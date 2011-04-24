package com.hivext.api.utils {
import com.hivext.api.AbstractService;

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

/**
 * @copyright Hivext Technology, http://hivext.ru, http://hivext.com
 **/

public class Batch extends AbstractService {
    public static var SERVER_SERVICE_URL:String = SERVER_URL;
    public static var SERVICE_PATH:String = "utils/batch/";
    public static var SERVICE_URL:String = SERVER_SERVICE_URL + SERVICE_PATH;
    private var serviceUrl:String = SERVICE_URL;
    private var appid:String = null;
    private var session:String = null;

    public function Batch(appid:Object = null, session:String = null, serviceUrl:String = null) {
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

    public function setAppid(appid:String):Batch {
        this.appid = appid;
        return this;
    }

    public function getSession():String {
        return session;
    }

    public function setSession(session:String):Batch {
        this.session = session;
        return this;
    }

    public function getServiceUrl():String {
        return serviceUrl;
    }

    public function setServiceUrl(serviceUrl:String):Batch {
        this.serviceUrl = serviceUrl;
        return this;
    }

    public function call(appid:Object = null, request:String = null, sync:Boolean = false, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, request:request, sync:sync, callback:callback};
        } else {
            json = appid;
        }
        var ro:RemoteObject = new RemoteObject();
        ro.destination = "batch";
        ro.endpoint = serviceUrl + "amf/";
        callback = json.callback;
        delete json.callback;
        ro.call.addEventListener(ResultEvent.RESULT, function(e:ResultEvent):void {
            callback(e.result);
        });
        ro.call.addEventListener(FaultEvent.FAULT, function (e:FaultEvent):void {
            callback({result:99, error:e.fault.faultDetail});
        });
        ro.call(json);
    }

}
}
