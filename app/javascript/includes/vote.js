$(function(){

    $(".vote").on("click", ".like, .dislike", function(){
        var post_id = $(this).parent().data("id"),
            is_like = $(this).hasClass("like");

        $.ajax({
            url: "/post/vote",
            method: "POST",
            data: { post_id: post_id , like: is_like},
            success: function(){
                console.log("success");
            }
        }); 
        
    });
});