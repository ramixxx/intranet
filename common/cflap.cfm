<!--- <cfparam name="logindomain" default="thoughtbubble">  
<cfparam name="ldapServer" default="10.0.0.86">  
<cfparam name="dcStart" default="DC=thoughtbubble.com">    
 
 <cfldap	action="QUERY"          
			name="auth"          
			attributes="samAccountName"          
			start="DC=thoughtbubble.com"                       
			server="10.0.0.86"          
			username="thoughtbubble\mitch"> --->
<!---  --->   
			  
  
<cfldap action="query" 
		server="10.0.0.86" 
		name="Results" 
		start="DC=thoughtbubble,DC=com"
		filter="(&(objectclass=user))"
		username="thoughtbubble\wasabi" 
		password="keyboardmouse" 
		attributes = "userPrincipalName,mail,SamAccountname"
>
		   

		   
<cfdump var="#results#">