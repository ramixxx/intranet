<!--- OBJECTS!! --->
<cfset commonObj 	= createObject("component", "cfc.common")>	

<!--- <cfquery name="projects" datasource="test">
	SELECT * FROM projects 
	INNER JOIN project_item_types ON projects.id = project_item_types.project_id
</cfquery> --->
<!--- <cfdump var="#projects#"> --->

<cfinclude template="/common/header.cfm">

        <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
		</div>


	 <div class="row wrapper border-bottom white-bg page-heading">

<!--- 
<cfoutput query="projects" group="id">
	Project Name:#project_name# <cfoutput>#type_name# -- #value#<br></cfoutput>
</cfoutput>


<cfset project = commonObj.forecast_api(api_url='https://api.forecastapp.com/milestones?end_date=2016-08-5&start_date=2016-05-02'
										,forecast_account_id='95989'
										,authorization='Bearer 14303.oeODZQ8hLibU5k0f6WbwpSGmjvg9bwVIkUxskcCrAe-SumqdncO78HgR5wC3ea9MYu3TjiMcG0X5VWenNko7pA')>
		
 <cfdump var="#project#">  --->

 
 <cfset project = commonObj.basecamp_api(api_url='https://basecamp.com/2544469/api/v1/projects.json'
										,username=''
										,password='')>
 
 <cfdump var="#project#"> 
    <!---    </div>
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2015
            </div>
        </div> --->

        </div>
        </div>

<cfinclude template="/common/footer.cfm">