$(function(){

  function appendCategory(child){
    var html = `
                <option value = "${child.name}" data-category="${child.id}">${child.name}</option>
              `;
    return html;
    
  }
  function appendchildrenbox(insertHTML){
    var secondhtml = 
              `
                  <div class = "contents__detail__box__set__form__detail">
                    <select class = "contents__detail__box__set__form", id = "children_category">
                      <option value="---">---</option>
                      ${insertHTML}
                    </select>
                  </div>
              `;
    $('.contents__detail__box__set__form__detail').append(secondhtml);
  }

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
        alert('カテゴリー取得に失敗しました');
      })
    };
  });
  
  $("contents__detail__box__set__form").on("change", function(){
    console.log("発火");
    // var parentCategory = document.getElementById('parent_category').value;
    // console.log(parentCategory);
    // if (parentCategory != "---"){ 
    //   $.ajax({
    //     url: 'get_category_children',
    //     type: 'GET',
    //     data: { parent_name: parentCategory },
    //     dataType: 'json'
    //   })
    //   .done(function(children){
    //     var insertHTML = '';
        
    //     children.forEach(function(child){
    //       insertHTML += appendCategory(child);
    //     });
    //     appendchildrenbox(insertHTML);
    //   })
    //   .fail(function(){
    //     alert('カテゴリー取得に失敗しました');
    //   })
    // };
  })
});
