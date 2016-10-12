<cfquery name="addprojecturl" datasource="test">
	 DELETE FROM projects 
	 WHERE id = #id#
</cfquery>

<cflocation url="index.cfm" addtoken="false">
