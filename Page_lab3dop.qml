import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15

import QtMultimedia 5.12
import QtGraphicalEffects 1.15


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
            text: qsTr("Лр №3 - Графические эффекты") //текст
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
        GridLayout{ //размещение элементов
            columns:2 //столбцы
            rows: 4 //ряды
            anchors.fill:parent



        Image{ //картинка 1
            id:image1
            source:"qrc:/icon/dog_PNG50375.png"
            Layout.row:0
            Layout.column:0
            Layout.leftMargin: 5
            smooth: true
            visible: false

        }
        LinearGradient { //градиент MaskedBlur
            id: mask
            anchors.fill: image1
            gradient: Gradient {
                GradientStop { position: 0.2; color: "#ffffffff" }
                GradientStop { position: 0.5; color: "#00ffffff" }
            }
            start: Qt.point(0, 0) //начало
            end: Qt.point(sliderend.value, 0) //конец от sliderend до 0
            visible: false

        }

        MaskedBlur {
            anchors.fill: image1
            source: image1
            maskSource: mask //источник
            radius: sliderblurradius.value //радиус размытия
            samples: sliderblursamp.value //Это свойство определяет, сколько выборок берется на пиксель при вычислении размытия
            fast:switchfast.checked //Это свойство выбирает алгоритм размытия, который используется для создания размытия. Установка этого значения в значение true включает быстрый алгоритм
        }


        Slider{ //слайдер радиус размытия
            id:sliderblurradius
            Layout.row:0
            Layout.column:1
            anchors.top:parent.top
            anchors.topMargin: 5
            from: 0 //значение от
            to: 50 //значение до
            stepSize: 1 //размер шага
            value:2
            Material.accent: Material.Blue //стиль материала
            Text {
                text: qsTr("Blur Radius")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderblurradius.horizontalCenter
            }
        }
        Slider{ //слайдер определяет, сколько выборок берется на пиксель при вычислении размытия
            id:sliderblursamp
            Layout.row:0
            Layout.column:1
            anchors.top:sliderblurradius.bottom
            anchors.topMargin: 10
            from: 0
            to: 32
            stepSize: 1
            value:3
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("Blur samples")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderblursamp.horizontalCenter
            }
        }
        Slider{ //слайдер для определения ширины размытия
            id:sliderend
            Layout.row:0
            Layout.column:1
            anchors.top:sliderblursamp.bottom
            anchors.topMargin: 10
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("Blur width")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderend.horizontalCenter
            }
            from:0
            to: 450
            stepSize: 1
        }

        Image{ //картинка 2
            id:image2
            source:"qrc:/icon/dog_PNG50375.png"
            Layout.row:1
            Layout.column:0
            Layout.leftMargin: 5
            smooth: true

        }
        InnerShadow { //тень
                anchors.fill: image2
                radius: sliderinerradius.value //радиус тени
                samples: sliderinersamples.value //Это свойство определяет, сколько выборок берется на пиксель, когда выполняется расчет размытия для смягчения краев
                horizontalOffset: sliderinerhorizontal.value //определяет горизонтальное смещение
                verticalOffset: 3 //вертикальное смещение
                color: "red"
                source: image2
            }
        Slider{ //слайдер для определения радиуса тени
            id:sliderinerradius
            Layout.row:1
            Layout.column:1
            anchors.top:sliderend.bottom
            anchors.topMargin: 20
            from: 0
            to: 60
            stepSize: 1
            value:3
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("Shadow radius")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderinerradius.horizontalCenter
            }

        }
        Slider{ //слайдер определяет, сколько выборок берется на пиксель, когда выполняется расчет размытия для смягчения краев
            id:sliderinersamples
            Layout.row:1
            Layout.column:1
            anchors.top:sliderinerradius.bottom
            anchors.topMargin: 10
            from: 0
            to: 30
            stepSize: 1
            value:3
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("Shadow samples")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderinersamples.horizontalCenter
            }

        }

        Slider{ //слайдер определяет горизонтальное смещение тени
            id:sliderinerhorizontal
            Layout.row:1
            Layout.column:1
            anchors.top:sliderinersamples.bottom
            anchors.topMargin: 10
            from: -50
            to: 50
            stepSize: 1
            value:0
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("Shadow horizontal offset")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderinerhorizontal.horizontalCenter
            }
        }
        Item {

            Layout.row:2
            Layout.column:0
            width:150
            height:150
            Layout.leftMargin: 5


            RectangularGlow {//Создает размытый цветной прямоугольник, создающий впечатление, что источник светится
                id: effect
                anchors.fill: rect
                glowRadius: sliderglowradius.value //Это свойство определяет, сколько пикселей за пределами области элемента достигает свечения
                spread: sliderglowspread.value //Это свойство определяет, насколько большая часть цвета свечения усиливается возле краев источника
                color: "#1E90FF"
                cornerRadius: sliderglowcorner.value//Это свойство определяет радиус угла, который используется для рисования свечения с закругленными углами
            }

            Rectangle { //прямоугольник внутренний
                id: rect
                color: "white"
                anchors.centerIn: parent
                width: Math.round(parent.width / 1.5)
                height: Math.round(parent.height / 2)
                radius: 5

            }
        }



        Slider{ //слайдер для определения радиуса угла, который используется для рисования свечения с закругленными углами
            id:sliderglowcorner
            Layout.row:2
            Layout.column:1
            anchors.top:sliderinerhorizontal.bottom
            anchors.topMargin: 25
            from: 0
            to: 50
            stepSize: 1
            value:3
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("RectangularGlow corner")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderglowcorner.horizontalCenter
            }

        }
        Slider{ //слайдер определяет, сколько пикселей за пределами области элемента достигает свечения
            id:sliderglowradius
            Layout.row:2
            Layout.column:1
            anchors.top:sliderglowcorner.bottom
            anchors.topMargin: 10
            from: 0
            to: 50
            stepSize: 1
            value:3
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("RectangularGlow radius")
                color:"#1E90FF"
                anchors.horizontalCenter: sliderglowradius.horizontalCenter
            }
        }

        Slider{ //слайдер определяет, насколько большая часть цвета свечения усиливается возле краев источника
            id:sliderglowspread
            Layout.row:2
            Layout.column:1
            anchors.top:sliderglowradius.bottom
            anchors.topMargin: 10
            from: 0.0
            to: 1.0
            stepSize: 0.1
            Material.accent: Material.Blue //стиль материала
            Text {

                text: qsTr("RectangularGlow spread")
                color:"#1E90FF"
                anchors.horizontalCenter:sliderglowspread.horizontalCenter
            }
        }

    }





}
