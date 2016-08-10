<!--- 
	Project: Intranet 2016
	File: data.cfc
	Author: Mitch, Thoughtbubble Ltd.
	Created: 03 May 2016
--->
<cfcomponent displayName="user" hint="user Functions" output="false">

	<cffunction name="all_users" returntype="any" hint="query returns all users">
		<cfquery name="qryUser" datasource="#application.DSN#">
			SELECT user_id, basecamp_user_id, username, email, title, first_name, last_name
			, sex, active, access_level_id, ext_no, mobile_no
			FROM users
			ORDER BY user_id desc
		</cfquery>
		<cfreturn qryUser>
	</cffunction>

	<cffunction name="all_users_by_access_level" returntype="any" hint="returns all users but filters by access_level">
		<cfquery name="qryUser" datasource="#application.DSN#">
			SELECT user_id, basecamp_user_id, username, email, title, first_name, last_name
			, sex, active, access_level_id, ext_no, mobile_no
			FROM users
			WHERE user_access_level <= 3 
			ORDER BY user_id desc
		</cfquery>
		<cfreturn qryUser>
	</cffunction>
</cfcomponent>	