#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>
#include <QtWebEngine/QtWebEngine>
#include "ControlCenter.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QtWebEngine::initialize();

    QQmlApplicationEngine engine;
    ControlCenter ctrlCntr;
    engine.rootContext()->setContextProperty("ctrApp", &ctrlCntr);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject * appObj = engine.rootObjects().first();
    ctrlCntr.setAppObj(appObj);

    return app.exec();
}
