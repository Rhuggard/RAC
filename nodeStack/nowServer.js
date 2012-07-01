var server = require('http').createServer(function(req, res){
});
server.listen(8080);

var nowjs = require("now");
var everyone = nowjs.initialize(server);

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

  if(this.now.name == target){
    console.log("target aquired");
    this.now.requestStack(message);
  }
  //Add group name
}

everyone.now.replyRequest = function(name, target, pobject, response, message){
  console.log("Sending request");
  console.log("From : " + this.now.name);
  console.log("To : " + target);
  console.log("For object : " + pobject);
  console.log("Additional Info :" + message);
  //Reply
}


