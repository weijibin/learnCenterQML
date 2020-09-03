import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12
import "../component"

Rectangle {
    property bool isMac: false;

    Image {
        id: logo
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: isMac ? ctrlLeft.right : parent.left;
        anchors.leftMargin: 10;
        source: "qrc:/res/learncenter/logo.png"
    }

    Row {
        id: tab;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        Rectangle {

            property int tabindex: 0;
            readonly property color checkedColor :"#FF5E50";
            readonly property color uncheckedColor :"#FFFFFF";

            id: tabW;
            color: uncheckedColor;
            width: 180;
            height: 36;
            radius: 18;
            border {
                color: checkedColor
                width: 1
            }

            Row {
                anchors.fill: parent;
                clip: true;
                TextBtn {
                    id: classTab;
                    text: "上课";
                    width: 90;
                    height: 36;
                    radius: height/2;
//                    color: tabW.tabindex == 0 ? tabW.checkedColor : tabW.uncheckedColor;
                    color: tabW.tabindex == 0 ? tabW.checkedColor : "transparent";
                    textColor: tabW.tabindex == 0 ? tabW.uncheckedColor : tabW.checkedColor;
                    textFont {
                        pixelSize: 14;
                        weight: Font.Bold
                    }
                    onClicked: {
                        tabW.tabindex = 0;
                    }
                }

                TextBtn {
                    id:courseTab;
                    text: "我的课程";
                    width: 90;
                    height: 36;
                    radius: height/2;
                    color: tabW.tabindex == 1 ? tabW.checkedColor : "transparent";
                    textColor: tabW.tabindex == 1 ? tabW.uncheckedColor : tabW.checkedColor;
                    textFont {
                        pixelSize: 14;
                        weight: Font.Bold;
                    }

                    onClicked: {
                        tabW.tabindex = 1;
                    }
                }
            }
        }
    }

    Row {
        id: stuInfo;

        anchors.right: menu.left;
        anchors.rightMargin: 20;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 10;

        RadiusImage {
            id: icon
            width: 30;
            height: 30;
            img_src: "qrc:/res/learncenter/classDefaultImg.png"
        }

        Text {
            anchors.verticalCenter: icon.verticalCenter;
            id: name
            clip: true;
            width: 56;
            elide: Text.ElideRight
            text: qsTr("郭德纲二三")
        }
    }

    Row {
        id: menu;

        anchors.right: isMac ? parent.right : ctrlRight.left;
        anchors.rightMargin: 10;
        anchors.verticalCenter: parent.verticalCenter;
        spacing: 10;

        ImageBtn {
            id: flushBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_shuaxin_hover.png" : "qrc:/res/learncenter/icon_shuaxin.png")
        }

        ImageBtn {
            id: menBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_caidan_hover.png" : "qrc:/res/learncenter/icon_caidan.png")
        }
    }

    // windows 控制栏
    Row {
        id: ctrlRight;
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
