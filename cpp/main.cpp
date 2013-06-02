#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());

    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer->setMainQmlFile(QLatin1String("/opt/cuteMeter/qml/HarmattanMain.qml"));
    viewer->showExpanded();

    return app->exec();
}
