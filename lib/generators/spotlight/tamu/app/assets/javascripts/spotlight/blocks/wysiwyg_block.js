SirTrevor.Blocks.Wysiwyg = (function () {

  return SirTrevor.Block.extend({
    type: 'wysiwyg',

    icon_name: "text",

    title: function () {
      return i18n.t('blocks:wysiwyg:title');
    },

    description: function () {
      return i18n.t('blocks:wysiwyg:description');
    },

    blockGroup: function () {
      return i18n.t("blocks:group:tamu")
    },

    formattable: true,

    toolbarEnabled: true,

    editorHTML: function () {
      return "<div class='tmce-" + this.blockID + " tinymce'></div>";
    },

    loadData: function (data) {
      this.$("div.tmce-" + this.blockID)[0].innerHTML = data.text;
    },

    onBlockRender: function () {
      var wb = this;
      tinyMCE.init({
        selector: "div.tmce-" + wb.blockID,
        inline: false,
        inline_styles: true,
        plugins: 'print preview fullpage importcss searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
        menubar: 'file edit view insert format tools table help',
        toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample',
        setup: function (editor) {
          editor.on("change", function () {
            wb.blockStorage.data.text = editor.getContent();
          });
        }
      });
    }

  });

})();
