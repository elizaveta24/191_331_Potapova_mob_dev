import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtMultimedia 5.12

ApplicationWindow { //создание окна
    width: 400 //ширина
    height: 600 //высота
    visible: true //отображение окна
    title: qsTr("Mobile development")
    SwipeView {//Позволяет пользователю перемещаться по страницам, проводя вбок
        id: swipeView
        anchors.fill: parent //по всей ширине и длине родителя
        currentIndex: tabBar.currentIndex
        Page {
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

        Page {
            id:page2

            header: ToolBar{ //создание панели
                background: Rectangle { //создание фона
                    id:rec3//заполнение панели цветом
                    color: "#DCDCDC" //цвет
                }
                GridLayout{
                    id:layout3 //задание id
                    anchors.fill:parent //по ширине родителя
                    columns:4 //столбцы
                    rows: 1 //строки
                ToolButton { //создание кнопки с иконкой
                    id:buttontwit//задание id
                    Layout.row:0
                    Layout.column:0
                    anchors.left:parent.left //привязка слева от родителя
                    icon.name: "twitter" //название иконки
                    icon.source: "qrc:/icon/twitter.png" //источник
                    icon.color:"#1E90FF" //цвет
                }
                Label { //Создание метки с текстом
                    id:label3 //задание id
                    text: qsTr("Лр №2 -Мультимедиа") //текст
                    color:"#1E90FF" //цвет
                    Layout.row:0
                    Layout.column:1
                }
                ToolButton { //создание кнопки с иконкой
                    id:buttonlens2 //задание id
                    icon.name: "lens" //имя иконки
                    icon.source: "qrc:/icon/3844432-magnifier-search-zoom_110300.png"//источник
                    icon.color:"#1E90FF" //цвет икноки
                    Layout.row:0
                    Layout.column:2

                }
                ToolButton { //создание кнопки с иконкой
                    id:buttonmenu2 //задание id
                    icon.name: "lens" //имя иконки
                    icon.source: "qrc:/icon/Menu_icon_icon-icons.com_71858.png"//источник
                    icon.color:"#1E90FF" //цвет икноки
                    Layout.row:0
                    Layout.column:3

                }

               }
            }
               ColumnLayout {
                   anchors.fill:parent
                   spacing: 6

                   Row{ //расположение кнопок на одном ряду
                       id:row2
                       anchors.horizontalCenter: parent.horizontalCenter


                       RadioButton { //создание кнопки видео
                           id: video
                           checked: true
                           text: qsTr("Видео")
                           Material.accent: Material.Blue
                       }
                       RadioButton {//создание кнопки камера
                           id: camera
                           text: qsTr("Камера")
                           Material.accent: Material.Blue
                       }
                   }
                   RowLayout{
                       Item{ // страница с видео-проигрывателем
                           id: page_v
                           width: parent.width
                           height: parent.height
                           ColumnLayout{
                               width: parent.width
                               height: parent.height


                               Row{
                                   id:row1
                                   anchors.horizontalCenter: parent.horizontalCenter

                                       ToolButton{

                                       Image {
                                           id:music
                                           source: "qrc:/icon/music.png"
                                           height: 35
                                           width: 35
                                           anchors.right:slid_volum.left //расположение икноки слева от слайдера громкости

                                       }
                                       ColorOverlay { //цвет для картинки music
                                             anchors.fill: music // на всю картинку
                                             source: music//источник
                                             color: "#1E90FF"  // make image like it lays under red glass
                                         }

                                 }


                                       Slider{ //создание слайдера громкости

                                           id: slid_volum
                                           from: 0
                                           to: 1
                                           value: 0.2
                                           Material.accent: Material.Blue



                                       }
                                   }

                               Row{//расположение кнопок в одном ряду
                                   id: video_controller
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   spacing:4

                                       RoundButton{ //создание кнопки back

                                           Image {
                                               id:back
                                               height: 40
                                               width: 40
                                               source: "qrc:/icon/back.png"
                                           }
                                           ColorOverlay { //цвет для картинки
                                                 anchors.fill: back// на всю картинку
                                                 source: back //источник
                                                 color: "#1E90FF"  // make image like it lays under red glass
                                             }
                                           flat: true //плоская кнопка
                                           onClicked: nature_video.seek(nature_video.position-2000) //пермемотка назад
                                       }

                                       RoundButton{ //создание кнопки stop

                                           Image {
                                               height: 40
                                               width: 40
                                               id: stop
                                               source: "qrc:/icon/stop.png"
                                           }
                                           ColorOverlay { //цвет для картинки
                                                 anchors.fill: stop
                                                 source: stop //источник
                                                 color: "#1E90FF"  // make image like it lays under red glass
                                             }
                                           flat: true
                                           onClicked: nature_video.stop() //остановка видео
                                       }

                                       RoundButton{//создание кнопки play и pause

                                           Image {
                                               height: 40
                                               width: 40
                                               id: play_pause
                                               source: {
                                                   if (nature_video.playbackState == MediaPlayer.PlayingState) //проверка свойства видео.PlaybackState свойство MediaPlayer. Это свойство содержит состояние воспроизведения мультимедиа и если оно PlayingState - медиафайл в данный момент воспроизводится.
                                                       return "qrc:/icon/pause.png"
                                                   else
                                                       return "qrc:/icon/play.png"
                                               }

                                           }
                                           ColorOverlay { //цвет для картинки
                                                 anchors.fill: play_pause // на весь слайдер
                                                 source: play_pause//источник
                                                 color: "#1E90FF"  // make image like it lays under red glass
                                             }
                                           // Material.background: Material.color("#000000", Shade50)
                                           flat: true //кнопка плоская

                                           onClicked: {
                                               if (nature_video.playbackState == MediaPlayer.PlayingState) //проверка свойства видео.PlaybackState свойство MediaPlayer. Это свойство содержит состояние воспроизведения мультимедиа и если оно PlayingState - медиафайл в данный момент воспроизводится.
                                                   return nature_video.pause();
                                               else
                                                   return nature_video.play();
                                           }
                                       }

                                       RoundButton{ //создание кнопки next

                                           Image {
                                               height: 40
                                               width: 40
                                               id: next
                                               source: "qrc:/icon/next.png"
                                           }
                                           ColorOverlay { //цвет для картинки
                                                 anchors.fill: next // на вcю картинку
                                                 source: next//источник
                                                 color: "#1E90FF"  // make image like it lays under red glass
                                             }
                                           flat: true
                                           onClicked: nature_video.seek(nature_video.position+2000) //перемотка видео вперед
                                       }
                                   }


                               Row{

                                   MediaPlayer{
                                       id: nature_video
                                       source: "Mare - 22183.mp4"
                                       //loops: 6
                                       volume: slid_volum.value //громкость видео настраивается на slid_volum
                                   }
                               }
                               RowLayout{
                                   Layout.fillWidth: true
                                   Slider{ //создание слайдера отображения положения видео
                                       id: slid_time
                                       from: 0 //начало
                                       to: nature_video.duration //конец
                                       value: nature_video.position //значение-позиция видео
                                       Material.accent: Material.Blue
                                       onPressedChanged: {
                                           nature_video.seek(slid_time.value) //при сдвиге позиция видео меняется
                                       }

                                   }
                                   anchors.horizontalCenter: outv.horizontalCenter
                                   anchors.top:outv.bottom

                               }

                               VideoOutput { //отображение видео
                                   id: outv
                                   source: nature_video
                                   anchors.top: parent.top
                                   anchors.topMargin: 100
                                   anchors.right:parent.right
                                   anchors.left:parent.left
                                   anchors.bottom:parent.bottom
                                   anchors.bottomMargin: 80


                               }



                               visible: { //отображение страницы, когда video.checked == true
                                   if(video.checked == true){
                                       return true
                                   }
                                   else
                                       return false
                               }
                           }
                       }
                       Item { // страница с камерой

                           id: page_c
                           anchors.left: parent.left
                           anchors.right: parent.right
                           anchors.top: camera1.bottom
                           anchors.bottom: parent.bottom
                           anchors.verticalCenter: parent.verticalCenter

                           Camera{
                               id: camera1

                               captureMode: stop()
                               imageCapture{
                                   onImageCaptured: {
                                       photoPreview.source = preview //отображение превьюшки фоток
                                   }
                               }
                           }


                           VideoOutput{ //отображение кмеры
                               id: videoCam
                               source: camera1
                               focus :  visible
                               autoOrientation:true //автоориентация.Для телефона, чтобы камера отображалась корректно.
                               anchors.left: parent.left
                               anchors.right:parent.right
                               anchors.top: camera1.bottom
                               anchors.bottom: page_c.bottom
                               anchors.leftMargin: 20
                               anchors.rightMargin: 20
                               anchors.bottomMargin: 10
                               anchors.verticalCenter: parent.verticalCenter
                               anchors.horizontalCenter: parent.horizontalCenter


                           }

                           Image { //превьюшка фоток
                               Layout.column: 1
                               Layout.row: 0
                               id:  photoPreview

                               anchors.horizontalCenter: parent.horizontalCenter
                               height: 150
                               width: 150
                           }
                           RowLayout{
                               Layout.alignment: Qt.AlignCenter

                               Layout.columnSpan: 3
                               Layout.row: 3
                               RoundButton{ // кнопка - сделать фото или поставить видео на паузу
                                   id: foto_button
                                   Layout.leftMargin: 5
                                   Image {
                                       source: {
                                           if (camera1.videoRecorder.recorderState === CameraRecorder.StoppedState) //StoppedState-камера не записывает видео.
                                               return "qrc:/icon/foto.png"
                                           else if (camera1.videoRecorder.recorderStatus === CameraRecorder.RecordingStatus)//RecordingState-Камера записывает видео.
                                               return "qrc:/icon/video_pause.png"
                                           else if (camera1.videoRecorder.recorderStatus === CameraRecorder.PausedStatus) //PausedStatus-Запись приостановлена.
                                               return "qrc:/icon/video_start.png"
                                       }
                                   }
                                   flat: true
                                   onClicked: {
                                       if (camera1.videoRecorder.recorderState === CameraRecorder.StoppedState){ //StoppedState-камера не записывает видео.
                                           camera1.imageCapture.captureToLocation("C:/191_331_Potapova/foto") // метод захвата неподвижного объекта (фото)
                                           // или можно camera1.imageCapture.capture() - тогда фото сохранится в место по умолчанию
                                       }
                                       else if (camera1.videoRecorder.recorderStatus === CameraRecorder.RecordingStatus) //RecordingState-Камера записывает видео.
                                           camera1.videoRecorder.recorderStatus = CameraRecorder.PausedStatus //PausedStatus-Запись приостановлена.
                                       else if (camera1.videoRecorder.recorderStatus === CameraRecorder.PausedStatus) //PausedStatus-Запись приостановлена.
                                           camera1.videoRecorder.recorderStatus = CameraRecorder.RecordingStatus //RecordingState-Камера записывает видео.
                                   }
                               }

                               RoundButton { //кнопка - начать видео или остановить его
                                   id: video_button
                                   anchors.left:foto_button.right

                                   Image {
                                       source: {
                                           if (camera1.videoRecorder.recorderStatus === CameraRecorder.RecordingStatus) //RecordingState-Камера записывает видео.
                                               return "qrc:/icon/video_stop.png"
                                           else
                                               return "qrc:/icon/video.png"
                                       }
                                   }
                                   flat: true
                                   onClicked: {
                                       if(camera1.videoRecorder.recorderState === CameraRecorder.StoppedState){ //StoppedState-камера не записывает видео.
                                           camera1.videoRecorder.outputLocation = "C:/191_331_Potapova/foto/video";
                                           camera1.videoRecorder.record() // начать запись
                                       }
                                       else
                                           camera1.videoRecorder.stop() // остановить
                                   }
                               }
                           }

                           visible: { //отображение страницы, когда video.checked == false
                               if(video.checked == false){
                                   return true
                               }
                               else
                                   return false
                           }
                       }

                   }
               }
          }


























        Page {
        }
}



           footer: TabBar {//создание footer
               id: tabBar
               currentIndex: swipeView.currentIndex
               TabButton {//создание кнопки 1
                   Text{
                       text:"Lab1"
                       color:"#1E90FF"
                       font.family: "Courier"
                       font.pixelSize: 17
                       anchors.horizontalCenter: parent.horizontalCenter //горизонтально в центре от родителя
                       anchors.verticalCenter: parent.verticalCenter //вертикально в центре от родителя
                   }
                   background: Rectangle {//создание прямоугольника
                       border.color: parent.pressed ? "#1E90FF" : "#1E90FF" //цвет рамки
                       color: "white"
                      }
               }
               TabButton { //создание кнопки 2
                   Text{
                       text:"Lab2"
                       color:"#1E90FF"
                       font.family: "Courier"
                       font.pixelSize: 17
                       anchors.horizontalCenter: parent.horizontalCenter //горизонтально в центре от родителя
                       anchors.verticalCenter: parent.verticalCenter //вертикально в центре от родителя
                   }
                   background: Rectangle {
                       border.color: parent.pressed ? "#1E90FF" : "#1E90FF" //цвет рамки
                       color: "white"
                       }
               }
               TabButton { //создание кнопки 3
                   Text{
                       text:"Lab3"
                       color:"#1E90FF"
                       font.family: "Courier"
                       font.pixelSize: 17
                       anchors.horizontalCenter: parent.horizontalCenter //горизонтально в центре от родителя
                       anchors.verticalCenter: parent.verticalCenter //вертикально в центре от родителя
                   }
                   background: Rectangle {
                       border.color: parent.pressed ? "#1E90FF" : "#1E90FF" //цвет рамки
                       color: "white"
                       }

               }
       }
}
