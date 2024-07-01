#ifndef APPOPEN_H
#define APPOPEN_H

#include <QObject>

class AppOpen
{
    Q_OBJECT
public:
    AppOpen();
    void StartXfce4Terminal();
    void StartTerminal();
    void StartWineRunner();
    void StartSparkStore();
};

#endif // APPOPEN_H
