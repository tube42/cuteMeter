
import QtQuick 1.0
import "../js/constants.js" as Constants

Item {
    id: view_    
    property string name: ""
    property bool is_dialog: false
    property real op
    signal viewHidden();
    signal viewShown();
    
    opacity: op * 0.85
        
    BackShadow {
        anchors.fill: parent
    }
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.margins: 12
    anchors.bottomMargin: 24
    anchors.topMargin: 120
    
    
    width: parent.width * Constants.view_size_factor
    
    function animShow() { anim_show_.start(); }
    function animHide() { anim_hide_.start(); }
        
    SequentialAnimation {
        id: anim_hide_        
        ParallelAnimation {
            PropertyAnimation { target: view_; property: "op"; from: 1; to: 0; duration: 300 }        
            PropertyAnimation { target: view_; property: "scale"; from: 1; to: 0.2; duration: 300 }        
            
        }
        ScriptAction { script: { visible = false;  viewHidden(); } }
    }
    
    SequentialAnimation {
        id: anim_show_
        PauseAnimation { duration: 200 }        
        ScriptAction { script: { visible = true;  viewShown(); } }
        ParallelAnimation {        
            PropertyAnimation { target: view_; property: "op"; from: 0; to: 1; duration: 200 }                
            PropertyAnimation { target: view_; property: "scale"; from: 0.2; to: 1; duration: 200 }        
        }        
    }    
}
