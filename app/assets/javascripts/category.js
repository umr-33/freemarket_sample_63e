$(document).on("turbolinks:load", function () {

  $(".category-font").on('mouseover', function () {
    $(".top_cat").removeClass('hidden');
    $(".top_cat").addClass('active_cat');
  })

  function hideLastActive(mouseoveredElem) {
    let active_cats = document.getElementsByClassName('active_cat');
    let active_last = [...active_cats].pop();
    if (mouseoveredElem.parentNode.className != active_last.className) {
      unFocusLastActive(mouseoveredElem);
      active_last.classList.remove('active_cat');
      active_last.classList.add('hidden');
    }
  }
  function unFocusLastActive(focusedLi) {
    let active_lis = document.getElementsByClassName('active_li')
    if (active_lis.length === 0) {
      return false;
    }
    let last_active_li = [...active_lis].pop()
    last_active_li.classList.remove('active_li');
  }

  $(document).on("mouseover", ".active_cat li", function hideAndShow() {
    hideLastActive(this);


    if (this.parentNode.className === "top_cat active_cat") {
      hideLastActive(this);
    }
    if (this.dataset.catId != null) {
      let catIdNum = this.dataset.catId.toString();
      let catId = 'cat'+ catIdNum
      let target = document.getElementById(catId);
      if (target != null) {
        target.classList.remove("hidden");
        target.classList.add('active_cat');
        this.classList.add('active_li')
      }
    }
  })

  function removeNav() {
    let activeCats = document.getElementsByClassName('active_cat');
      
    for (let cat of [...activeCats]) {
      cat.classList.remove('active_cat');
      cat.classList.add('hidden');
    }
    
    let active_lis = document.getElementsByClassName('active_li');
    for (let cat of [...active_lis]) {
      cat.classList.remove('active_li');
    }
  }
  $("#search_with_category").on("mouseleave", function () {
    removeNav();
  })
})