
<cfquery datasource="test" name="send_message">
  SELECT message_id,send_from,send_to,message_text
  FROM send_message
 WHERE (send_from = '#SESSION.user.username#' AND send_to = '#URL.username#') OR (send_to = '#SESSION.user.username#' AND send_from = '#URL.username#')

</cfquery>


<div>

	<cfoutput query="send_message">
		
		<cfif send_message.send_from EQ SESSION.user.username>
			<div style="text-align:left;">
			#send_message.send_from# : #send_message.message_text# <br />
			</div>
		<cfelse>
			<div style="text-align:right;">
				#send_message.send_from# : #send_message.message_text#
			</div>
		</cfif>
		
<!--- 		<div style="text-align:right;">
			#URL.username# : #send_message.message_text#
		</div> --->

	</cfoutput>

		</div>							<!--- <cfoutput query="receive_message">
									
									</cfoutput> --->

