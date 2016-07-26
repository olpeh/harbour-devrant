import QtQuick 2.1
import Sailfish.Silica 1.0
import "../js/api.js" as API

Item {
    property var rantId
    anchors.top: parent.bottom
    width: parent.width

    SilicaListView {
        id: commentsList
        anchors.fill: parent

        model:  ListModel {
            id: commentsModel
        }

        ViewPlaceholder {
            enabled: busyIndicator.running
            BusyIndicator {
                id: busyIndicator
                anchors.centerIn: parent
                size: BusyIndicatorSize.Large
                running: true
            }
        }

        delegate: Column {
            width: parent.width
            spacing: Theme.paddingLarge

            Label {
                id: username
                text: model.user_username
                truncationMode: TruncationMode.Fade
                color: Theme.primaryColor
                font.bold: true
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }

            Text {
                id: commentText
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                text: model.body
                width: parent.width
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
        }

        VerticalScrollDecorator {
        }
    }

    Label {
        visible: !commentsModel.count
        text: "No comments"
        color: Theme.primaryColor
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
    }

    Banner {
        id: banner
    }

    Component.onCompleted: {
        API.getComments(rantId, handleCommentsResult)
    }

    function handleCommentsResult(res) {
        busyIndicator.running = false

        if(res.error) {
            console.log(res.error)
            banner.notify("Error occured - please try again later!")
        }
        else {
            for (var i = 0; i < res.comments.length; i++) {
                commentsModel.append(res.comments[i])
            }
        }
    }
}
