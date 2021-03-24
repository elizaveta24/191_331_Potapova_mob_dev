#include "httpcontroller.h"
#include <QNetworkRequest> // запрос
#include <QNetworkReply> // ответ
#include <QEventLoop> // (врезка обработки сигнала по месту действия)
// программа прерывается с режима ожидания, когда приходит объект и продолжает работу
#include <QDebug>
#include <QString>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QNetworkAccessManager>
#include <QUrl>




HTTPController::HTTPController(QObject *QMLObject) : pocaz(QMLObject)
{
   nam = new QNetworkAccessManager(this);//создаю менеджмент
   connect(nam, &QNetworkAccessManager::finished,
           this, &HTTPController::onPageInfo); //создание соединения сигнала о завершении запроса со слотом
}
void HTTPController::getPageInfo()
{

    QNetworkRequest request; //создание запроса
    request.setUrl(QUrl("https://yandex.ru/pogoda/moscow")); //адрес
    qDebug() << request.url();//ошибки
    QEventLoop evntLoop; //предоставляет средства входа в цикл событий и выхода из него
    connect(nam, &QNetworkAccessManager::finished, &evntLoop, &QEventLoop::quit);//создание соединения сигнала о выхоед из цикла событий
    QNetworkReply * reply;
    reply = nam->get(request);//получаем возвращаемые данные и записываем их в reply
    evntLoop.exec();//завершение цикла
    //QString replyString = reply->readAll(); //считываем все данные из reply




}
void HTTPController::onPageInfo(QNetworkReply *reply)
{
    QString str = reply->readAll(); // записываем в str наш сайт
    QObject* textField = pocaz->findChild<QObject*>("textField"); // ищем элемент textField, куда будем записывать
   // QObject* textFieldDate = pocaz->findChild<QObject*>("textFieldDate");
    QObject* textArea = pocaz->findChild<QObject*>("textArea"); // ищем элемент textArea, откуда будем брать

    textArea->setProperty("text", str); // задаем параметр "текст" для textArea из qml

    int j = 0;

     if((j = str.indexOf("temp fact__temp fact__temp_size_s", j)) != -1) // ищем индекс этого тега в тексте
     {
        //textField->setProperty("text", str.mid( j + 140,2)); // мы находим 140 символ после тега и отсчитываем 2 символов и их выводим (курс доллара) и записываем в textField
        textField->setProperty("text", str.mid( j + 162,2)); // мы находим 162 символ после тега и отсчитываем 2 символов и их выводим (градусы) и записываем в textField
     }

}
bool HTTPController::failed (QString add){

    qDebug() <<  "failed";
    if(add.indexOf("st._hi=") != -1)
    {
        QString pop;
        pop = add.split("st._hi=")[1].split(" ")[0];
          return 1;
    }
    else {
          return 0;
    }
     return 0;
}

bool HTTPController::cancel (QString add){
qDebug() <<  "failedcancel";
    if(add.indexOf("error=") != -1)
    {
      QString pop;
        pop = add.split("error=")[1].split(" ")[0];

       return 1;
    }
    else {
        return 0;
    }
   return 0;
}
