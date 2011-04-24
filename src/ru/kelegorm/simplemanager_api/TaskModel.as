package ru.kelegorm.simplemanager_api {

public class TaskModel {
    public static var projects:Object;

    /** Хэщ задач. Словарь. */
    private static var _tasks:Object = new Object;

    /** Функция добавляет загруженные объекты в хэш задач
     * приводя к типу Task */
    public static function tasksPush(tasks:Array):void {
        for (var i:int = 0; i < tasks.length; i++) {
            var item:Object = tasks[i];
            // Если закладываемая задача в хэше существует,
            // значит нужно запихивать не новый объект в кэш,
            // заменяя старый, а имено обновить содержимого старого,
            // чтобы указатели не менялись
            if (_tasks[item.id] == null)
                _tasks[item.id] = new Task(item);
            else
                _tasks[item.id].UpdateFromData(item);
        }
    }

    /** Возвращает задачу по её ID */
    public static function taskGet(id:int):Task {
        return _tasks[id];
    }
}
}