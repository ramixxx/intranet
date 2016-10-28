
<!--- <cfdump var="#form#">

 --->

<cfquery datasource="test" name="abc">
  INSERT INTO send_message (send_from,send_to,message_text,project_id)
  VALUES (
   
        '#SESSION.user.username#',
        'ALL',
        '#FORM.new_message#',
        '#FORM.project_id#'
        )
</cfquery>



<cfquery datasource="test" name="getmymessage">
  SELECT message_text,send_from,send_to FROM send_message 
  WHERE (send_from = '#SESSION.user.username#' AND send_to = '#FORM.send_to#') OR ( send_to = '#SESSION.user.username#' AND send_from = '#FORM.send_from#')
</cfquery>








<cfoutput query="getmymessage">

    <div>
          <cfif getmymessage.send_from EQ SESSION.user.username>
            <div style="text-align:left;   word-wrap: break-word;">
              #getmymessage.send_from# : #getmymessage.message_text# <br />
            </div>
          <cfelse>
          <div style="text-align:right;   word-wrap: break-word;">
              #getmymessage.send_from# : #getmymessage.message_text#
          </div>
        </cfif>
    </div>
</cfoutput>

