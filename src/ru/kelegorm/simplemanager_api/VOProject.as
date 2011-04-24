package ru.kelegorm.simplemanager_api {
[Bindable]
public class VOProject {
    public var name:String;
    public var description:String;
    public var id:uint;
    public var creator:uint;

    public function VOProject(value:Object) {
        name = value.name;
        description = value.description;
        id = value.id;
        creator = value.creator;
    }
}
}