$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `
                  <div class="file_field_group" data-index= ${index}>
                    <div class="file_field">
                      <label for="product_images_attributes_${index}_image">
                        <i class="fa fa-camera"></i>
                        画像選択
                      </label>
                      <input type="file", class= "hidden"
                      name="product[images_attributes][${index}][image]"
                      id="product_images_attributes_${index}_image">
                    </div>
                    <div class= "remove">削除</div>
                  </div>
                `;
      return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="120px" height="130px" class= "product_img">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9];
   // 既に使われているindexを除外
  lastIndex = $('.file_field_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  $('.hidden-destroy').hide();
  
  // edit画面の５つ目のfile_fieldを消す
  if(($('.file_field_group').length >= 5)){
    $('.file_field_group:last').hide();
  };


  $('.image_box').on('change', '.file_field_group', function(e) {
    const targetIndex = $(this).data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {      
      img.setAttribute('src', blobUrl);
    } else if($('.product_img').length < 4) {  // 新規画像追加の処理
      $('.previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      if(($('.file_field_group').length < 4)){
      $('.image_box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      }
    }
  });


  
  $('.image_box').on('click', '.remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) {
      hiddenCheck.prop('checked', true);
    };
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.file_field_group').length == 0) {
      $('.image_box').append(buildFileField(fileIndex[0]));
    }
  });
 
  $('.product_show').on('click', '.product_show_image', function(){
    $('.active').removeClass('active')
    $(this).addClass('active')
    $(this).prependTo('.product_show_images') 
  });


});

