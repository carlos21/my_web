var delay = 100;
var count = 0;
var current_div = null;
var loading = false;

function quickStart() {
  randomitem();
}

function randomitem(){

  if(loading){
    return;
  }

  if(count == 20) {
    loading = true;

    var location = 'http://carlos21.com' + $("div.random-item-highlighted a").attr('href');
    
    var selectedDiv = $(".random-item-highlighted");
    selectedDiv.css('opacity', '.4');

    var divLoading  = $("div#loading");
    
    divLoading.css('left', selectedDiv.offset().left + 'px');
    divLoading.css('top' , selectedDiv.offset().top  + 'px');
    divLoading.css('display', 'block');
    
    setTimeout(function(){
      window.location.href = location;
    }, 2000);
    

    delay = 100;
    count = 0;
    return;
  }

  $(".random-item-highlighted").attr("class", "random-item");

  var divs_array = $('div[id^="article"]');
  var randomnumber = Math.floor(Math.random()*divs_array.length);

  for(var i=0; i<divs_array.length; i++){
    if(i==randomnumber){
      count += 1;
      highlight(divs_array[i]);
      setTimeout(function(){randomitem()}, delay);
    }
  }
}

$('div.random-item-highlighted a').live('click',function(){
  $('location').attr('href', $('div.random-item-highlighted a').attr('href'));
});

function highlight(div){
  $(".random-item-highlighted").attr("class", "random-item");
  $("#"+div.id).attr("class", "random-item-highlighted");
  current_div = div;
}

$(document).ready(function(){
  //startAnimation();
});

function startAnimation(){
  var time = 0;
  var div = null;
  var div_array = $('div[id^="article"]');

  for(var i=0;i<div_array.length;i++) {
    displayItem(div_array[i], time);
    time += 200;
    $(".navigation").css("height", $(".maincontent").css("height"));
  }
}

function displayItem(div, time){
  setInterval(function(){
    $(div).slideDown();
    $(".navigation").css("height", $(".maincontent").css("height"));
  }, time);
}