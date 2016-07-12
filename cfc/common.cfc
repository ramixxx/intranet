<!--- 
	Project: Intranet 2016
	File: common.cfc
	Author: Mitch, Thoughtbubble Ltd.
	Created: 03 May 2016
--->
<cfcomponent displayName="common" hint="common Functions" output="false">
	
	<!--- This or windows auth, radius? --->
	<cffunction name="ldap_login" hint="">
		<cfargument name="ldap_server" default="10.0.0.86">
		<cfargument name="domain" required="true">
		<cfargument name="user" required="true">
		<cfargument name="password" required="true">
	
		<cftry>	  
			<cfldap action="query" 
					server="#arguments.ldap_server#" 
					name="results" 
					start="DC=thoughtbubble,DC=com"
					filter="(&(objectclass=user)(SamAccountName=#arguments.user#))"
					username="#arguments.domain#\#arguments.user#" 
					password="#arguments.password#" 
					attributes = "cn,givenName,sn,mail,telephonenumber, SamAccountname"
			>
					   
			<cfcatch type="any">
				
			</cfcatch>
			
		</cftry>
		
		<cfif IsDefined('results')>
			<cfset variables.login = Results>
		<cfelse>
			<cfset variables.login = "">
		</cfif>
		
		<cfreturn variables.login>
	
	</cffunction>
	
	
	<cffunction name="resmushiturl" hint="">
		<cfargument name="api_url" default="http://api.resmush.it/ws.php?">
		<cfargument name="image_url" required="true">
		<cfargument name="image_dest" required="true">
			
			<cfset message = "OK">
			
			<cfhttp url="http://api.resmush.it/ws.php?img=#arguments.image_url#"
					method="GET"
			>
			
			<cfset variables.result = deserializeJSON(CFHTTP.filecontent)>
			<cfset variables.result_filename = ListLast('/')>
			<cffile action="copy" source="#variables.result.dest#" destination="#arguments.image_dest#/#variables.result_filename#">
			
			
			<cfif NOT FileExists('#arguments.image_dest#/#variables.result_filename#')>
				<cfset message = "doesnt exist">
			</cfif>
			
			<cfreturn message>
	</cffunction>


<!--- 		
	BASECAMP API
	https://github.com/basecamp/bcx-api
	calendars.json

	GET /projects/1/calendar_events.json will return upcoming calendar events for the project.
	GET /calendars/1/calendar_events.json will return upcoming calendar events for the calendar.
	GET /projects/1/calendar_events/past.json will return past calendar events for the project.
	GET /calendars/1/calendar_events/past.json will return past calendar events for the calendar.
--->
	
	<cffunction name="basecamp_api" hint="">
		<cfargument name="api_url" default="https://basecamp.com/2544469/api/v1/projects.json">
 		<cfargument name="username" required="true" default="">
		<cfargument name="password" required="true" default="">
			
			
			<cfhttp url="#arguments.api_url#"
					method="GET"
					username="#arguments.username#"
					password="#arguments.password#"
					<!--- Lucee 5 supports cachedWithin on cfhttp --->
					<!--- cachedWithin="#createTimespan(0,0,10,0)#" --->
			>
			
			<cfset variables.result = deserializeJSON(cfhttp.filecontent)>
			<cfset variables.result = arrayOfStructuresToQuery(variables.result)>
			
			<cfreturn variables.result>
	</cffunction>
	

				
<!--- 		
	FORECASTAPP API can't find documentation for this just guessed based on looking at browser inspect

	https://api.forecastapp.com/milestones
	https://api.forecastapp.com/assignments
	https://api.forecastapp.com/whoami
	https://api.forecastapp.com/people
	https://api.forecastapp.com/projects
	https://api.forecastapp.com/user_connections
	https://api.forecastapp.com/clients
	https://api.forecastapp.com/people


	end_date=2016-06-19&start_date=2016-05-02
