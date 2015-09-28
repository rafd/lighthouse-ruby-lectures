$(function() {

  $("body").append("<div class='h'>hello world</div>")

  setTimeout(function() {
    $(".h").css("color", "red");
  }, 1000);

  $.get('http://crossorigin.me/http://lcboapi.com/products', function(data){
      var products = data.result;

      products.forEach(function(p) {
        console.log(p.name);
      });
   });

  $(document).ready(function(){
    $('body').on('click', function(e){
      alert("Hello World");
    });
  });

});



