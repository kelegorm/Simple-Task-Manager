package ru.kelegorm.simplemanager_api {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

[Event(name="vtpChanged")]
public class ViewTaskParameters extends EventDispatcher {
    private var _criteria:Object = new Object();

    public function get criteria():Object {
        return _criteria;
    }

    public function setStatus(freeze:Boolean = true, work:Boolean = true, complete:Boolean = true):void {
        var statuses:Array = new Array();
        if (freeze) statuses.push({'=':0});
        if (work) statuses.push({'=':1});
        if (complete) statuses.push({'=':2});


        if (statuses.length == 0)
            _criteria.status = null;
        if (statuses.length == 1)
            _criteria.status = statuses[0];
        if (statuses.length > 1)
            _criteria.status = statuses;

        dispatchEvent(new Event("vtpChanged"));
    }

    private var _sort:Object;

    public function get sort():Object {
        return null;
    }

    public function ViewTaskParameters(target:IEventDispatcher = null) {
        super(target);
    }
}
}