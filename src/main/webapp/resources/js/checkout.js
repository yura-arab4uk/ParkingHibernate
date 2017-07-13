function checkout(id) {
    $.ajax({
        url : '/checkout?id='+id,
        type : "POST",

        dataType : "json",
        cache : false,

        success : function(data) {
            console.log(data.status);
            var $car=$('#'+id);
            $car.remove();
        }
    });
}