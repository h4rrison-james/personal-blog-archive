# To make images retina, add a class "2x" to the img element
# and add a <image-name>@2x.png image. Assumes jquery is loaded.
 
isRetina = ->
  mediaQuery = "(-webkit-min-device-pixel-ratio: 1.5),\t\t\t\t\t  (min--moz-device-pixel-ratio: 1.5),\t\t\t\t\t  (-o-min-device-pixel-ratio: 3/2),\t\t\t\t\t  (min-resolution: 1.5dppx)"
  return true  if window.devicePixelRatio > 1
  return true  if window.matchMedia and window.matchMedia(mediaQuery).matches
  false

retina = ->
  return  unless isRetina()
  $("img.2x").map (i, image) ->
    path = $(image).attr("src")
    path = path.replace(".png", "@2x.png")
    path = path.replace(".jpg", "@2x.jpg")
    $(image).attr "src", path
    return

  return

$(document).ready ->
  # Substitute retina assets
  retina
  
  # Implement basic parallax effect
  $("[data-type=\"background\"]").each ->
    $bgobj = $(this) # Assigning the object
    initial = parseInt ($bgobj.css 'background-position-y').replace(/px/, "") # Get initial position

    $(window).scroll ->
      yPos = initial + -($(window).scrollTop() / $bgobj.data("speed")) # Calculate the new position
      
      # Put together our final background position
      coords = "50% " + yPos + "px"
      
      # Move the background
      $bgobj.css backgroundPosition: coords
      return
    return
  return