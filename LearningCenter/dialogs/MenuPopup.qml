import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12

import "../component"

Dialog {
    id: root
    property color barColor: "white"
    property color borderColor:  "red"
    property real borderWidth: 0

    signal sigItemClicked(int index)

    modal:false
    dim: false
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    contentItem: Rectangle {
        id: content
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        color: "white"

        ColumnLayout {
            spacing: 0
            anchors.fill: parent
            ImageTextBtn {
                id: setting;
                layoutType: 0
//                anchors.horizontalCenter:
                width: 180
                height: content.height/5

                color: containsMouse ? "#F9F9F9" : "#FFFFFF"

                imageUrl: "qrc:/res/learncenter/menu/icon_set.png";
                imageWidth: 16;
                imageHeight: 16;

                textColor: "#212831"
                textWidth: 56;
                textHeight: 19;
                text: "系统设置";
                font {
                    pixelSize: 14;
                    bold: Font.Bold;
                }

                onClicked: {
                    console.log("你按下了系统设置按钮")
                    root.sigItemClicked(1)
                }
            }
            ImageTextBtn {
                id: switchC;
                layoutType: 0
                //                anchors.horizontalCenter:
                width: 180
                height: content.height/5

                color: containsMouse ? "#F9F9F9" : "#FFFFFF"

                imageUrl: "qrc:/res/learncenter/menu/icon_switch.png";
                imageWidth: 16;
                imageHeight: 16;

                textColor: "#212831"
                textWidth: 56;
                textHeight: 19;
                text: "切换账号";
                font {
                    pixelSize: 14;
                    bold: Font.Bold;
                }

                onClicked: {
                    console.log("你按下了系统设置按钮")
                    root.sigItemClicked(2)
                }
            }
            ImageTextBtn {
                id: checkUpdate;
                layoutType: 0
                //                anchors.horizontalCenter:
                width: 180
                height: content.height/5

                color: containsMouse ? "#F9F9F9" : "#FFFFFF"

                imageUrl: "qrc:/res/learncenter/menu/icon_update.png";
                imageWidth: 16;
                imageHeight: 16;

                textColor: "#212831"
                textWidth: 56;
                textHeight: 19;
                text: "检查更新";
                font {
                    pixelSize: 14;
                    bold: Font.Bold;
                }

                onClicked: {
                    console.log("你按下了系统设置按钮")
                    root.sigItemClicked(3)
                }
            }
            ImageTextBtn {
                id: aboutUs;
                layoutType: 0
                //                anchors.horizontalCenter:
                width: 180
                height: content.height/5

                color: containsMouse ? "#F9F9F9" : "#FFFFFF"

                imageUrl: "qrc:/res/learncenter/menu/icon_about.png";
                imageWidth: 16;
                imageHeight: 16;

                textColor: "#212831"
                textWidth: 56;
                textHeight: 19;
                text: "关于我们";
                font {
                    pixelSize: 14;
                    bold: Font.Bold;
                }

                onClicked: {
                    console.log("你按下了系统设置按钮")
                    root.sigItemClicked(4)
                }
            }
            ImageTextBtn {
                id: clearCach;
                layoutType: 0
                //                anchors.horizontalCenter:
                width: 180
                height: content.height/5

                color: containsMouse ? "#F9F9F9" : "#FFFFFF"

                imageUrl: "qrc:/res/learncenter/menu/icon_clear.png";
                imageWidth: 16;
                imageHeight: 16;

                textColor: "#212831"
                textWidth: 56;
                textHeight: 19;
                text: "清除缓存";
                font {
                    pixelSize: 14;
                    bold: Font.Bold;
                }

                onClicked: {
                    console.log("你按下了系统设置按钮")
                    root.sigItemClicked(5)
                }
            }
        }
    }


    background: Rectangle {
        id: background
        color: barColor
        radius: 8
        border.color:borderColor
        border.width: borderWidth

//        DragArea {
//            anchors.fill: parent
//            control: root
//        }

        Rectangle {
            id: childBack
            anchors.fill: parent
            radius: 8
        }

        DropShadow {
            anchors.fill: childBack
            horizontalOffset: 0
            verticalOffset: 0
            radius: 8.0
            samples: 17
            color: "#aa000000"
            source: childBack
        }
    }

    function show() {
        root.open()
    }
    function hide() {
        root.close()
    }
}
