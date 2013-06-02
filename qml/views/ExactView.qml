
import QtQuick 1.0

import "../components"

View {
    name: "Exact"
    
    Column {
        anchors.fill: parent
        spacing: 16
    
        Button {
            text: "Round"
            width: parent.width
            onClicked: set( Math.round(data_.data));
        }
        
        Button {
            text: "+10"
            width: parent.width
            onClicked: set(data_.data + 10);
        }
        Button {
            text: "+1"
            width: parent.width
            onClicked: set(data_.data + 1);
        }
        Button {
            text: "-1"
            width: parent.width
            enabled: data_.data >= 1
            onClicked: set( data_.data - 1)
        }
        
        Button {
            text: "-10"
            width: parent.width
            enabled: data_.data >= 10
            onClicked: set( data_.data - 10)
        }
        
        Button {
            text: "Actual\n(displayed)"
            small: true
            width: parent.width
            onClicked: set_actual();
        }
        
    }
    
    // --------------------------------------------------------------------------------------
    
    // this sets removes the decimals in the p1/p2 points which 
    // gives us gets what is _really_ displayed on the screen
    function set_actual()
    {
        p1.pix = Math.round(p1.pix);
        p2.pix = Math.round(p2.pix);
    }
    
    // this sets the new size (in current unit)
    // note that this might lead to sub-pixel positions which can't really 
    // be shown on the screen
    function set(num)
    {
        var v0 = 5;        
        var v1 = root_.height - 5;
        
        var x = data_.pixelsFor(num)
        var mid = Math.round( (p1.pix + p2.pix) / 2);
        
        p1.pix = mid - Math.round(x / 2)
        p2.pix = p1.pix + x
        
        // make sure we dont leave the screen!
        p1.pix = Math.max(p1.pix, v0);
        p2.pix = Math.min(p2.pix, v1);        
    }
}

