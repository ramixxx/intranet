<!--- OBJECTS!! --->


    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<cfinclude template="/common/header.cfm">

<cfquery datasource="test" name="selectid">
    SELECT id FROM project_item_types
    ORDER BY id DESC
    LIMIT 1
</cfquery>

<cfquery name="gettypegroup" datasource="test">
    SELECT type_group, type_description FROM project_item_types
</cfquery>

            
                    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2>Settings</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>
                         <li>
                            <a href="/settings">Settings</a>
                        </li>
                        <li class="active">
                            <strong>Add new information type</strong>
                        </li>
                    </ol>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Add new information type</h5>
                            <div class="ibox-tools">
                               <!---  <a href="" class="btn btn-primary btn-xs">Create new project</a> --->
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
                                <cfoutput query="selectid">
                                    <input type="hidden" name="#id#" value="#id#" >
                                </cfoutput>

                                <cfform action="make_new_information_type_action.cfm" method="post" name="addnewinformationtype" preservedata="Yes" enctype="multipart/form-data">
                                         
                                    <div class="col-md-3">
                                        <label style="text-align:center">Information type name</label>
                                        <input  name="information_type_name" class="form-control" style="width:80%">
                                    </div>
                                     <div class="col-md-3">
                                        <label style="text-align:center">Information type description</label>
                                        <input  name="information_type_description" class="form-control" style="width:80%">
                                    </div>
                                    <div class="col-md-3">
                                        <label style="text-align:center">Select type group</label>
                                        <select NAME="type_group" class="form-control" style="width:50%" id="resolutionid"> <!---  onchange="whichLocal(this.form)">--->
                                         <option>Select type group</option>
                                         <!-- <!--- again, use the group attribute to group output by category --->  -->
                                         <cfoutput query="gettypegroup" > 
                                         <option value="#type_group#">#type_description#</option>
                                         </cfoutput> 
                                       </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Upload image for information type</label>
                                        <label class="file">
                                            <input type="file" name="fileUpload" class="form-control" fileField="fileUpload" id="fileUpload">
                                            <span class="file-custom"></span>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                      <div style="margin-top:20px; text-align:center;"><input type="submit" value="Submit" name="submit" class="btn btn-primary"></div>
                                    </div>
                                </cfform>
                            <div class="project-list">

                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
                10GB of <strong>250GB</strong> Free.
            </div>
            <div>
               <!---  <strong>Copyright</strong> Example Company &copy; 2014-2015 --->
            </div>
        </div>

        </div>
        </div>



        
        
        

<cfinclude template="/common/footer.cfm">
