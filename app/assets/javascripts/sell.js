$(function(){

  // 手数料、利益の自動計算用の変数とメソッド
  var commissionRate = 0.1;
  var commisionBox = $('#commission_box');
  var profitBox    = $('#profit_box');
  var preInput;

  function isInputInteger() {
    return Number.isInteger(Number(input))
  }

  function resetResults(){
    commisionBox.text("-")
    profitBox.text("-")
  }

  function outPutsResluts(commission,profit){
    commisionBox.text("¥" + commission);
    profitBox.text("¥" + profit);
  }

  function hasCategorySelectOptions(){
    return $('#category_select').length;
  }

  function ClearOptions(select_tag){
    select_tag.children().remove();
  }

  // 上位カテゴリーを選択すると下位カテゴリーのセレクトが生成されるイベント
  $('#root_category_select').change(function(e){
    e.preventDefault();
    var input = $(this).val();
    $.ajax({
      type : 'GET',
      url  : '/categories',
      data : { root_category_id: input},
    })
    .done(function(data){
      if(hasCategorySelectOptions()){
        ClearOptions($('#category_select'));
        ClearOptions($('#item_sub_category_id'));
        $('#item_sub_category_id').append('<option value="">---</option>');
      } else {
        var select = '<select class="sell_form__input sell_form__input--select" id="category_select" name="category[category_id]"></select>';
        $('#category_select_box').append(select)
      }
      $('#category_select').append('<option value="">---</option>');
      $.each(data, function(i, category){
        $('#category_select').append('<option value="' + category.id + '">'+ category.name + '</option>');
      });
      // 追加イベント
      $('#category_select').change(function(e){
        e.preventDefault();
        var input = $(this).val();
        $.ajax({
          type : 'GET',
          url  : '/sub_categories',
          data : { category_id: input},
        })
        .done(function(data){
          if($('#item_sub_category_id').length){
            $('#item_sub_category_id').children().remove();
          } else {
            var select = '<select class="sell_form__input sell_form__input--select" name="item[sub_category_id]" id="item_sub_category_id" name="category[category_id]"></select>';
            $('#category_select_box').append(select)
          }
          $('#item_sub_category_id').append('<option value="">---</option>');
          $.each(data, function(i, sub_category){
            $('#item_sub_category_id').append('<option value="' + sub_category.id + '">' + sub_category.name + '</option>');
          });
        })
        .fail(function(){
          alert('カテゴリー検索に失敗しました');
        });
      });
      // 追加イベントここまで
    })
    .fail(function(){
      alert('カテゴリー検索に失敗しました');
    });
  });

  // 手数料、利益の自動計算用のイベント
  $('#input_price').on('keyup', function(e){
    e.preventDefault();
    var input = $(this).val();

    if(input != preInput){
      resetResults();

      if(input >= 300 && isInputInteger){
        var commission = Math.round(input * commissionRate);
        var profit     = input - commission;
        outPutsResluts(commission,profit);
      }

      preInput = input;
    }

  });
});
