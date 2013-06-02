
function loadView(name)
{
    var component = Qt.createComponent( "views/" + name + ".qml");
    if (component.status == Component.Ready) {
        var obj = component.createObject(root_, {"visible" : false  /* , "anchors.fill": main_ */ } );
        if(obj != null) {
            return obj;
        } else console.log("Could not create object " + name + " from " + component);
    } else console.log("Unable to load " + name + ": " + component.status, ":\n", component.errorString() );
    return null;
}


function init()
{
    var ret = []
    var views = Constants.settings;
    
    for(var i = 0; i < views.length; i++) {
        ret[i] = loadView( views[i].view );
    }
    Data.views = ret;    
}

function setViewByIndex(idx)
{
    for(var i = 0; i < Data.views.length; i++)  {
        if( Data.views[i].visible && i != idx) {
            Data.views[i].animHide();
        }
    }
    
    if(Data.views[idx]) Data.views[idx].animShow();    
    
    Data.current = idx;
}

function setViewByName(name)
{
    for(var i = 0; i < Data.views.length; i++) {
        if(Data.views[i].name === name) {
            setViewByIndex(i);
            return;
        }
    }    
    
    console.log("ERROR: didn't found view " + name);    
}

function hideCurrent()
{
    if(Data.current >= 0 && Data.current < Data.views.length) {
        Data.views[Data.current].animHide();
    }
    
}

function showCurrent()
{
    if(Data.current >= 0 && Data.current < Data.views.length) {
        Data.views[Data.current].animShow();
    }
}

function remove()
{
    setViewByIndex(-1);    
}

function isDialog()
{
    
    if(Data.current >= 0 && Data.current < Data.views.length) {
        var view = Data.views[Data.current];
        return view.is_dialog;
    }
    return false;    
}
