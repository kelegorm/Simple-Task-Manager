/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 15.04.11
 * Time: 23:24
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
public interface ICommand {
    function execute(params:Object):Object;
}
}
