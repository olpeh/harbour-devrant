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
import "../js/api.js" as API

Page {
    id: root

    SilicaFlickable {
        id: flickable
        width: parent.width
        height: parent.height

        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("About.qml"))
                }
            }
            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    refresh()
                }
            }
        }

        PushUpMenu {
            visible: !busyIndicator.running
            MenuItem {
                text: qsTr("Load more")
                onClicked: loadMore()
            }
        }

        ListModel {
            id: rantModel
        }

        SilicaListView {
            id: rantList
            model: rantModel
            anchors.fill: parent
            header: PageHeader {
                title: qsTr("Recent")
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

            delegate: RantListItem {
                visible: true
                item: model
            }

            VerticalScrollDecorator {
            }
        }
    }

    Banner {
        id: banner
    }

    Component.onCompleted: {
        refresh()
    }

    function refresh() {
        busyIndicator.running = true
        API.getRecent(handleResult)
    }

    function loadMore() {
        console.log("Load more, plz")
    }

    function handleResult(res) {
        console.log("handleResult")
        busyIndicator.running = false

        if(res.error) {
            console.log(res.error)
            banner.notify("Error occured - please try again later!")
        }
        else {
            console.log(res.rants.length)
            for (var i = 0; i < res.rants.length; i++) {
                var rant = res.rants[i]
                if (rant.attached_image === "") {
                    rant.attached_image = undefined
                }
                rantModel.append(rant)
            }
        }
    }
}


