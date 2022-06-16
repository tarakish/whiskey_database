document.addEventListener("turbolinks:load", function() {
  $(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#filePreview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $("#preview").change(function(){
        readURL(this);
    });
  });
})