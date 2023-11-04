"use strict";

var connection = new signalR.HubConnectionBuilder().withUrl("/chatBox").build();

//Disable the send button until connection is established.
document.getElementById("sendButton").disabled = true;

connection.on("ReceiveMessage", function (userDisplayName, message, isSuccess, msgID) {
    var li = document.createElement("li");
    document.getElementById("messagesList").appendChild(li);
    // We can assign user-supplied strings to an element's textContent because it
    // is not interpreted as markup. If you're assigning in any other way, you
    // should be aware of possible script injection concerns.
    //if the callback is error, display error message and red color text
    if (isSuccess == 0) {
        li.textContent = 'Error: Please check the network or contact the administrator as below link.'
        li.style.color = 'red';
        li.style.fontStyle = 'italic';
    }
    else {
        li.textContent = `${userDisplayName} says ${message}`;
        //get instant response
        getResponseMsgByDB(msgID);
    }
});

connection.start().then(function () {
    document.getElementById("sendButton").disabled = false;
}).catch(function (err) {
    return console.error(err.toString());
});

document.getElementById("sendButton").addEventListener("click", function (event) {
    var userId = document.getElementById("userID").value;
    var userDisplayName = document.getElementById("userDisplayName").value;
    var message = document.getElementById("messageInput").value;
    connection.invoke("SendMessage", userId, userDisplayName, message).catch(function (err) {
        return console.error(err.toString());
    });


    event.preventDefault();
});