import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import "./component"
import "./composite"

Window {
    id: root;
    visible: true
//    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint
    minimumWidth: 1280
    minimumHeight: 720

    title: qsTr("learn center")
    screen: Qt.application.screens[0];

    TitlePage {
        id: title;
        x: 0;
        y: 0;
        width: parent.width;
    }

    ContentPage {
        id: content;
        x:0;
        y: title.height;
//        width: parent.width;
//        height: parent.height - title.height;
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
                content.contentType = ((content.contentType + 1)%3);
            }
        }
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
