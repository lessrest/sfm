function select(selector) {
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

select("aside").forEach(function(aside) {
  aside.onclick = function() {
    aside.classList.toggle("expanded")
  }
})

select("video").forEach(function(video) {
  video._dashjs_player.setFastSwitchEnabled(true)
})
