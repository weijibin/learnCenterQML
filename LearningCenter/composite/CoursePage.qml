import QtQuick 2.0

Item {
    id:root;
    property alias color: content.color

    Rectangle {
        id:content;
        color: "white"
        anchors.fill: parent;
        Text {
            id: name
            anchors.bottom: parent.bottom;
            text: qsTr("CourseList")
        }
    }
}
