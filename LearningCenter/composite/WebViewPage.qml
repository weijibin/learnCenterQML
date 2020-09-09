import QtQuick 2.0
import QtWebView 1.1
import QtWebEngine 1.8

Item {
    id:root;
    property alias weburl: content.url
    WebEngineView {
        id:content;
        anchors.fill: parent;
        url: "https://www.qt.io/"
        onLoadingChanged: {
            if (loadRequest.errorString)
                console.error(loadRequest.errorString);
        }
    }
//    WebView {
//        id:content;
//        anchors.fill: parent;
//        url: "http://www.baidu.com"
//        onLoadingChanged: {
//            if (loadRequest.errorString)
//                console.error(loadRequest.errorString);
//        }
//    }
}
