import QtQuick 1.0

import "../js/constants.js" as Constants

Item {
    id: r_
    
    width: 80
    height: 80
    
    signal clicked();
        
    Image {
        anchors.centerIn: parent
        source: "../images/settings.png"
        smooth: true
    }
                    
    MouseArea {
        id: ma_
        anchors.fill: parent
        onClicked: {
            anim_click_.start();
            parent.clicked();
        }
    }        
    
    
    SequentialAnimation {
        id: anim_click_
        
        ParallelAnimation {
            PropertyAnimation { target: r_; property: "scale"; from: 1.0; to: 0.8; duration: 150 }        
            PropertyAnimation { target: r_; property: "rotation"; from: 0; to: 15; duration: 150 }
        }
        PropertyAnimation { target: r_; property: "rotation"; to: -15; duration: 150 }        
        
        ParallelAnimation {
            PropertyAnimation { target: r_; property: "rotation"; to: 0; duration: 150 }                        
            PropertyAnimation { target: r_; property: "scale"; to: 1.0; duration: 150 }
        }        
    }
    
}
