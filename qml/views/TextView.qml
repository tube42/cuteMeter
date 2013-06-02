
import QtQuick 1.0

import "../components"
import "../js/constants.js" as Constants

/* base component for help and about */

Rectangle {
    id: tv_
    anchors.fill: parent
    anchors.margins: 2
    
    property bool is_dialog: true
    
    property string viewName: ""
    property string name: ""
    property string text: ""
    
    
    radius: 2
    border.width: 10
    border.color: Constants.color_page_fg
    color: Constants.color_page_bg
    
    signal viewShown();
    signal viewHidden(); 
    
    transform: Translate {
        id: translate_
        x: 0
    }
    
    
    Flickable{
        id: text_flick_
        flickableDirection: Flickable.VerticalFlick
        anchors.fill: parent     
        anchors.margins: 18
        anchors.topMargin: 120
        contentWidth: width
        contentHeight: text_.height
        
            Text {
                id: text_
                anchors.left: parent.left
                anchors.right: parent.right
                
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                color: Constants.color_about_fg
                font.pixelSize: 24
                onLinkActivated: Qt.openUrlExternally(link)
                text: tv_.text
            }
            clip: true
        }
    
    function animShow(){ anim_show_.start(); }
    function animHide() { anim_hide_.start(); } 
    
    
    SequentialAnimation {
        id: anim_hide_             
        ParallelAnimation {
            PropertyAnimation { target: translate_; property: "x"; from: 0; to: -tv_.width; duration: 300 }        
            PropertyAnimation { target: tv_; property: "opacity"; from: 1; to: 0; duration: 400 }                    
        }
        ScriptAction { script: { visible = false;  viewHidden(); } }
    }
    
    SequentialAnimation {
        id: anim_show_
//        PauseAnimation { duration: 400 }                
        ScriptAction { script: { visible = true;  opacity = 1; viewShown(); } }
        PropertyAnimation { target: translate_; property: "x"; from: -tv_.width; to: 0; duration: 280 }  
    }        
}
