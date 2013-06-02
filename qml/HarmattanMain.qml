import QtQuick 1.0
import com.nokia.meego 1.0
import QtMobility.systeminfo  1.2

PageStackWindow {
    initialPage: mainPage
    showStatusBar: false

    Page{
        id: mainPage
        orientationLock: PageOrientation.LockPortrait
        Main {
            id: main
            anchors.fill: parent
        }
    }
    
    QtObject  {
        id: measure
        property real mmPerPixel: 1.0
        function update()
        {
            mmPerPixel = Math.max(devinfo.physicalHeight, devinfo.physicalWidth) / 854;
            console.log("Dimensions: ", devinfo.physicalHeight, devinfo.physicalWidth, mmPerPixel);
        }

    }
    
    DisplayInfo  {
        id: devinfo
        onOrientationChanged: mesuare.update();
    }

    Component.onCompleted: measure.update();
}
