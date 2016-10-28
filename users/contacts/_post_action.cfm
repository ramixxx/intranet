<cfif IsDefined("FORM.new_message") and FORM.new_message IS NOT "">
    <cfset Application.MessageLog	= "<b>#session.MyUserName#</b>: #FORM.new_message#<br>" & Application.MessageLog>
	
	<cfset newRow = QueryAddRow(Application.Messages)>
	<cfset querySetCell(Application.Messages,"#session.MyUserName#",1)>
	<cfset querySetCell(Application.Messages,"#FORM.new_message#",1)>
	<cfset querySetCell(Application.Messages,"today",1)>
	
</cfif>