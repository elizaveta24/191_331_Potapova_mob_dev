#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;//создание объекта движка/интерпретатор QML
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    //конструкция ниже -задает связь между событием objectCreated объекта engine
    //и коллбеки
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app,
                     [url](QObject *obj, const QUrl &objUrl) // коллбек, лямбда выражение т.к безымянная функция объявленная
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);//действия на случай ошибки внутри движка
    }, Qt::QueuedConnection);
    engine.load(url);//загрузить файл стартовой страницы в движок

    return app.exec();//начало работы приложения т.e передача управления
                      // от точки входа коду самого приложения (cpp и qml)
}
/* строение проекта
.pro - файл настроек системы сборки qmake,
----все файлы из дерева
----проекта перечислены в этом файле, при удалении из pro файла удаляются из дерева
----внешние библиотеки (.lib, .h-файлы) подключаются перез pro файл
----различие процесса сборки для операционных систем задается тут же

main.cpp - точка входа в приложение. А в случае приложения QML в main создается
объект движка-интерпретатора qml-разметки

Как и в любом С++ приложении в проекте могут быть другие .cpp и .h-файлы.

Описание интерфейса приложения и простейших механик его логики содержатся в файлах
QML, которые выполнят роль frontend'a. QML - диалект JS+JSON. Qml - язык разметки



*/
