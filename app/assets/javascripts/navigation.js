var time_out;

var tooltip = function () {
  var id = 'tooltip';
  var top = 3;
  var left = 3;
  var maxw = 300;
  var speed = 10;
  var timer = 20;
  var endalpha = 95;
  var alpha = 0;
  var tt, height, colita;
  var ie = document.all ? true : false;

  return {

    show: function (element, value, width) {
      time_out = setTimeout(function(){tooltip.showTooltip(element, value, width);}, 800);
    },

    showTooltip: function (element, value, width) {

      if (tt == null) {
        tt = document.createElement('div');
        tt.className = 'custom-tooltip';
        document.body.appendChild(tt);
        
        colita = document.createElement('div');
        colita.className = 'colita';
        
      }
      
      tt.style.display = 'block';
      tt.innerHTML = value;
      tt.appendChild(colita);
      tt.style.width = width ? width + 'px' : 'auto';

      if (!width && ie) {
        tt.style.width = tt.offsetWidth;
      }

      if (tt.offsetWidth > maxw) {
        tt.style.width = maxw + 'px'
      }
      
      var new_x = element.offsetLeft + parseInt(element.offsetWidth) - 30;
      var new_y = element.offsetTop + 5;
      tt.style.top = new_y + 'px';
      tt.style.left = new_x + 'px';

      

      height = parseInt(tt.offsetHeight) + top;
      clearInterval(tooltip.timer);
      tooltip.timer = setInterval(function(){tooltip.fade(1)}, timer);
    },

    fade: function (d) {
      var a = alpha;
      if((a != endalpha && d == 1) || (a != 0 && d == -1)){
        var i = speed;
        if(endalpha - a < speed && d == 1){
          i = endalpha - a;
        }else if(alpha < speed && d == -1){
          i = a;
        }
        alpha = a + (i * d);
      }else{
        clearInterval(tooltip.timer);
        if(d == -1){
          if(tt != null){
            tt.style.display = 'none';
          }
          
        }
      }
    },

    hide: function () {
      clearInterval(tooltip.timer);
      clearTimeout(time_out);
      tooltip.timer = setInterval(function(){tooltip.fade(-1)},timer);
    }

  };
}();

jQuery(function($){
  $(".navigation").css("height", $(".maincontent").css("height"));  
  $(".navigation div.name").tooltip({
    animation: true
  });
});