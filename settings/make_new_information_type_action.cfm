
<cfquery datasource="test" name="gettypeid">
    SELECT type_id FROM project_item_types
    ORDER BY type_id DESC
    LIMIT 1
</cfquery>

<cfquery name="getnumberoutput" datasource="test">
	SELECT id FROM project_item_types
    ORDER BY id DESC
    LIMIT 1
</cfquery>

<cfoutput query="gettypeid">
<cfquery name="addnewinformationtype" datasource="test">
	 INSERT INTO project_item_types (type_id,type_name,type_description,type_group)
	 VALUES ('#type_id#' + 1
	 	 ,'#Form.information_type_name#'
	 	 ,'#Form.information_type_description#'	
	 	 ,'#Form.type_group#'
	 		
	 		
	 		)
</cfquery>
</cfoutput> 

<cfoutput query="getnumberoutput">
   <cffile action="upload"
        destination="C:\inetpub\wwwroot\intranet\img\project_item_types\#id#.png"
        nameConflict="overwrite"
        fileField="fileUpload"
        accept = "*" >
</cfoutput>     

<cflocation url="index.cfm" addtoken="false">

