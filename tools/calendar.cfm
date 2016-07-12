https://calendar.google.com/calendar/render?action=TEMPLATE&text=Hello_IAN&dates=20160525T090000/20160525T110000&ctz=America/New_York&details=HI%0A&location=Location+of+the+event&pli=1&uid&sf=true&output=xml


	<cffunction name="google_calendar" hint="">
		<cfargument name="calendar_url" default="https://calendar.google.com/calendar/render?action=TEMPLATE&">
		<cfargument name="title" required="true">
		<cfargument name="date_to" required="true">
		<cfargument name="date_form" required="true">
		<cfargument name="timezone" required="true">
		<cfargument name="description" required="true">
		<cfargument name="event_location" required="true">
		
		<cfset title = URLEncodedFormat(arguments.title)>
		<cfset date_to_from = DateFormat(arguments.date_from,"yyyymmdd") & "T" & TimeFormat(arguments.date_to, "HHmmss")>
		<cfset timezone = arguments.timezone>
		<cfset description = URLEncodedFormat(arguments.description)>
		<cfset event_location = URLEncodedFormat(arguments.event_location)>
		
		<cfset url = arguments.calendar_url & 'text=' title & '&dates=' & date_from & '/' & date_to & '&ctz=' timezone & '&details=' description & '&location=' & event_location & '&pli=1&uid&sf=true&output=xml'>
		
		<cfreturn url>
		
	</cffunction>