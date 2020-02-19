$('#imgFile').change(function(){
    if (this.files.length > 0) {
      // 選択されたファイル情報を取得
      let file = this.files[0] //選択出来るファイルは一つのみ
      
      // readerのresultプロパティに、データURLとしてエンコードされたファイルデータを格納
      var reader = new FileReader()
      reader.readAsDataURL(file)
      
      reader.onload = function() {
        $('#preview').attr('src', reader.result )
      }
    }
  })