$(function(){

  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][image]"
                    id="product_images_attributes_${num}_image">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;

  }
  
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // console.log(img);
      // console.log(src);
      // console.log(blobUrl);
      img.setAttribute('image', blobUrl);
    } else if ($('.js-file').length == 10) {
      // console.log(img);
      // console.log(src);
      // console.log(blobUrl);
      $('#previews').append(buildImg(targetIndex, blobUrl));
    }
    else{
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

  
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

// $(document).on('turbolinks:load', ()=> {
//   const buildFileField = (index)=> {
//     const html = `<div data-index="${index}" class="js-file_group">
//                     <input label class="js-file" type="file"
//                     name="product[images_attributes][${index}][image]"
//                     id="product_images_attributes_${index}_src"><br>
//                   </div>`;
//     return html;
//   }

//   const buildImg = (index, url)=> {
//     const html = `<div data-index="${index}" class="contents__image__box__area__preview__box">
//                     <img data-index="${index}" src="${url}", class: "contents__image__box__area__preview__box__thumb", width="110px" height="110px">
//                     <div class="js-remove">削除</div>
//                   </div>`
//     return html;
//   }

//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   lastIndex = $('.js-file_group:last').data('index');
//   fileIndex.splice(0, lastIndex);
  

//   $('.hidden-destroy').hide();

//   $('.contents__image__box__area').on('change', '.js-file', function(e) {
//     const targetIndex = $(this).parent().data('index');
//     const file = e.target.files[0];
//     const blobUrl = window.URL.createObjectURL(file);
//     if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
//       img.setAttribute('src', blobUrl);
//     } else {
//       $('.contents__image__box__area__preview').append(buildImg(targetIndex, blobUrl));
//       $('.contents__image__box__area').append(buildFileField(fileIndex[0]));
//       fileIndex.shift();
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
//     }
//   });

//   $('.contents__image__box__area__preview').on('click', '.js-remove', function() {
//     const targetIndex = $(this).parent().data('index')
//     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
//     if (hiddenCheck) hiddenCheck.prop('checked', true);
//     $(this).parent().remove();
//     $(`.js-file_group[data-index="${targetIndex}"`).remove();
//     $(`img[data-index="${targetIndex}"]`).remove();
//     if ($('.js-file').length == 0) $('.contents__image__box__area').append(buildFileField(fileIndex[0]));
//   });
// });