// Loads all Semantic javascripts
//= require semantic-ui

$(document).on("turbolinks:load", () => {
  $(function() {
    $('.fav-whiskey').dimmer({on: 'hover'});
    
    $('.ui.dropdown').dropdown();
    
  });
});