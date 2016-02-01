var intelequiaSecure = intelequiaSecure || {};

intelequiaSecure.Message = function (data) {
    this.MessageId = data.messageId;
    this.MessageFrom = data.messageFrom;
    this.MessageTo = data.messageTo;
    this.MessageCc = data.messageCc;
    this.MessageCco = data.messageCco;
    this.Subject = data.subject;
    this.Body = data.head + data.body + data.foot;
    this.ExpireDate = data.expireDate;
}


intelequiaSecure.ViewMessageViewModel = function (moduleId, resx) {
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
    var date = ko.observable("").extend({ required: { message: resx.RequiredDate, params: true } });
    var hour = ko.observable("").extend({ required: { message: resx.RequiredDate, params: true } });

    var expireDateString = ko.observable("");
    
    var hasMessage = ko.observable(false);

    var cancelMessageVisible = ko.observable(false);

    var actionsVisible = ko.observable(true);

    var expireDate = ko.computed(function () {
        if (hour() === "")
            return date() + " 00:00";
        else
            return date() + " " + hour();
    });

    var isLoading = ko.observable(false);

    var service = { path: "Intelequia/Secure", framework: $.ServicesFramework(moduleId), controller: "Message" }

    service.baseUrl = service.framework.getServiceRoot(service.path);

    var refreshMessage = function (resourceGroupId, messageId) {
        var el = "#iss_IntelequiaSecure_ViewMessage_" + moduleId;
        // TODO Aarón => Loading icon
        alert.dismiss({ selector: el });

        var params = {
            messageId: messageId
        };

        utils.get("GET", "GetEncryptMessage", service, params,
            function (data) {
                if (data.Success && data.Message) {
                    load(data.Message);
                    hasMessage(true);
                } else {
                    alert.danger({ selector: el, text: resx.MessageNotExist });
                }
            },
            function (error, exception) {
                alert.danger({ selector: el, text: error.responseText, status: error.status });
            },
            function () {
                isLoading(false);
            });
    };
    
    var init = function () {
        var qs = utils.getQueryStrings();
        refreshMessage(qs["rgid"], qs["msgid"]);
        resourceGroupId(qs["rgid"]);
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
        body(data.Body);
        date(data.ExpireDate.substring(0, data.ExpireDate.indexOf("T")));
        hour(data.ExpireDate.substring(data.ExpireDate.indexOf("T") + 1, data.ExpireDate.indexOf("T") + 6));
        var expDate = new Date(date() + ", " + hour());
        expireDateString(expDate.toLocaleDateString()+", "+ expDate.toLocaleTimeString());
    };

    return {
        init: init,
        load, load,
        isLoading: isLoading,
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
        expireDateString: expireDateString,
        hasMessage:hasMessage,

        refreshMessage: refreshMessage
    };
}