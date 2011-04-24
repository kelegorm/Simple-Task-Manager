package com.hivext.api.storage {
import com.adobe.serialization.json.JSON;
import com.hivext.api.AbstractService;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.FileReference;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLRequestHeader;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;
import flash.utils.ByteArray;
import flash.utils.Endian;

/**
 * @copyright Hivext Technology, http://hivext.ru, http://hivext.com
 **/

public class Uploader extends AbstractService {
    public static var SERVER_SERVICE_URL:String = SERVER_URL;
    public static var SERVICE_PATH:String = "storage/uploader/";
    public static var SERVICE_URL:String = SERVER_SERVICE_URL + SERVICE_PATH;
    private var serviceUrl:String = SERVICE_URL;
    private var appid:String = null;
    private var session:String = null;

    public function Uploader(appid:Object = null, session:String = null, serviceUrl:String = null) {
        var json:Object = {};
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

    public function setAppid(appid:String):Uploader {
        this.appid = appid;
        return this;
    }

    public function getSession():String {
        return session;
    }

    public function setSession(session:String):Uploader {
        this.session = session;
        return this;
    }

    public function getServiceUrl():String {
        return serviceUrl;
    }

    public function setServiceUrl(serviceUrl:String):Uploader {
        this.serviceUrl = serviceUrl;
        return this;
    }

    public function upload(appid:Object = null, fid:String = null, file:FileReference = null, callback:Function = null):void {
        var json:Object = null;
        if (appid is String) {
            json = {appid:appid, fid:fid, file:file, callback:callback};
        } else {
            json = appid;
        }

        file = json.file;
        delete json.file;
        callback = json.callback;
        delete json.callback;


        file.addEventListener(Event.CANCEL, cancelHandler);
        file.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void {
            callback({result:99, error:e.text});
        });
        file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
        file.addEventListener(Event.COMPLETE, function(e:Event):void {
            var request:URLRequest = new URLRequest();
            request.url = serviceUrl + "rest/upload";
            request.method = URLRequestMethod.POST;
            var params:URLVariables = new URLVariables();
            var boundary:String = getBoundary();
            request.data = uploadFile(boundary, file.name, file.data, json);
            request.requestHeaders.push(new URLRequestHeader('Cache-Control', 'no-cache'));
            request.requestHeaders.push(new URLRequestHeader('Content-Type', 'multipart/form-data; boundary=' + boundary));

            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, function(e:Event):void {
                var loader:URLLoader = URLLoader(e.target);
                callback(JSON.decode(loader.data.toString()));
            });
            loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void {
                callback({result:99, error:e.text});
            });
            loader.dataFormat = URLLoaderDataFormat.BINARY;

            loader.load(request);
        });

        file.load();

        /*
         есть проблема - не изестно как убрать
         ------------cH2gL6ae0GI3Ef1Ij5cH2Ef1ei4gL6
         Content-Disposition: form-data; name="Upload"

         Submit Query
         **/
        /*
         file.addEventListener(Event.CANCEL, cancelHandler);
         file.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent):void{
         callback({result:99, error:e.text});
         });
         file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
         file.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, function(e:DataEvent):void{
         callback(JSON.decode(e.data));
         });

         var request:URLRequest = new URLRequest();
         request.url = serviceUrl + "rest/upload";
         request.method = URLRequestMethod.POST;
         var params:URLVariables = new URLVariables();
         //request.requestHeaders.push(new URLRequestHeader('X-File-Size', file.size + ''));
         params.appid = json.appid;
         params.fid = json.fid;
         params.Upload = "BLABLA";
         request.data = params;

         file.upload(request, "file", false);
         */

    }


    public function getBoundary():String {

        var boundary:String = "---------------------------";
        for (var i:int = 0; i < 0x20; i++) {
            boundary += String.fromCharCode(int(97 + Math.random() * 25));
        }

        return boundary;
    }

    //http://www.actionscript.org/forums/showthread.php3?t=232598
    public function uploadFile(boundary:String, fileName:String, byteArray:ByteArray, parameters:Object = null):ByteArray {

        var i:int;
        var bytes:String;

        var postData:ByteArray = new ByteArray();
        postData.endian = Endian.BIG_ENDIAN;
        //add Filename to parameters
        if (parameters != null) {
            //add parameters to postData
            for (var name:String in parameters) {
                postData = BOUNDARY(boundary, postData);
                postData = LINEBREAK(postData);
                bytes = 'Content-Disposition: form-data; name="' + name + '"';
                for (i = 0; i < bytes.length; i++) {
                    postData.writeByte(bytes.charCodeAt(i));
                }
                postData = LINEBREAK(postData);
                postData = LINEBREAK(postData);
                postData.writeUTFBytes(parameters[name]);
                postData = LINEBREAK(postData);
            }
        }

        //add Filedata to postData
        postData = BOUNDARY(boundary, postData);
        postData = LINEBREAK(postData);
        bytes = 'Content-Disposition: form-data; name="file"; filename="';
        for (i = 0; i < bytes.length; i++) {
            postData.writeByte(bytes.charCodeAt(i));
        }
        postData.writeUTFBytes(fileName);
        postData = QUOTATIONMARK(postData);
        postData = LINEBREAK(postData);
        bytes = 'Content-Type: application/octet-stream';
        for (i = 0; i < bytes.length; i++) {
            postData.writeByte(bytes.charCodeAt(i));
        }
        postData = LINEBREAK(postData);
        postData = LINEBREAK(postData);
        postData.writeBytes(byteArray, 0, byteArray.length);
        postData = LINEBREAK(postData);

        /*//add upload filed to postData
         postData = LINEBREAK(postData);
         postData = BOUNDARY(postData);
         postData = LINEBREAK(postData);

         bytes = 'Content-Disposition: form-data; name="Upload"';
         for ( i = 0; i < bytes.length; i++ ) {
         postData.writeByte( bytes.charCodeAt(i) );
         }
         postData = LINEBREAK(postData);
         postData = LINEBREAK(postData);
         bytes = 'Submit Query';
         for ( i = 0; i < bytes.length; i++ ) {
         postData.writeByte( bytes.charCodeAt(i) );
         }
         */
        postData = LINEBREAK(postData);
        //closing boundary
        postData = BOUNDARY(boundary, postData);
        postData = DOUBLEDASH(postData);

        return postData;
    }

    /**
     * Add a boundary to the PostData with leading doubledash
     */
    private function BOUNDARY(boundary:String, p:ByteArray):ByteArray {
        var l:int = boundary.length;

        p = DOUBLEDASH(p);
        for (var i:int = 0; i < l; i++) {
            p.writeByte(boundary.charCodeAt(i));
        }
        return p;
    }

    /**
     * Add one linebreak
     */
    private function LINEBREAK(p:ByteArray):ByteArray {
        p.writeShort(0x0d0a);
        return p;
    }

    /**
     * Add quotation mark
     */
    private function QUOTATIONMARK(p:ByteArray):ByteArray {
        p.writeByte(0x22);
        return p;
    }

    /**
     * Add Double Dash
     */
    private function DOUBLEDASH(p:ByteArray):ByteArray {
        p.writeShort(0x2d2d);
        return p;
    }


    private function cancelHandler(event:Event):void {
        trace("cancelHandler: " + event);
    }

    private function progressHandler(event:ProgressEvent):void {
        var file:FileReference = FileReference(event.target);
        trace("progressHandler name=" + file.name + " bytesLoaded=" + event.bytesLoaded + " bytesTotal=" + event.bytesTotal);
    }


}
}
