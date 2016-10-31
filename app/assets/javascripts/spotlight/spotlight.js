Spotlight = function() {
  var buffer = [];
  return {
    onLoad: function(func) {
      buffer.push(func);
    },

    activate: function() {
      for(var i = 0; i < buffer.length; i++) {
        buffer[i].call();
      }
    }
  };
}();

Blacklight.onLoad(function() {
  Spotlight.activate();
  //$(".openseadragon-container").find("picture:not([id])").openseadragon();
  console.log("Blacklight load");
});

Spotlight.onLoad(function(){
  SpotlightNestable.init();
  $(".openseadragon-container").find("picture:not([id])").openseadragon();
  console.log("Spotlight load");
});

