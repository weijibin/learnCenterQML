import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import "./component"
import "./composite"

Window {
    id: root;
    objectName: "mainWindow";
    visible: true
    minimumWidth: 1280
    minimumHeight: 720

    property bool isMac: Qt.platform.os === "osx";

    Component.onCompleted: flags = flags | Qt.WindowFullscreenButtonHint

    flags: Qt.Window | Qt.CustomizeWindowHint
           |Qt.WindowSystemMenuHint|Qt.WindowMinimizeButtonHint|Qt.WindowMaximizeButtonHint

    title: qsTr("learn center")
    screen: Qt.application.screens[0];

    Connections{
        target: root
        onVisibilityChanged: {
            if(!isMac && ctrApp.isMaxed && root.visibility === Window.Windowed) {
                showMax();
            }
        }
    }

    MouseArea{
        height: 50
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        property point clickPos: Qt.point(0,0)
        property bool  isDoubleClick: false

        onPressed: {
            isDoubleClick = false;
            if(root.visibility != 4 && root.visibility != 5) {
                clickPos  = Qt.point(mouse.x,mouse.y)
            }
        }
        onDoubleClicked: {
            isDoubleClick = true;
            if(root.visibility != 4 && root.visibility != 5){
                showMax()
            }
            else{
                showNor()
            }
        }

        onPositionChanged: {
            if(root.visibility != 4 && root.visibility != 5 && !isDoubleClick){
                var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                root.x += delta.x;
                root.y += delta.y;
            }
        }
    }

    TitlePage {
        id: title;
        x: 0;
        y: 0;
        width: parent.width;
    }

    Binding {
        id: siz
        target: title
        property: "appHeight"
        value: root.height
    }

    ContentPage {
        id: content;
        x:0;
        y: title.height;

        anchors {
            top: title.bottom
            bottom: parent.bottom
            left: title.left
            right: title.right
        }
    }

    Row {

        anchors.top: content.anchors.top;
        spacing: 10;
        Button {
            id: test;
            text: "testBtn";
            onClicked: {
                title.isMainTitle = !(title.isMainTitle) ;
            }
        }

        Button {
            id: test2;
            text: "testBtnContent";
            onClicked: {
                content.contentType = ((content.contentType + 1)%4);
            }
        }
    }

    function showMax() {
        ctrApp.isMaxed = true
        root.showMaximized()
    }

    function showMin() {
        root.showMinimized()
    }

    function showNor() {
        ctrApp.isMaxed = false
        root.showNormal()
    }

    function showFul() {
        ctrApp.isMaxed = true
        root.showFullScreen()
    }

    function closeWin() {
        Qt.quit()
    }

//    ResizeBorder {
//        control: ctrol     //默认就是parent，可以不写。这里写出来示意一下。
//        anchors.fill: parent
//    }

//    onScreenChanged: {
////        console.log("screenChanged==>" + screen);
////        root.screen = screen;
//        // 多显示器下 最大化显示有问题
//        root.screen = Qt.application.screens[0];
//    }
}
