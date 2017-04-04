// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


//Takes in two select elements, populates second select
//based on choice made in first select.
function populate(s1,s2){
  var s1 = document.getElementById(s1);
  var s2 = document.getElementById(s2);
  s2.innerHTML = "";
  if(s1.value == "Attack"){
    var optionArray = ["kill|Kill", "out|Out","blocked|Blocked", "continuation|Continuation", "net fault|Net Fault", 
                      "attack violation|Attack Violation", "net|Net", "foot fault|Foot Fault", 
                      "handling error|Handling Error", "invasion|Invasion", "free ball|Free Ball"];
  }else if(s1.value == "Block"){
    var optionArray = ["kill block|Kill Block", "out|Out", "continuation|Continuation", "net fault|Net Fault", 
                      "invasion|Invasion", "foot fault|Foot Fault", "handling error|Handling Error", 
                      "illegal blocker|Illegal Blocker"]

  }else if(s1.value == "Pass"){
    var optionArray = ["0|0 point-pass", "1|1 point-pass", "2|2 point-pass", "3|3 point-pass" ]

  }else if(s1.value == "Set"){
    var optionArray = ["1|Set to 1","2|Set to 2", "3|Set to 3", "4|Set to 4", "5|Set to 5", "6|Set to 6", 
                      "handling error|Handling Error", "error|Error"]
                      
  }else if(s1.value == "Serve"){
    var optionArray = ["ace|Ace", "out|Out", "1|into 1", "2|into 2", "3|into 3", "4| into 4", "5|into 5","6|into 6"]

  }else if(s1.value == "Misc"){
    var optionArray = ["yellow card|Yellow Card", "red card|Red Card", "rotation fault|Rotation Fault"]
  }


  for(var option in optionArray){
    var pair = optionArray[option].split("|");
    var newOption = document.createElement("option");
    newOption.value = pair[0];
    newOption.innerHTML = pair[1];
    s2.options.add(newOption);
  }
}

//Scrolls to the bottom of the touch tracker
function scrollToBottom(){
  var objDiv = document.getElementById("touch-tracker");
  objDiv.scrollTop = objDiv.scrollHeight;
}




