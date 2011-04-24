/**
 * Created by ${PRODUCT_NAME}.
 * User: kel
 * Date: 17.04.11
 * Time: 14:04
 * To change this template use File | Settings | File Templates.
 */
package ru.kelegorm.simplemanager_api {
import flash.events.Event;

import mx.collections.ArrayCollection;

public class GetProjectsEvent extends Event {
    public static const PROJECTS_LOADED:String = "ProjectssLoaded";
    public static const LOAD_ERROR:String = "LoadError";

    public var items:ArrayCollection;

    public function GetProjectsEvent(type:String, items:ArrayCollection) {
        super(type);

        this.items = items;
    }
}
}
