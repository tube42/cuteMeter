
import QtQuick 1.0

Rectangle 
{
    anchors.margins: -8
    color: "white"
    opacity: 0.1
    
    // steal touch
    MouseArea { anchors.fill: parent }
}
