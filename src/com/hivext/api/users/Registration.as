package com.hivext.api.users {
import com.hivext.api.AbstractService;

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

/**
 * @copyright Hivext Technology, http://hivext.ru, http://hivext.com
 **/

public class Registration extends AbstractService {
    public static var SERVER_SERVICE_URL:String = SERVER_URL;
    public static var SERVICE_PATH:String = "users/registration/";
    public static var SERVICE_URL:String = SERVER_SERVICE_URL + SERVICE_PATH;
    private var serviceUrl:String = SERVICE_URL;
    private var appid:String = null;
    private var session:String = null;

    public function Registration(appid:Object = null, session:String = null, serviceUrl:String = null) {
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

    public function setAppid(appid:String):Registration {
        this.appid = appid;
        return this;
    }

    public function getSession():String {
        return session;
    }

    public function setSession(session:String):Registration {
        this.session = session;
        return this;
    }

    public function getServiceUrl():String {
        return serviceUrl;
    }

    public function setServiceUrl(serviceUrl:String):Registration {
        this.serviceUrl = serviceUrl;
        return this;
    }

    public function checkPassword(appid:Object = null, password:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, password:password, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "registration";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.checkpassword.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.checkpassword.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.checkpassword(json);
    }

    public function checkEmailRegistration(appid:Object = null, email:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, email:email, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "registration";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.checkemailregistration.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.checkemailregistration.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.checkemailregistration(json);
    }

    public function checkEmailExist(appid:Object = null, email:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, email:email, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "registration";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.checkemailexist.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.checkemailexist.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.checkemailexist(json);
    }

    public function createAccount(appid:Object = null, email:String = null, password:String = null, name:String = null, checkEmail:Boolean = false, welcome:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, email:email, password:password, name:name, checkEmail:checkEmail, welcome:welcome, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "registration";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.createaccount.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.createaccount.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.createaccount(json);
    }

    public function activate(appid:Object = null, key:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, key:key, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "registration";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.activate.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.activate.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.activate(json);
    }

    public function resendInvitation(appid:Object = null, email:String = null, welcome:String = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, email:email, welcome:welcome, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "registration";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.resendinvitation.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.resendinvitation.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.resendinvitation(json);
    }

}
}
