import QtQuick 1.0

import "../js/constants.js" as Constants

BorderImage 
{
    property int pix1
    property int pix2
    
    width: 32
    height: Math.abs(pix1 - pix2);
    y: Math.min(pix1, pix2);
    x : parent.width / 2
    
    
     border { left: 16; top: 30; right: 16; bottom: 30 }
     horizontalTileMode: BorderImage.Stretch
     verticalTileMode: BorderImage.Stretch
     source: "../images/measure.png"
 }
 /*
Rectangle
{
    id: line_
    property int pix1
    property int pix2
    property int size: 4

    width: 1 + 2 * size
    height: Math.abs(pix1 - pix2);
    y: Math.min(pix1, pix2);
    x : parent.width / 3 - size

    color: Constants.color_line_outer 
}*/
