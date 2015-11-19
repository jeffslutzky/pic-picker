$(function(){

    $('form#comparison_form').on('ajax:success', function(e, data, status, xhr){
      debugger;
        $('ul').prepend(xhr.responseText)
    })
})
