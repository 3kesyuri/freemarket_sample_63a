$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    function setLabel() {
      var imageContent = $('.content__product--image-label').prev();
      labelWidth = (620 - $(imageContent).css('width').replace(/[^0-9]/g, ''));
      $('.content__product--image-label').css('width', labelWidth);
    }

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({id: `label-box--${id}`,for: `product_product_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          var imageContent = $('.content__product--image-label').prev();
          $(imageContent).append(html);
        }

        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 5) { 
          $('.content__product--image-label').hide();
        }
        setLabel();
        if(count < 5){
          $('.label-box').attr({id: `label-box--${count}`,for: `product_product_images_attributes_${count}_image`});
        }
      }
    });

    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      $(`#product_product_images_attributes_${id}_image`).val("");
      var count = $('.preview-box').length;
      if (count == 4) {
        $('.content__product--image-label').show();
      }
      setLabel(count);
      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `product_product_images_attributes_${id}_image`});
      }
    });


    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    function buildChildrenHTML(insertHTML) {
      var childrenHtml = `<div class="content__product--category children">
                            <select name="product[category_id]" id="child_category">
                              <option value="">選択してください</option>
                              ${insertHTML}
                            </select>
                          </div>`;
      $('.content__product--category.parent').append(childrenHtml);
    }

    function buildGrandchildren(insertHTML){
      var grandchildrenHtml =`<div class="content__product--category grandchildren">
                                <select name="product[category_id]" id="grandchild_category">
                                  <option value="">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>`;
      $('.content__product--category.parent').append(grandchildrenHtml);
    }

    $('#product_category_id').on('change', function(){
      $('.children').remove(); 
      $('.grandchildren').remove();
      var parentCategory = document.getElementById('product_category_id').value;
      if (!parentCategory) {
        return
      }
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: {parent_name: parentCategory},
          dataType: 'json'
        })

        .done(function(children){
          $('.children').remove(); 
          $('.grandchildren').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          buildChildrenHTML(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })   
    });

    $('.parent').on('change', '#child_category', function(){
      $('.grandchildren').remove(); 
      var childrenCategory = $('#child_category option:selected').data('category'); 
      if (!childrenCategory) {
        return
      } 
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: {child_id: childrenCategory},
        dataType: 'json'
      })

      .done(function(grandchildren){
        $('.grandchildren').remove(); 
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
          buildGrandchildren(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    })
  });
})