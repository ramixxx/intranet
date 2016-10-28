

<cfquery datasource="test" name="getuserid">
    SELECT user_id  FROM users
    ORDER BY user_id DESC
    LIMIT 1
</cfquery>

<cfoutput query="getuserid">
<cfset type_if_plus_one = '#user_id#' + '1'>
</cfoutput>



<cfquery name="createnewuser" datasource="test">
	 INSERT INTO users (job_title,title,first_name,last_name,email,ext_no,mobile_no,sex,active,basecamp_user_id,username,fileUpload)
	 VALUES ( 
	 		  '#FORM.job_title#' 
		 	 ,'#FORM.title#'
		 	 ,'#FORM.first_name#'	
		 	 ,'#FORM.last_name#'
		 	 ,'#FORM.email#'
		 	 ,'#FORM.ext_no#'
		 	 ,'#FORM.mobile_no#'
		 	 ,'#FORM.sex#'
		 	 ,'#FORM.active#'
		 	 ,'#FORM.basecamp_user_id#'
		 	 ,'#FORM.username#'
		 	 ,'#type_if_plus_one#.png'
	 		)
</cfquery>

<cfoutput query="getuserid">
   <cffile action="upload"
        destination="C:\inetpub\wwwroot\intranet\img\user_images\#type_if_plus_one#.png"
        nameConflict="overwrite"
        fileField="fileUpload"
        accept = "*" >
</cfoutput>     

<cflocation url="/users" addtoken="false">