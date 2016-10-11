<!--- OBJECTS!! --->
<cfset commonObj 	= createObject("component", "cfc.common")>	

        <cfquery name="projecttypenew" datasource="test">
                                            SELECT type_id,type_description FROM project_item_types
                                            
                                        </cfquery>

                                    


<cfinclude template="/common/header.cfm">


        <div class="row border-bottom">

        </div>
		            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2>New url</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li class="active">
                            <strong>New url</strong>
                        </li>
                    </ol>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Add new url</h5>
                            <div class="ibox-tools">
                               <!---  <a href="" class="btn btn-primary btn-xs">Create new project</a> --->
                            </div>
                        </div>
                        <form action="add_new_project_type_action.cfm" method="post"  enctype="multipart/form-data"> 
                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
                                            <cfoutput>
                                              <input type="hidden" class="form-control" style="width:40%" name="project_id" value="#url.project_id#" >
                                            </cfoutput>
                                            <div class="col-md-1">
                                                <h4 style="padding-left:20px;">Project url</h4>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" name="value" 
                                                message="SSL Expiry date must be filled in"
                                                size="30" class="form-control" id="value" style="width:100%">
                                            </div>

                                            <div class="col-md-1">
                                                <h4>Type</h4>
                                            </div>
                                            <div class="col-md-3">
                                                <SELECT SIZE="1" NAME="type_id" class="form-control" id="type_id" style="width:100%">
                                                <cfloop query="projecttypenew">
                                                    <cfoutput>
                                                        <OPTION VALUE="#type_id#">#type_description#</OPTION>
                                                    </cfoutput>
                                                </cfloop>
                                                </SELECT>
                                            </div>
   
                                           <div style="text-align:center;">
                                            <div class="col-md-2">
                                                <label><input type="radio" name='active' value='0'>Inactive</label></br>

                                                <label><input type="radio" name='active' value='1'>Active</label>
                                            </div>
                                            </div>
                                            <div class="col-md-1">
                                                <input type="submit" value="Submit" name="submit" class="btn btn-primary">
                                            </div>
                            </form>        
                                </div>                                  
                            </div> 



                     


                                
                         
	
                                  
                          
                            