$(function () {

  function addCategories(catId, catLevel) {
    $.ajax({
      type: "GET",
      url: "/categories",
      data: {cat_id: catId},
      dataType: "json"
    })
    .done(function (cats) {
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


  // brand incremental search
  $(document.getElementsByName("brand")[0]).on('keyup', function () {
    let input = $(this).val();

    $.ajax({
      type: "GET",
      url: "/brands",
      data: {keyword: input},
      dataType: "json"
    })
    .done(function (brands) {
      let html = ``
      for (let brand of brands) {
        html += `
          <li data-brand-id="${brand.id}">${brand.name}</li>
        `;
      }
      $('#add-brands').children().remove();
      $('#add-brands').append(html);
      return false
    })
    .fail(function (a, b, error) {
      alert(error);
    })
  })
  
  $('#add-brands').on('click', 'li', function () {
    let bName = $(this).text();
    let bid = $(this).data().brandId;
    let hiddenInput = `
      <input name='item[brand_id]' type='hidden' value=${bid}></input>`
    $(document.getElementsByName("brand")[0]).val(bName);
    $(document.getElementsByName('item[brand_id]')).remove();
    $(document.getElementsByName("brand")[0]).parent().append(hiddenInput);
  })

  $('#add-brands').on("mouseleave", function () {
    $('#add-brands').children().remove();
  })
})