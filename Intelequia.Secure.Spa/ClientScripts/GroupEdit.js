var intelequiaSecure = intelequiaSecure || {};

intelequiaSecure.EditViewModel = function (moduleId, resx) {
    var viewmodel = null;
    var utils = new common.Utils();
    var alert = new common.Alert();
    var isLoading = ko.observable(false);
    var group = ko.observable(null);
    var rolePermissionList = ko.observableArray([]);
    var userPermissionList = ko.observableArray([]);
    var addUserVisible = ko.observable(false);
    var newUserUserName = ko.observable("").extend({ required: { message: resx.RequiredNewUserUserName, params: true }, pattern: { message: resx.RequiredNewUserUserName, params: "^[^<>%=\"!¡¿?·()$]*$" } });
    var newUserReadPermission = ko.observable(false);
    var newUserWritePermission = ko.observable(false);
    var userFound = ko.observable();
    var editMode = ko.observable(false);
    var postBackUrl = ko.observable("");
    var isAdministrator = ko.observable(false);
    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId)
    }
    service.baseUrl = service.framework.getServiceRoot(service.path);
    // ko.validation
    ko.validation.init({ insertMessages: false, decorateElement: false });

    var init = function (vm) {
        viewmodel = vm;
        var qs = utils.getQueryStrings();
        var groupId = qs["rgid"];
        var grp = new intelequiaSecure.GroupViewModel(moduleId, resx, viewmodel);
        grp.load({
            ResourceGroupId: groupId,
            ResourceName: ""
        });
        group(grp);
        editMode(groupId !== utils.emptyGuid);
        getGroup(groupId);
    };

    var getGroup = function (groupId) {
        service.controller = "Group";
        var el = "#iss_IntelequiaSecure_GroupEdit_" + moduleId;

        var params = {
            ResourceGroupId: groupId
        };

        alert.dismiss({ selector: el }, function () {

            utils.get("GET", "GetGroup", service, params,
                function (data) {
                    // success
                    if (data.Success && data.Group) {
                        var grp = new intelequiaSecure.GroupViewModel(moduleId, resx, viewmodel);
                        grp.load(data.Group);
                        group(grp);
                        postBackUrl(data.PostBackUrl);
                        getPermissions(moduleId, groupId);
                        isAdministrator(data.CurrentUserIsAdministrator);
                    }
                },
                function (error, exception) {
                    // fail
                    postBackUrl(error.responseText.indexOf("PostBackUrl") > -1 ? JSON.parse(error.responseText).PostBackUrl : "/");
                    
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        redirect: error.status === 401
                    });
                });
        });
    };

    var getPermissions = function (moduleId, groupId) {
        service.controller = "Permission";
        var el = ".role-permissions";
        
        var params = {
            resourceGroupId: groupId
        };

        alert.dismiss({ selector: el }, function () {
            utils.get("GET", "GetPermissions", service, params,
                function (data) {
                    // success
                    if (data.Success) {
                        // load role permissions
                        rolePermissionList.removeAll();
                        var underlyingArray = rolePermissionList();
                        for (var i = 0; i < data.RolePermissions.length; i++) {
                            var result = data.RolePermissions[i];
                            var rp = new intelequiaSecure.PermissionViewModel(moduleId, resx, viewmodel);
                            rp.load(result);
                            underlyingArray.push(rp);
                        }
                        rolePermissionList.valueHasMutated();

                        // load user permissions
                        userPermissionList.removeAll();
                        underlyingArray = userPermissionList();
                        for (var i = 0; i < data.UserPermissions.length; i++) {
                            var result = data.UserPermissions[i];
                            var up = new intelequiaSecure.PermissionViewModel(moduleId, resx, viewmodel);
                            up.load(result);
                            underlyingArray.push(up);
                        }
                        userPermissionList.valueHasMutated();
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        redirect: error.status === 401
                    });
                });
        });
    };

    var addUserConfirm = function () {
        addUserVisible(true);
    };

    var checkUser = function () {
        service.controller = "Permission";
        var el = ".new-user";
        var errors = ko.validation.group(this);
        var params = {
            UserName: newUserUserName(),
            resourceGroupId: group().resourceGroupId()
        };

        alert.dismiss({ selector: el }, function () {
            if (errors().length === 0) {
                utils.get("GET", "CheckUser", service, params,
                function (data) {
                    // success
                    if (data.Success) {
                        userFound(true);
                    } else {
                        userFound(false);
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        redirect: error.status === 401
                    });
                });
            } else {
                errors.showAllMessages(true);
            }
        });
    };

    var addUserCancel = function () {
        resetNewUserProperties();
    };

    var resetNewUserProperties = function () {
        addUserVisible(false);
        newUserUserName = ko.observable("").extend({ required: { message: resx.RequiredNewUserUserName, params: true }, pattern: { message: resx.RequiredNewUserUserName, params: "^[^<>%=\"!¡¿?·()$]*$" } });
        userFound = ko.observable();
        newUserReadPermission(false);
        newUserWritePermission(false);
    };

    var addUser = function () {
        service.controller = "Permission";
        var el = ".new-user";
        var errors = ko.validation.group(this);

        var userPermission = {
            permission: {
                ResourceGroupId: group().resourceGroupId(),
                ReadPermission: newUserReadPermission(),
                WritePermission: newUserWritePermission()
            },
            userName: newUserUserName()
        };

        alert.dismiss({ selector: el }, function () {
            if (errors().length === 0) {
                utils.get("POST", "SaveUserPermission", service, userPermission,
                function (data) {
                    // success
                    if (data.Success) {
                        resetNewUserProperties();
                        getPermissions(moduleId, group().resourceGroupId());
                    } else {
                        alert.danger({
                            selector: el,
                            text: data.Message
                        });
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        redirect: error.status === 401
                    });
                });
            } else {
                errors.showAllMessages(true);
            }
        });
    };

    return {
        init: init,
        group: group,
        viewmodel: viewmodel,
        editMode: editMode,
        getPermissions: getPermissions,
        rolePermissionList: rolePermissionList,
        userPermissionList: userPermissionList,
        newUserUserName: newUserUserName,
        addUserVisible: addUserVisible,
        addUserConfirm: addUserConfirm,
        checkUser: checkUser,
        userFound: userFound,
        newUserReadPermission: newUserReadPermission,
        newUserWritePermission: newUserWritePermission,
        resetNewUserProperties: resetNewUserProperties,
        addUser: addUser,
        addUserCancel: addUserCancel,
        postBackUrl: postBackUrl,
        isAdministrator: isAdministrator
    };
};


