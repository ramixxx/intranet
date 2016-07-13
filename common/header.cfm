<cfparam name="SESSION.User.logged_in" default="false">



<cfif SESSION.User.logged_in NEQ 'true'>
	<!---  <cflocation url="/login/" addtoken="no"> --->
</cfif>

<cfcontent type="text/html; charset=utf-8" reset="true" />
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>TB Intranet</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

</head>

<body class="">

    <div id="wrapper">
	<!--- <cfdump var="#session#" label="session"> --->
	<cfinclude template="_nav.cfm">
