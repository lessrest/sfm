var videos = [].slice.call(document.querySelectorAll("video"))
var sections = [].slice.call(document.querySelectorAll("section"))
var container = document.body

container.onscroll = document.onresize = function() {
  var y = container.scrollTop
  if (y >= window.main.offsetTop) {
    document.body.classList.add("scrolled")
  } else {
    document.body.classList.remove("scrolled")
  }

  // for (var i = sections.length - 1; i >= 0; i--) {
  //   if (y + 100 > sections[i].offsetTop || i == 0) {
  //     videos.forEach(function(video, j) {
  //       if (j == i) {
  //         video.classList.add("playing")
  //         video.play()
  //       } else {
  //         video.classList.remove("playing")
  //         video.pause()
  //       }
  //     })
  //     return
  //   }
  // }
}

container.onscroll()

var asides = [].slice.call(document.querySelectorAll("aside"))
asides.forEach(function(aside) {
  aside.onclick = function() {
    aside.classList.toggle("expanded")
  }
})
