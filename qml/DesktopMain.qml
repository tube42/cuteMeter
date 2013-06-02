import QtQuick 1.0

Item
{
    width: 360
    height: 640
    
    Main {
        anchors.fill: parent
    }
    
    // dummy
    QtObject  {
        id: measure
        property real mmPerPixel: 97.0 / 854
    }
    
}
    
