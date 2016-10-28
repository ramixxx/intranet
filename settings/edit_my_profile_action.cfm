<cfparam name="FORM.fileUpload" default="">

<cfquery datasource="test" name="getuseridforimage">
    SELECT user_id  FROM users
    WHERE username = '#SESSION.user.username#'
</cfquery>

<cfif form.fileUpload neq ''>
<cfoutput query="getuseridforimage">
<cfquery name="edituser" datasource="test">
	 UPDATE users
	 SET 
	 		  job_title = '#FORM.job_title#' 
		 	 ,title = '#FORM.title#'
		 	 ,first_name = '#FORM.first_name#'	
		 	 ,last_name = '#FORM.last_name#'
		 	 ,email = '#FORM.email#'
		 	 ,ext_no = '#FORM.ext_no#'
		 	 ,mobile_no = '#FORM.mobile_no#'
		 	 ,sex = '#FORM.sex#'
		 	 ,active = '#FORM.active#'
		 	 ,basecamp_user_id = '#FORM.basecamp_user_id#'
		 	 ,username = '#FORM.username#'
		 	 ,fileUpload = '#user_id#.png'
		WHERE username = '#SESSION.user.username#'
	 		


</cfquery>
</cfoutput>
		
	<cfoutput query="getuseridforimage">

		   		<cffile action="upload"
		        destination="C:\inetpub\wwwroot\intranet\img\user_images\#user_id#.png"
		        nameConflict="overwrite"
		        fileField="fileUpload"
		        accept = "*" >
		
</cfoutput>     

<cfelse>

<cfoutput query="getuseridforimage">
<cfquery name="edituser" datasource="test">
	 UPDATE users
	 SET 
	 		  job_title = '#FORM.job_title#' 
		 	 ,title = '#FORM.title#'
		 	 ,first_name = '#FORM.first_name#'	
		 	 ,last_name = '#FORM.last_name#'
		 	 ,email = '#FORM.email#'
		 	 ,ext_no = '#FORM.ext_no#'
		 	 ,mobile_no = '#FORM.mobile_no#'
		 	 ,sex = '#FORM.sex#'
		 	 ,active = '#FORM.active#'
		 	 ,basecamp_user_id = '#FORM.basecamp_user_id#'
		 	 ,username = '#FORM.username#'
		 	 ,fileUpload = '#user_id#.png'
		WHERE username = '#SESSION.user.username#'
	 		
</cfquery>
</cfoutput>
   
</cfif>



<cflocation url="/users" addtoken="false">