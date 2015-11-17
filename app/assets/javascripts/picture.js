$(function(){

    $('form#new_todo').on('ajax:success', function(e, data, status, xhr){
      debugger;
        $('ul').prepend(xhr.responseText)
    })
})
