package ru.kelegorm.simplemanager_api {
[Bindable]
public class VOTask {
    /** Индификатор задачи */
    public var id:int;

    /** Индификатор проекта задачи */
    public var project_id:int;

    /** Индификатор релиза, к которому приурочено выполнение задачи */
    public var release_id:int;

    /** Короткое название */
    public var shortName:String;
    private static const SHORTNAME_DEFAULT:String = "Enter Task caption";

    /** Тип задачи: задача или ошибка */
    public var type:int;
    private static const TYPE_NEW_FUNCTION:int = 0;
    private static const TYPE_BUG:int = 1;
    private static const TYPE_DEFAULT:int = TYPE_NEW_FUNCTION;

    /** Текущий статус задачи: заморожена, в работе, завершена */
    public var status:int;
    private static const STATUS_FREEZE:int = 0;
    private static const STATUS_IN_WORK:int = 1;
    private static const STATUS_COMPLETE:int = 2;
    private static const STATUS_REOPEN:int = 3;
    private static const STATUS_DEFAULT:int = STATUS_FREEZE;

    /** Дата последнего события: создания, запуска, завершения */
    public var date:String;

    public function VOTask(data:Object) {
        if (data.id) id = data.id;

        status = (data.status !== undefined) ? data.status : STATUS_DEFAULT;

        project_id = (data.project_id !== undefined) ? data.project_id : 1;

        release_id = (data.release_id !== undefined) ? data.release_id : 0;

        shortName = (data.shortName !== undefined) ? data.shortName : SHORTNAME_DEFAULT;

        type = (data.type !== undefined) ? TYPE_DEFAULT : data.type;

        date = (data.date !== undefined) ? data.date : getUTCDateString(new Date());
    }

    public static function getUTCDateString(date:Date):String {
        return date.fullYearUTC + "-" + (date.monthUTC + 1) + "-" + date.date;
    }
}
}