--->
	
	<cffunction name="forecast_api" hint="">
		
		<cfargument name="api_url" default="https://api.forecastapp.com/assignments">
		<cfargument name="api_event_type" default="assignments">
		<cfargument name="forecast_account_id" default="95989">
		<cfargument name="authorization" default="Bearer 14303.oeODZQ8hLibU5k0f6WbwpSGmjvg9bwVIkUxskcCrAe-SumqdncO78HgR5wC3ea9MYu3TjiMcG0X5VWenNko7pA">
			
		<cfhttp url="#arguments.api_url#"
				method="GET"
				result="result"		
		>

			<cfhttpparam name="forecast-account-id" type="header" value="#arguments.forecast_account_id#"> 	
			<cfhttpparam name="authorization" type="header" value="#arguments.authorization#"> 
			<!--- <cfhttpparam name="path" type="header" value="assignments?end_date=2016-05-15&start_date=2016-05-02&state=active"> 	 --->

		</cfhttp>
		
		
		<cfset variables.result = deserializeJSON(result.filecontent)>
		<cfset variables.result = arrayOfStructuresToQuery(result.milestones)>
		
		<cfreturn variables.result>
	</cffunction>
	
	<!--- <cffunction name="pivot_data" hint="">
		<cfargument name="query_data">
		<cfargument name="query_column_to pivot">
		
		<!--- Create Empty List --->
		<cfset item_types = "">

		<cfloop query="#arguments.query_data#">
			<cfset item_types = ListAppend(item_types, projects.type_name)>
		</cfloop>

		<cfset firstQuery = queryNew(item_types)>
		<cfset aRow = queryAddRow(firstQuery)>
		<cfloop query="projects">
			<cfset querySetCell(firstQuery,projects.type_name[currentrow],projects.value[currentrow],aRow)>
		</cfloop>
	
	</cffunction> --->
	
	<cffunction name="arrayOfStructuresToQuery" hint="">
		<cfargument name="theArray" required="true">
			<cfscript>
				var colNames = "";
				var theQuery = queryNew("");
				var i=0;
				var j=0;
				//if there's nothing in the array, return the empty query
				//WriteDump(arguments.theArray);
				if(NOT arrayLen(arguments.theArray))
					return theQuery;
				//get the column names into an array =	
				colNames = structKeyArray(arguments.theArray[1]);
				//build the query based on the colNames
				theQuery = queryNew(arrayToList(colNames));
				//add the right number of rows to the query
				queryAddRow(theQuery, arrayLen(arguments.theArray));
				//for each element in the array, loop through the columns, populating the query
				for(i=1; i LTE arrayLen(arguments.theArray); i=i+1){
					for(j=1; j LTE arrayLen(colNames); j=j+1){
						if (NOT IsNull(arguments.theArray[i][colNames[j]]))
							querySetCell(theQuery, colNames[j], arguments.theArray[i][colNames[j]], i);
						}
				}
				return theQuery;
			
			</cfscript>
	</cffunction>

	
	 
	<cffunction name="Directorylisting" returntype="query" output="true">
		<cfargument name="pathToparse" type="string" required="true" />
		<cfargument name="recurse" type="boolean" default="false" required="false" />
		<cfargument name="dirInfo" type="query" default="#queryNew('datelastmodified,name,size,type,directory,hidden,pathname,attributes')#">
			
			<cfset var thisFile = "" />
			<cfset var listFiles = "" />
			<cfset var theType = '' />
			<cfif Len(arguments.pathToparse)>
				<cfset listFiles =  createObject("java","java.io.File").init(Trim(arguments.pathToParse)).listFiles() />
				<cfset theDate = createObject("java","java.util.Date") />
				<cfset theDateFormat = createObject("java","java.text.SimpleDateFormat") />
				<cfloop from="1" to="#arraylen(listFiles)#" index="thisFile">
					<cfset queryAddRow(arguments.dirInfo)>
					<cfset querySetCell(arguments.dirInfo,"datelastmodified", theDateFormat.format(listFiles[thisFile].lastModified()))>
					<!--- <cfset querySetCell(arguments.dirInfo,"datelastmodified", listFiles[thisFile].lastModified() )> --->
					<cfset querySetCell(arguments.dirInfo,"name", listFiles[thisFile].getName() )>
					<cfset querySetCell(arguments.dirInfo,"size", Val( listFiles[thisFile].length() ) )>
					<cfset querySetCell(arguments.dirInfo,"directory", listFiles[thisFile].getParent() )>
					<cfset querySetCell(arguments.dirInfo,"hidden", listFiles[thisFile].isHidden() )>
					<cfset querySetCell(arguments.dirInfo,"pathname", listFiles[thisFile].getPath() )>
					<cfset querySetCell(arguments.dirInfo,"attributes", listFiles[thisFile].canWrite() )>
					<cfset theType = 'dir'>
					<cfif listFiles[thisFile].isFile()>
						<cfset theType = "file">
					</cfif>
					<cfset querySetCell(arguments.dirInfo,"type", theType )>
					<cfif arguments.recurse AND listFiles[thisFile].isDirectory() AND NOT listFiles[thisFile].isHidden()>
						<cfset arguments.dirInfo = Directorylisting( listFiles[thisFile].getPath(),true, arguments.dirInfo ) />
					</cfif>
				</cfloop>
				<cfquery name="dirInfo" dbtype="query">
					SELECT datelastmodified,name,size,type,directory,hidden,pathname,attributes
					FROM arguments.dirInfo
					ORDER BY Type ASC
				</cfquery>
			
			</cfif>
		<cfreturn dirInfo />
		
	</cffunction>
 
</cfcomponent>	