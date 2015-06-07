$(function() {
    $('button').on('click', function(){
        var originalUrl = $('input').val();
        var url = '/short_links/?original_url=' + encodeURIComponent(originalUrl);
        $.post(url, function(data) {
            $('.result').append("<p><span>Original: " + data.original + "</span><span>Short: " + data.short + "</span></p>")
        }).error(function() {
            alert("This is not a valid URL. Possible reason: missing http://")
        });
    });
});