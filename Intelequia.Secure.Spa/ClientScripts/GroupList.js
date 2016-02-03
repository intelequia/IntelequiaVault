var intelequiaSecure = intelequiaSecure || {};

intelequiaSecure.GroupListViewModel = function (moduleId, resx) {
    var utils = new common.Utils();
    var alert = new common.Alert();
    var searchTags = ko.observable("");
    var sortOrder = ko.observable("ASC");
    var sortField = ko.observable("ResourceName");
    var isLoading = ko.observable(false);
    var groupList = ko.observableArray([]);
    var addGroupUrl = ko.observable("");
    var editMode = ko.computed(function () {
        return groupList().length > 0 && typeof (groupList()[0].editGroupUrl()) !== 'undefined';
    });
    var isAdministrator = ko.observable(false);
    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId),
        controller: "Group"
    }
    service.baseUrl = service.framework.getServiceRoot(service.path);

    var init = function () {
        getGroupList();
    };

    var getGroupList = function () {
        var el = "[id*='iss_IntelequiaSecure_Groups']";
        var icon = $(el).find(".heading .fa-list");
        
        var params = {
            SortField: sortField(),
            SortOrder: sortOrder(),
            Tags: searchTags()
        };

        alert.dismiss({ selector: el }, function () {

            utils.loading(icon, "fa-list");

            utils.get("GET", "GetGroups", service, params,
                function (data) {
                    // success
                    if (data.Success) {
                        load(data);
                    }
                    else {
                        // No data to load 
                        groupList.removeAll();
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText,
                        status: error.status
                    });
                },
                function () {
                    // always
                    utils.loading(icon, "fa-list");
                });
        });
    };

    var swapOrder = function () {
        if (sortOrder() === "DESC") {
            sortOrder("ASC");
        } else {
            sortOrder("DESC");
        }
    };

    var sort = function (caller, column) {
        // If the event is launched from a link (<a> </a>) the value of "hash" is retrieved.
        // If launched from a combo (<select> </ select>) the value of "value" is recovered
        var hash = typeof column.currentTarget.hash !== "undefined" ? column.currentTarget.hash.substring(1) : column.currentTarget.value;

        if (sortField() === hash) {
            swapOrder();
        }

        sortField(hash);
        getGroupList();
    };

    var search = function () {
        sortOrder("ASC");
        sortField("ResourceName");
        getGroupList();
    };

    var clean = function () {
        searchTags("");
        sortOrder("ASC");
        sortField("ResourceName");
        getGroupList();
    };

    var load = function (data) {
        addGroupUrl(data.AddGroupUrl);
        isAdministrator(data.CurrentUserIsAdministrator);
        groupList.removeAll();

        var underlyingArray = groupList();
        for (var i = 0; i < data.Groups.length; i++) {
            var result = data.Groups[i];
            var group = new intelequiaSecure.GroupViewModel(moduleId, resx);
            group.load(result);
            underlyingArray.push(group);
        }
        groupList.valueHasMutated();
    };

    return {
        init: init,
        load, load,
        groupList: groupList,
        getGroupList: getGroupList,
        addGroupUrl: addGroupUrl,
        editMode: editMode,
        isLoading: isLoading,
        searchTags: searchTags,
        sortOrder: sortOrder,
        sortField: sortField,
        sort: sort,
        search: search,
        clean: clean,
        isAdministrator: isAdministrator
    }
};

