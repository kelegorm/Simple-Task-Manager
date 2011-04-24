/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 17.04.11
 * Time: 23:54
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import flash.events.EventDispatcher;

public class UpdateTaskRequest extends EventDispatcher implements ICommand {
    public function UpdateTaskRequest() {
    }

    public function execute(params:Object):Object {
        return null;
    }
}
}
