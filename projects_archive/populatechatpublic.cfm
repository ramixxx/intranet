
<cfquery datasource="test" name="send_message">
  SELECT message_id,send_from,send_to,message_text,project_id
  FROM send_message
 WHERE   send_to = 'ALL' AND project_id = '#project_id#'

</cfquery>


<div>
<!--- <cfdump var="#send_message#"> --->
	<cfoutput query="send_message">
		
		<cfif send_message.send_from EQ SESSION.user.username>
			<div style="text-align:left;   word-wrap: break-word;">
			#send_message.send_from# : #send_message.message_text# <br />
			</div>
		<cfelse>
			<div style="text-align:right;   word-wrap: break-word;">
				#send_message.send_from# : #send_message.message_text#
			</div>
		</cfif>
		
<!--- 		<div style="text-align:right;">
			#URL.username# : #send_message.message_text#
		</div> --->

	</cfoutput>

		</div>							<!--- <cfoutput query="receive_message">
									
									</cfoutput> --->

