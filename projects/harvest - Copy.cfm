<!---  <cfset commonObj 	= createObject("component", "cfc.common")> --->

<!---  <cfhttp url="https://api.forecastapp.com/assignments?end_date=2016-05-06&start_date=2016-05-02"
					method="GET"
					result="topics"		
			>
			
		<cfhttpparam name="forecast-account-id" type="header" value="95989"> 	
		<cfhttpparam name="authorization" type="header" value="Bearer 14303.oeODZQ8hLibU5k0f6WbwpSGmjvg9bwVIkUxskcCrAe-SumqdncO78HgR5wC3ea9MYu3TjiMcG0X5VWenNko7pA"> 
		<cfhttpparam name="path" type="header" value="assignments?end_date=2016-05-15&start_date=2016-05-02&state=active"> 	
		
</cfhttp>  --->
			
<!--- 		<cfset result = deserializeJSON(topics.filecontent)>
			<cfdump var="#result#"> --->
<!--- 			<cfset test = commonObj.arrayOfStructuresToQuery(result.assignments)> 
			
			<cfdump var="#test#">  --->
		
		
<!--- 		
		FORECASTAPP API can't find documentation for this just guessed based on looking at browser inspect
		
		https://api.forecastapp.com/milestones
		https://api.forecastapp.com/assignments


	end_date=2016-06-19&start_date=2016-05-02

--->



<!--- <cfquery name="sqllite" datasource="test">
SELECT test.id, test.name, test_2.forecast_id

FROM test 
INNER JOIN test_2 ON test.id = test_2.id
order by test.id
</cfquery> --->

<!--- <cfdump var="#sqllite#"> --->

	<!--- 		<cfhttp url="https://basecamp.com/2544469/api/v1/calendars.json"
					method="GET"
					username="mitch.e@thoughtbubble.com"
					password="radic6basecamp"
					result="project_result"
			>
			
			<cfset result = deserializeJSON(project_result.filecontent)>
			<!--- <cfset project = arrayOfStructuresToQuery(result)> --->
			
		 --->

		<!--- OBJECTS!! --->
		<cfset commonObj 	= createObject("component", "cfc.common")>
<!--- 		<cfset project = commonObj.arrayOfStructuresToQuery(result)>
		<cfdump var="#project#"> --->
		
<!--- 		<cfset basecamp_project = commonObj.basecamp_api(api_url='https://basecamp.com/2544469/api/v1/projects.json'
												,username='mitch.e@thoughtbubble.com'
												,password='radic6basecamp')
		> --->
		
		
		<cfset project = commonObj.forecast_api(api_url='https://api.forecastapp.com/assignments?end_date=2016-05-5&start_date=2016-05-02'
												,forecast_account_id='95989'
												,authorization='Bearer 14303.oeODZQ8hLibU5k0f6WbwpSGmjvg9bwVIkUxskcCrAe-SumqdncO78HgR5wC3ea9MYu3TjiMcG0X5VWenNko7pA')>
		
		<cfdump var="#project#">
		
		
		
		
