import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import "../component"

Dialog {
    id: root
    width: 600
    height: 340
    modal: true
    dim: false

    background: Rectangle {
        id: back

        width: root.width
        height: root.height
        radius: 8
        border.width: 1
        border.color: "red"
        DragArea {
            anchors.fill: parent
            control: root
        }

        Rectangle {
            id: childBack
            anchors.fill: parent
            radius: 8
            Image {
                id: img
                anchors.left: parent.left
                anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/res/learncenter/logo.png"
            }
            TextBtn {
                id: closeBtn
                text: qsTr("Close")
                width: 80
                height: 38
                radius: 8
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 4
                onClicked: {
                    root.close()
                }
            }
            Column {
                anchors.left: img.right
                anchors.leftMargin: 4
                anchors.top: parent.top
                anchors.topMargin: 4
                anchors.bottom: closeBtn.top
                anchors.right: parent.right
                spacing: 18

                Text {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    textFormat: Text.RichText
                    text: "Author JaredTao <a href=\"https://jaredtao.github.io\">JaredTao Blog</a>"
                    onLinkActivated: {
                        Qt.openUrlExternally("https://jaredtao.github.io")
                    }
                    font.pixelSize: 16
                    renderType: Text.NativeRendering
                }
            }
        }

        DropShadow {
            anchors.fill: childBack
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
        x = (parent.width - width) / 2
        y = (parent.height - height) / 2
        open()
    }

}
