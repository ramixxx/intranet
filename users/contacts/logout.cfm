<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        LET EVERYONE KNOW THAT THIS USER LOGGED OUT
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfset Application.MessageLog = "<font color=red><b>#session.MyUserName# Logged Out at #DateFormat(now())# #TimeFormat(now())#</b></font><br>" & Application.MessageLog>
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        TAKE USER OUT OF THE LIST OF LOGGED IN USERS
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cfset Application.UserList = ListDeleteAt(Application.UserList, ListFindNoCase(Application.UserList, session.MyUsername, "#chr(9)#"), "#chr(9)#")>
<!--- ^^^^^^^^^^^^^
         LOG THE USER OUT
        ^^^^^^^^^^^^^ --->
<cfset session.MyUsername = "">
<cfset session.goodUser	= "No">
<!--- ^^^^^^^^^^^^^^^^^^^^^^^^^
        TAKE USER BACK TO THE LOGIN PAGE
        ^^^^^^^^^^^^^^^^^^^^^^^^^ --->
<cflocation url="index.cfm" addtoken="Yes">