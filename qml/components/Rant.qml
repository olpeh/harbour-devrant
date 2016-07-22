import QtQuick 2.1
import Sailfish.Silica 1.0

Column {
    property var rant
    property boolean listMode: true
    width: parent.width

    Label {
        id: username
        text: rant.userName
        truncationMode: TruncationMode.Fade
        color: Theme.primaryColor
    }

    Text {
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.primaryColor
        wrapMode: Text.WordWrap
        width: root.width
        text: rant.text
    }

    Image {
        id: rantImage
        visible: rant.image
        width: rant.image.width
        height: rant.image.height
        source: rant.image
    }
}