import QtQuick 2.0
import QtQuick.Controls 2.5
import "./composite"

Rectangle {
    id: root
    height: 50;
    color: "#FF7700";
    property bool isMainTitle: true
    property int appHeight: null

    onIsMainTitleChanged: {
        if(isMainTitle) {
            hideComp();
            showComp("qrc:/composite/MainTitle.qml");
        } else {
            hideComp();
            showComp("qrc:/composite/ChapterTitle.qml");
        }
    }

    Loader {
        id: compLoader
        anchors.fill: parent
        visible: opacity > 0
        opacity: 1
        source: "qrc:/composite/MainTitle.qml"
        onSourceChanged: {
            console.log("source changed", source)
        }
        onLoaded: {
            item.anchors.centerIn = compLoader
            binder.target = compLoader.item
        }
    }

    Binding {
        id: binder
        property: "appHeight"
        value: root.appHeight
    } 

    function showComp(compPath) {
        console.log("showComp", compPath)
        compLoader.source = compPath
    }
    function hideComp() {
        compLoader.source = ""
    }

    Component.onCompleted: {
    }
}


