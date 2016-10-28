<cfapplication name="chatter">

<cfset threadLife = 30000><!--- thirty seconds --->


<cfset threadStart = getTickCount()>
<cfparam name="lastchat" default="0">

<cfif not IsDefined("application.chatlog")>
        <cfset application.chatlog = ArrayNew(1)>
</cfif>

<cfloop condition="threadLife+threadStart GT getTickCount()">

        <cfoutput>

                <cfif ArrayLen(application.chatlog) GT lastchat>
                                #SerializeJSON(application.chatlog)#
                        <cfabort>
                </cfif>

                <cfthread action="sleep" duration="500" />

        </cfoutput>

</cfloop>
<cfoutput>#SerializeJSON(ArrayNew(1))#</cfoutput>