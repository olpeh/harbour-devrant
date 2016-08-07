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

.pragma library

var BASE = "https://www.devrant.io/api/devrant";
var APPID = "?app=3";
var PAGESIZE = 12;

function request(method, endpoint, sort, skip, callBack) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var res;
            try {
                res = JSON.parse(xhr.responseText.toString());
            } catch(err) {
                res = {}
                res.error = xhr.responseText.toString();
            }
            callBack(res);
        }
    }
    var url = BASE + endpoint + APPID + '&sort=' + sort + '&limit=' + PAGESIZE + '&skip=' + skip;
    console.log(url);
    xhr.open(method, url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.setRequestHeader('Accept', 'application/json');
    xhr.send();
}

function get(sort, pageNumber, callBack) {
    var skip = PAGESIZE * pageNumber
    return request('GET', '/rants', sort, skip, callBack);
}

function getComments(id, callBack) {
    return request('GET', '/rants/' + id, '', 0, callBack)
}