intelequiaSecure.GroupViewModel = function (moduleId, resx, editvm) {
    var utils = new common.Utils();
    var alert = new common.Alert();
    var isLoading = ko.observable(false);
    var resourceGroupId = ko.observable("");
    var resourceName = ko.observable("").extend({ required: { message: resx.RequiredResourceGroupName, params: true }, pattern: { message: resx.RequiredResourceGroupName, params: "^[^<>%=\"!¡¿?·$']*$" } });
    var deleteResourceGroupVisible = ko.observable(false);
    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId)
    }
    service.baseUrl = service.framework.getServiceRoot(service.path);

    var saveResourceGroup = function () {
        service.controller = "Group";
        var el = "#iss_IntelequiaSecure_GroupEdit_" + moduleId;

        var group = {
            ResourceGroupId: resourceGroupId(),
            ResourceName: resourceName()
        };

        var errors = ko.validation.group(this);

        alert.dismiss({ selector: el }, function () {
            if (errors().length === 0) {
                utils.get("POST", "Save", service, group,
                function (data) {
                    // success
                    if (data.Success) {
                        editvm.group().load(data.Group);
                        editvm.getPermissions(moduleId, data.Group.ResourceGroupId);
                        editvm.editMode(true);
                    }
                },
                function (error, exception) {
                    // fail
                    alert.danger({
                        selector: el,
                        text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                        redirect: error.status === 401
                    });
                });
            } else {
                errors.showAllMessages(true);
            }
        });
    };

    var deleteResourceGroupConfirm = function () {
        var el = "#iss_IntelequiaSecure_GroupEdit_" + moduleId;

        alert.dismiss({ selector: el }, function () {
            deleteResourceGroupVisible(true);
        });
    };

    var deleteResourceGroupCancel = function () {
        deleteResourceGroupVisible(false);
    };

    var deleteResourceGroup = function () {
        service.controller = "Group";
        var el = ".delete-group";

        var group = {
            ResourceGroupId: resourceGroupId(),
            ResourceName: resourceName()
        };

        alert.dismiss({ selector: el }, function () {
            utils.get("POST", "Delete", service, group,
            function (data) {
                // success
                if (data.Success) {
                    location.href = data.PostBackUrl;
                }
            },
            function (error, exception) {
                // fail
                alert.danger({
                    selector: el,
                    text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                    redirect: error.status === 401
                });
            });
        });
    };

    var load = function (data) {
        resourceGroupId(data.ResourceGroupId);
        resourceName(data.ResourceName);
    };

    return {
        load: load,
        resourceGroupId: resourceGroupId,
        resourceName: resourceName,
        saveResourceGroup: saveResourceGroup,
        deleteResourceGroupVisible: deleteResourceGroupVisible,
        deleteResourceGroupConfirm: deleteResourceGroupConfirm,
        deleteResourceGroupCancel: deleteResourceGroupCancel,
        deleteResourceGroup: deleteResourceGroup
    };
}


