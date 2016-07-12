<cfset logout = StructClear(session)>
<cflocation url="/login/" addtoken="no">