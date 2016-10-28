<cfquery name="update_to_archived" datasource="test">
	 UPDATE projects 
	 SET is_archived = 1
	 WHERE id = '#FORM.project_id#'
</cfquery>

<cflocation url="index.cfm" addtoken="false">
