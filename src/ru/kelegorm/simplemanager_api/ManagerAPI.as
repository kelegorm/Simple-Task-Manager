package ru.kelegorm.simplemanager_api {
public class ManagerAPI {
    public static var currentProjectID:int = -1;

    public function ManagerAPI() {
    }

    public static function init():void {
        // проверяем куки-шмуки и возможно автоматический вход
    }

    public static function Logon(login:String, pass:String, callback:Function):void {
        Settings.login = login;
        new ManagerAuth().Logon(login, pass, callback);
    }

    public static function GetProjects(callback:Function):void {
        new ManagerBase().GetProjects(callback);
    }
}
}