# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-devrant

CONFIG += sailfishapp

appicons.path = /usr/share/icons/hicolor

appicons.files = appicons/*

INSTALLS += appicons

DEFINES += APP_VERSION=\\\"$$VERSION\\\"
DEFINES += APP_BUILDNUM=\\\"$$RELEASE\\\"

message($${DEFINES})

system("touch src/harbour-devrant.cpp")

SOURCES += src/harbour-devrant.cpp

OTHER_FILES += qml/harbour-devrant.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-devrant.spec \
    rpm/harbour-devrant.yaml \
    rpm/harbour-devrant.changes \
    appicons/86x86/apps/harbour-devrant.png \
    appicons/108x108/apps/harbour-devrant.png \
    appicons/128x128/apps/harbour-devrant.png \
    appicons/256x256/apps/harbour-devrant.png \
    harbour-devrant.desktop \
    qml/pages/FirstPage.qml \
    qml/pages/About.qml

QT += core

DISTFILES += \
    qml/components/RantListItem.qml \
    qml/components/Banner.qml \
    qml/components/Rant.qml \
    qml/js/api.js \
    qml/pages/RantPage.qml
