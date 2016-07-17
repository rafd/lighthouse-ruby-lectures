$.get('http://crossorigin.me/http://lcboapi.com/products', function(data){
  var products = data.result;
  console.log(products[0].name);

  console.log("done for real");
});

console.log("done");
