# Add more folders to ship with the application, here
base.source = qml/*.qml
base.target = qml

components.source = qml/components/*.qml
components.target = qml/components

views.source = qml/views/*.qml
views.target = qml/views

js.source = qml/js/*.js
js.target = qml/js

images.source = qml/images/*.png
images.target = qml/images


DEPLOYMENTFOLDERS = base components views js images

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE16993DF

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += \
    cpp/main.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    cuteMeter.desktop \
    qml/*.qml \
    qml/components/*.qml \
    qml/views/*.qml \
    qml/js/*.js \
    qml/images/*.png



contains(MEEGO_EDITION,harmattan) {
    target.path = /opt/cuteMeter/bin
    INSTALLS += target
}
