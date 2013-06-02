import QtQuick 1.0

import "components"
import "views"

import "js/logic.js" as Logic
import "js/data.js" as Data
import "js/constants.js" as Constants
import "js/db.js" as Db

Rectangle
{
    id: root_
    color: "black"
    property bool menu_shown: false
    
    // -------------------------------------------
    
    Point { id: p1 } 
    Point { id: p2 } 
    Point {
        id: ratio_
        property bool visible: false
        property real ratio : 0.5
        pix: p2.pix * ratio + p1.pix * (1 - ratio)        
    }
    
    Item {
        id: data_
        property real px: Math.abs(p1.pix - p2.pix)        
        property real data: px * mult * measure.mmPerPixel
        property real mult
        property string unit
        property int size: 24 + Math.min(24, 2 * Math.round(Math.abs(p1.pix - p2.pix) / 32))
        
        function setUnit(div_, name_)
        {
            if(name_.length > 1) name_ = " " + name_;
            data_.unit = name_;
            data_.mult = 1.0 / div_;
        }        
        
        function pixelsFor(size) // pixels to get this size
        {
            // return Math.round(size / (mult * measure.mmPerPixel))
            return size / (mult * measure.mmPerPixel)
        }                
    }
    // -------------------------------------------
    
    SettingsPage {
        id: sp_
        opacity: root_.menu_shown ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 300 } }            
        z: 0
        
        onClicked: {
            Logic.setViewByIndex(idx);
            root_.onMenu();
        }
    }
    
    MainPage {
        id: mp_
        anchors.fill: parent
        transform: Translate {
            id: mp_translate_
            x: 0
            Behavior on x { NumberAnimation { duration: 400; easing.type: Easing.OutQuad } }            
        }
                
        /* menu shadow */
        BorderImage {
            id: menu_shadow_
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: -8
            z: -1 /* this will place it below normal_view_ */
            visible: root_.menu_shown
            source: "images/shadow.png"
            border { top: 4; bottom: 4 }
        }
                
        /* put this last to "steal" touch on the normal window when menu is shown */
        MouseArea {
            anchors.fill: parent
            enabled: root_.menu_shown
            onClicked: root_.onMenu();
        }        
    }
    
    SettingsButton {
        id: sb_
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 12
        onClicked: root_.onMenu();
        z: 10
    }
    
    // ----------------------------------------------------
    /* this functions toggles the menu and starts the animation */
    function onMenu()
    {                    
        if(!root_.menu_shown && Logic.isDialog()) {
            Logic.remove();
            return;
        }                
        
        mp_translate_.x = root_.menu_shown ? 0 : - root_.width * 0.8
        
        if(root_.menu_shown) {
            root_.menu_shown = false;            
            Logic.showCurrent();
        } else {            
            root_.menu_shown = true;            
            Logic.hideCurrent();            
        }                
    }    
    
    Component.onCompleted:
    {        
      
      Logic.init();
      
      p1.pix = 250;
      p2.pix = 400;      
      data_.setUnit(1.0, "mm");
      
      
      // keep record of the number of starts
      var starts = parseInt( Db.get("app.starts", "0") ) + 1;
      Db.set("app.starts", starts);        
      
      // show help text in the begining
      if(starts < 2) {
          Logic.setViewByName("Help");
      } else {
          Logic.setViewByIndex(0);
      }
      
    }    
}
