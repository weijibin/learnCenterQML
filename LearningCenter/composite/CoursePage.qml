import QtQuick 2.0
import QtQuick.Controls 2.5

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

    BusyIndicator{
        id:mybusy
        width: 200
        height: 200
        running:true;
        anchors.centerIn: parent
    }
}
