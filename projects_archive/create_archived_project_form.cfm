<!--- OBJECTS!! --->


    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<cfinclude template="/common/header.cfm">


				

			
		            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2>Project list</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li class="active">
                            <strong>Project list</strong>
                        </li>
                    </ol>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Add new project</h5>
                            <div class="ibox-tools">
                               <!---  <a href="" class="btn btn-primary btn-xs">Create new project</a> --->
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
	                            <form action="create_archived_project_form_action.cfm" method="Post">
	                                <div class="col-md-3">
	                                	<label style="text-align:center">Project Name</label>
	                               		<input  name="project_name" class="form-control" style="width:80%">
	                                </div>
	                                
	                                <div class="col-md-3">
	                                  <label style="text-align:left">Basecamp ID</label>
	                               		<input  name="basecamp_id" class="form-control" style="width:80%">
	                            	</div>

	                            	<div class="col-md-3">
	                                  <label><input type="radio" name='project_active_inactive' value='0'>Inactive</label></br>
									  <label><input type="radio" name='project_active_inactive' value='1'>Active</label>
	                            	</div>

	                              	<div class="col-md-3">
	                                  <div style="margin-top:20px;"><input type="submit" value="Submit" name="submit" class="btn btn-primary"></div>
	                            	</div>
	                            </form>
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