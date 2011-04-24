/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 15.04.11
 * Time: 23:49
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import flash.events.Event;

import mx.collections.ArrayCollection;

public class GetTasksEvent extends Event {
    public static const TASKS_LOADED:String = "TasksLoaded";
    public static const LOAD_ERROR:String = "LoadError";

    public var items:ArrayCollection;

    public function GetTasksEvent(type:String, items:ArrayCollection) {
        super(type);

        this.items = items;
    }
}
}
