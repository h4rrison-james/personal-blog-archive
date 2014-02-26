(function() {
  var isRetina, retina;

  isRetina = function() {
    var mediaQuery;
    mediaQuery = "(-webkit-min-device-pixel-ratio: 1.5),\t\t\t\t\t  (min--moz-device-pixel-ratio: 1.5),\t\t\t\t\t  (-o-min-device-pixel-ratio: 3/2),\t\t\t\t\t  (min-resolution: 1.5dppx)";
    if (window.devicePixelRatio > 1) {
      return true;
    }
    if (window.matchMedia && window.matchMedia(mediaQuery).matches) {
      return true;
    }
    return false;
  };

  retina = function() {
    if (!isRetina()) {
      return;
    }
    $("img.2x").map(function(i, image) {
      var path;
      path = $(image).attr("src");
      path = path.replace(".png", "@2x.png");
      path = path.replace(".jpg", "@2x.jpg");
      $(image).attr("src", path);
    });
  };

  $(document).ready(function() {
    retina;
    $("[data-type=\"background\"]").each(function() {
      var $bgobj, initial;
      $bgobj = $(this);
      initial = parseInt(($bgobj.css('background-position-y')).replace(/px/, ""));
      $(window).scroll(function() {
        var coords, yPos;
        yPos = initial + -($(window).scrollTop() / $bgobj.data("speed"));
        coords = "50% " + yPos + "px";
        $bgobj.css({
          backgroundPosition: coords
        });
      });
    });
  });

}).call(this);
