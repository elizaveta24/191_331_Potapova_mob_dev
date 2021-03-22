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
        Page_lab1 {
        }
        Page_lab2 {
        }
        Page_lab3{
        }
        /*Page_lab4{
        }*/


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
               /*TabButton { //создание кнопки 4
                   Text{
                       text:"Lab4"
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

               }*/
       }
}


