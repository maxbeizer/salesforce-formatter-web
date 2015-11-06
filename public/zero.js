jQuery(document).ready(function($) {
  $("body")
    .on("copy", ".zclip", function(/* ClipboardEvent */ e) {
      e.clipboardData.clearData();
      dat = $(".tab-pane").filter(".active")[0].children[0].innerHTML
        e.clipboardData.setData("text/plain", dat);
      e.preventDefault();
    });
});
