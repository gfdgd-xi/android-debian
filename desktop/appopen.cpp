#include "appopen.h"
#include <iostream>
#include <QFile>

AppOpen::AppOpen()
{

}

void AppOpen::StartXfce4Terminal() {
    std::system("xfce4-terminal &");
}

void AppOpen::StartTerminal() {
    StartXfce4Terminal();
}

void AppOpen::StartWineRunner() {
    std::system("deepin-wine-runner &");
}

void AppOpen::StartSparkStore() {
    // 判断是终端版的星火应用商店还是 dtk 版的
    if (QFile::exists("/usr/bin/spark-store")) {
        // dtk 版
        std::system("spark-store &");
        return;
    }
}
