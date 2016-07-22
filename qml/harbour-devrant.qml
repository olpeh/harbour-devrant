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
import "pages"
import "helpers.js" as HH

ApplicationWindow
{
    property bool timerRunning : false
    property bool breakTimerRunning: false
    property string startTime: ""
    property string durationNow: "0h 0min"
    property double duration: 0
    property string breakStartTime: ""
    property string breakDurationNow: "0h 0min"
    property double breakDuration: 0
    property string thisWeek: "0"
    property string thisMonth: "0"
    property string today: "0"
    property Item firstPage
    property string defaultProjectId: ""
    property variant projects: []
    property string currencyString: "€"
    property int roundToNearest: 0

    id: appWindow
    initialPage: Component {
        FirstPage {
            id: firstPage
            Component.onCompleted: appWindow.firstPage = firstPage
        }
    }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}