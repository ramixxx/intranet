
<!--- <cfdump var="#form#">

 --->

<cfquery datasource="test" name="abc">
  INSERT INTO send_message (send_from,send_to,message_text)
  VALUES ('#SESSION.user.username#',
  			'#FORM.send_to#',
  			'#FORM.new_message#'
  			)
</cfquery>


<cfquery datasource="test" name="getmymessage">
  SELECT message_text FROM send_message 
  WHERE (send_from = '#SESSION.user.username#' AND send_to = '#FORM.send_to#') OR ( send_to = '#SESSION.user.username#' AND send_from = '#FORM.send_to#')
</cfquery>



<cfoutput query="getmymessage">
    <div id="updateid">
          <cfif send_message.send_from EQ SESSION.user.username>
            <div style="text-align:left;">
              #send_message.send_from# : #send_message.message_text# <br />
            </div>
          <cfelse>
          <div style="text-align:right;">
              #send_message.send_from# : #send_message.message_text#
          </div>
        </cfif>
    </div>
</cfoutput>

