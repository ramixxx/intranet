<cfquery name="update_to_live" datasource="test">
	 UPDATE projects 
	 SET is_archived = 0
	 WHERE id = '#FORM.project_id#'
</cfquery>

<cflocation url="index.cfm" addtoken="false">
