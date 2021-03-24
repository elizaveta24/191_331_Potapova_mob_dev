#ifndef HTTPCONTROLLER_H
#define HTTPCONTROLLER_H
#include <QNetworkAccessManager>
#include <QObject>
#include <QJsonArray>

class HTTPController : public QObject
{
    Q_OBJECT
public:
    explicit HTTPController(QObject *parent = nullptr);
    QNetworkAccessManager *nam; //определяю переменную nam



signals:
public slots:
    void onPageInfo(QNetworkReply *reply); //определяем функцию onPageInfo
    void getPageInfo();//определяем функцию getPageInfo
         bool failed (QString add);
         bool cancel (QString add);


protected:
    QObject *pocaz;

};

#endif // HTTPCONTROLLER_H
