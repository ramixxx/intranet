<cfparam name="SESSION.Messages.last_viewed" default="">
<div class="row">
	<div class="container-fluid">
	<cfloop query="#Application.Messages#">
		<cfoutput>
			<div <cfif SESSION.MyUsername EQ Application.Messages.user> align="right"</cfif>><strong>#user#:</strong> #date_sent#</div>
				<div class="alert alert-info" <cfif SESSION.MyUsername EQ Application.Messages.user>style="background-color:##E8E8E8; border-color:##E8E8EE"</cfif>>
					#message#
				</div> 
			<br>
		</cfoutput>
	</cfloop>
	</div>
</div>

<cfif Application.Messages.recordcount GT SESSION.Messages.last_viewed>
	<script>
		$('html, body').animate({scrollTop:$(document).height()}, 'fast');
	</script>
	<cfset SESSION.Messages.last_viewed = Application.Messages.recordcount>
</cfif>
