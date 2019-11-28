$(document).on("turbolinks:load", function () {
  $('.topchar').on('click', function (e) {
    e.preventDefault();
    let topchar = $(this).data().topchar;
    console.log(topchar);
    let target = $("#"+topchar);
    $('html, body').animate({
      scrollTop: target.offset().top
    }, 100);
  })
})
