import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0



ApplicationWindow {
    width: 640 //ширина окна
    height: 400 //высота окна
    visible: true //отображение окна
    title: qsTr("Tabs") //заглавие

    SwipeView{
        id: swipeView //задание id
        anchors.fill:parent //на всю ширину родителя
        currentIndex: tabBar.currentIndex //tabBar

        Page { //создание 1 страницы
            Rectangle{ //фон
            id: smon_user_app_header //задание id
            height: 600 //высота
            color: "#F8F8FF" //цвет
            width: parent.width //ширина родителя
        }
            header: ToolBar { //создание панели
                background: Rectangle { //заполнение панели цветом
                    color: "#DCDCDC" //цвет
                   }
                   RowLayout { //расположение элементов на одной строке
                       id:layout1 //задание id
                       anchors.fill:parent //по ширине родителя
                       spacing:6 //интервал
                       ToolButton { //создание кнопки с иконкой
                           id:rec1 //задание id
                           icon.name: "twitter" //название иконки
                           icon.source: "qrc:/icon/twitter.png" //источник
                           icon.color:"#1E90FF" //цвет
                       }
                       Label { //Создание метки с текстом
                           id:rec2 //задание id
                           text: qsTr("Лабораторная работа №1") //текст
                           color:"#1E90FF" //цвет
                           Layout.minimumWidth: 10 //мин ширина
                           Layout.preferredWidth: 30 //предподчительная ширина
                           Layout.maximumHeight: 30 //max длина
                           Layout.minimumHeight: 10 //min длина
                           anchors.left:rec1.right  //находится справа от rec1
                           anchors.leftMargin:5 //отступ 5
                       }
                       ToolButton { //создание кнопки с иконкой
                           id:rec3 //задание id
                           icon.name: "lens" //имя иконки
                           icon.source: "qrc:/icon/3844432-magnifier-search-zoom_110300.png"//источник
                           icon.color:"#1E90FF" //цвет икноки
                           anchors.left:rec2.right //располагается справа от rec2
                           anchors.leftMargin: 180 //отступ
                       }
                     }
                   }
            GridLayout { //расположения элементов в сетке
                columns:3 //столбцы
                rows: 3 //строки
            TextField{ //используется для ввода строки текста
                id: control //задание id
                placeholderText: qsTr("") //текст в строке ввода
                anchors.left:parent.left //распологается слева, что и родитель
                anchors.leftMargin: 25 //отступ
                Layout.row:0 //строка 0
                Layout.column:0 //столбец 0
                color:"#4682B4" //цвет текста
                Material.accent: Material.Blue //стиль материала
                font.pixelSize: Qt.application.font.pixelSize * 1 //размер шрифта
                anchors.top:field1.bottom //распологается под текстом field1
                anchors.topMargin: 3 //оступ
            }
            Text { //текст
                 id:field1//задание id
                 text:"Напишите текст" //текст
                 color:"#1E90FF" //цвет
                 font.underline:true //подчеркивание текста
                 anchors.top:parent.top //расположение сверху
                 anchors.topMargin: 28 //отступ от родителя сверху
                 anchors.left:control.left// распологается слева
                 font.family: "Courier" //стиль текста
                 font.pixelSize: Qt.application.font.pixelSize * 1 // размер шрифта
                 Image { //создание картинки
                     id:image4 //задание id
                      width: 15; height: 15 //ширина высота
                      smooth: true //гладкость
                      source: "qrc:/icon/353430-checkbox-edit-pen-pencil_107516.png"//источник
                      anchors.left:field1.right //расположение справа от field1
                      anchors.leftMargin: 3 //отступ слева
                      ColorOverlay { //цвет картинки
                            anchors.fill: image4 //на всю картинку
                            source: image4 // источник
                            color: "#4682B4"  // make image like it lays under red glass
                        }
                 }
            }
               BusyIndicator{ //создание индикатора
                   id:busy1 //задание id
                   Layout.row:0 // расположение строка-0
                   Layout.column:1 // расположение столбец-1
                   running: true //вращение -true
                   Material.accent: Material.Blue //стиль материала индикатора
                   font.pixelSize: Qt.application.font.pixelSize * 1 //размер шрифта
                   anchors.left:control.right //распологается справа от control(textfiled)
                   anchors.leftMargin: 60 //оступ
                   Text { //создание текста
                         id:busytext
                         Layout.row:0 // расположение строка-0
                         Layout.column:1 //расположение столбец-1
                         text:"Подождите..."
                         color:"#1E90FF"
                         font.strikeout : true
                         font.pixelSize: Qt.application.font.pixelSize * 1 //размер шрифта
                         anchors.top:busy1.bottom // расположение снизу под индикатором
                         anchors.topMargin: 11 //отступ
                         font.family: "Courier" // стиль шрифта
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
               GridLayout{ // создание прямоугольника с расположением столбец-0 и строка-2
                   Layout.column:0
                   Layout.row:2
                   RowLayout {
                   id: layout //задание id
                       anchors.fill: parent //на всю ширину родителя
                       spacing: 1 //интервал
                       Rectangle {
                           color: '#C0C0C0'
                           Layout.fillWidth: true //на  всю ширину
                           Layout.minimumWidth: 185 //min ширина
                           Layout.preferredWidth: 185 //предпочтительная ширина
                           Layout.maximumWidth: 185 //максимальная ширина
                           Layout.minimumHeight: 30 //минимальная длина
                           anchors.left:parent.left //расположение слева
                           anchors.leftMargin: 135 //отступ слева от родителя
                       }
                    }
                 }
               GridLayout{ // создание прямоугольника с расположением столбец-0 и строка-3
                   Layout.column:0
                   Layout.row:3
                   RowLayout {
                       id: layout2 //задание id
                       anchors.fill: parent //на всю ширину родителя
                       spacing: 1 //интервал
                       Rectangle {
                           color: '#FFFFFF'
                           Layout.fillWidth: true //на всю ширину
                           Layout.minimumWidth: 185 //мин ширина
                           Layout.preferredWidth: 185 //предпотчительная ширина
                           Layout.maximumWidth: 185 //max ширина
                           Layout.minimumHeight: 35 //мин длина
                           anchors.left:parent.left // арсположение слева
                           anchors.leftMargin: 135//отступ слева от родителя
                       }
                    }
                 }
               Tumbler{ //создание тумблера часов
                  id: hoursTumbler //задание id
                  model: 24 //кол-во чисел
                  delegate: delegateComponent //инкапсулирует модель
                  Layout.column:0 //расположение столбец-0
                  Layout.row:1 //расположение строка-1
                  anchors.left:parent.left
                  anchors.leftMargin:25 //отступ слева от родителя
                  anchors.top: sl.top
                  anchors.topMargin:40 //отступ сверху от sl(text)
                  font.pixelSize: Qt.application.font.pixelSize * 1 //размер шрифта
                  scale:1.0 //масштаб
               }
                Tumbler{ //создание тумблера минут
                      id: minuteTumbler //задание id
                      model: 60 //кол-во чисел в модели
                      delegate: delegateComponent //инкапсулирует модель
                      anchors.left:hoursTumbler.left
                      anchors.leftMargin:30 //отступ слева от тумблера часов
                      anchors.top: hoursTumbler.top //на одном уровне с тумблером часов
                      font.pixelSize: Qt.application.font.pixelSize * 1
                      scale:1.0 //масштаб
                  }
                  Tumbler{ //создание тумблера секунд
                      id: secTumbler //задание id
                      model: 60 //кол-во чисел в модели
                      delegate: delegateComponent //инкапсулирует модель
                      anchors.left:minuteTumbler.left
                      anchors.leftMargin:30 //отступ от тумблера минут
                      anchors.top: minuteTumbler.top //на одном уровне с тумблером минут
                      font.pixelSize: Qt.application.font.pixelSize * 1
                      scale:1.0 //масштаб
                     }
                  Button{ //создание кнопки сохранить
                      id:button1 //задание id
                      text:"Сохранить"
                      font.pixelSize: Qt.application.font.pixelSize * 1
                      font.family: "Courier"
                      Layout.column:0 //расположение столбец-0
                      Layout.row:2 //строка -2
                      anchors.left: parent.left
                      anchors.leftMargin: 140 //отступ от родителя слева
                      anchors.top:hoursTumbler.bottom // расположение внизу под тумблером часов
                      anchors.topMargin: 30 //отступ от тумблера часов
                            ColorOverlay { //определение цвета кнопки
                                  anchors.fill: button1 //на всю кнопку
                                  source: button1 //источник
                                  color: "#1E90FF"  // make image like it lays under red glass
                            }

                 }
                    Text { //создание текста
                        Layout.column:0 //столбец-0
                        Layout.row:1 // строка-1
                       id:sl //задание id
                       text:"Время"
                       color:"#1E90FF"
                       font.underline:true //подчеркивание текста снизу
                       anchors.top:control.bottom //расположение сверху над control
                       anchors.topMargin: 50 //отступ
                       anchors.left: field1.left //расположение слева, как и field1
                       font.family: "Courier"
                       font.pixelSize: Qt.application.font.pixelSize * 1
                       Image { //создание картинки
                           id:image1 //задание id
                            width: 15; height: 15 //высота ширина
                            smooth: true //гладкий
                            source: "qrc:/icon/clock_time_5025.png" //источник
                            anchors.left:sl.right //расположение справа от sl
                            anchors.leftMargin: 5 // Отступ
                            ColorOverlay { //создание цвета картинки
                                  anchors.fill: image1 //на всю картинку
                                  source: image1 //источник
                                  color: "#4682B4"  // make image like it lays under red glass
                              }
                       }
                  }

                Slider{ //создание слайдера
                       id:slider //задание id
                       Layout.column:1 //столбец-1
                       Layout.row:1//строка-1
                       anchors.horizontalCenter: busy1.horizontalCenter //горизонтально в центре от busy1
                       anchors.top:busy1.bottom //расположение снизу под busy1
                       anchors.topMargin: 112 //отступ
                       font.pixelSize: Qt.application.font.pixelSize * 1
                       anchors.left:sl.right //расположение справа от sl
                       anchors.leftMargin: 60 //отступ
                       ColorOverlay { //цвет для слайдера
                             anchors.fill: slider // на весь слайдер
                             source: slider //источник
                             color: "#1E90FF"  // make image like it lays under red glass
                         }
                       CheckBox{ //создание checkbox
                           id:check1 //задание id
                           Layout.column:1 //столбец-1
                           Layout.row:1 //строка-1
                           anchors.left: slider.left //расположение слева под слайдером
                           anchors.top:slider.bottom // снизу под слайдером
                           anchors.topMargin: 1 //отступ
                           text:qsTr(textr)
                           Material.accent: Material.Blue //стиль материала
                           Text{ //создание текста
                               id:textr //задание id
                               text:("Ретвитнуть")
                               font.family: "Courier"
                               color:"#1E90FF"
                               anchors.verticalCenter: parent.verticalCenter//вертикально в центре от родителя
                               anchors.left: check1.right // расположение справа
                               anchors.leftMargin: 20 //отступ
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
                           Switch {//создание переключателя
                               id:switch1 //задаем id
                               Layout.column:1 //столбец-1
                               Layout.row:1// строка-1
                               anchors.left: check1.left //расположение слева
                               anchors.top:check1.bottom // расположение снизу под check1
                               anchors.topMargin: 5 // отступ
                               text: qsTr(textr1) // передаем textr1
                               Material.accent: Material.Blue //стиль материала
                               Text{ //создание текста
                                   id:textr1
                                   text:("Тёмная тема")
                                   font.family: "Courier"
                                   color:"#1E90FF"
                                   anchors.verticalCenter: parent.verticalCenter //расположение вертикально в центре от родителя
                                   anchors.left: switch1.right //справа от switch1
                                   anchors.leftMargin: 1 //отступ
                                   Image { //создание картинки
                                       id:image5 //задание id
                                        width: 15; height: 15 //ширина высота
                                        smooth: true //гладкость
                                        source: "qrc:/icon/paintbrush_23864.png"//источник
                                        anchors.left:textr1.right //расположение справа от field1
                                        anchors.leftMargin: 3 //отступ слева

                                   }
                               }
                           }
                           Switch {//создание переключателя
                               id:switch2 //задание id
                               Layout.column:1//столбец-1
                               Layout.row:1//строка-1
                               anchors.left: switch1.left//расположение слева
                               anchors.top:switch1.bottom//снизу под switch1
                               anchors.topMargin: 3//отступ сверху
                               text: qsTr(textr2)
                               Material.accent: Material.Blue //стиль материала
                               Text{//создание текста
                                   id:textr2 //задание id
                                   text:("Светлая тема")
                                   font.family: "Courier"
                                   color:"#1E90FF"
                                   anchors.verticalCenter: parent.verticalCenter//вертикально в центре от родителя
                                   anchors.left: switch2.right //справа от switch2
                                   anchors.leftMargin: 1// отступ
                                   Image { //создание картинки
                                       id:image6 //задание id
                                        width: 15; height: 15 //ширина высота
                                        smooth: true //гладкость
                                        source: "qrc:/icon/paintbrush_23864.png"//источник
                                        anchors.left:textr2.right //расположение справа от field1
                                        anchors.leftMargin: 3 //отступ слева

                                   }
                               }
                           }
                }
                Text { //создание текст
                    id:zv //задание id
                    text:"Громкость"
                    color:"#1E90FF"
                    font.underline:true //подчеркивание текста снизу
                    anchors.bottom:slider.top //расположение сверху над слайдером
                    anchors.bottomMargin: 9 //отступ снизу
                    anchors.left:sl.right//расположение справа от sl
                    anchors.leftMargin: 130 // отступ слева
                    font.family: "Courier"
                    font.pixelSize: Qt.application.font.pixelSize * 1
                    Image { //создание картинки
                        id:image2 //задание id
                         width: 15; height: 15 //ширина высота
                         smooth: true //гладкость
                         source: "qrc:/icon/seo-social-web-network-internet_150_icon-icons.com_61510.png"//источник
                         anchors.right:zv.left //расположение слева от zv
                         anchors.rightMargin: 3 //отступ справа
                         ColorOverlay { //цвет картинки
                               anchors.fill: image2 //на всю картинку
                               source: image2 // источник
                               color: "#4682B4"  // make image like it lays under red glass
                           }
                    }
                }
       }

    }

        Page { //создание страницы 2
            Button{
            text:"нажми\n"
            onClicked:{
                console.log("исход аргумент", text)
                text++
                console.log("исход аргумент", text)
            }
          }
        }
        Page { //создание страницы 3
            Button{
            text:"нажми\n"
            onClicked:{
                console.log("исход аргумент", text)
                text++
                console.log("исход аргумент", text)
            }
          }
        }
      }
    footer: TabBar {//создание footer
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {//создание кнопки 1
            text: qsTr("Lab1")
            background: Rectangle {//создание прямоугольника
                border.color: parent.pressed ? "blue" : "blue" //цвет рамки
                color: "#1E90FF"
               }
        }
        TabButton { //создание кнопки 2
            text: qsTr("Lab2")
            background: Rectangle {
                 border.color: parent.pressed ? "blue" : "blue" //цвет рамки
                 color: "#1E90FF"
                }
        }
        TabButton { //создание кнопки 3
            text: qsTr("Lab3")
            background: Rectangle {
                    color: "#1E90FF"
                    border.color: parent.pressed ? "blue" : "blue"
                }
        }
    }
  }


