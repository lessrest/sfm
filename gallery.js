function selectAll(selector) {
  return [].slice.call(document.querySelectorAll(selector))
}

function toggle(x, klass, shouldBeSet) {
  if (shouldBeSet)
    x.classList.add(klass)
  else
    x.classList.remove(klass)
}

var container = document.body
var photos = selectAll(".zoomed img")
// var thumbnails = selectAll(".list img")
// var list = document.querySelector(".list")

container.onscroll = document.onresize = function() {
  var selected = 0
  var y = container.scrollTop
  var ys = photos.map(function(x) {
    return x.offsetTop + (x.height / 1.5)
  })

  for (var i = 0; i < ys.length; i++) {
    if (y <= ys[i]) {
      selected = i
      break
    }
  }

  for (var i = 0; i < photos.length; i++) {
    toggle(photos[i], "active", i == selected)
    // toggle(thumbnails[i], "active", i == selected)
  }

  // var thumbnailOffsets = thumbnails.map(function(x) {
  //   return x.offsetTop
  // })

  // list.style.transform = "translateY(" + (-thumbnailOffsets[selected] + 25) + "px)"
}
