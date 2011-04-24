package com.hivext.api.development {
import com.hivext.api.AbstractService;

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

/**
 * @copyright Hivext Technology, http://hivext.ru, http://hivext.com
 **/

public class Applications extends AbstractService {
    public static var SERVER_SERVICE_URL:String = SERVER_URL;
    public static var SERVICE_PATH:String = "development/applications/";
    public static var SERVICE_URL:String = SERVER_SERVICE_URL + SERVICE_PATH;
    private var serviceUrl:String = SERVICE_URL;
    private var appid:String = null;
    private var session:String = null;

    public function Applications(appid:Object = null, session:String = null, serviceUrl:String = null) {
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

    public function setAppid(appid:String):Applications {
        this.appid = appid;
        return this;
    }

    public function getSession():String {
        return session;
    }

    public function setSession(session:String):Applications {
        this.session = session;
        return this;
    }

    public function getServiceUrl():String {
        return serviceUrl;
    }

    public function setServiceUrl(serviceUrl:String):Applications {
        this.serviceUrl = serviceUrl;
        return this;
    }

    public function generateApp(appid:Object = null, session:String = null, name:String = null, description:String = null, domain:String = null, keywords:String = null, config:Object = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, name:name, description:description, domain:domain, keywords:keywords, config:config, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        json = encode(json);
        ro.generateapp.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.generateapp.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.generateapp(json);
    }

    public function deleteApp(appid:Object = null, session:String = null, password:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, password:password, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.deleteapp.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.deleteapp.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.deleteapp(json);
    }

    public function getApp(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getapp.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getapp.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getapp(json);
    }

    public function getApps(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getapps.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getapps.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getapps(json);
    }

    public function changeAppInfo(appid:Object = null, session:String = null, targetAppid:String = null, field:String = null, value:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, field:field, value:value, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.changeappinfo.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.changeappinfo.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.changeappinfo(json);
    }

    public function setAppPermission(appid:Object = null, session:String = null, targetAppid:String = null, login:String = null, right:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, login:login, right:right, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.setapppermission.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.setapppermission.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.setapppermission(json);
    }

    public function getAppPermission(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getapppermission.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getapppermission.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getapppermission(json);
    }

    public function allowAppAccess(appid:Object = null, session:String = null, targetAppid:String = null, allowAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, allowAppid:allowAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.allowappaccess.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.allowappaccess.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.allowappaccess(json);
    }

    public function removeAppAccess(appid:Object = null, session:String = null, targetAppid:String = null, allowAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, allowAppid:allowAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removeappaccess.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removeappaccess.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removeappaccess(json);
    }

    public function getAppAccess(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getappaccess.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getappaccess.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getappaccess(json);
    }

    public function createAppsPool(appid:Object = null, session:String = null, name:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, name:name, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.createappspool.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.createappspool.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.createappspool(json);
    }

    public function deleteAppsPool(appid:Object = null, session:String = null, name:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, name:name, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.deleteappspool.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.deleteappspool.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.deleteappspool(json);
    }

    public function getAppsPools(appid:Object = null, session:String = null, name:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, name:name, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getappspools.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getappspools.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getappspools(json);
    }

    public function addAppToPool(appid:Object = null, session:String = null, name:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, name:name, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.addapptopool.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.addapptopool.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.addapptopool(json);
    }

    public function removeAppFromPool(appid:Object = null, session:String = null, name:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, name:name, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.removeappfrompool.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.removeappfrompool.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.removeappfrompool(json);
    }

    public function rebuildApp(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.rebuildapp.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.rebuildapp.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.rebuildapp(json);
    }

    public function exportAppPersistance(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.exportapppersistance.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.exportapppersistance.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.exportapppersistance(json);
    }

    public function exportAppResources(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.exportappresources.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.exportappresources.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.exportappresources(json);
    }

    public function importAppPersistance(appid:Object = null, session:String = null, path:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, path:path, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.importapppersistance.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.importapppersistance.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.importapppersistance(json);
    }

    public function importAppResources(appid:Object = null, session:String = null, path:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, path:path, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.importappresources.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.importappresources.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.importappresources(json);
    }

    public function cloneApp(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.cloneapp.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.cloneapp.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.cloneapp(json);
    }

    public function createSolution(appid:Object = null, session:String = null, targetAppid:String = null, clonable:Boolean = false, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, clonable:clonable, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.createsolution.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.createsolution.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.createsolution(json);
    }

    public function deleteSolution(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.deletesolution.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.deletesolution.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.deletesolution(json);
    }

    public function changeSolutionInfo(appid:Object = null, session:String = null, targetAppid:String = null, field:String = null, value:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, field:field, value:value, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.changesolutioninfo.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.changesolutioninfo.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.changesolutioninfo(json);
    }

    public function getSolution(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getsolution.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getsolution.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getsolution(json);
    }

    public function getSolutions(appid:Object = null, session:String = null, targetAppid:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, targetAppid:targetAppid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getsolutions.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getsolutions.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getsolutions(json);
    }

    public function findSolutions(appid:Object = null, session:String = null, keywords:String = null, description:String = null, from:int = -1, count:int = -1, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, keywords:keywords, description:description, from:from, count:count, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "applications";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.findsolutions.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.findsolutions.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.findsolutions(json);
    }

}
}
