import QtQuick 2.0
import QtWebView 1.1
import QtWebEngine 1.8
import QtQuick.Controls 2.5

Item {
    id:root;
    property alias weburl: content.url
    WebEngineView {
        id:content;
        anchors.fill: parent;
        url: "https://www.qt.io/"
        onLoadingChanged: {
            console.log("webengine view======" + loadRequest.status);
            if (loadRequest.errorString) {
                console.error(loadRequest.errorString);
            }

//            if (loadRequest.status === 0) {
//                mybusy.running = false;
//            }

//            mybusy.running = false;
        }
    }

    BusyIndicator{
        id:mybusy
        width: 200
        height: 200
        running: content.loading;
        anchors.centerIn: parent
    }
}
