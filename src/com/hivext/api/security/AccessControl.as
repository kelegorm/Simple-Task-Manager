package com.hivext.api.security {
import com.hivext.api.AbstractService;

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

/**
 * @copyright Hivext Technology, http://hivext.ru, http://hivext.com
 **/

public class AccessControl extends AbstractService {
    public static var SERVER_SERVICE_URL:String = SERVER_URL;
    public static var SERVICE_PATH:String = "security/accesscontrol/";
    public static var SERVICE_URL:String = SERVER_SERVICE_URL + SERVICE_PATH;
    private var serviceUrl:String = SERVICE_URL;
    private var appid:String = null;
    private var session:String = null;

    public function AccessControl(appid:Object = null, session:String = null, serviceUrl:String = null) {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, serviceUrl:serviceUrl};
        } else {
            json = appid || {};
        }
        if (json.appid) this.appid = json.appid;
        if (json.session) this.session = json.session;
        if (json.serviceUrl) this.serviceUrl = json.serviceUrl;
    }

    public function getAppid():String {
        return appid;
    }

    public function setAppid(appid:String):AccessControl {
        this.appid = appid;
        return this;
    }

    public function getSession():String {
        return session;
    }

    public function setSession(session:String):AccessControl {
        this.session = session;
        return this;
    }

    public function getServiceUrl():String {
        return serviceUrl;
    }

    public function setServiceUrl(serviceUrl:String):AccessControl {
        this.serviceUrl = serviceUrl;
        return this;
    }

    public function createRole(appid:Object = null, session:String = null, role:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.createrole.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.createrole.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.createrole(json);
    }

    public function deleteRole(appid:Object = null, session:String = null, role:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.deleterole.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.deleterole.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.deleterole(json);
    }

    public function getRoles(appid:Object = null, session:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getroles.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getroles.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getroles(json);
    }

    public function applyRole(appid:Object = null, session:String = null, role:String = null, subject:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, subject:subject, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.applyrole.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.applyrole.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.applyrole(json);
    }

    public function removeRole(appid:Object = null, session:String = null, role:String = null, subject:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, subject:subject, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removerole.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removerole.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removerole(json);
    }

    public function getRolesBySubject(appid:Object = null, session:String = null, subject:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getrolesbysubject.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getrolesbysubject.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getrolesbysubject(json);
    }

    public function getSubjectsByRole(appid:Object = null, session:String = null, role:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getsubjectsbyrole.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getsubjectsbyrole.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getsubjectsbyrole(json);
    }

    public function getRolesByObject(appid:Object = null, session:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getrolesbyobject.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getrolesbyobject.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getrolesbyobject(json);
    }

    public function getObjectsByRole(appid:Object = null, session:String = null, role:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getobjectsbyrole.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getobjectsbyrole.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getobjectsbyrole(json);
    }

    public function addPolicy(appid:Object = null, session:String = null, role:String = null, object:String = null, rights:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, object:object, rights:rights, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.addpolicy.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.addpolicy.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.addpolicy(json);
    }

    public function removePolicy(appid:Object = null, session:String = null, role:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removepolicy.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removepolicy.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removepolicy(json);
    }

    public function getPolicy(appid:Object = null, session:String = null, role:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, role:role, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getpolicy.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getpolicy.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getpolicy(json);
    }

    public function setRights(appid:Object = null, session:String = null, subject:String = null, object:String = null, rights:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, object:object, rights:rights, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.setrights.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.setrights.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.setrights(json);
    }

    public function removeRights(appid:Object = null, session:String = null, subject:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removerights.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removerights.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removerights(json);
    }

    public function getRights(appid:Object = null, session:String = null, subject:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getrights.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getrights.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getrights(json);
    }

    public function getRightsBySubject(appid:Object = null, session:String = null, subject:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getrightsbysubject.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getrightsbysubject.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getrightsbysubject(json);
    }

    public function getRightsByObject(appid:Object = null, session:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getrightsbyobject.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getrightsbyobject.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getrightsbyobject(json);
    }

    public function removeRightsBySubject(appid:Object = null, session:String = null, subject:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removerightsbysubject.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removerightsbysubject.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removerightsbysubject(json);
    }

    public function removeRightsByObject(appid:Object = null, session:String = null, object:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, object:object, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removerightsbyobject.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removerightsbyobject.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removerightsbyobject(json);
    }

    public function checkRights(appid:Object = null, session:String = null, subject:String = null, object:String = null, rights:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, subject:subject, object:object, rights:rights, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "accesscontrol";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.checkrights.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.checkrights.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.checkrights(json);
    }

}
}
