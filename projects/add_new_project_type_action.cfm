<cfquery name="addprojecturl" datasource="test">
	 INSERT INTO project_item_types_values (type_id,project_id,value,active,show_in_view)
	 VALUES (
	 		'#Form.type_id#'	
	 	,	'#form.project_id#'
	 	,	'#Form.value#'
	 	,	'#Form.active#'
	 	,	'#Form.show_in_view#' 	
	 		)
</cfquery>

<cflocation url="index.cfm" addtoken="false">
