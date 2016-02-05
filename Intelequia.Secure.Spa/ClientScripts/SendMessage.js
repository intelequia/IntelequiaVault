var intelequiaSecure = intelequiaSecure || {};

intelequiaSecure.Message = function (data) {
    this.MessageId = data.messageId;
    this.MessageFrom = data.messageFrom;
    this.MessageTo = data.messageTo;
    this.MessageCc = data.messageCc;
    this.MessageCco = data.messageCco;
    this.Subject = data.subject;
    this.Body = data.body;
    this.ExpireDate = data.expireDate;
}

intelequiaSecure.SendMessageViewModel = function (moduleId, resx) {
    var resourceGroupId = ko.observable("");
    var utils = new common.Utils();
    var alert = new common.Alert();
    var messageId = ko.observable("");
    var messageFrom = ko.observable("");
    var messageTo = ko.observable("").extend({ required: { message: resx.RequiredMessageTo, params: true } }).extend({ multiemail: { params: true, message: resx.EmailsNotValid } });
    var messageCc = ko.observable("").extend({ multiemail: { params: true, message: resx.EmailsNotValid } });
    var messageCco = ko.observable("").extend({ multiemail: { params: true, message: resx.EmailsNotValid } });
    var subject = ko.observable("").extend({ required: { message: resx.RequiredSubject, params: true }, pattern: { message: resx.RequiredSubject, params: "^[^<>%=\"!¡¿?·()$]*$" } });
    var head = ko.observable("");
    var foot = ko.observable("");
    var body = ko.observable("");
    var date = ko.observable("").extend({ required: { message: resx.DateError, params: true } });
    var hour = ko.observable("").extend({ required: { message: resx.RequiredDate, params: true } });
    var cancelMessageVisible = ko.observable(false);
    var actionsVisible = ko.observable(true);
    var isSending = ko.observable(false);
    var expireDate = ko.computed(function () {
        if (hour() === "")
            return date() + " 00:00";
        else
            return date() + " " + hour();
    });

    var service = { path: "Intelequia/Secure", framework: $.ServicesFramework(moduleId), controller: "Message" }
    service.baseUrl = service.framework.getServiceRoot(service.path);

    ko.validation.init({ insertMessages: false, decorateElement: false });

    var refreshMessage = function (resourceGroupId, messageId) {
        var el = "#iss_IntelequiaSecure_SendMessage_" + moduleId;

        alert.dismiss({ selector: el }, function () {

            var params = {
                messageId: messageId,
                resourceGroupId: resourceGroupId
            };

            utils.get("GET", "GetMessage", service, params,
                function (data) { // success
                    if (data.Success && data.Message) {
                        load(data.Message);
                    }
                },
                function (error, exception) { // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        redirect: error.status === 401
                    });
                });
        });
    };


    var sendMessage = function (model, target) {
        var el = "#iss_IntelequiaSecure_SendMessage_" + moduleId;
        var icon = $(target.currentTarget).find(".fa-paper-plane");

        head($('#MessageHeadEditor').trumbowyg('html'));
        head().replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, "");

        if (head().replace(/<[^>]*>/ig, "").replace(/&(nbsp|amp|quot|lt|gt);/g, "").trim().length === 0) {
            head("");
        }

        foot($('#MessageFootEditor').trumbowyg('html'));
        foot().replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, "");

        if (foot().replace(/<[^>]*>/ig, "").replace(/&(nbsp|amp|quot|lt|gt);/g, "").trim().length === 0) {
            foot("");
        }
        var errors = ko.validation.group(this);

        var message = new intelequiaSecure.Message({
            messageId: messageId(),
            messageFrom: messageFrom(),
            messageTo: messageTo(),
            messageCc: messageCc(),
            messageCco: messageCco(),
            subject: subject(),
            body: head() + body() + foot(),
            expireDate: expireDate()
        });
        

        if (errors().length === 000) {
            utils.loading(icon, "fa-paper-plane");

            var params = {
                Message: message,
                ResourceGroupId: resourceGroupId()
            };

            utils.get("POST", "SendMessage", service, params,
                    function (data) { // success
                        if (data.Success) {
                            alert.success({
                                selector: el,
                                text: resx.MessageSent,
                                redirect: true,
                                postBack: data.PostBackUrl
                            });
                        } else {
                            alert.danger({ selector: el, text: resx.MessageNotSent });
                        }
                    },
                    function (error, exception) { // fail
                        alert.danger({
                            selector: el,
                            text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                            redirect: error.status === 401
                        });
                    },
                    function () { // always
                        utils.loading(icon, "fa-paper-plane");
                    });
        } else {
            errors.showAllMessages(true);
            window.scrollTo(0, 0);
        }
    }

    var deleteMessageConfirm = function () {
        cancelMessageVisible(true);
    }

    var cancelMessageCancel = function () {
        cancelMessageVisible(false);
    };

    var deleteMessage = function () {
        var params = {
            MessageId: messageId(),
            ResourceGroupId: resourceGroupId()
        };

        utils.get("POST", "Delete", service, params,
            function (data) { // success
                if (data.Success) {
                    location.href = data.ResourceGroupUrl;
                } else {
                    alert.danger({ selector: el, text: resx.MessageNotCancel });
                }
            },
            function (error, exception) { // fail
                alert.danger({
                    selector: el,
                    text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                    redirect: error.status === 401
                });
            });
    }

    ko.validation.init({ insertMessages: false, decorateElement: false });

    var init = function (editorOptions) {
        var qs = utils.getQueryStrings();
        refreshMessage(qs["rgid"], qs["msgid"]);
        resourceGroupId(qs["rgid"]);

        $('#MessageHeadEditor').trumbowyg(editorOptions)
        .on("tbwblur", function () {
            head($('#MessageHeadEditor').trumbowyg('html'));
        });

        $('#MessageFootEditor').trumbowyg(editorOptions)
        .on("tbwblur", function () {
            foot($('#MessageFootEditor').trumbowyg('html'));
        });
    };

    var load = function (data) {
        messageId(data.MessageId);
        messageFrom(data.MessageFrom);
        messageTo(data.MessageTo);
        messageCc(data.MessageCc);
        messageCco(data.MessageCco);
        subject(data.Subject);
        head(data.Head);
        foot(data.Foot);
        $('#MessageHeadEditor').trumbowyg('html', data.Head);
        $('#MessageFootEditor').trumbowyg('html', data.Foot);
        body(data.Body);
        date(data.ExpireDate.substring(0, data.ExpireDate.indexOf("T")));
        hour(data.ExpireDate.substring(data.ExpireDate.indexOf("T") + 1, data.ExpireDate.indexOf("T") + 6));
    };

    return {
        init: init,
        load, load,
        messageId: messageId,
        messageTo: messageTo,
        messageFrom: messageFrom,
        messageCc: messageCc,
        messageCco: messageCco,
        subject: subject,
        head: head,
        foot: foot,
        body: body,
        date: date,
        hour: hour,
        actionsVisible: actionsVisible,
        refreshMessage: refreshMessage,
        sendMessage: sendMessage,
        deleteMessageConfirm: deleteMessageConfirm,
        cancelMessageCancel: cancelMessageCancel,
        deleteMessage: deleteMessage,
        cancelMessageVisible: cancelMessageVisible,
        isSending: isSending
    };
}