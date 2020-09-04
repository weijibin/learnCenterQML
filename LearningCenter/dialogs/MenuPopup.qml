import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import "../component"

Item {
    id: root
    property alias popupVisible: popup.visible
    property alias contentItem: popup.contentItem
    property color barColor: "white"
    property alias backgroundItem: background
    property real backgroundWidth: width
    property real backgroundHeight: height
    property color borderColor:  "red"
    property real borderWidth: 0

    property real verticalOffset: 20

//    z: 10
    //矩形旋转45度，一半被toolTip遮住(重合)，另一半三角形和ToolTip组成一个带箭头的ToolTip
    Rectangle {
        id: bar
        visible: popup.visible
//        rotation: 45
        width: 16
        height: 16
        color: "red"

        //水平居中
        anchors.horizontalCenter: popup.horizontalCenter
        //垂直方向上，由ToolTip的y值，决定位置
        anchors.verticalCenter: popup.Top
        anchors.verticalCenterOffset: verticalOffset
    }
    Popup {
        id: popup
        width: backgroundWidth
        height: backgroundHeight
        background: Rectangle {
            id: background
            color: barColor
            radius: 8
            border.color:borderColor
            border.width: borderWidth

            DragArea {
                anchors.fill: parent
                control: root
            }

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
    }
    function show() {
        popupVisible = true
    }
    function hide() {
        popupVisible = false
    }
}
