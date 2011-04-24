/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 17.04.11
 * Time: 1:29
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import flash.events.Event;

public class GetTaskDataEvent extends Event {
    public static const TASK_LOADED:String = "TaskLoaded";
    public static const LOAD_ERROR:String = "LoadError";

    public var item:Task;

    public function GetTaskDataEvent(type:String, item:Task) {
        super(type);

        this.item = item;
    }
}
}
