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
import "../components"

Page {
    id: aboutPage
    allowedOrientations: Orientation.All

    SilicaFlickable{
        anchors.fill: parent
        anchors.bottomMargin: Theme.paddingLarge
        contentHeight: column.y + column.height

        Column {
            id: column
            spacing: Theme.paddingLarge
            width: parent.width

            PageHeader {
                title: qsTr("About")
            }

            SectionHeader { text: qsTr("General") }

            Text {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: root.width
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("This is an unofficial application for browsing devRant. Please see devrant.io for more information about devRant.")
            }

            Button {
                text: "devRant.io"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    banner.notify(qsTr("Launching external browser"))
                    Qt.openUrlExternally("https://www.devrant.io/")
                }
            }

            SectionHeader { text: qsTr("Version") }

            Text {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: root.width
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Your current version and build number: %1-%2").arg(appVersion).arg(appBuildNum);
            }

            SectionHeader { text: qsTr("Author") }

            Text {
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: root.width
                horizontalAlignment: Text.AlignHCenter
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: "Olavi Haapala"
            }

            Button {
                text: "Twitter: @0lpeh"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    banner.notify(qsTr("Launching external browser"))
                    Qt.openUrlExternally("https://twitter.com/0lpeh")
                }
            }

            SectionHeader { text: qsTr("Contribute") }

            Button {
                text: qsTr("Issues in GitHub")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    banner.notify(qsTr("Launching external browser"))
                    Qt.openUrlExternally("https://github.com/olpeh/harbour-devrant/issues")
                }
            }
            Button {
                text: qsTr("Project in GitHub")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    banner.notify(qsTr("Launching external browser"))
                    Qt.openUrlExternally("https://github.com/olpeh/harbour-devrant")
                }
            }

            SectionHeader { text: qsTr("License") }

            Text {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
                width: root.width
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("The source code is licensed under MIT license.")
            }

            Button {
                text: qsTr("Read the license")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    banner.notify(qsTr("Launching external browser"))
                    Qt.openUrlExternally("https://raw.githubusercontent.com/olpeh/harbour-devrant/master/LICENSE")
                }
            }

            Item {
                width: parent.width
                height: 10
            }
        }
    }

    Banner {
        id: banner
    }
}










