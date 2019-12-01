$(function () {
  console.log('item/new');

  function addCategories(catId, catLevel) {
    $.ajax({
      type: "GET",
      url: "/categories",
      data: {cat_id: catId},
      dataType: "json"
    })
    .done(function (cats) {
      console.log(cats);
      let select = `
      <select class="input-form__nest" id=${catLevel} name="item[${catLevel}_category_id]">
        <option value="">---</option>
      `;
      for (let cat of cats) {
        select += `<option value="${cat.id}">${cat.name}                          </option>`
      }
      select += `</select>`
      $('#add-category').append(select);
      return false;
    })
    .fail(function () {
      alert('error');
    })
  }
  $('#major-category').change(function () {
    $('#medium-category').remove();
    $('#bottom-category').remove();
    let catId = this.value;
    if (catId === "") {
      return false;
    }
    console.log(catId);
    addCategories(catId, "medium-category");
  });
  $('#add-category').on('change', '#medium-category', function () {
    $('#bottom-category').remove();
    let catId = this.value;
    if (catId === "") {
      return false;
    }
    addCategories(catId, "bottom-category");
  });
})