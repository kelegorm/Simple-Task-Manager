/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 15.04.11
 * Time: 23:45
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import com.hivext.api.data.Base;

import flash.events.EventDispatcher;

import mx.collections.ArrayCollection;

[Event(name="", type="")]

/**
 * Объект запроса списка айдишников задач. В параметрах передаются фильтр
 */
public class GetTasksRequest extends EventDispatcher implements ICommand {
    public function GetTasksRequest() {
    }

    public function execute(params:Object):Object {
        //TODO обработка ошибок
        if (ManagerAuth.isLogged()) {
            //TODO Внедрить проверку на уществование записей в кэше

            var data:Object = new Object();
            data.appid = ManagerAuth.userAppId;
            data.session = ManagerAuth.session;

            data.type = "task";
            data.criteria = {};
            data.criteria.project_id = {"=":ManagerAPI.currentProjectID};
            //if (taskParams.criteria.status) data.criteria.status = taskParams.criteria.status;
            data.callback = getObjectsByCriteriaResponse;

            new Base().getObjectsByCriteria(data);
        } else {
            dispatchEvent(new GetTasksEvent(GetTasksEvent.LOAD_ERROR, null));
        }
        return null;
    }

    private function getObjectsByCriteriaResponse(response:Object):void {
        if (response && response.result == 0) {
            TaskModel.tasksPush(response.objects.source);
            var taskIdList:Array = new Array();
            for each (var task:Object in response.objects) {
                taskIdList.push(task.id);
            }
            dispatchEvent(new GetTasksEvent(GetTasksEvent.TASKS_LOADED, new ArrayCollection(taskIdList)));
        } else {
            dispatchEvent(new GetTasksEvent(GetTasksEvent.LOAD_ERROR, null));
        }

    }
}
}
