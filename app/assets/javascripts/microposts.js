function pluralize(count, word){
  if (count == 1 || count == -1 || count == 0){
    return String(count) + ' ' + word;
  }else{
    return String(count) + ' ' + word + 's';
  }
}

function updateCountdown() {
  // 140 is the max message length
  var remaining = 140 - jQuery('#micropost_content').val().length;
  jQuery('.countdown').text(pluralize(remaining,' character') + ' remaining');

  var color = 'grey';
    if (remaining < 21) { color = 'black'; }
    if (remaining < 11) { color = 'red'; }
    jQuery('.countdown').css( { color: color} );
}

jQuery(document).ready(function($) {
  updateCountdown();
  $('#micropost_content').on('input',updateCountdown);
});