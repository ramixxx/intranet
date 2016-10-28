<cfquery name="addnewproject" datasource="test">
	 INSERT INTO projects (project_name,basecamp_id,is_active,is_archived)
	 VALUES (
	 		'#Form.project_name#'	
	 	,	'#form.basecamp_id#'
	 	,	'#Form.project_active_inactive#'	
	 	,	0
	 		)
</cfquery>

<cflocation url="index.cfm" addtoken="false">
