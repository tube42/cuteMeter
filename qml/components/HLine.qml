
import QtQuick 1.0

import "../js/constants.js" as Constants

Item {
    property int size: 6
    property int pix   
    y: pix - size
    height: 1 + size * 2
    width: parent.width
    
    Image {
        id: marker_
        source: "../images/marker.png"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Rectangle
    {
        anchors.left: marker_.right
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        height: 3
        color: Constants.color_line_inner
    }
    
}
