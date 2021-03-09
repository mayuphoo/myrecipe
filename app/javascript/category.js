function pullDown() {


  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild = document.querySelectorAll(".pull-down-list")

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#FFBEDA;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#FFBEDA;")
  })

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（表示されている時）実行される
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  //リストの要素1つ1つに対する処理
  pullDownChild.forEach(function(list) {
    list.addEventListener('mouseover', function() {
      this.setAttribute("style", "background-color:#FFBEDA;")
    })
  })

  pullDownChild.forEach(function(list) {
    list.addEventListener('mouseout', function() {
      this.removeAttribute("style", "background-color:#FFBEDA;")
    })
  })


}

setInterval(pullDown, 500);
