/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 15.04.11
 * Time: 23:38
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import flash.events.EventDispatcher;

public class GetTaskDataRequest extends EventDispatcher implements ICommand {
    public function GetTaskDataRequest() {
    }

    public function execute(task_id:Object):Object {
        var result:Task = TaskModel.taskGet(task_id as int);

        if (result != null) {
            dispatchEvent(new GetTaskDataEvent(GetTaskDataEvent.TASK_LOADED, result));
        } else {
            dispatchEvent(new GetTaskDataEvent(GetTaskDataEvent.LOAD_ERROR, null));
        }
        return null;
    }
}
}
