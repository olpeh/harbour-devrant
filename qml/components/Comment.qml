/*
The MIT License (MIT)

Copyright (c) 2016 Olavi Haapala

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Column {
    property var commentItem
    id: commentListItem
    width: parent.width
    height: childrenRect.height + Theme.paddingLarge
    spacing: Theme.paddingMedium

    Label {
        id: username
        text: model.user_username + " (" + model.user_score + ")"
        truncationMode: TruncationMode.Fade
        color: Theme.primaryColor
        font.bold: true
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
    }

    Item {
        width: parent.width
        height: childrenRect.height
        anchors {
            left: parent.left
            right: parent.right
        }

        RantScore {
            id: rantScore
            currentRant: commentItem
        }

        Text {
            id: commentText
            font.pixelSize: Theme.fontSizeSmall
            color: Theme.primaryColor
            wrapMode: Text.WordWrap
            text: model.body
            width: parent.width
            anchors {
                left: rantScore.right
                right: parent.right
                margins: Theme.paddingLarge
            }
        }
    }
}
