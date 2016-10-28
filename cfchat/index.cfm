<cfset commonObj 	= createObject("component", "cfc.common")>	

<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0, minimal-ui">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<title>TB Chat</title>
 </head>



<cfset session.goodUser = "Yes">
<body>

<cfif session.goodUser eq "Yes"> 

<style>
	html {
	  position: relative;
	  min-height: 100%;
	}
	body {
		padding-top: 70px;	
		margin-bottom: 45px;
	}
	.footer {
	  position: fixed;
	  bottom: 0;
	  width: 100%;
	  height: 45px;
	  background-color: ##f5f5f5;
	}

</style>

<script>
 $(document).ready(function() {
 	$("##messages").load("_messages.cfm?<cfoutput>#CGI.QUERY_STRING#</cfoutput>");
		var refreshId = setInterval(function() {
		  $("##messages").load('_messages.cfm?randval='+ Math.random()+'&<cfoutput>#CGI.QUERY_STRING#</cfoutput>');
	   }, 3000);
   $.ajaxSetup({ cache: false });
   $('html, body').animate({scrollTop:$(document).height()}, 'fast');
});
</script>

   <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="##">TB Chat</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">

		 <ul class="nav navbar-nav  pull-right">

            <li class="dropdown">
             <a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">#SESSION.user.username# <span class="caret"></span></a>
              <ul class="dropdown-menu">
			  <li><a href="logout.cfm" target="_top">Logout</a></li>
			  <li>Current users</li>
              <!---  <cfloop list="#Application.user.#" index="UserName" delimiters="#chr(9)#">
					<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span> #UserName# </li>
				</cfloop>  --->
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>

<div class="container">

		<div id="messages" >

		</div>
		
</div>

    <footer class="footer">
		<div class="container-full" style="padding-top:5px;">
			<form action="postmessage.cfm" method="post" id="form_message">
				<div class="col-lg-12">
					<div class="input-group">
						<input type="textarea" class="form-control"name="new_message" autocomplete="false" autofocus value="" required >
						<span class="input-group-btn">
							<button type="submit" class="btn btn-success" type="button">Send</button>
						</span>
					</div>
				</div>
			</form>
		</div>
    </footer>

<cfelse>

</cfif>


</cfoutput>


</body>
</html>