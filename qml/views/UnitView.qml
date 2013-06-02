
import QtQuick 1.0

import "../components"

View {
    name: "Unit"        
    
    Column {
        anchors.fill: parent
        spacing: 16
        
        
        Button {
            text: "mm"
            onClicked: data_.setUnit(1.0, "mm");
            width: parent.width
            
        }
        Button {
            text: "cm"
            width: parent.width
            
            onClicked: data_.setUnit(10.0, "cm");
            
        }
        Button {
            text: "Inch"
            width: parent.width        
            onClicked: data_.setUnit(25.40, "\"");            
        }
        Button {
            text: "mil (thou)"            
            width: parent.width        
            small: true
            onClicked: data_.setUnit(25.40 / 1000, "mil");            
        }
        
    }

}

