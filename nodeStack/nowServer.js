console.log("Launching Server");

var server = require('http').createServer(function(req, res){
});
server.listen(8080);

console.log("Initializing nowjs");

var nowjs = require("now");
var everyone = nowjs.initialize(server);

console.log("Begin Listening");

everyone.now.distributeMessage = function(message){
  console.log("");
  console.log("Sending-Message: " + this.now.name + " : " +  message);
  everyone.now.receiveMessage(this.now.name, message);
};

everyone.now.sendRequest = function( target, pobject, message ){
  console.log("");
  console.log("Sending request");
  console.log("From : " + this.now.name);
  console.log("To : " + target);
  console.log("For object : " + pobject);
  console.log("Additional Info :" + message);

  //update all the clients as per the current request/response stack
  everyone.now.updateRequests();
}

everyone.now.replyRequest = function(name, target, pobject, response, message){
  console.log("Sending request");
  console.log("From : " + this.now.name);
  console.log("To : " + target);
  console.log("For object : " + pobject);
  console.log("Additional Info :" + message);
  
  //Reply
  everyone.now.updateRequests();
}

everyone.now.serverLog = function(message){
  console.log("Client: " + message);
}

