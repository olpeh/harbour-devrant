import QtQuick 2.1
import Sailfish.Silica 1.0

Column {
    property var rant
    property bool listMode: true
    width: parent.width
    spacing: Theme.paddingLarge

    Label {
        id: username
        text: rant.user_username
        truncationMode: TruncationMode.Fade
        color: Theme.primaryColor
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
    }

    Label {
        id: rantScore
        text: rant.score
        truncationMode: TruncationMode.Fade
        color: Theme.primaryColor
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
    }

    Text {
        id: rantText
        font.pixelSize: 0
        color: Theme.primaryColor
        wrapMode: Text.WordWrap
        maximumLineCount: 4
        text: rant.text + (truncated ? "[Read more]" : "")
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
    }

    Image {
        id: rantImage
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        scale: parent.width / rantImage.width
    }

    Component.onCompleted: {
        if (rant.attached_image && rant.attached_image.width && rant.attached_image.height && rant.attached_image.url) {
            rantImage.width = rant.attached_image.width
            rantImage.height = rant.attached_image.height
            rantImage.source = rant.attached_image.url
        }

    }
}
