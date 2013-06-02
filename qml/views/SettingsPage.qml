
import QtQuick 1.0

import "../components"
import "../js/constants.js" as Constants

Rectangle {
    id: sp_
    anchors.fill: parent
    color: Constants.color_settings_bg
    
    signal clicked(int idx);
    
    Item {
        id: drawing_area_
        
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        
        anchors.leftMargin: parent.width * 0.2 -1
        anchors.topMargin: 120
                
        
        ListView {
            anchors { fill: parent; margins: 22 }
            model: Constants.settings.length
            
            delegate: Item { 
                height: 80; 
                width: parent.width; 
                
                Text { 
                    anchors { left: parent.left; leftMargin: 12; verticalCenter: parent.verticalCenter }
                    color: Constants.color_settings_fg
                    font.pixelSize: 32
                    text: Constants.settings[index].text
                    
                    scale: ma_.pressed ? 1.2 : 1
                    Behavior on scale { NumberAnimation { duration: 100; easing.type: Easing.OutQuad } }            
                    
                }
                
                MouseArea {
                    id: ma_
                    anchors.fill: parent
                    onClicked: sp_.clicked(index);
                }
                Rectangle { 
                    height: 2; 
                    width: parent.width * 0.7; 
                    color: Constants.color_settings_separator
                    anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom } 
                }
            }
        }                
    }    
}
