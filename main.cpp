#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QNetworkReply>
#include <QtWebEngine>
#include "httpcontroller.h"



int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();
    //const QUrl url(QStringLiteral("qrc:/main.qml"));
    //конструкция ниже -задает связь между событием objectCreated объекта engine
    //и коллбеки
   /* QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app,
                     [url](QObject *obj, const QUrl &objUrl) // коллбек, лямбда выражение т.к безымянная функция объявленная
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);//действия на случай ошибки внутри движка
    }, Qt::QueuedConnection);
    engine.load(url);//загрузить файл стартовой страницы в движок

    return app.exec();//начало работы приложения т.e передача управления
                      // от точки входа коду самого приложения (cpp и qml)*/
    HTTPController httpController;
    QQmlApplicationEngine engine;

     QQmlContext *context = engine.rootContext();//Контексты позволяют предоставлять данные компонентам QML, созданным механизмом QML
    context->setContextProperty("httpController", &httpController);
       //преобразование пути стартовой страницы из char в Qurl
    //подлючение слота, срабатывающего после создания objectCreated
/* engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
 if (engine.rootObjects().isEmpty())
     return -1;*/
    //подлючение слота, срабатывающего после создания objectCreated
 engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
 if (engine.rootObjects().isEmpty())
     return -1;

 QObject::connect(engine.rootObjects().first(), SIGNAL(restRequest()),
 &httpController, SLOT(restRequest()));

 QObject::connect(engine.rootObjects().first(), SIGNAL(failed(QString)),
 &httpController, SLOT(failed(QString)));


 QObject::connect(engine.rootObjects().first(), SIGNAL(cancel(QString)),
 &httpController, SLOT(cancel(QString)));



 QObject* main = engine.rootObjects()[0];
  HTTPController sendtoqml(main);
 engine.rootContext()->setContextProperty("_send", &sendtoqml);

 return app.exec();//запуск бесконечного цикла обработки сообщений и слотов/сигналов
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

-конфигурация release -только код приложения и ничего лишнего
-сборка debug больше по объему , чем release, так как содержит встроенную информацию для привязки
полученного машинного кода к исходным строкам кода
для возможности работать в отладчике именно с исходным кодом

сборка debug больше (в 3 раза и более) и медленее, а также содержит информацию
об исходном коде приложения, по которому злоумышленники могут провести реверс-инжиниринг

отладка C++ кода производится обязательно в конфигурационном debug и с запущенным отладчиком(F5 вместо Ctrl+R)
кроме того, отладка С++ может производиться печатью qDebug() <<"текст"; (не только в debug  и не только под отладчиком)
отладка QML кода также производится либо отладочной печатью(быстрее) или под отладчиком

если на странице графических элементов не много, то можно выравнивать элемент по границе с соседними :
button.bottom:label.top
button.left:label.right
если элементов больше, их проще расположить в layout по логике таблицы .
Layout имеет ячейки (GridLayout и по вертикали и по горизонтали, Column
*/
