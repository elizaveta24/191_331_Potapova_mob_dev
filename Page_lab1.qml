import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtMultimedia 5.12

Page {
    width: 600
    height: 400

    id: page1
    header: ToolBar{ //создание панели
        background: Rectangle { //создание фона
            id:rec1//заполнение панели цветом
            color: "#DCDCDC" //цвет
        }
        GridLayout{
            id:layout1 //задание id
            anchors.fill:parent //по ширине родителя
            columns:4 //столбцы
            rows: 1 //строки
        ToolButton { //создание кнопки с иконкой
            id:buttontwitter //задание id
            Layout.row:0
            Layout.column:0
            anchors.left:parent.left //привязка слева от родителя
            icon.name: "twitter" //название иконки
            icon.source: "qrc:/icon/twitter.png" //источник
            icon.color:"#1E90FF" //цвет
        }
        Label { //Создание метки с текстом
            id:label1 //задание id
            text: qsTr("Лабораторная работа №1") //текст
            color:"#1E90FF" //цвет
            Layout.row:0
            Layout.column:1
        }
        ToolButton { //создание кнопки с иконкой
            id:buttonlens //задание id
            icon.name: "lens" //имя иконки
            icon.source: "qrc:/icon/3844432-magnifier-search-zoom_110300.png"//источник
            icon.color:"#1E90FF" //цвет икноки
            Layout.row:0
            Layout.column:2

        }
        ToolButton { //создание кнопки с иконкой
            id:buttonmenu //задание id
            icon.name: "lens" //имя иконки
            icon.source: "qrc:/icon/Menu_icon_icon-icons.com_71858.png"//источник
            icon.color:"#1E90FF" //цвет икноки
            Layout.row:0
            Layout.column:3

        }

       }
    }
    GridLayout{
        columns:2 //столбцы
        rows: 4 //строки
        anchors.fill:parent
        TextField{
            id:text1
            placeholderText: qsTr("ФИО")
            color:"#4682B4" //цвет текста
            Material.accent: Material.Blue //стиль материала
            Layout.row:0
            Layout.column:0
            Layout.leftMargin: 25 //отступ слева
            anchors.top:parent.top //привязка сверху от родителя
            anchors.topMargin: 55 //отступ сверху
            Text { //текст
                 id:field1//задание id
                 text:"Напишите ФИО" //текст
                 color:"#1E90FF" //цвет
                 font.underline:true //подчеркивание текста
                 font.family: "Courier"
                 font.pixelSize: 15
                 anchors.bottom:text1.top //привязка сверху над text1
                 Image { //создание картинки
                     id:imagepen //задание id
                      width: 15; height: 15 //ширина высота
                      smooth: true //гладкость
                      source: "qrc:/icon/353430-checkbox-edit-pen-pencil_107516.png"//источник
                      anchors.left:field1.right //расположение справа от field1
                      anchors.leftMargin: 3 //отступ слева
                      ColorOverlay { //цвет картинки
                            anchors.fill: imagepen //на всю картинку
                            source: imagepen // источник
                            color: "#4682B4"  // make image like it lays under red glass
                        }
                 }
            }
        }
        BusyIndicator{
            id:busy1
            Layout.row:0
            Layout.column:1
            running:true
            Material.accent: Material.Blue //стиль материала индикатора
            Text {
                id:busytext
                text:"Подождите"
                color:"#1E90FF"
                font.strikeout : true
                anchors.top:busy1.bottom // расположение снизу под индикатором
                anchors.topMargin: 5 //отступ
                font.family: "Courier"
                font.pixelSize: 15
                anchors.verticalCenter: busy1.verticalCenter //вертикально в центре от busy1
            }
        }
        Component{ //изменение цвета и стиля для delegateComponent
            id:delegateComponent //задание id
            Label{
                text:modelData
                font.family: "Courier"
                color:"#696969"
            }
        }
        Tumbler{
            id: hoursTumbler //задание id
            model:24 //кол-во чисел в модели
            delegate: delegateComponent //инкапсулирует модель
            Layout.row:2
            Layout.column:0
            Layout.leftMargin: 30 //отступ слева
            anchors.top:rectangle.bottom //привязка снизу от rectangle
            anchors.topMargin: 70 //отступ сверху от rectangle

        }

            Tumbler{ //создание тумблера минут
                  id: minuteTumbler //задание id
                  Layout.row:2
                  Layout.column:0
                  model: 60 //кол-во чисел в модели
                  delegate: delegateComponent //инкапсулирует модель
                  anchors.left:hoursTumbler.left
                  anchors.leftMargin:30 //отступ слева от тумблера часов
                  anchors.top: hoursTumbler.top //на одном уровне с тумблером часов

              }
              Tumbler{ //создание тумблера секунд
                  id: secTumbler //задание id
                  Layout.row:2
                  Layout.column:0
                  model: 60 //кол-во чисел в модели
                  delegate: delegateComponent //инкапсулирует модель
                  anchors.left:minuteTumbler.left
                  anchors.leftMargin:30 //отступ от тумблера минут
                  anchors.top: minuteTumbler.top //на одном уровне с тумблером минут
                 }
            Text { //создание текста
               id:texttime //задание id
               text:"Время"
               color:"#1E90FF"
               font.underline:true //подчеркивание текста снизу
               font.family: "Courier"
               font.pixelSize: 15
               anchors.bottom:secTumbler.top
               anchors.bottomMargin: 10
               anchors.left:hoursTumbler.left
               Image { //создание картинки
                   id:imageclock //задание id
                    width: 15; height: 15 //высота ширина
                    smooth: true //гладкий
                    source: "qrc:/icon/clock_time_5025.png" //источник
                    anchors.left:texttime.right //расположение справа от sl
                    anchors.leftMargin: 5 // Отступ
                    ColorOverlay { //создание цвета картинки
                          anchors.fill: imageclock //на всю картинку
                          source: imageclock //источник
                          color: "#4682B4"  // make image like it lays under red glass
                      }
               }

     }

            Rectangle{ //создание панели
                id:rectangle
                Layout.row:1
                Layout.column:0
                height: 30
                width: parent.width
                radius: 10
                anchors.left: parent.left //привязка слева от родителя
                anchors.right: parent.right //привязка справа от родителя
                anchors.top: parent.top //привязка сверху от родителя
                anchors.topMargin: 140 //отступ сверху
                color: "#DCDCDC"
                Text{
                    id:textconf
                    text: "Настройки параметров"
                    font.pixelSize: 15
                    color: "#1E90FF"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Image { //создание картинки
                        id:imageconf //задание id
                         width: 20; height: 20 //ширина высота
                         smooth: true //гладкость
                         source: "qrc:/icon/iconfinder-settings-4341324_120534.png"//источник
                         anchors.left:textconf.right //расположение справа от textconf
                         anchors.leftMargin: 3 //отступ слева

                    }
                }
            }
       CheckBox{
           id:check1
           Layout.row:2
           Layout.column:1
           anchors.top:rectangle.bottom //привязка снизу от rectangle
           anchors.topMargin: 90 //отступ сверху
           text:qsTr(textr)
           Material.accent: Material.Blue //стиль материала
           Text{ //создание текста
               id:textr //задание id
               text:("Ретвитнуть")
               font.family: "Courier"
               font.pixelSize: 15
               color:"#1E90FF"
               anchors.horizontalCenter: check1.horizontalCenter //горизонтально в центре от check1
               anchors.bottom:check1.top //привязка сверху от check1
               Image { //создание картинки
                   id:image3 //задание id
                    width: 15; height: 15 //высота ширина
                    smooth: true //гладкий
                    source: "qrc:/icon/retweet_87545.png" //источник
                    anchors.left:textr.right//расположение справа от sl
                    anchors.leftMargin: 5// Отступ
                    ColorOverlay { //цвет для слайдера
                          anchors.fill: image3 // на весь слайдер
                          source: image3 //источник
                          color: "#4682B4"  // make image like it lays under red glass
                      }

               }
           }
       }
       Switch{
           id:switch1 //задаем id
           Layout.row:2
           Layout.column:1
           text: qsTr(textr1) // передаем textr1
           Material.accent: Material.Blue //стиль материала
           anchors.top:check1.bottom // расположение снизу под check1
           anchors.topMargin: 15 // отступ
           Text{ //создание текста
               id:textr1
               text:("Тёмная тема")
               font.family: "Courier"
               font.pixelSize: 15
               color:"#1E90FF"
               anchors.horizontalCenter: switch1.horizontalCenter //горизонтально в центре от switch1
               anchors.bottom:switch1.top
               Image { //создание картинки
                   id:image5 //задание id
                    width: 15; height: 15 //ширина высота
                    smooth: true //гладкость
                    source: "qrc:/icon/paintbrush_23864.png"//источник
                    anchors.left:textr1.right //расположение справа от textr1
                    anchors.leftMargin: 3 //отступ слева
               }
           }
       }
       Switch{
           id:switch2 //задание id
           Layout.row:2
           Layout.column:1
           anchors.left: switch1.left//расположение слева
           anchors.top:switch1.bottom//снизу под switch1
           anchors.topMargin: 15//отступ сверху
           text: qsTr(textr2)
           Material.accent: Material.Blue //стиль материала
           Text{//создание текста
               id:textr2 //задание id
               text:("Светлая тема")
               font.family: "Courier"
               font.pixelSize: 15
               color:"#1E90FF"
               anchors.horizontalCenter: switch2.horizontalCenter //горизонтально в центре от switch2
               anchors.bottom:switch2.top
               Image { //создание картинки
                   id:image6 //задание id
                    width: 15; height: 15 //ширина высота
                    smooth: true //гладкость
                    source: "qrc:/icon/paintbrush_23864.png"//источник
                    anchors.left:textr2.right //расположение справа от textr2
                    anchors.leftMargin: 3 //отступ слева

               }
           }
       }
       Button{
           id:button1
           Layout.row:3
           Layout.column:0
           anchors.horizontalCenter: parent.horizontalCenter
           Text{
               text:"сохранить"
               color:"#1E90FF"
               font.family: "Courier"
               font.pixelSize: 15
               anchors.horizontalCenter: parent.horizontalCenter//горизонтально в центре от родителя
               anchors.verticalCenter: parent.verticalCenter
           }
           background: Rectangle {

                               opacity: enabled ? 1 : 0.3
                               border.color: "#1E90FF"
                               border.width: 1
                               radius: 4
                               color:"white"
                               implicitWidth: 100
                               implicitHeight: 40
                           }

       }

}




}
