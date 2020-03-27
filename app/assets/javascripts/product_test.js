$(document).on('turbolinks:load', ()=> {

  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[product_images_attributes][${index}][image]"
                    id="product_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }


  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box-test').on('change', '.js-file', function(e) {

    $('#image-box-test').append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box-test').on('click', '.js-remove', function() {
    $(this).parent().remove();
  
    if ($('.js-file').length == 0) $('#image-box-test').append(buildFileField(fileIndex[0]));
  });
});