$(function(){

  $("input:radio").click(function() {
        var img_id = $("input[name=id]:checked").val()
        $("#"+img_id).addClass("photo-border");
    });

  $("input:radio").blur(function() {
        var img_id = $("input[name=id]:checked").val()
        $("#"+img_id).removeClass("photo-border");
    });

});
