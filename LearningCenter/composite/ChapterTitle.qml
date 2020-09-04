import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12
import "../component"

Rectangle {
    id:root;
    property bool isMac: false;

    ImageTextBtn {
        id: backBtn;
        layoutType: 0;

        width: 60;
        height: 25;

        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: isMac ? ctrlLeft.right : parent.left;
        anchors.leftMargin: 10;

        imageUrl: containsMouse ? "qrc:/res/learncenter/icon_fanhui_hover.png" : "qrc:/res/learncenter/icon_fanhui.png";
        imageWidth: 20;
        imageHeight: 20;

        textColor: containsMouse ? "#FF5E50" : "#212831"
        textWidth: 18;
        textHeight: 32;
        text: "返回";
        font {
            pixelSize: 16;
            bold: Font.Bold;
        }

        onClicked: {
            console.log("你按下了返回按钮")
        }

        z:2;   //todo 不设置z 属性，hover 不灵敏
    }

    Row {
        id: chapter;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        Text {
            id: chapterName
            color: "#212831";
            font.pixelSize: 16;
            font.bold: Font.Bold;
            text: qsTr("【2019-暑】六年级升初一数学直播菁英")
        }
    }

    Row {
        id: cm;
        readonly property color checkedColor :"#FF5E50";
        readonly property color uncheckedColor :"#212831";

        anchors.right: isMac ? parent.right : ctrlRight1.left;
        anchors.rightMargin: 10;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 10;

        TextBtn {
            id: stuMaterial;
            width: 80;
            height: 32;
            radius: height/2;
            text: "学习资料";
            textFont {
                pixelSize: 12;
            }
            textColor: containsMouse ? cm.checkedColor : cm.uncheckedColor;
            color: "transparent";
            border {
                width: 1;
                color: containsMouse ? cm.checkedColor : cm.uncheckedColor;
            }

            onClicked: {
                console.log("场次列表 学习" + isMac);
            }
        }

        ImageBtn {
            id: flushBtn;
            anchors.verticalCenter: stuMaterial.verticalCenter;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_shuaxin_hover.png" : "qrc:/res/learncenter/icon_shuaxin.png")

            onClicked: {
                console.log("场次列表 刷新" + isMac);
            }
        }
    }

    // windows 控制栏
    Row {
        id: ctrlRight1;
        opacity: isMac? 0:1;
        anchors.right: parent.right;
        anchors.rightMargin: 10;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 5;
        ImageBtn {
            id: minBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuixiaohua_hover.png" : "qrc:/res/learncenter/icon_zuixiaohua.png")

            onClicked: {
                console.log("场次列表 最小化" + isMac);
            }
        }

        ImageBtn {
            id: maxBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuidahua_hover.png" : "qrc:/res/learncenter/icon_zuidahua.png")
        }

        ImageBtn {
            id: closeBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_guanbi_hover.png" : "qrc:/res/learncenter/icon_guanbi.png")
        }
    }

    //mac 控制栏
    Row {
        id: ctrlLeft;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 5;
        opacity: isMac? 1:0;

        ImageBtn {
            id: closeMacBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_guanbi_hover.png" : "qrc:/res/learncenter/icon_guanbi.png")
        }

        ImageBtn {
            id: minMacBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuixiaohua_hover.png" : "qrc:/res/learncenter/icon_zuixiaohua.png")
        }

        ImageBtn {
            id: maxMacBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuidahua_hover.png" : "qrc:/res/learncenter/icon_zuidahua.png")
        }
    }

//    Component.onCompleted: {
//        color = Qt.rgba(Math.random(125), Math.random(125), Math.random(125), 255);
//    }
}
