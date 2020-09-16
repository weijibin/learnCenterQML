import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
import QtQml 2.12
import "../component"
import "../dialogs"

Rectangle {
    id: root
    property bool isMac: Qt.platform.os === "osx";
    property int appHeight: null

    Image {
        id: logo
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left:  parent.left;
        anchors.leftMargin: isMac ? 90 :20;
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

        anchors.right: parent.right;
        anchors.rightMargin: isMac ? 10 : 90;

        anchors.verticalCenter: parent.verticalCenter;
        spacing: 10;

        ImageBtn {
            id: flushBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_shuaxin_hover.png" : "qrc:/res/learncenter/icon_shuaxin.png")

            onClicked: {
                console.log("上课 刷新");
            }
        }

        ImageBtn {
            id: menBtn;
            width: 20;
            height: 20;
            imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_caidan_hover.png" : "qrc:/res/learncenter/icon_caidan.png")

            onClicked: {
                console.log("上课 点击菜单");
                menPop.show();
            }
        }

    }

    MenuPopup {
        id: menPop;
        width: 180
        height: 267
        x: menu.x - width + menu.width + 10
        y: menu.y + menBtn.height + 10
        onSigItemClicked: {
            console.log("menu click===" + index);
            menPop.hide();
            if(index === 1) {

            } else if(index === 2) {

            } else if(index === 3) {

            } else if(index === 4) {
                aboutDlg.x = (root.width - aboutDlg.width)/2
                aboutDlg.y = (root.appHeight - aboutDlg.height)/2
                aboutDlg.show();
            } else if(index === 5) {

            }
        }
    }

    AboutDialog {
        id: aboutDlg
    }

    Component {
        id: winCtr
        Row {
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
                    console.log("上课 最小化");
                    ctrApp.onShowMin()
                }
            }

            ImageBtn {
                id: maxBtn;
                width: 20;
                height: 20;
                imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuidahua_hover.png" : "qrc:/res/learncenter/icon_zuidahua.png")

                onClicked: {
                    console.log("上课 最大化");
                    ctrApp.onShowMax()
                }
            }

            ImageBtn {
                id: closeBtn;
                width: 20;
                height: 20;
                imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_guanbi_hover.png" : "qrc:/res/learncenter/icon_guanbi.png")

                onClicked: {
                    console.log("上课 关闭");
                    ctrApp.onCloseWin()
                }
            }
        }

    }

    Component {
        id: macCtr
        //mac 控制栏
        Row {
            id: ctrlLeft;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 5;

            ImageBtn {
                id: closeMacBtn;
                width: 20;
                height: 20;
                imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_guanbi_hover.png" : "qrc:/res/learncenter/icon_guanbi.png")

                onClicked: {
                    console.log("上课 关闭");
                    ctrApp.onCloseWin()
                }
            }

            ImageBtn {
                id: minMacBtn;
                width: 20;
                height: 20;
                imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuixiaohua_hover.png" : "qrc:/res/learncenter/icon_zuixiaohua.png")

                onClicked: {
                    console.log("上课 最小化");
                    ctrApp.onShowMin()

                }
            }

            ImageBtn {
                id: maxMacBtn;
                width: 20;
                height: 20;
                imageUrl: (containsMouse ? "qrc:/res/learncenter/icon_zuidahua_hover.png" : "qrc:/res/learncenter/icon_zuidahua.png")

                onClicked: {
                    console.log("上课 最大化");
                    ctrApp.onShowMax()
                }
            }
        }
    }

    Component.onCompleted: {
        if(isMac) {
            macCtr.createObject(parent, { });
        } else {
            winCtr.createObject(parent, { });
        }

//        color = Qt.rgba(Math.random(125), Math.random(125), Math.random(125), 255);
    }
}
