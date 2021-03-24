#include <QGuiApplication>
#include <QNetworkReply>
#include <QQmlContext>
#include <QQmlApplicationEngine>
//#include <QtWebEngine>
#include "httpcontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    //QtWebEngine::initialize();
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    /*QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);*/
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



   QObject::connect(engine.rootObjects().first(), SIGNAL(failed(QString)),
   &httpController, SLOT(failed(QString)));


   QObject::connect(engine.rootObjects().first(), SIGNAL(cancel(QString)),
   &httpController, SLOT(cancel(QString)));



   QObject* main = engine.rootObjects()[0];
    HTTPController sendtoqml(main);
   engine.rootContext()->setContextProperty("_send", &sendtoqml);

    return app.exec();
}
