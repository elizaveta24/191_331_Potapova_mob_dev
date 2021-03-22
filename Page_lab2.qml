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
            text: qsTr("Лр №2 - Мультимедиа") //текст
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
                       width: 200
                   }
                   RowLayout{
                       Layout.alignment: Qt.AlignCenter

                       Layout.columnSpan: 3
                       Layout.row: 3
                       RoundButton{ // кнопка - сделать фото или поставить видео на паузу
                           id: foto_button
                           Layout.leftMargin: 8
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
                                   camera1.imageCapture.capture() // метод захвата неподвижного объекта (фото)
                                   //camera1.imageCapture.captureToLocation("C:/191_331_Potapova/foto") или можно camera1.imageCapture.capture() - тогда фото сохранится в место по умолчанию
                               }
                               else if (camera1.videoRecorder.recorderStatus === CameraRecorder.RecordingStatus) //RecordingState-Камера записывает видео.
                                   camera1.videoRecorder.recorderStatus = CameraRecorder.PausedStatus //PausedStatus-Запись приостановлена.
                               else if (camera1.videoRecorder.recorderStatus === CameraRecorder.PausedStatus) //PausedStatus-Запись приостановлена.
                                   camera1.videoRecorder.recorderStatus = CameraRecorder.RecordingStatus //RecordingState-Камера записывает видео.
                           }
                       }

                       RoundButton { //кнопка - начать видео или остановить его
                           id: video_button
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



