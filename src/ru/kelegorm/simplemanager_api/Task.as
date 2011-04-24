package ru.kelegorm.simplemanager_api {
import flash.events.Event;
import flash.events.EventDispatcher;

import mx.collections.ArrayCollection;

public class Task extends EventDispatcher {
    /** Индификатор задачи */
    [Bindable]
    public var id:int;

    /** Текущий статус задачи: заморожена, в работе, завершена */
    [Bindable]
    public var status:int;

    /** Индификатор проекта задачи */
    [Bindable]
    public var project_id:int;

    /** Индификатор резила, к которому приурочено выполнение задачи */
    [Bindable]
    public var release_id:int;

    /** Дата последнего события: создания, запуска, завершения */
    [Bindable]
    public var date:String;

    /** Короткое название */
    [Bindable]
    public var shortName:String;

    /** Тип задачи: задача или ошибка */
    [Bindable]
    public var type:int;

    /** Коллекция комманд для управления задачей: заморозить, открыть, и т.д. */
    [Bindable ("commandsChange")]
    public function get commands():ArrayCollection {
        switch (status) {
            case 0:
                return new ArrayCollection(["open"]);
            case 1:
                return new ArrayCollection(["freeze", "resolve"]);
            case 2:
                return new ArrayCollection(["rediscover"]);
            default:
                return new ArrayCollection();
        }
    }

    //public var commands:ArrayCollection = new ArrayCollection(["open", "resolve", "aprove"]);

    /** В качестве параметра передается нетипизированный объект, с заполненными полями */
    public function Task(data:Object) {
        if (data.id) id = data.id;

        if (!data.status) status = 0;
        else status = data.status;

        if (!data.project_id) project_id = 1;
        else project_id = data.project_id;

        if (!data.release_id) release_id = 0;
        else release_id = data.release_id;

        if (!data.date) date = getUTCDateString(new Date());
        else date = data.date;

        if (!data.shortName) shortName = "Enter Task caption";
        else shortName = data.shortName;

        if (!data.type) type = 0;
        else type = data.type;
    }

    public function Save():void {

    }


    public function Update():void {

    }

    public function UpdateFromData(data:Object):void {

    }

    public static function getUTCDateString(date:Date):String {
        return date.fullYearUTC + "-" + (date.monthUTC + 1) + "-" + date.date;
    }

    public function command(name:String):void {
        switch (name) {
            case "open":
                open();
                break;
            case "freeze":
                freeze();
                break;
            case "resolve":
                resolve();
                break;
            case "rediscover":
                rediscover();
                break;
        }


    }

    /** открыть, пустить в работу */
    private function open():void {
        if (status == 0) {
            status = 1;
            dispatchEvent(new Event("commandsChange"));
        }
    }

    /** заморозить */
    private function freeze():void {
        if (status == 1) {
            status = 0;
            dispatchEvent(new Event("commandsChange"));
        }
    }

    /** закрыть задачу (выполнена, не возможна, т.д.) */
    private function resolve():void {
        if (status == 1) {
            status = 2;
            dispatchEvent(new Event("commandsChange"));
        }
    }

    /** переоткрыть (не решена задача, ошибка проявляется вновь) */
    private function rediscover():void {
        if (status == 2) {
            status = 1;
            dispatchEvent(new Event("commandsChange"));
        }
    }

}
}