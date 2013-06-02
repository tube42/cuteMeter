
import QtQuick 1.0

import "../components"
import "../js/constants.js" as Constants

View {
    id: mem_
    property real memory: 0
    name: "Memory"
    
    
    Column {
        anchors.fill: parent
        spacing: 16
    
        Text {
            text: memory.toFixed(2)
            color:  Constants.color_button_fg
            font.pixelSize: 36            
            anchors.right: parent.right
        }
        Button {
            text: "C"
            width: parent.width
            onClicked: memory = 0;        
        }
        
        Button {
            text: "M+"
            width: parent.width
            onClicked: memory += data_.data
        }
        Button {
            text: "M-"
            width: parent.width
            onClicked: memory -= data_.data
        }
    }
    
}

