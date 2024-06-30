#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QTimer>
#include <QDateTime>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    // 先加载时间，这样就不会闪过 00:00
    TimerUpdater();
    QTimer *timeUpdaterTimer = new QTimer();
    timeUpdaterTimer->setInterval(1000);
    connect(timeUpdaterTimer, &QTimer::timeout, this, &MainWindow::TimerUpdater);
    timeUpdaterTimer->start();
}

void MainWindow::TimerUpdater() {
    // 获取当前时间
    QDateTime time = QDateTime::currentDateTime();
    QString strTime = time.toString("hh:mm");
    QString strDate = time.toString("yyyy.MM.dd");
    ui->timeLabel->setText("<h1 align='center'>" + strTime +
                           "</h1><h2 align='center'>" + strDate + "</h2>");
}

MainWindow::~MainWindow()
{
    delete ui;
}

