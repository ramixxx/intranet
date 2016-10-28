<cfquery name="addprojecturl" datasource="test">
	 DELETE FROM projects 
	 WHERE id = '#FORM.project_id#'
</cfquery>

<cflocation url="index.cfm" addtoken="false">