intelequiaSecure.PermissionViewModel = function (moduleId, resx, editvm) {
    var roleEl = ".role-permissions";
    var userEl = ".user-permissions";
    var that = this;
    var utils = new common.Utils();
    var alert = new common.Alert();
    var permissionId = ko.observable("");
    var resourceGroupId = ko.observable("");
    var userId = ko.observable("");
    var userDisplayName = ko.observable("");
    var roleId = ko.observable("");
    var roleName = ko.observable("");
    var readPermission = ko.observable(false);
    var writePermission = ko.observable(false);
    var service = {
        path: "Intelequia/Secure",
        framework: $.ServicesFramework(moduleId)
    }
    service.baseUrl = service.framework.getServiceRoot(service.path);

    var savePermission = function (viewmodel) {
        service.controller = "Permission";
        var el = "[class*='-permissions']";

        var permission = {
            PermissionId: viewmodel.permissionId(),
            ResourceGroupId: viewmodel.resourceGroupId(),
            UserId: viewmodel.userId(),
            UserDisplayName: viewmodel.userDisplayName(),
            RolId: viewmodel.roleId(),
            RoleName: viewmodel.roleName(),
            ReadPermission: viewmodel.readPermission(),
            WritePermission: viewmodel.writePermission()
        };

        alert.dismiss({ selector: el }, function () {
            utils.get("POST", "Save", service, permission,
            function (data) {
                // success
                if (data.Success) {
                    viewmodel.permissionId(data.Permission.PermissionId);
                } else {
                    alert.danger({
                        selector: roleId() !== null ? roleEl : userEl,
                        text: resx.ErrorSavePermission
                    });
                }
            },
            function (error, exception) {
                // fail
                alert.danger({
                    selector: roleEl,
                    text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                    redirect: error.status === 401
                });
            });
        });

        return true;
    };

    var deletePermission = function (viewmodel) {
        service.controller = "Permission";
        var el = "[class*='-permissions']";

        var permission = {
            PermissionId: viewmodel.permissionId(),
            ResourceGroupId: viewmodel.resourceGroupId(),
            UserId: viewmodel.userId(),
            UserDisplayName: viewmodel.userDisplayName(),
            RolId: viewmodel.roleId(),
            RoleName: viewmodel.roleName(),
            ReadPermission: viewmodel.readPermission(),
            WritePermission: viewmodel.writePermission()
        };

        alert.dismiss({ selector: el }, function () {
            utils.get("POST", "Delete", service, permission,
            function (data) {
                // success

                if (data.Success) {
                    editvm.getPermissions(moduleId, resourceGroupId());
                } else {
                    alert.danger({
                        selector: roleId() !== null ? roleEl : userEl,
                        text: resx.ErrorDeletePermission
                    });
                }
            },
            function (error, exception) {
                // fail
                alert.danger({
                    selector: roleEl,
                    text: error.responseText.indexOf("Message") > -1 ? JSON.parse(error.responseText).Message : error.responseText,
                    redirect: error.status === 401
                });
            });
        });
    };

    var load = function (data) {
        permissionId(data.PermissionId);
        resourceGroupId(data.ResourceGroupId);
        userId(data.UserId);
        userDisplayName(data.UserDisplayName);
        roleId(data.RolId);
        roleName(data.RoleName);
        readPermission(data.ReadPermission);
        writePermission(data.WritePermission);
    };

    return {
        load: load,
        permissionId: permissionId,
        resourceGroupId: resourceGroupId,
        userId: userId,
        userDisplayName: userDisplayName,
        roleId: roleId,
        roleName: roleName,
        readPermission: readPermission,
        writePermission: writePermission,
        savePermission: savePermission,
        deletePermission: deletePermission
    }
};