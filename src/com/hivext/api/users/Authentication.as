package com.hivext.api.users {
import com.hivext.api.AbstractService;

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

/**
 * @copyright Hivext Technology, http://hivext.ru, http://hivext.com
 **/

public class Authentication extends AbstractService {
    public static var SERVER_SERVICE_URL:String = SERVER_URL;
    public static var SERVICE_PATH:String = "users/authentication/";
    public static var SERVICE_URL:String = SERVER_SERVICE_URL + SERVICE_PATH;
    private var serviceUrl:String = SERVICE_URL;
    private var appid:String = null;
    private var session:String = null;

    public function Authentication(appid:Object = null, session:String = null, serviceUrl:String = null) {
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

    public function setAppid(appid:String):Authentication {
        this.appid = appid;
        return this;
    }

    public function getSession():String {
        return session;
    }

    public function setSession(session:String):Authentication {
        this.session = session;
        return this;
    }

    public function getServiceUrl():String {
        return serviceUrl;
    }

    public function setServiceUrl(serviceUrl:String):Authentication {
        this.serviceUrl = serviceUrl;
        return this;
    }

    public function checkSign(appid:Object = null, session:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "authentication";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.checksign.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.checksign.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.checksign(json);
    }

    public function checkUser(appid:Object = null, session:String = null, login:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, login:login, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "authentication";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.checkuser.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.checkuser.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.checkuser(json);
    }

    public function changeSession(appid:Object = null, session:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "authentication";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.changesession.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.changesession.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.changesession(json);
    }

    public function signout(appid:Object = null, session:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, session:session, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "authentication";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.signout.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.signout.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.signout(json);
    }

    public function signin(appid:Object = null, login:String = null, password:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, login:login, password:password, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "authentication";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.signin.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.signin.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.signin(json);
    }

    public function getDeviceSignature(appid:Object = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "authentication";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.getdevicesignature.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.getdevicesignature.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.getdevicesignature(json);
    }

}
}
