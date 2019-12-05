$(document).on("turbolinks:load", function () {

  // category 追加
  function addCategories(catId, catLevel) {
    let dataName = (catLevel=="minor-category") ? "item[category_id]" : "medium_cat";
    $.ajax({
      type: "GET",
      url: "/categories",
      data: {cat_id: catId},
      dataType: "json"
    })
    .done(function (cats) {
      let select = `
      <select class="input-form__nest" id=${catLevel} name=${dataName}>
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
    $('#minor-category').remove();
    let catId = this.value;
    if (catId === "") {
      return false;
    }
    addCategories(catId, "medium-category");
  });

  $('#add-category').on('change', '#medium-category', function () {
    $('#minor-category').remove();
    let catId = this.value;
    if (catId === "") {
      return false;
    }
    addCategories(catId, "minor-category");
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
      <input name='item[brand_id]' type='hidden' value=${bid}>`
    $(document.getElementsByName("brand")[0]).val(bName);
    $(document.getElementsByName('item[brand_id]')).remove();
    $(document.getElementsByName("brand")[0]).parent().append(hiddenInput);
  })

  $('#add-brands').on("mouseleave", function () {
    $('#add-brands').children().remove();
  })

  // 販売手数料と販売利益を設定
  setSalesSubEntry = function(isValid, margin = 0, profit = 0) {
    marginVal = '-';
    profitVal = '-';
    if (true == isValid) {
      marginVal = `¥${margin}`;
      profitVal = `¥${profit}`; 
    }
    $('.sales-margin').text(marginVal);
    $('.sales-profit').text(profitVal);
  }

  const priceLower = 300;     // 最低価格
  const prcieUpper = 9999999; // 最高価格
  const marginRate = 10;      // 販売手数料率[%]
  // 販売価格計算
  $('#item_price').on('keyup', function() {
    var price = $('#item_price').val();
    if (false == $.isNumeric(price)) {
      // 入力値は数値ではない
      setSalesSubEntry(false);
    }
    if ((priceLower <= price) && (price <= prcieUpper)) {
      // 入力値が範囲内
      var margin = Math.floor((price * marginRate) / 100);  // 小数点以下切り捨て
      var profit = price - margin;
      setSalesSubEntry(true, margin, profit);
    }
    else {
      // 入力値が範囲外
      setSalesSubEntry(false);
    }
  })

})