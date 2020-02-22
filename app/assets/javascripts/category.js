$(function(){
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
    }
  })
});
