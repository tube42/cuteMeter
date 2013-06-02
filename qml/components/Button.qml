import QtQuick 1.0

import "../js/constants.js" as Constants


Item {
    id: bi_
    property color fg: Constants.color_button_fg
    property color bg: Constants.color_button_bg 
    property int size: 32
    property alias text: t_.text
    property bool enabled: true
    property bool small: false
    
    scale: ma_.pressed ? 1.1 : 1.0
    Behavior on scale { NumberAnimation { duration: 100 } }
    
    
    signal clicked();
    
    height: 16 * 2 + size    
    width: 12 * 2 + size * text.length    
    
    Rectangle {
        id: b_        
        anchors.fill: parent            
        color: ma_.pressed ? bi_.fg : bi_.bg
        opacity: bi_.enabled ?  1 : 0.5
        radius: 2
        border.width: 3
        border.color: bi_.fg
        
        Text {
            id: t_
            anchors.centerIn: parent
            color: ma_.pressed ? bi_.bg : bi_.fg
            font.pixelSize: bi_.small ? bi_.size * 0.6 : bi_.size
        }
        
        MouseArea {
            id: ma_
            anchors.fill: parent
            onClicked: bi_.clicked();
            visible: bi_.enabled
        }
    }
    
    
}
