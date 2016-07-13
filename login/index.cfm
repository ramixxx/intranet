<cfparam name="message" default="">
<cfparam name="form.submit" default="">
<cfset commonObj 	= createObject("component", "cfc.common")>
<cfif form.submit NEQ ''>
	<cfset login = commonObj.ldap_login(ldap_server="10.0.0.86",domain="thoughtbubble",user=form.user,password=form.password)>
	
	<cfif LEN(variables.login)>
		<cfdump var="#session#">
		<cfset session.username = variables.login.SamAccountname>
		<cfset SESSION.User.logged_in = "true"> 
		<cfdump var="#session#">
		<cflocation url="/projects/" addtoken="no"> 
	<cfelse>
		<cfset message = "No User Found Please try again. Please log in with your system login details.">
	</cfif>
</cfif> 

<!--- <cfdump var="#session#"> --->
<!--- <cfcontent type="text/html; charset=utf-8" reset="true" /> --->
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Thoughtbubble Intranet | Login</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">TB</h1>

            </div>
            <h3>Welcome to Thoughtbubble INTRANET</h3>
            <p>
            </p>
            <p>Login</p>
            <form class="m-t" role="form" method="post" action="index.cfm">
			<cfif LEN(message)>
				<cfoutput>
					<span class="label label-danger ">#message#</span>
					<br> <br>
				</cfoutput>
			</cfif>
				<div class="form-group">
                    <input type="user" name="user" class="form-control" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required="">
                </div>
                <input type="submit" name="submit" class="btn btn-primary block full-width m-b">

            </form>
          
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="/js/jquery-2.1.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>

</body>

</html>