<!--- OBJECTS!! --->
<!--- <cfset commonObj 	= createObject("component", "cfc.common")>	 --->

<!--- <cfscript>
	ourDirectory = "C:\inetpub\wwwroot\in";
	directoryList = createObject("java","java.io.File").init(ourDirectory).list();
</cfscript>

<cfdump var="#directoryList#">
 --->

<Cfsetting requesttimeout="200">
<cfscript>

currentDirectory = "C:\inetpub\wwwroot\in";

function dirList(path) {
    return createObject("java","java.io.File").init(Trim(path)).list();
}

ftime = gettickcount();
    mylist = dirList(currentDirectory);
ftime = gettickcount() - ftime;

nfTime = gettickcount();
    nfList = createObject("java","java.io.File").init(Trim(currentDirectory)).list();
nfTime = getTickcount() - nfTime;
</cfscript>
<!--- Use CFDirectory as a baseline for comparison --->
<cfset tm = getTickcount()/>
    <cfdirectory action="list" directory="#currentDirectory#" name="test" listinfo="name">
<cfset dirTime = getTickcount() - tm/>
<cfoutput>
<h4>#ftime# milliseconds for java using a function</h4>
<h4>#nftime# for Java outside of function</h4>
<h4>#dirTime# for CF</h4></cfoutput>