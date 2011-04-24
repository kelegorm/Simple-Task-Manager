package ru.kelegorm.simplemanager_api.tasks {
import com.hivext.api.data.Base;

import mx.collections.ArrayCollection;

import ru.kelegorm.simplemanager_api.TaskModel;
import ru.kelegorm.simplemanager_api.ManagerAPI;
import ru.kelegorm.simplemanager_api.ManagerAuth;

/** Класс, у которого запрашивают задачи*/
public class TaskLoader {
    public static var taskParams:ViewTaskParameters = new ViewTaskParameters();

    private var _callback:Function;

    public function TaskLoader() {
    }

    /** Возвращает в каллбэк список айдишников тасков */
    public function GetTaskIds(callback:Function):void {
        if (ManagerAuth.isLogged()) callbackCaller();
        _callback = callback;

        var data:Object = new Object();
        data.appid = ManagerAuth.userAppId;
        data.session = ManagerAuth.session;

        data.type = "task";
        data.criteria = {};
        data.criteria.project_id = {"=":ManagerAPI.currentProjectID};
        if (taskParams.criteria.status) data.criteria.status = taskParams.criteria.status;
        data.callback = getTaskIdsResponse;

        new Base().getObjectsByCriteria(data);
    }

    private function getTaskIdsResponse(result:Object):void {
        result;
        if (result.result == 0) {
            TaskModel.tasksPush(result.objects.source);
            var taskIdList:Array = new Array();
            for each (var task:Object in result.objects) {
                taskIdList.push(task.id);
            }
            _callback(new ArrayCollection(taskIdList), null);
        } else
            _callback(null, {});
    }

    /** вызывает каллбэк, если тот существует */
    private function callbackCaller(params:* = null):void {
        if (_callback != null) _callback(params);
    }
}
}