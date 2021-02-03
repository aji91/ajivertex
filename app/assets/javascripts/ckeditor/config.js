if(typeof(CKEDITOR) != 'undefined'){
  customConfig : ""
  CKEDITOR.editorConfig = function (config) {
    config.toolbar_mini = [
      { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
      { name: 'styles', items: [ 'Font', 'FontSize' ] },
      { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
      { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
      { name: 'insert', items: [ 'Image', 'Table' ] }
      ];
      config.toolbar_image = [
      { name: 'insert', items: [ 'Image', 'Table' ] }
    ];
    config.enterMode = CKEDITOR.ENTER_BR; // <p></p> to <br />
    config.entities = false;
    config.basicEntities = false;
    config.toolbar_mini = [
      ["Bold",  "Italic",  "Underline", "BulletedList"],
    ];
    config.toolbar = "mini";
  }
} else {
  console.log("ckeditor not loaded")
}