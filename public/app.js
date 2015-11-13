jQuery(document).ready(function($) {
  // submit the form with commmand + enter
  $(document).on('keydown', 'body', function(e) {
    if (!(e.keyCode == 13 && e.metaKey)) return;

    var $target = $(e.target);
    if ($target.is('textarea')) {
      $target.closest('form').submit();
    }
  });
});
