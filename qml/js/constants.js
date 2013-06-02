
// -----------------------------------------------------
// app conatnts
// -----------------------------------------------------

var app_version = "0.4.0"


// -----------------------------------------------------
// view constants
// -----------------------------------------------------

var view_size_factor = 0.3

// -----------------------------------------------------
// Color constants
// -----------------------------------------------------
var color_page_bg = "black"
var color_page_fg = "white"

var color_line_outer = "#808080"
var color_line_inner = "#FF0000"

var color_button_bg = color_page_bg
var color_button_fg = "white"

var color_about_bg = color_button_bg
var color_about_fg = "silver"

var color_list_active = "white"
var color_list_inactive = "gray"

var color_data_fg = "#FFFFFF"


var color_settings_bg = "#303030"
var color_settings_fg = "white"
var color_settings_separator = "silver"

// -------------------------------

var settings = [
                { text: "Just measure", view: "PlainView" },
                { text: "Units", view: "UnitView" } ,
                { text: "Exact", view: "ExactView" },
                { text: "Ratio", view: "RatioView" },
                { text: "Memory", view: "MemoryView" },
                { text: "Help", view: "HelpView" },
                { text: "About", view: "AboutView" },
                ];

// -------------------------------
var ABOUT_TEXT = "<h3>cuteMeter</h3>" + 
"<p>version " + app_version + 
"<p><br>Created by tube42" + 
"<br>Twitter: <a href='http://twitter.com/tube42'>@tube42</a>" +
"<br>Email: av@tube42.se" +
"<br> Homepage: <a href='http://blog.tube42.se'>tube42.se</a>" +
"<p><br>With this app, you don't need to carry a big ruler in your pocket all the time, "+
"which not only destorys your pants, it may also confuse the ladies." +
"<h3>Source code</h3>"+
"<p><br>This app was developed in QML for the MeeGo platform. The source code is available from "+
"<a href=\"http://projects.developer.nokia.com/cutemeter\">Nokia Developers Forum</a> under the GPLv2 license" + 
"<h3>Special thanks</h3>"+
"Special thanks to everyone at <a href='http://meegosweden.com'>meegosweden.com</a> for beta testing, and to Nokia for loaning me a devphone";

var HELP_TEXT = "<h3>How to use cuteMeter</h3>" + 
"Touch anywhere on your display to move the two measurement bars. "+
"The number in the middle of the display is the distance between the two bars." +
"<p>Please note that this app is single-touch. You cannot pinch zoom or use gestures...";
