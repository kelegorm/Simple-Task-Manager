package ru.kelegorm.simplemanager_api {
import com.hivext.api.data.Base;

import mx.collections.ArrayCollection;

import ru.kelegorm.simplemanager_api.tasks.TaskLoader;

public class ManagerBase {
    private var _callback:Function;

    public function ManagerBase() {
    }

    public function GetProjects(callback:Function):void {
        if (ManagerAuth.userAppId == "") _callback(null, {});
        _callback = callback;

        var data:Object = new Object();
        data.appid = ManagerAuth.userAppId;
        data.session = ManagerAuth.session;

        data.type = "project";
        data.callback = getProjectsResponse;

        new Base().getObjects(data);
    }

    private function getProjectsResponse(result:Object):void {
        if (result.result == 0) {
            _callback(result.objects, null);
        } else
            _callback(null, {});
    }

    /** загружает список айдюков */
    public function GetTaskIds(callback:Function):void {
        if (ManagerAuth.userAppId == "") _callback(null, {});
        _callback = callback;

        var data:Object = new Object();
        data.appid = ManagerAuth.userAppId;
        data.session = ManagerAuth.session;

        data.type = "task";
        //data.criteria = "{\"project_id\":{\"=\":" + ManagerAPI.currentProjectID + "}}";
        data.criteria = {};
        data.criteria.project_id = {"=":ManagerAPI.currentProjectID};
        data.criteria.status = TaskLoader.taskParams.criteria.status;
        data.callback = getTasksResponse;

        new Base().getObjectsByCriteria(data);
    }

    private function getTasksResponse(result:Object):void {
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
}
}