import QtQuick 2.1
import Sailfish.Silica 1.0
import "../js/api.js" as API

SilicaListView {
    property var rantId
    width: parent.width
    id: commentsList
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

    ViewPlaceholder {
        id: emptyCommentsPlaceHolder
        enabled: false
        text: "No comments"
        anchors.verticalCenter: commentsList.verticalCenter
    }

    delegate: Comment {
        commentItem: model
    }

    Component.onCompleted: {
        refresh()
    }

    function refresh() {
        busyIndicator.running = true
        commentsModel.clear()
        API.getComments(rantId, handleCommentsResult)
    }

    function handleCommentsResult(res) {
        busyIndicator.running = false

        if(res.error) {
            console.log(res.error)
            banner.notify("Error occured - please try again later!")
        }
        else {
            if (res.comments && res.comments.length) {
                for (var i = 0; i < res.comments.length; i++) {
                    commentsModel.append(res.comments[i])
                }
            }

            else {
                emptyCommentsPlaceHolder.enabled = true
            }
        }
    }
}


