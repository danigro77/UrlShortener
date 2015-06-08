$(function() {
    $('button').on('click', function(){
        var originalUrl = $('input').val();
        var url = '/short_links/?original_url=' + encodeURIComponent(originalUrl);
        $.post(url, function(data) {
            var new_url = document.URL + 'a/' + data.short;
            $('.result').append("<p class='short'><span>Short: <a href=" + new_url + " target='_blank'>"+ new_url + "</a></span></p>");
            $('input').val('');
        }).error(function() {
            alert("This is not a valid URL. Possible reason: missing http://");
        });
    });
});