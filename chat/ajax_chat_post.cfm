<cfapplication name="chatter">

<cfif not IsDefined("application.chatlog")>
        <cfset application.chatlog = ArrayNew(1)>
</cfif>

<cfparam name="message" default="">

<cfif len(message)>
        <cfset arrayAppend(application.chatlog, message)>
</cfif>