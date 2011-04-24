package ru.kelegorm.simplemanager_api {
import com.hivext.api.data.Base;
import com.hivext.api.users.Authentication;

public class ManagerAuth {
    public static const HivextId:String = "1dd8d191d38fff45e62564fcf67fdcd6";
    public static const mainAppId:String = "ed548e8c8e4d8eda46042d82072ccf08";
    public static var userAppId:String;

    public static var session:String;

    private var _callback:Function;

    public function ManagerAuth() {
    }

    public static function isLogged():Boolean {
        return (userAppId == "") ? false : true;
    }


    /**
     * Проверяет логин и пароль на сервере.
     * по положительному ответу устанавливает сессию
     * и вызывает getUserApplication, чтобы загрузить базу данных пользователя.
     *
     * после этого вызывается калбек с параметрами ({}, null)
     * При неудачном вызове калбек вызывается с параметрами (null, {error:"текст ошибки"})
     */
    public function Logon(login:String, pass:String, callback:Function):void {
        _callback = callback;

        var data:Object = new Object();
        data.appid = HivextId;
        data.login = login;
        data.password = pass;
        data.callback = logonResponce;

        new Authentication().signin(data);
    }

    private function logonResponce(result:Object):void {
        var error:Object;

        if (result.result == 0) {
            session = result.session;
            getUserApplication();
        } else {
            error = new Object;
            error.message = result.error;
            error.result = result.result;
            _callback(null, error);
        }
    }

    /**
     * Запрашиваем ID аппликейшена, зарегестрированного за пользователем
     */
    private function getUserApplication():void {
        var data:Object = new Object();
        data.appid = mainAppId;
        data.session = session;

        data.type = "appUser";
        data.count = 1;
        data.criteria = "{'email':{'LIKE':'" + Settings.login + "'}}";
        data.callback = getUserApplicationResponse;

        new Base().getObjectsByCriteria(data);
    }

    private function getUserApplicationResponse(response:Object):void {
        if (response.result == 0) {
            if (response.objects[0]) {
                userAppId = response.objects[0].applicationID;
                _callback({}, null);
            }
        }
    }
}
}