/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 17.04.11
 * Time: 10:54
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import com.hivext.api.data.Base;

import flash.events.EventDispatcher;

import mx.collections.ArrayCollection;

public class GetProjectsRequest extends EventDispatcher implements ICommand {
    public function GetProjectsRequest() {
    }

    public function execute(params:Object):Object {
        //TODO обработка ошибок
        if (ManagerAuth.userAppId == "") return null;

        var data:Object = new Object();
        data.appid = ManagerAuth.userAppId;
        data.session = ManagerAuth.session;

        data.type = "project";
        data.callback = getProjectsResponse;

        new Base().getObjects(data);

        return null;
    }

    private function getProjectsResponse(response:Object):void {
        if (response && response.result == 0) {
            dispatchEvent(new GetProjectsEvent(GetProjectsEvent.PROJECTS_LOADED, response.objects as ArrayCollection));
        } else {
            dispatchEvent(new GetProjectsEvent(GetProjectsEvent.LOAD_ERROR, null));
        }
    }


}
}
