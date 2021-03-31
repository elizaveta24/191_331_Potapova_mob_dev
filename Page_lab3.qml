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
            text: qsTr("Запросы к серверу по HTTP") //текст
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
    Rectangle {
        id: rectangle122
        color: "#696969"
        anchors.topMargin: 0
        anchors.fill: parent
    }
    GridLayout {
        anchors.topMargin: 52
        anchors.fill: parent
        columns: 2

        Button {
            id: sent
            Layout.alignment: Qt.AlignCenter
            Layout.columnSpan: 2
            onClicked: {
                _send.getPageInfo();
                helloImage.visible = false;
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Отправить")
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 20
                opacity: enabled ? 1 : 0.3
                color: "#1E90FF"
                radius: 10
            }
        }


        ScrollView {
            Layout.fillHeight: true
            Layout.columnSpan: 2
            Layout.fillWidth: true

            clip:  true
            TextArea{
                id: textArea
                textFormat: Text.RichText //формат текста
                objectName: "textArea"
                readOnly: true//только чтение
                anchors.fill: parent

                background: Rectangle {
                    id: rectangle
                    anchors.fill: parent
                    color: "#fff"
                    Image {
                        id: helloImage
                        anchors.fill: parent
                        source: "qrc:/icon/large-weather_album-art-1000x1000-1588557670878.jpg"

                    }
                }
            }
        }

        Label {
            Layout.alignment: Qt.AlignCenter
            //Layout.fillWidth: true
            Layout.columnSpan: 2
            text: "<b>Погода сейчас<b>"
            color: "#1E90FF"
        }
        RowLayout{
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignCenter

            TextField {
                id: textField

                objectName: "textField"
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                readOnly: true
                Layout.alignment: Qt.AlignCenter
                Layout.columnSpan: 2
                Material.accent: Material.Blue
            }
         }
    }
  }

