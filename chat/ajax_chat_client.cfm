<div id="chatlog">

</div>

<input type="text" name="message" id="chat_message"> <input type="button" value="post" onclick="sendMessage()">

<br>Last HTTP Request made:
<span id="last_request_time"></span>

<style>
#chatlog {

        width: 500px;
        height: 300px;
        overflow: auto;
        border: thin black solid;

}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

var lastMessage = 0;

function sendMessage(){
        $.get("ajax_chat_post.cfm?message=" + escape($("#chat_message").val()));
        $("#chat_message").val("");
}

function checkNewPosts()
{
        $("#last_request_time").html(new Date().getTime());
        $.getJSON('ajax_chat_get.cfm?lastchat=' + lastMessage, function(data){

                while(data.length > lastMessage)
                {
                        $("#chatlog").prepend((lastMessage+1) + ') ' + data[lastMessage] + '<br>');

                        lastMessage++;

                }


                setTimeout(checkNewPosts(), 500);

        });

}

 $(document).ready(function(){


        checkNewPosts();


 });

</script>