TamuSpotlight = function() {
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
  TamuSpotlight.activate(); 
});

// A fix for slideshow advances that initiate a page reload
TamuSpotlight.onLoad(function() {
   $(".carousel-control").on("click", function(e) {
    e.preventDefault();
  });
});


// A fix for onpenseadragon images that do not get initialized on navigation.
TamuSpotlight.onLoad(function() {
   $(".openseadragon-container").find("picture:not([id])").openseadragon();
});