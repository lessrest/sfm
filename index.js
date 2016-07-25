function selectAll(selector) {
  return [].slice.call(document.querySelectorAll(selector))
}

var container = document.body

container.onscroll = document.onresize = function() {
  var y = container.scrollTop
  if (y >= window.main.offsetTop) {
    document.body.classList.add("scrolled")
  } else {
    document.body.classList.remove("scrolled")
  }
}

container.onscroll()

selectAll("aside").forEach(function(aside) {
  aside.onclick = function() {
    aside.classList.toggle("expanded")
  }
})

selectAll("video").forEach(function(element) {
  var src = element.dataset["src"]
  var player = dashjs.MediaPlayer().create()
  player.setFastSwitchEnabled()
  player.initialize(element, src, true)
})

selectAll(".click-to-play-video").forEach(function(element) {
  element.onclick = function() {
    selectAll("video").forEach(function(video) {
      video.play()
    })
  }
})
