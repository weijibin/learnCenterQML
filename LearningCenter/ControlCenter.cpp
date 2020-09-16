#include "ControlCenter.h"
#include <QQmlApplicationEngine>
#include <QDebug>

ControlCenter::ControlCenter(QObject *parent) : QObject (parent)
{

}

void ControlCenter::setAppObj(QObject *obj)
{
    m_appObj = obj;
}

void ControlCenter::onShowMax()
{
    qDebug() << Q_FUNC_INFO;
    if(m_appObj != nullptr) {
        QMetaObject::invokeMethod(m_appObj,  "showMax");
    }
}

void ControlCenter::onShowMin()
{
    qDebug() << Q_FUNC_INFO;
    if(m_appObj != nullptr) {
        QMetaObject::invokeMethod(m_appObj,  "showMin");
    }
}

void ControlCenter::onShowNor()
{
    qDebug() << Q_FUNC_INFO;
    if(m_appObj != nullptr) {
        QMetaObject::invokeMethod(m_appObj,  "showNor");
    }
}

void ControlCenter::onShowFull()
{
    qDebug() << Q_FUNC_INFO;
    if(m_appObj != nullptr) {
        QMetaObject::invokeMethod(m_appObj,  "showFull");
    }
}

void ControlCenter::onCloseWin()
{
    qDebug() << Q_FUNC_INFO;
    if(m_appObj != nullptr) {
        QMetaObject::invokeMethod(m_appObj,  "closeWin");
    }
}
