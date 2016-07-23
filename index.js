var videos = [].slice.call(document.querySelectorAll("video"))
var sections = [].slice.call(document.querySelectorAll("section"))

window.content.onscroll = document.onresize = function() {
  var y = window.content.scrollTop
  if (y >= window.main.offsetTop) {
    document.body.classList.add("scrolled")
  } else {
    document.body.classList.remove("scrolled")
  }

  for (var i = sections.length - 1; i >= 0; i--) {
    if (y + 100 > sections[i].offsetTop || i == 0) {
      videos.forEach(function(video, j) {
        if (j == i) {
          video.classList.add("playing")
          video.play()
        } else {
          video.classList.remove("playing")
          video.pause()
        }
      })
      return
    }
  }
}

window.content.onscroll()
