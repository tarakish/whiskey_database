// Loads all Semantic javascripts
//= require semantic-ui

// まだ実用していない
// Use Semantic UI pull-down component
$(function(){
  $('.ui.dropdown').dropdown();
})

$(document).ready(function() {
  $('.fav-whiskey').dimmer({on: 'hover'});
});