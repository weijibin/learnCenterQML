import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import "../component"

Dialog {
    id: root
    width: 480
    height: 343
    modal: true
    dim: true
    closePolicy: Popup.CloseOnEscape

    property string versionNum: "2.2.0"

    contentItem: Rectangle {
        id: childBack
        anchors.fill: parent
        radius: 8

        Rectangle {
            id: bodyT
            height: childBack.height/2
            radius: 8
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            color: "#F9F9F9"
        }
        Rectangle {
            id: bodyB
            radius: 8
            anchors.top: bodyT.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "#FFFFFF"
        }

        Rectangle {
            id: title
            height: 48
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.right: parent.right
            color: "#F9F9F9"
            clip: true

            Text {
                id: ttxt
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -4
                anchors.left: parent.left
                anchors.leftMargin: 24
                text: qsTr("关于我们")
                color: "#212831"
                font.pixelSize: 16
                font.bold: true
            }

            ImageBtn {
                id: closeBtn
                width: 20
                height: 20
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -4
                imageUrl: containsMouse ? "qrc:/res/learncenter/icon_guanbi_hover.png" : "qrc:/res/learncenter/icon_guanbi.png"
                onClicked: {
                    root.close()
                }
            }
        }
        Rectangle {
            id: body
            anchors.top: title.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            color: "#FFFFFF"


            Image {
                id: img
                width: 80
                height: 80
                source: "qrc:/res/learncenter/xue.png"
                anchors.top: parent.top
                anchors.topMargin: 28
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: t1
                anchors.top: img.bottom
                anchors.topMargin: 16
                anchors.horizontalCenter: parent.horizontalCenter

                text: "学而思网校直播课堂"
                color: "#212831"
                font.pixelSize: 25
            }

            Text {
                id: t2
                anchors.top: t1.bottom
                anchors.topMargin: 16
                anchors.horizontalCenter: parent.horizontalCenter
                text: "版本号 " + versionNum
                color: "#212831"
                font.pixelSize: 12
            }

            Text {
                id: t3
                anchors.top: t2.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
                textFormat: Text.RichText
                text: "<font color=\"#212831\" size=2>北京学而思教育科技有限公司</font> <a href=\"https://www.xueersi.com\"style='text-decoration:none;'><font color=\"#52AEF8\" size=2>http://www.xueersi.com</font></a> "
                color: "#52AEF8"
                onLinkActivated: {
                    if(link != "") {
                        Qt.openUrlExternally("https://www.xueersi.com")
                    }
                }
                onLinkHovered: {
                    t3Area.cursorShape = link!=""? Qt.PointingHandCursor : Qt.ArrowCursor
                }

                MouseArea {
                    id: t3Area
                    anchors.fill: parent
                    enabled: false
//                    cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                }

                font.pixelSize: 16
            }

            Text {
                id: t4
                anchors.top: t3.bottom
                anchors.topMargin: 16
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Copyright&#169 2009-2018 www.xueersi.com All Rights Reserved"
                color: "#ADB4BE"
                font.pixelSize: 10
            }
        }
    }

    background: Rectangle {
        id: back
        width: root.width
        height: root.height
        radius: 8
        border.width: 0
        border.color: "gray"

        DragArea {
            anchors.fill: parent
            control: root
        }
        DropShadow {
            anchors.fill: back
            horizontalOffset: 0
            verticalOffset: 0
            radius: 10
            samples: 20
            color: "#aa000000"
            source: childBack
        }
    }



    function show()
    {
        open()
    }

}
