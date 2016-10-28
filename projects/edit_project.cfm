<!--- OBJECTS!! --->
<cfset commonObj    = createObject("component", "cfc.common")>  



<cfquery name="projects" datasource="test">
    SELECT * FROM projects 
    WHERE is_active = 1
    AND is_archived = 0
    AND id = #project_id#
    <!--- LEFT JOIN project_item_types ON projects.id = project_item_types.project_id
    WHERE type_id IN (1,3,4,5,6) --->
</cfquery>

<cfinclude template="/common/header.cfm">


       
                    
                                        <cfquery name="projects_items" datasource="test">
                                            SELECT * FROM projects 
                                            LEFT JOIN project_item_types_values ON projects.id = project_item_types_values.project_id
                                            LEFT JOIN project_item_types ON project_item_types.type_id = project_item_types_values.type_id
                                            WHERE project_item_types_values.show_in_view = 1
                                            AND projects.id = #projects.id#
                                            ORDER  BY project_item_types.type_id DESC
                                        </cfquery>

                    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2>Project list</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>

                        <li>
                            <a href="/projects">Project list</a>
                        </li>

                         <li class="active">
                           <strong><cfoutput>Edit - #projects.project_name#</cfoutput></strong>
                        </li>
                    </ol>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <cfoutput><h5>Edit - #projects.project_name#</h5></cfoutput>
                            <div class="ibox-tools">
                               <!---  <a href="" class="btn btn-primary btn-xs">Create new project</a> --->
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
                                <div class="col-md-1">
                               <!---      <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" ><i class="fa fa-refresh"></i> Refresh</button> --->
                                </div>
                                <div class="col-md-11">
                                   <!---  <div class="input-group"><input type="text" placeholder="Search" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> Go!</button> </span></div>
                                </div> --->
                            </div>
<!--- <cfdump var="#test#"> --->
                            <div class="project-list">

                                <table class="table table-hover table-striped">
                                    <tbody>

                                              <!-- Trigger the modal with a button -->

														

<cfoutput>
	<div style="text-align:right;">
														<form action="delete_project.cfm" style="margin-bottom:0px" method="Post">
															<input type="hidden" value="#project_id#" name="project_id">
															<input type="submit" value="Delete project" name="submit" class="btn btn-danger btn-sm pull-right">
														</form>

														<form action="is_archived.cfm" style="margin-bottom:0px" method="Post">
															<input type="hidden" value="#project_id#" name="project_id">
															<input type="submit" style="margin-right:5px;" value="Put to archived projects" name="submit" class="btn btn-danger btn-sm pull-right">
														</form>

														<a href="add_new_project_type.cfm?project_id=#projects.id#" style="margin-right:5px;" class="btn btn-white btn-sm">Add new information type</a>
	</div>													

</cfoutput>
                                                    </div>
                                                   
                                                  </div>
                                                  
                                                </div>
                                              </div>
                                              
                                            

                                        </td>
  
                                    </tr>
                                 

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        
        
        

<cfinclude template="/common/footer.cfm">
                                       

                           















