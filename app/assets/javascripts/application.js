// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function () {
  /*var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
    //    alert('2');
      //hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });*/ 
  
});

/*Brainy*/
var imageTypes = ['image/png', 'image/jpeg', 'image/gif']

// Events
window.addEventListener('load', function (e) {

    var node = document.getElementById('tree-box');

    node.addEventListener('dragover', function (e) {
        e.preventDefault();
        e.currentTarget.classList.add('over-line');
    });

    node.addEventListener('dragleave', function (e) {
        e.preventDefault();
        e.currentTarget.classList.remove('over-line');
    });

    node.addEventListener('drop', function (e) {
        e.preventDefault();

        var parentNode = document.getElementById('tree-box-list');
        var length = e.dataTransfer.items.length;
        if (length > -1) {
            clearLog();
        }

        for (var i = 0; i < length; i++) {
            var entries = [];
            entries[0] = e.dataTransfer.items[i].webkitGetAsEntry();
            readDirectory(entries, parentNode);
        }

        e.currentTarget.classList.remove('over-line');
    });

    var btn = document.getElementById('clear-logs');
    btn.addEventListener('click', function (e) {
        clearLog();
        appendStr('Drag and drop folder here');
    });
});


// Recursive directory read 
function readDirectory(entries, parentNode) {

    for (var i = 0; i < entries.length; i++) {    	

        if (entries[i].isDirectory) {
            appendItem(entries[i].name, 'folder', parentNode);
            var directoryReader = entries[i].createReader();
            getAllEntries(directoryReader, readDirectory, appendIndentList(parentNode) );
        } else {
            appendItem(entries[i].name, 'file', parentNode);
            entries[i].file(appendFile, errorHandler);
        }
    }
}


function appendFile(file) {
    if (file.type === 'text/plain')
        appendTextFile(file);

    if (imageTypes.indexOf(file.type) > -1)
        appendImageFile(file);
}


function appendImageFile(file) {
    appendContainer();
    var fileReader = new FileReader();
    fileReader.onload = function (e) {
        var node = document.getElementById('tree-box-content');
        var img = document.createElement('img');
        img.setAttribute('src', e.target.result);
        node.appendChild(img);
    };
    fileReader.readAsDataURL(file);
}


function appendTextFile(file) {
    appendContainer();
    var reader = new FileReader();
    reader.onload = function (e) {
        var node = document.getElementById('tree-box-content');
        var div = document.createElement('div');
        node.appendChild(document.createTextNode(e.target.result));
        node.appendChild(div);
    };
    reader.readAsText(file);
}

// This is needed to get all directory entries as one 
// call of readEntries may not return all items. Works a 
// bit like stream reader.  
function getAllEntries(directoryReader, callback, parentNode) {
    var entries = [];  

    var readEntries = function () {  
        directoryReader.readEntries(function (results) {
        	if (!results.length) {
                entries.sort();
                callback(entries, parentNode);
            } else {
                entries = entries.concat(toArray(results));
                readEntries();
            }
        }, errorHandler);
    };

    readEntries();
}


function toArray(list) {
    return Array.prototype.slice.call(list || [], 0);
}

function errorHandler(e) {
    console.log('FileSystem API error code: '+ e.name+ ':: ' + e.message)
}



// DOM stuff for appending HTML into page
// --------------------------------------

function clearLog() {
    empty(document.getElementById('tree-box-list'));
    var container = document.getElementById('tree-box-content')
    if (container)
        container.parentNode.removeChild(container);
}

function empty(node) {
    while (node.firstChild) {
        node.removeChild(node.firstChild);
    }
}

function appendStr(str) {
    var log = document.getElementById('tree-box-list');
    var li = document.createElement('li');
    li.appendChild(document.createTextNode(str))
    log.appendChild(li);
}

function appendItem(name, type, parentNode) {
    var li = document.createElement('li');
    
    //li.innerHTML = <%= image_tag( type +'.png') %>;
    li.innerHTML = '<img src="/assets/' + type + '.png" />' + name;
    parentNode.appendChild(li);
}

function appendIndentList(parentNode) {
    var li = document.createElement('li');
    var ul = document.createElement('ul');
    parentNode.appendChild(li);
    li.appendChild(ul);

    return ul;
}

function appendContainer() {
    if (!document.getElementById('tree-box-content')) {
        var div = document.createElement('div');
        div.setAttribute('id', 'tree-box-content');
        document.getElementById('tree-box').appendChild(div);
    }
}