import QtQuick 2.0

Item {
    id:root;
    property alias color: content.color

    Rectangle {
        id:content;
        color: "gray"
        anchors.fill: parent;
        Text {
            id: name
            anchors.bottom: parent.bottom;
            text: qsTr("ClassList")
        }
    }

    MouseArea{
        anchors.fill: parent
        onPressed: {
            console.log("parent pressed")
            mouse.accepted=true
        }
        onClicked: {
            console.log("parent clicked")
            mouse.accepted=false
        }
    }

    Rectangle{
        x: 200
        y: 200
        width: 200
        height: 200
        color: "green"

        MouseArea{
            anchors.fill: parent
            //是否传递到被覆盖的MouseArea
            propagateComposedEvents: true
            onPressed: {
                console.log("item pressed")
                mouse.accepted=false
            }
            onClicked: {
                console.log("item clicked")
                mouse.accepted=true
            }
        }
    }

}
