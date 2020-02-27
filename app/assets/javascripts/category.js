$(function(){

  function appendCategory(child){
    var html = `
                <option value = ${child.id} data-category="${child.id}">${child.name}</option>
              `;
    return html;
    
  };

  function appendchildrenbox(insertHTML){
        var secondhtml = 
              `
                    <select class = "contents__detail__box__set__form__detail__select", id = "children_category", name = "product[category_id]">
                      <option value>---</option>

                      ${insertHTML}
                    </select>
              `;
    $('.contents__detail__box__set__form__detail').append(secondhtml);
  };

  function appendgrandchildrenbox(insertHTML){
    var thirdhtml = 
              `
                    <select class = "contents__detail__box__set__form__detail__select", id = "grandchildren_category", name = "product[category_id]">
                      <option value>---</option>
                      ${insertHTML}
                    </select>
              `;
    $('.contents__detail__box__set__form__detail').append(thirdhtml);
  };

  $("#parent_category").on("change", function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "---"){ 
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#grandchildren_category').remove();
      $('#children_category').remove();

        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendCategory(child);
        });
        appendchildrenbox(insertHTML);
      })
      .fail(function(){
        alert('子カテゴリー取得に失敗しました');
      })
    } else {
      $('#grandchildren_category').remove();
      $('#children_category').remove();
    };
  });

  $(".contents__detail__box__set").on("change", '#children_category', function(){
    var childContent = $('#children_category option:selected').data('category');
    var childContentvalue = document.getElementById('children_category').value;
    if (childContentvalue != "---"){ 
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childContent },
        dataType: 'json'
      })
      .done(function(grandChildren){
        $('#grandchildren_category').remove();
        var insertHTML = '';
        grandChildren.forEach(function(grandchild){
          insertHTML += appendCategory(grandchild);
        });
        appendgrandchildrenbox(insertHTML);
      })
      .fail(function(){
        alert('孫カテゴリー取得に失敗しました');
      })
    } else{
      $('#grandchildren_category').remove();
    };
  })
});