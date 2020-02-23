$(function(){

  function appendCategory(child){
    var html = `
                <option value = "${child.name}" data-category="${child.id}">${child.name}</option>
              `;
    return html;
    
  };

  function appendchildrenbox(insertHTML){
    var secondhtml = 
              `
                  
                    <select class = "contents__detail__box__set__form", id = "children_category", name = "product[category]">
                      <option value="---">---</option>
                      ${insertHTML}
                    </select>
                
              `;
    $('.contents__detail__box__set__form__detail').append(secondhtml);
  };

  function appendgrandchildrenbox(insertHTML){
    var thirdhtml = 
              `
                  
                    <select class = "contents__detail__box__set__form", id = "grandchildren_category", name = "product[category]">
                      <option value="---">---</option>
                      ${insertHTML}
                    </select>
                  
              `;
    $('.contents__detail__box__set__form__detail').append(thirdhtml);
  };

  $("#parent_category").on("change", function(){
    var parentCategory = document.getElementById('parent_category').value;
    console.log(parentCategory);
    if (parentCategory != "---"){ 
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        
        children.forEach(function(child){
          insertHTML += appendCategory(child);
        });
        appendchildrenbox(insertHTML);
      })
      .fail(function(){
        alert('子カテゴリー取得に失敗しました');
      })
    };
  });

  $(".contents__detail__box__set").on("change", '#children_category', function(){
    var childContent = $('#children_category option:selected').data('category');
    console.log(childContent);
    if (childContent != "---"){ 
      
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childContent },
        dataType: 'json'
      })
      .done(function(grandChildren){
        var insertHTML = '';
        console.log(grandChildren);

        grandChildren.forEach(function(grandchild){
          insertHTML += appendCategory(grandchild);
        });
        console.log(insertHTML)
        appendgrandchildrenbox(insertHTML);
      })
      .fail(function(){
        alert('孫カテゴリー取得に失敗しました');
      })
    };
  })

  $(".contents__detail__box__set__form").on("change", '#grandchildren_category', function(){
    var grandchildContent = $('#grandchildren_category option:selected').data('category');
    console.log(grandchildContent);
    return grandchildContent;
  //   $.ajax({
  //     url: 'get_selected_grandchild',
  //     type: 'GET',
  //     data: { grandchild_id: grandchildContent },
  //     dataType: 'json'
  //   })
  //   .done(function(grandchild){
  //     return grandchild.id;
  //   })
  //   .fail(function(){
  //     alert('孫カテゴリー取得に失敗しました');
  //   })
  })
});