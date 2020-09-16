#ifndef CONTROLCENTER_H
#define CONTROLCENTER_H

#include <QObject>

class ControlCenter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isMaxed READ isMaxed WRITE setMaxed)
public:
    ControlCenter(QObject *parent = nullptr);

    void setAppObj(QObject * obj);

    bool isMaxed() const;
    void setMaxed( bool is);
signals:

public slots:
    void onShowMax();
    void onShowMin();
    void onShowNor();
    void onShowFull();
    void onCloseWin();

private:
    QObject * m_appObj = nullptr;
    bool    m_isMaxed = false;
};

#endif // CONTROLCENTER_H
