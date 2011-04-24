package com.hivext.api {
import com.adobe.serialization.json.JSON;

public class AbstractService {
    public static var SERVER_URL:String = "http://app.hivext.com/1.0/";

    public function AbstractService() {
    }

    public function encode(obj:Object):Object {
        for (var key:String in obj) {
            var value:Object = obj[key];
            if (!(value is String || value is Number || value is Boolean)) {
                obj[key] = JSON.encode(value);
            }
        }
        return obj;
    }
}
}