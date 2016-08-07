import QtQuick 2.1
import Sailfish.Silica 1.0

Column {
    property var rant
    property bool listMode: true
    width: parent.width
    spacing: Theme.paddingMedium

    Item {
        width: parent.width
        height: childrenRect.height

        RantScore {
            id: rantScore
            visible: listMode
            currentRant: rant
        }

        Text {
            id: rantText
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            wrapMode: Text.WordWrap
            maximumLineCount: listMode ? 4 : -1
            text: rant.text + (rantText.truncated ? "[Read more]" : "")
            anchors {
                left: rantScore.visible ? rantScore.right : parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
        }
    }

    Image {
        id: rantImage
        fillMode: Image.PreserveAspectFit
        scale:  listMode ? 1 : parent.width / rantImage.width
        anchors {
            left: parent.left
            right: parent.right
            rightMargin: listMode ? Theme.paddingLarge : 0
            leftMargin: listMode ? Theme.paddingLarge : 0
        }
    }

    Text {
        id: tags
        visible: rant.tagString
        font.pixelSize: Theme.fontSizeExtraSmall
        font.bold: true
        color: Theme.secondaryColor
        wrapMode: Text.WordWrap
        text: rant.tagString
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
    }

    Component.onCompleted: {
        if (rant.attached_image && rant.attached_image.width && rant.attached_image.height && rant.attached_image.url) {
            rantImage.width = rant.attached_image.width
            rantImage.height = rant.attached_image.height
            rantImage.source = rant.attached_image.url
        }
    }
}
