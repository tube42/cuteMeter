import QtQuick 1.0

import "../components"
// import "../views"

import "../js/logic.js" as Logic
import "../js/data.js" as Data
import "../js/constants.js" as Constants
import "../js/db.js" as Db

Rectangle
{
    id: main_
    color: Constants.color_page_bg
    
    
    HLine { id: l1; pix: p1.pix }
    HLine { id: l2; pix: p2.pix }                
    HLine {         
        id: l3_
        pix: ratio_.pix
        size: 4
        visible: ratio_.visible
    }    
    
    VLine { 
        id: vline_; pix1: p1.pix; pix2: p2.pix }    
    
    
    // ---------------------------------
    // mouse handler
    
    MouseArea {
        property bool move1: false
        
        anchors.fill: parent
        onPressed: {
            var d1 = Math.abs( mouseY - p1.pix);
            var d2 = Math.abs( mouseY - p2.pix);
            move1 = d1 < d2;
            
            update(mouseY);
        }
        
        onPositionChanged: update(mouseY);            
        
        function update(y)
        {
            if(move1) p1.pix = y;            
            else p2.pix = y;
            
            // sanity checks 
            var d = Math.abs(p2.pix - p1.pix);
            
            if(d < 4) {
                p1.pix -= 2;
                p2.pix += 2;
            }
            p1.pix = Math.min(parent.height - 4, Math.max(4, p1.pix));
            p2.pix = Math.min(parent.height - 4, Math.max(4, p2.pix));
        }        
    }    
    
    
/*    
    // -----------------------------------
    BackShadow {
        anchors.fill: mode_
    }
    ListView {
        id: mode_
        property int size: 48
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        height: size * 1.2 // XXX: why is this needed??
        
        model: ListModel { id: model_ }
        spacing: size * 0.8
        orientation: ListView.Horizontal
        clip: true        
        preferredHighlightBegin : width * 0.2
        preferredHighlightEnd : width * 0.6        
        highlightRangeMode: ListView.StrictlyEnforceRange               
        highlightMoveDuration: 350
        
        onMovementEnded: main_.selectionChanged(mode_.currentIndex);
                
        delegate: Text {
            anchors.verticalCenter: parent.verticalCenter            
            font.pixelSize: mode_.size
            color: ListView.isCurrentItem ? Constants.color_list_active : Constants.color_list_inactive
            scale: ListView.isCurrentItem ? 1.0 : 0.5
            text: model.name            
            smooth: true
            
            Behavior on scale { NumberAnimation { duration: 350 } }
            
            MouseArea {
                anchors.fill: parent               
                onClicked: mode_.set(index);
            }
            
            transitions: Transition {
                NumberAnimation { properties: "scale,y" }
            }
        }
        
        function set(idx)
        {
            if(idx != mode_.curentIndex) {
                mode_.currentIndex = idx;
                main_.selectionChanged(idx);
            }
        }
    }
    */
    // ----------------------------------------------------
    // the measurement
    Item {
        id: text_pos_
        anchors.verticalCenter: vline_.verticalCenter
        x: vline_.x - data_.size / 2
    }
    
    Text {
        id: text_                
        anchors.centerIn: text_pos_
        rotation: -90
        color: Constants.color_data_fg
        font.pixelSize: data_.size
        text: data_.data.toFixed(2) + data_.unit        
    }
    
    // -----------------------------------
    function selectionChanged(idx)
    {
        Logic.setByIndex(idx)
    }            
    
    Timer {
        id: init_timer_
        interval: 8000
        onTriggered: mode_.set(0)        
    }
    
}

