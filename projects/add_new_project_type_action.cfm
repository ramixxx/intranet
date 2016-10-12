<cfquery name="addprojecturl" datasource="test">
	 INSERT INTO project_item_types_values (type_id,project_id,value,active)
	 VALUES (
	 		'#Form.type_id#'	
	 	,	'#form.project_id#'
	 	,	'#Form.value#'
	 	,	'#Form.active#' 	
	 		)
</cfquery>

<cflocation url="index.cfm" addtoken="false">
