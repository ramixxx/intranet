<cfinclude template="/common/header.cfm">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>



<cfquery datasource="test" name="contact_list">
  SELECT first_name,last_name,username,fileUpload
  FROM users
  WHERE username <> '#session.user.username#'
  
  
</cfquery>



<cfquery datasource="test" name="send_message">
  SELECT message_id,send_from,send_to,message_text
  FROM send_message
 WHERE send_from = '#SESSION.user.username#' AND send_to = '#URL.username#' 
</cfquery>


<cfquery datasource="test" name="receive_message">
  SELECT message_id,send_from,send_to,message_text
  FROM send_message
 WHERE send_to = '#SESSION.user.username#' AND send_from = '#URL.username#'
</cfquery>





<style>
.floating-box {
    display: inline-block;
    width: 296px;
    height: 100px;
    margin: 10px;
    border: 1px solid #2e353d;
    border-top-left-radius:31px;
    border-bottom-right-radius:30px;

}
</style>

<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h2>User menu</h2>
		<ol class="breadcrumb">
			<li>
				<a href="index.html">Home</a>
			</li>
			<li>
				<a>User Menu</a>
			</li>
			<li class="active">
				<strong>Contacts</strong>
			</li>
		</ol>
	</div>
	<div class="col-lg-2">

	</div>
</div>
<cfoutput>
		<div class="col-md-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>Chat - #URL.username#</h5>
				</div>
				<div>
					<div class="ibox-content no-padding border-left-right profile-image-container">
						
					</div>
				
					<div class="ibox-content NO PADDING">
						</cfoutput>
					

<head>
	
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<title>TB Chat</title>
 </head>

 <ul class="nav nav-tabs">

<cfset session.goodUser = "Yes">


<cfif session.goodUser eq "Yes"> 

<style>
	
	
	.footer {
	  position: fixed;
	  bottom: 0;
	  width: 100%;
	  height: 45px;
	  background-color: ##f5f5f5;
	}

</style>


   

<div class="container">

		<div id="messages" >

								
		</div>
		
</div>
<cfoutput>
		<div class="container-full" style="padding-top:5px;">
			<form action="" method="post" id="form_message">
				<div class="col-md-12">
					<div class="input-group">
						<input type="hidden" class="form-control" name="send_from" id="sessionusername" value="#SESSION.user.username#">
						<input type="hidden" class="form-control" name="send_to" id="urlusername" value="#URL.username#">
						<input type="textarea" class="form-control" name="new_message" id="newmessage"  autocomplete="false" autofocus value="" required >
						<span class="input-group-btn">
							<input type="submit" name="submit"   class="btn btn-primary alignright sendmessage">
						</span>
					</div>
				</div>
</cfoutput>


							<div class="col-md-12">
								<div id="updateid">
									
										
									
									<cfoutput query="receive_message">
									<div style="text-align:right;">
									#URL.username# : #receive_message.message_text#
									</div>
									</cfoutput>

									<cfoutput query="send_message">
									#SESSION.user.username# : #send_message.message_text# <br />
									</cfoutput>

									
								</div>
							</div>

			</form>
		</div>

			

  
 
   

<cfelse>

</cfif>

</ul>




					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			
				<div class="ibox-title">
					<h5>Contacts</h5>
					
				</div>
				 <cfoutput query="contact_list">
				<div class="ibox-content">
					
			<div class="row">

   				 <div class="col-md-2"><img alt="image" class="img-circle" height="40" width="40" src="/img/user_images/#fileUpload#" style="margin-right:5px;"/>#first_name# #last_name#</div>
		
					


                               
                     
                            	
                               <div class="col-md-2"><a href="/users/contacts/index.cfm?username=#username#" class="btn btn-white btn-sm chatclass"><i class="fa fa-weixin" aria-hidden="true" style="margin-right:3px;"></i>Chat</a></div>
                              	</div>
                     

					
					
			
						</div>
			</cfoutput>


<script> 
 $(document).ready(function() {
 	$("#updateid").load("populatechat.cfm?<cfoutput>#CGI.QUERY_STRING#</cfoutput>");
		var refreshId = setInterval(function() {
		  $("#updateid").load('populatechat.cfm?randval='+ Math.random()+'&<cfoutput>#CGI.QUERY_STRING#</cfoutput>');
	   }, 3000);
   $.ajaxSetup({ cache: false });
   
});
</script>

<script>

$(".sendmessage").on('click', function(e){
	
		e.originalEvent.defaultPrevented;

			var send_from = $('#sessionusername').val();
			var send_to = $('#urlusername').val();
			var new_message = $('#newmessage').val();
			
			

		$.post('_ajax_send_message.cfm', {
			
				send_from: send_from,
				send_to: send_to,
				new_message: new_message
				
			
			}, function(data) {
				
						
		$('#updateid').html(data);	
				
							
			});
		
			return false;




});
</script>




<!--- <cfinclude template="/common/footer.cfm"> --->