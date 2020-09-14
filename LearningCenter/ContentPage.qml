import QtQuick 2.0
import "./composite"

Rectangle {
    id:root;
    color:"green";
    property int contentType: 0

    Loader {
        id: body
        anchors.fill: parent

        source: "qrc:/composite/ClassPage.qml"

        onLoaded: {
            console.log("加载完成")
        }
    }

    onContentTypeChanged: {
        if(contentType === 0) {
            body.source = "qrc:/composite/ClassPage.qml"
        } else if (contentType === 1){
            body.source = "qrc:/composite/CoursePage.qml"
        } else if(contentType === 2) {
            body.source = "qrc:/composite/ChapterPage.qml"
        } else {
            body.source = "qrc:/composite/WebViewPage.qml"
        }
    }
}

