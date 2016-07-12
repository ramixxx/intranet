<!--- <!--- OBJECTS!! --->
<cfset commonObj 	= createObject("component", "cfc.common")>	 --->


	<cfquery name="projects" datasource="test">
		SELECT * FROM projects 
		LEFT JOIN project_item_types_values ON projects.id = project_item_types_values.project_id
		LEFT JOIN project_item_types ON project_item_types.type_id = project_item_types_values.type_id
		WHERE projects.basecamp_id = #url.id#
		ORDER  BY project_item_types.type_id DESC
	</cfquery>


	<cfset item_types = "">

	<cfloop query="projects">
		<cfset item_types = ListAppend(item_types, projects.type_name)>
	</cfloop>
	<cfdump var="#item_types#">

	
	<cfset firstQuery = queryNew(item_types)>
	<cfset aRow = queryAddRow(firstQuery)>
	<cfloop query="projects">
		<cfset querySetCell(firstQuery,projects.type_name[currentrow],projects.value[currentrow],aRow)>
	</cfloop>

<cfdump var="#firstQuery#">

<!--- <cfset aRow = queryAddRow(firstQuery)>
<cfset querySetCell(firstQuery,"date","NOV_2011",aRow)>
<cfset querySetCell(firstQuery,"NumberofPeople","28",aRow)>
<cfset querySetCell(firstQuery,"EmploymentRate","56%",aRow)>

<cfset aRow = queryAddRow(firstQuery)>
<cfset querySetCell(firstQuery,"date","DEC_2011",aRow)>
<cfset querySetCell(firstQuery,"NumberofPeople","29",aRow)>
<cfset querySetCell(firstQuery,"EmploymentRate","55%",aRow)>

<cfset aRow = queryAddRow(firstQuery)>
<cfset querySetCell(firstQuery,"date","JAN_2012",aRow)>
<cfset querySetCell(firstQuery,"NumberofPeople","30",aRow)>
<cfset querySetCell(firstQuery,"EmploymentRate","52%",aRow)> --->

<!--- 

<!--- Will Create new query with names as column headers--->
<cfset newQuery = queryNew(valueList(firstQuery.date,','))> 

<!--- Will Create new query with names as column headers--->

<cfset people = queryAddRow(newQuery)>
<cfset rate = queryAddRow(newQuery)>

<cfloop query='firstQuery'>
    <!---Syntax for this function is: QuerySetCell(query, column_name, value [, row_number ]) --->
    <cfset querySetCell(newQuery,firstQuery.date,firstQuery.NumberofPeople,people)>
    <cfset querySetCell(newQuery,firstQuery.date,firstQuery.EmploymentRate,rate)>
</cfloop>

<cfdump var="#newQuery#">

<cfdump var="#ArrayToList(newQuery.getColumnNames())#"> ---> --->

<!--- <cfscript>
	function arrayOfStructuresToQuery(theArray){
		var colNames = "";
		var theQuery = queryNew("");
		var i=0;
		var j=0;
		//if there's nothing in the array, return the empty query
		if(NOT arrayLen(theArray))
			return theQuery;
		//get the column names into an array =	
		colNames = structKeyArray(theArray[1]);
		//build the query based on the colNames
		theQuery = queryNew(arrayToList(colNames));
		//add the right number of rows to the query
		queryAddRow(theQuery, arrayLen(theArray));
		//for each element in the array, loop through the columns, populating the query
		for(i=1; i LTE arrayLen(theArray); i=i+1){
			for(j=1; j LTE arrayLen(colNames); j=j+1){
				querySetCell(theQuery, colNames[j], theArray[i][colNames[j]], i);
			}
		}
		return theQuery;
	}
</cfscript>


		
		
		

<cfinclude template="/common/footer.cfm"> --->