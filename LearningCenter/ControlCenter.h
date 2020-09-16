#ifndef CONTROLCENTER_H
#define CONTROLCENTER_H

#include <QObject>

class ControlCenter : public QObject
{
    Q_OBJECT
public:
    ControlCenter(QObject *parent = nullptr);

    void setAppObj(QObject * obj);
signals:

public slots:
    void onShowMax();
    void onShowMin();
    void onShowNor();
    void onShowFull();
    void onCloseWin();

private:
    QObject * m_appObj = nullptr;
};

#endif // CONTROLCENTER_H
