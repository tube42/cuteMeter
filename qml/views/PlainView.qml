
import QtQuick 1.0

import "../components"

Item {
    property string name: "MEasure"
    property bool is_dialog: false
    property real op
    signal viewHidden();
    signal viewShown();
    
    
    function animShow() {  }
    function animHide() {  }
    
}

