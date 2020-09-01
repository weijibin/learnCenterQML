import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import "./component"

Window {
    id: root;
    visible: true
    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint
    minimumWidth: 1280
    minimumHeight: 720
    width: 1280
    height: 720

    title: qsTr("learn center")
    screen: Qt.application.screens[0];


    Rectangle {
        id: title
        height: 40;
        anchors.left: parent.left;
        anchors.right:  parent.right;
        anchors.top: parent.top;
        color: "#EEEEEE";

        property bool isMaximized: false

        Connections{
            target: root
            onVisibilityChanged: {//解决Qt窗口最大化的时候最小化，再恢复窗口变为普通窗口的bug
                if(title.isMaximized && root.visibility === Window.Windowed) {
                    root.visibility = Window.Maximized;
                }
            }
        }

        MouseArea {
            anchors.fill: parent;
            acceptedButtons: Qt.LeftButton;
            hoverEnabled: true

            property point clickPos: "0,0"
            property bool  isPressed: false
            property bool  isDoubleClick: false

            onPressed: {
                isPressed = true;
                isDoubleClick = false;
                clickPos  = Qt.point(mouse.x,mouse.y)
//                console.log("onPressed==>"+isPressed);
                mouse.accepted = true;
            }

            onPositionChanged: {
                var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                if(isPressed === true && isDoubleClick === false) {
                    root.setX(root.x+delta.x)
                    root.setY(root.y+delta.y)
//                    console.log("pos==>"+root.y);
                }
            }

            onReleased: {
                isPressed = false;
//                console.log("onReleased==>"+isPressed);
            }

            onDoubleClicked: {
                console.log("onDoubleClicked==>"+isPressed + root.visibility);
                isDoubleClick = true;

                if(root.visibility != Window.FullScreen) {
                    if(root.visibility === Window.Windowed) {
                        title.isMaximized  = true;
                        root.visibility = Window.Maximized;
                    } else {
                        title.isMaximized  = false;
                        root.visibility = Window.Windowed;
                    }
                }
            }

        }

        Button {
            id: minBtn
            text: "min"
            width: 40;
            height: 40;
            onClicked: {
                console.log("onMinmized==>");
                root.visibility = Window.Minimized;
            }
        }
    }

    ResizeBorder {
        control: root     //默认就是parent，可以不写。这里写出来示意一下。
        anchors.fill: parent
    }

    onScreenChanged: {
//        console.log("screenChanged==>" + screen);
//        root.screen = screen;
        // 多显示器下 最大化显示有问题
        root.screen = Qt.application.screens[0];
    }
}
