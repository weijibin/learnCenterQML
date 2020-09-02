import QtQuick 2.0
import QtQuick.Controls 2.5
import "./composite"

Rectangle {
    id: root
    height: 50;
    color: "#FF7700";
    property bool isMainTitle: true

    MainTitle {
        id: mainTitle;
        anchors.fill: parent;
        opacity: isMainTitle ? 1:0;
        color: "yellow";
    }

    ChapterTitle {
        id: chapterTitle;
        anchors.fill: parent;
        opacity: isMainTitle ? 0:1;
        color: "red"
    }
}


