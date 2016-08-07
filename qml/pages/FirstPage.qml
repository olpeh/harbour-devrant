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
    allowedOrientations: Orientation.All
    property int pageNumber: 0

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
            width: parent.width
            height: parent.height
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

    Item {
        width: parent.width
        height: 100
        anchors.bottom: parent.bottom

        BusyIndicator {
            id: loadMoreIndicator
            size: BusyIndicatorSize.Medium
            running: false
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Banner {
        id: banner
    }

    Component.onCompleted: {
        refresh()
    }

    function refresh() {
        pageNumber = 0
        rantModel.clear()
        busyIndicator.running = true
        API.get('recent', pageNumber, handleResult)
    }

    function loadMore() {
        pageNumber++
        loadMoreIndicator.running = true
        API.get('recent', pageNumber, handleResult)
    }

    function handleResult(res) {
        busyIndicator.running = false
        loadMoreIndicator.running = false

        if(res.error) {
            console.log(res.error)
            banner.notify("Error occured - please try again later!")
        }
        else {
            for (var i = 0; i < res.rants.length; i++) {
                var rant = res.rants[i]
                if (rant.attached_image === "") {
                    rant.attached_image = undefined
                }

                if (rant.tags) {
                    if (rant.tags) {
                        var tagStr = ""
                        for (var j = 0; j < rant.tags.length; j++) {
                            tagStr += "#" + rant.tags[j] + " "
                        }
                        rant.tagString = tagStr
                    }
                }
                rantModel.append(rant)
            }
        }
    }
}


