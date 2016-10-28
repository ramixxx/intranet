<!--- NO DB CHAT --->


<cfparam name="Application.UserList" default="">
<cfparam name="Application.MessageLog" default="">
<cfparam name="session.MyUsername" default="">
<cfparam name="session.goodUser" default="No">

<cfif not structKeyExists(application, "loaded")>
	<cfset Application.Messages = queryNew("user,message,date_sent","VarChar,VarChar,VarChar")>
	<cfset Application.Users = queryNew("user,room,date_logged_in,last_seen","VarChar,VarChar,VarChar,VarChar")>
	<cfset application.loaded = "test">
	<cfset application.loaded_date = Now()>
</cfif>




<cfif IsDefined("FORM.MyUsername") and FORM.MyUsername neq "">
        <cfset UserOkToUse	=	ListFind(Application.UserList, FORM.MyUsername, "#chr(9)#")>

        <cfif UserOkToUse eq 0>
                <cfset session.MyUsername = FORM.MyUsername>
                <cfset session.goodUser	= "Yes">

                <cfset Application.UserList = ListAppend(Application.UserList, FORM.MyUsername, "#chr(9)#")>
                <cfset Application.MessageLog = "<font color=Green><b>#session.MyUserName# Logged In at #DateFormat(now())# #TimeFormat(now())#</b></font><br>" & Application.MessageLog>
        <cfelse>
                <cfset UserMessage = "Username taken, try another!">
        </cfif>
</cfif>


<cffunction name="onApplicationEnd"> 
	<cfargument name="ApplicationScope" required=true/> 
	<cflog file="C:\inetpub\wwwroot\cfchat\logs\chat.log" type="Information" text="Application #Arguments.ApplicationScope.applicationname# Ended" > 
</cffunction>

<cfsetting enablecfoutputonly="No">
<cfsetting showdebugoutput="no">