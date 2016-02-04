var intelequiaSecure = intelequiaSecure || {};

intelequiaSecure.ResourceViewModel = function (moduleId, resx) {
    var utils = new common.Utils();
    var alert = new common.Alert();
    var isLoading = ko.observable(false);
    var resourceGroupId = ko.observable("");
    var resourceId = ko.observable("");
    var resourceGroupName = ko.observable("");
    var resourceKey = ko.observable("").extend({ required: { message: resx.RequiredResourceKey, params: true }, pattern: { message: resx.RequiredResourceKey, params: "^[^<>%=\"!¡¿?·()$]*$" } });
    var resourceValue = ko.observable("").extend({ required: { message: resx.RequiredResourceValue, params: true } });
    var postBackUrl = ko.observable("");
    var deleteResourceVisible = ko.observable(false);
    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId)
    }
    service.baseUrl = service.framework.getServiceRoot(service.path);
    // ko.validation
    ko.validation.init({ insertMessages: false, decorateElement: false });

    var init = function (editorOptions) {
        var qs = utils.getQueryStrings();
        resourceGroupId(qs["rgid"]);
        resourceId(qs["rid"]);
        getResource(resourceId(), resourceGroupId());

        $('#ResourceValueEditor').trumbowyg(editorOptions)
        .on("tbwblur", function () {
            resourceValue($('#ResourceValueEditor').trumbowyg('html'));
        });
    };

    var load = function (data) {
        resourceGroupId(data.ResourceGroupId);
        resourceId(data.ResourceId);
        resourceGroupName(data.ResourceGroupName);
        resourceKey(data.ResourceKey);
        resourceValue(data.ResourceValue);
        $('#ResourceValueEditor').trumbowyg('html', data.ResourceValue);
    };

    var getResource = function (resourceId, resourceGroupId) {
        service.controller = "Resource";
        var el = "#iss_IntelequiaSecure_Resource_" + moduleId;
        var errors = ko.validation.group(this);

        var params = {
            Resourceid: resourceId,
            ResourceGroupId: resourceGroupId
        };

        utils.get("GET", "GetResource", service, params,
            function (data) {
                // success
                if (data.Success) {
                    postBackUrl(data.PostBackUrl);
                    load(data.Resource);
                }
            },
            function (error, exception) {
                // fail
                alert.danger({
                    selector: el,
                    text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                    status: error.status,
                    redirect: error.status === 401
                });
            });
    };

    var saveResource = function () {
        service.controller = "Resource";
        var el = ".editor-wrapper";

        resourceValue($('#ResourceValueEditor').trumbowyg('html'));

        if (resourceValue().replace(/<[^>]*>/ig, "").replace(/&(nbsp|amp|quot|lt|gt);/g, "").trim().length === 0) {
            resourceValue("");
        }

        var errors = ko.validation.group(this);

        var resource = {
            ResourceId: resourceId(),
            ResourceGroupId: resourceGroupId(),
            ResourceKey: resourceKey(),
            ResourceValue: resourceValue()
        }

        alert.dismiss({ selector: el }, function () {
            if (errors().length === 000) {
                utils.get("POST", "Save", service, resource,
                function (data) {
                    // success
                    if (data.Success) {
                        load(data.Resource);
                        alert.success({
                            selector: el,
                            text: resx.ResourceSaved
                        });
                    } else {
                        alert.danger({
                            selector: el,
                            text: resx.ResourceNotSaved
                        });
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        status: error.status,
                        redirect: error.status === 401
                    });
                });
            } else {
                errors.showAllMessages(true);
            }
        });
    };

    var deleteResourceConfirm = function () {
        deleteResourceVisible(true);
    };

    var deleteResourceCancel = function () {
        deleteResourceVisible(false);
    };

    var deleteResource = function () {
        service.controller = "Resource";
        var el = ".delete-resource";
        alert.dismiss({ selector: el });

        var resource = {
            ResourceId: resourceId(),
            ResourceGroupId: resourceGroupId(),
            ResourceKey: resourceKey(),
            ResourceValue: resourceValue()
        }

        alert.dismiss({ selector: el }, function () {
            utils.get("POST", "Delete", service, resource,
            function (data) {
                // success
                if (data.Success) {
                    location.href = postBackUrl();
                }
            },
            function (error, exception) {
                // fail
                alert.danger({
                    selector: el,
                    text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                    status: error.status,
                    redirect: error.status === 401
                });
            });
        });
    };

    return {
        init: init,
        load: load,
        postBackUrl: postBackUrl,
        resourceGroupName: resourceGroupName,
        resourceKey: resourceKey,
        resourceValue: resourceValue,
        saveResource: saveResource,
        deleteResourceVisible: deleteResourceVisible,
        deleteResourceConfirm: deleteResourceConfirm,
        deleteResourceCancel: deleteResourceCancel,
        deleteResource: deleteResource
    };
};