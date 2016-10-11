<cfcomponent
    displayname="Application"
    output="true"
    hint="Handle the application.">


    <!--- Set up the application. --->
    <cfset this.name = "intranet_1" />
    <cfset this.applicationtimeout = CreateTimeSpan( 0, 1, 0, 0 ) />
	<cfset this.sessionmanagement = true />
	<cfset this.sessiontimeout = CreateTimeSpan( 0, 1, 0, 0 ) />
	<cfset this.clientmanagement = true /> 
    <cfset this.setclientcookies = true />
	<cfset this.datasource = "test"/>


    <!--- Define the page request properties. --->
    <cfsetting
        requesttimeout="20"
        showdebugoutput="true"
        enablecfoutputonly="false"
    />
	

     <cffunction
        name="OnApplicationStart"
        access="public"
        returntype="boolean"
        output="false"
        hint="Fires when the application is first created.">

		<cfset application.dsn = this.datasource>
		<cfset application.environment = 'local'>
		<!--- instantiate object --->
		<cfset application.commonObj 	= createObject("component", "cfc.common")>
		<cfset application.siteYear = LSDateFormat(now(), 'YYYY')>
        <!--- Return out. --->
        <cfreturn true />
    </cffunction>

	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the session is first created.">
		
		<cfset session.user = StructNew() />
		<cfset session.user.logged_in = false />
		
		<cfif IsDebugMode()> 
			<cfdump var="#session#" label="sessionStart">
		</cfif>
		<!--- Return out. --->
		<cfreturn true/>
	</cffunction>
		
    <cffunction
        name="OnSessionEnd"
        access="public"
        returntype="boolean"
        output="false"
        hint="Fires when the session is terminated.">

        <!--- Define arguments. --->
        <cfargument
            name="SessionScope"
            type="struct"
            required="true"
        />

        <cfargument
            name="ApplicationScope"
            type="struct"
            required="false"
            default="#StructNew()#"
        />
		
		<cfif IsDebugMode()> 
			<cfdump var="#arguments#" label="sessionStart">
		</cfif>
		
        <!--- Return out. --->
        <cfreturn true/>
    </cffunction>
	
	<cffunction
        name="OnRequestStart"
        access="public"
        returntype="boolean"
        output="false"
        hint="Fires at first part of page processing.">
		
        <!--- Define arguments. --->
        <cfargument
            name="TargetPage"
            type="string"
            required="true"
        />
			
		<cfif structKeyExists(url,'reload')>
			<cfset OnSessionStart()>
			<cfset OnApplicationStart()>
		</cfif>
		
		<cfif structKeyExists(url, 'logout')>
			<!--- invalidate the current session --->
			<cfset sessionInvalidate()>
			<!--- trigger OnsessionStart so as to set default session variables --->
			<cfset OnSessionStart()>
		</cfif>
		
		<cfif IsDebugMode()> 
			<cfdump var="#session#" label="onRequestStart()">
		</cfif>
		
		<cfset Request.user.logged_in = false>
		<cfset Request.user.username = 'anonymous'>
		
 		<cfif structKeyExists(session, 'user') and session.user.logged_in>
			<cfset Request.user.logged_in = session.user.logged_in>
			<cfset Request.user.username = session.user.username>
		<cfelse>
			<cfinclude template="/login/index.cfm">
			<!--- 
				create new session, copy date from old session to new session 
				and invalidate old session. This will help to prevent session attacks.
			--->
			<cfset sessionRotate()>
		</cfif>
		<!--- Return out. --->
		<cfreturn true />
    </cffunction>


    <cffunction
        name="OnRequest"
        access="public"
       <!---  returntype="void" --->
        output="true"
        hint="Fires after pre page processing is complete.">

        <!--- Define arguments. --->
        <cfargument
            name="TargetPage"
            type="string"
            required="true"
            />
        <!--- Include the requested page. --->		
		
 		<cfif StructKeyExists(session, 'user') and session.user.logged_in>
			<cfinclude template="#ARGUMENTS.TargetPage#" />
		<cfelse>
			<cfinclude template="/login/index.cfm">
			<!--- 
				create new session, copy date from old session to new session 
				and invalidate old session. This will help to prevent session attacks.
			--->
			<cfset sessionRotate()>
		</cfif>
        <!--- Return out. --->
        <cfreturn true/>
    </cffunction>

	
	<cffunction
        name="OnRequestEnd"
        access="public"
		returntype="boolean"
        output="true"
        hint="Fires after the page processing is complete.">
		
		<!--- <cfdump var="#session#" label="onRequestEnd(Application)"> --->
        <!--- Return out. --->
        <cfreturn true/>
    </cffunction>
	
  <!---  <cffunction
        name="OnRequestStart"
        access="public"
        returntype="boolean"
        output="false"
        hint="Fires at first part of page processing.">

        <!--- Define arguments. --->
        <cfargument
            name="TargetPage"
            type="string"
            required="true"
            />

        <!--- Return out. --->
        <cfreturn true />
    </cffunction>


    <cffunction
        name="OnRequest"
        access="public"
        returntype="void"
        output="true"
        hint="Fires after pre page processing is complete.">

        <!--- Define arguments. --->
        <cfargument
            name="TargetPage"
            type="string"
            required="true"
            />

        <!--- Include the requested page. --->
        <cfinclude template="#ARGUMENTS.TargetPage#" />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
        name="OnRequestEnd"
        access="public"
        returntype="void"
        output="true"
        hint="Fires after the page processing is complete.">

        <!--- Return out. --->
        <cfreturn />
    </cffunction>





    <cffunction
        name="OnApplicationEnd"
        access="public"
        returntype="void"
        output="false"
        hint="Fires when the application is terminated.">

        <!--- Define arguments. --->
        <cfargument
            name="ApplicationScope"
            type="struct"
            required="false"
            default="#StructNew()#"
            />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
        name="OnError"
        access="public"
        returntype="void"
        output="true"
        hint="Fires when an exception occures that is not caught by a try/catch.">

        <!--- Define arguments. --->
        <cfargument
            name="Exception"
            type="any"
            required="true"
            />

        <cfargument
            name="EventName"
            type="string"
            required="false"
            default=""
            />

        <!--- Return out. --->
        <cfreturn />
    </cffunction> --->

</cfcomponent>