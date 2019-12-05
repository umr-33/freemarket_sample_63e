$(document).on("turbolinks:load", function () {

  $(".image_preview").on('click', '.item-image', function () {
    let destroyReq = window.confirm('選択した画像を削除しますか');
    if (destroyReq) {
      let imgId = $(this).data("img-id");
      let imgBody = $(this)
      //console.log(imgId);
      $.ajax({
        type: "delete",
        url: "/images/" + imgId,
        data: {image_id: imgId},
        dataType: "json"
      })
      .done(function (data) {
        //console.log(data);
        imgBody.remove();
      })
      .fail(function () {
        alert('error');
      })
    }
  })

  function readURL(input) {
    for (i = 0; i < input.files.length; i++) {
      if (input.files && input.files[i]) {
        var reader = new FileReader();
        
        
        reader.onload = function (e) {
          let imgPrev = $(`<img class="avatar_img_prev" width="120" height="120" src="${e.target.result}" />`);
          $(".image_preview").append(imgPrev);
        }
        reader.readAsDataURL(input.files[i]);
      }
    }
    $(".file_number").text(`${input.files.length}枚選択されています`)
  }

  $('.image-post-area').change(function(){
    $(".avatar_img_prev").remove();
    readURL(this);
  });
})