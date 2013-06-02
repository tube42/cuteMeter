
import QtQuick 1.0

import "../components"
import "../js/constants.js" as Constants

View {
    id: rat_
    name: "Ratio"
        
    Column {
        anchors.fill: parent
        spacing: 16
        
        
        Text {
            text: (data_.data * ratio_.ratio ) .toFixed(2)
            color:  Constants.color_button_fg
            font.pixelSize: 36
            anchors.right: parent.right
        }
        
        Button {
            text: "1/4"
            width: parent.width
            onClicked: ratio_.ratio = 1/4
        }
        
        Button {
            text: "1/3"
            width: parent.width
            onClicked: ratio_.ratio = 1/3
        }
        
        Button {
            text: "1/2"
            width: parent.width
            onClicked: ratio_.ratio = 1/2
        }
        
        Button {
            text: "2/3"
            width: parent.width
            onClicked: ratio_.ratio = 2/3
        }
        
        Button {
            text: "3/4"
            width: parent.width
            onClicked: ratio_.ratio = 3/4
        }
    }    
    
    onViewShown: ratio_.visible = true
    onViewHidden: ratio_.visible = false
}
