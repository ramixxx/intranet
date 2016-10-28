<!--- <!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        If a new message if posted, put into the application variable so everyone can see it
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->

<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         DISPLAY THE FORM THAT ALLOWS NEW MESSAGE TO BE ENTERED
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<html>
  <head>
     <title>Post New Message</title>
  </head>

  <body bgcolor="#000000">

<form action="postmessage.cfm" method="post">

<input type="text" name="new_message" value="" size="50">
<input type="submit" name="PostIt" value="Post Message">
				   
</table>
</form>

</body>
</html> --->

<cfif IsDefined("FORM.new_message") and FORM.new_message IS NOT "">
    <cfset Application.MessageLog	= "<b>#session.user.username#</b>: #FORM.new_message#<br>">
	
	<cfset newRow = QueryAddRow(Application.Messages,1)>
	<cfset querySetCell(Application.Messages, "user","#session.user.username#",newRow )>
	<cfset querySetCell(Application.Messages,"message","#FORM.new_message#",newRow )>
	<cfset querySetCell(Application.Messages,"date_sent",DateTimeFormat(NOW(),"dd MMMMM HH:nn"),newRow )>
	<Cfdump var="#newRow#">
</cfif>
<Cflocation url="/users/contacts" addtoken="no"> 


