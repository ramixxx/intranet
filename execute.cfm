<cfexecute 
	name = "C:\Windows\system32\cmd.exe" 
    arguments = "wmic logicaldisk get size,freespace,caption"  
    timeout = "0"
    variable = "hddstatus"> 
</cfexecute>

<cfdump var="#hddstatus#">