intelequiaSecure.GroupViewModel = function (moduleId, resx) {
    var utils = new common.Utils();
    var alert = new common.Alert();
    var resourceGroupId = ko.observable("");
    var resourceName = ko.observable("");
    var portalId = ko.observable("");
    var editGroupUrl = ko.observable("");
    var addResourceUrl = ko.observable("");
    var hasSelectedResources = ko.observable(false);
    var selectedResources = ko.observableArray([]);

    selectedResources.subscribe(function () {
        hasSelectedResources(selectedResources().length > 0);
    });

    var resourceList = ko.observableArray([]);

    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId)
    }

    service.baseUrl = service.framework.getServiceRoot(service.path);

    var selectResource = function (resource, target) {

        var fa = $(target.currentTarget).find(".fa");

        if (typeof (fa) !== "undefined") {
            $(fa).toggleClass("fa-square-o").toggleClass("fa-check-square-o");
        }

        var el = "#resource_" + resource.resourceId();

        if (selectedResources.indexOf(resource.resourceId()) < 0) {
            selectedResources.push(resource.resourceId());
        }
        else {
            selectedResources.remove(resource.resourceId());
        }

        $(el).toggleClass("selected-resource");
    };

    var getResources = function (group, target) {
        service.controller = "Resource";
        var icon = $(target.currentTarget).find(".fa-book");
        var el = "#pnlGroup_" + group.resourceGroupId();

        selectedResources.removeAll();

        var params = {
            ResourceGroupId: resourceGroupId()
        };

        alert.dismiss({ selector: el }, function () {

            utils.loading(icon, "fa-book");

            if (typeof ($(el).attr("aria-expanded")) === "undefined" || $(el).attr("aria-expanded") === "false") {
                utils.get("GET", "GetResources", service, params,
                    function (data) {
                        // success
                        if (data.Success && data.Resources.length > 0) {
                            resourceList.removeAll();
                            $.each(data.Resources,
                                function (index, resource) {
                                    var resc = new intelequiaSecure.ResourceViewModel(moduleId);
                                    resc.load(resource);
                                    resourceList.push(resc);
                                });
                        }
                        else {
                            // No data to load 
                            resourceList.removeAll();
                        }
                    },
                    function (error, exception) {
                        // fail
                        alert.danger({
                            selector: el,
                            text: JSON.parse(error.responseText).Message,
                            status: error.status
                        });
                    },
                    function () {
                        // always
                        utils.loading(icon, "fa-book");
                    });
            }
        });
    };

    var sendMail = function (group) {
        service.controller = "Message";
        var el = $("#pnlGroup_" + group.resourceGroupId()).find(".group-body");

        var params = {
            ResourceGroupId: resourceGroupId(),
            ResourcesIds: selectedResources()
        };

        alert.dismiss({ selector: el }, function () {

            if (!hasSelectedResources()) {
                alert.danger({ selector: el, text: resx.ErrorSelectMessage, redirect: false });
                return false;
            }

            utils.get("POST", "Create", service, params,
                function (data) {
                    // success
                    if (data.Success) {
                        location.href = data.SendMailUrl;
                    } else {
                        alert.danger({ selector: el, text: JSONdata.MessageError, redirect: false });
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        status: error.status
                    });
                });
        });

        return true;
    }

    var load = function (data) {
        resourceGroupId(data.ResourceGroupId);
        resourceName(data.ResourceName);
        portalId(data.PortalId);
        editGroupUrl(data.EditGroupUrl);
        addResourceUrl(data.AddResourceUrl);
    };

    return {
        load: load,
        resourceGroupId: resourceGroupId,
        resourceName: resourceName,
        portalId: portalId,
        editGroupUrl: editGroupUrl,
        addResourceUrl: addResourceUrl,
        sendMail: sendMail,
        hasSelectedResources: hasSelectedResources,
        selectResource: selectResource,
        getResources: getResources,
        resourceList: resourceList
    };
}

intelequiaSecure.ResourceViewModel = function (moduleId) {
    var utils = new common.Utils();
    var alert = new common.Alert();
    var resourceId = ko.observable("");
    var resourceKey = ko.observable("");
    var resourceValue = ko.observable("");
    var resourceEncriptedValue = ko.observable("");
    var resourceGroupId = ko.observable("");
    var editResourceUrl = ko.observable("");
    var resourceValueCss = ko.observable("resource-value blurred");
    var timeout;
    var isResourceVisible = ko.observable(false);

    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId)
    }

    service.baseUrl = service.framework.getServiceRoot(service.path);

    var hideResource = function () {
        var el = "#resource_" + resourceId();
        var icon = $(el).find(".fa-key");

        clearTimeout(timeout);
        isResourceVisible(false);

        $(el).find(".resource-value").animate(
            {
                opacity: 0
            },
            function () {
                resourceValue(resourceEncriptedValue());
                resourceValueCss("resource-value blurred");
                $(el).find(".resource-value").animate({ opacity: 1 });
            });

    };

    var viewResource = function () {
        service.controller = "Resource";
        var el = "#resource_" + resourceId();
        var icon = $(el).find(".fa-key");

        var params = {
            resourceId: resourceId,
            resourceGroupId: resourceGroupId
        };

        alert.dismiss({ selector: el }, function () {

            utils.loading(icon, "fa-key");

            $(el).find(".resource-value").animate(
                {
                    opacity: 0
                },
                function () {
                    utils.get("GET", "GetResource", service, params,
                        function (data) {
                            // success
                            if (data.Success && data.Resource) {
                                isResourceVisible(true);
                                load(data.Resource);
                                resourceEncriptedValue(data.ResourceEncriptedValue);
                                resourceValueCss("resource-value");

                                timeout = setTimeout(function () {
                                    hideResource();
                                }, 30000);
                            }
                        },
                        function (error, exception) {
                            // fail
                            alert.danger({
                                selector: el,
                                text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                                status: error.status,
                                redirect: false
                            });
                        },
                        function () {
                            // always
                            $(el).find(".resource-value").animate({ opacity: 1 }, 1000);
                                utils.loading(icon, "fa-key");
                            });
                        });
            });
    };

    var load = function (data) {
        resourceId(data.ResourceId);
        resourceKey(data.ResourceKey);
        resourceValue(data.ResourceValue);
        resourceGroupId(data.ResourceGroupId);
        resourceValue(data.ResourceValue);
        editResourceUrl(data.EditResourceUrl);
    };

    return {
        load, load,
        resourceId: resourceId,
        resourceKey: resourceKey,
        resourceValue: resourceValue,
        resourceGroupId: resourceGroupId,
        resourceValueCss: resourceValueCss,
        editResourceUrl: editResourceUrl,
        viewResource: viewResource,
        hideResource: hideResource,
        isResourceVisible: isResourceVisible
    };
}