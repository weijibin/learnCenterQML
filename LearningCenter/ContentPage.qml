import QtQuick 2.0
import "./composite"

Rectangle {
    id:root;
    color:"green";
    property int contentType: 0

    ClassPage {
        id: classP
        anchors.fill: parent;
        opacity: (contentType === 0);
    }

    CoursePage {
        id: courseP;
        anchors.fill: parent;
        opacity: (contentType === 1);
    }

    ChapterPage {
        id: chapterP;
        anchors.fill: parent;
        opacity: (contentType === 2);
    }
}

