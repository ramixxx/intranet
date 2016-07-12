<!--- OBJECTS!! --->
<cfset commonObj 	= createObject("component", "cfc.common")>	

		<cfhttp url="https://api.newrelic.com/v2/applications.json"
					method="GET"
					result="result"	
			>
			<cfhttpparam name="X-Api-Key" type="header" value="27fdc0092ba80730e763a3a14a626dc4"> 
		</cfhttp>

		<cfdump var="#result#">
		
		
		<cfset variables.result = deserializeJSON(result.filecontent)>
		<cfdump var="#variables.result#">
		<cfset variables.result = commonObj.arrayOfStructuresToQuery(variables.result)>
		<cfdump var="#variables.result#">