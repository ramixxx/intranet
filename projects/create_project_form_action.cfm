<cfquery name="addnewproject" datasource="test">
	 INSERT INTO projects (project_name,basecamp_id,is_active)
	 VALUES (
	 		'#Form.project_name#'	
	 	,	'#form.basecamp_id#'
	 	,	'#Form.project_active_inactive#'	
	 		)
</cfquery>

<cflocation url="index.cfm" addtoken="false">
