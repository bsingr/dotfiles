(function(){
  var box = "<div style='position:absolute;left:45%;top:4px;padding:3px;display:block;background:yellow;-webkit-border-radius:3px;z-index:9999999;'></div>";
  var $box = $(box);
  
  $box.text("dotjs running")
  
  $('body').append($box);
})();