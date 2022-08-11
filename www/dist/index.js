$(".save").click(function(){
    newMark = $('.mark').val();

    $.ajax({
        url: handleOptionSave,
        type: "post",
        data: {"mark": newMark},
        success: function () {
            location.reload();
            //$("objekt").load(location.href + " objekt"); Využizí bez reloadu
        },
    });
});

$(".transform").click(function(){
    $(".add").attr("data-id",$(this).attr("id"));
});

$(".add").click(function(){
    newTag = $('.tags').find(":selected").text();
    page = $(this).attr("data-id");

    $.ajax({
        url: handleOptionAdd,
        type: "post",
        data: {"tag": newTag, "page": page},
        success: function () {
            location.reload();
            //$("objekt").load(location.href + " objekt"); Využizí bez reloadu
        },
    });
});

$(".delete").click(function(){
    page = $(this).attr("id");

    $.ajax({
        url: handleOptionDelete,
        type: "post",
        data: {"page": page},
        success: function () {
            window.location.href = 'http://localhost/urbitech/www/';
        },
    });
});

$(document).ready(function() {

});