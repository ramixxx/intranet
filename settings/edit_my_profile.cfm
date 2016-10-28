<!--- OBJECTS!! --->
<cfset commonObj 	= createObject("component", "cfc.common")>	

<cfquery name="getuserinfo" datasource="test">
	SELECT * FROM users 
	WHERE username = '#SESSION.user.username#'
	
</cfquery>

<cfinclude template="/common/header.cfm">


			
		            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2>Settings</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>
                        <li class="active">
                            <strong>Settings</strong>
                        </li>
                    </ol>
                </div>
            </div>
       <div class="wrapper wrapper-content  animated fadeInRight">
            <div class="row">
                <div class="col-md-12">
                    <div class="ibox">
                        <div class="ibox-content">
                     <div style="text-align:right;">
                                    <a class="btn btn-primary btn-xs" href="edit_my_profile.cfm">Edit my profile</a>
                                    <a class="btn btn-primary btn-xs" href="make_new_information_type.cfm">Make new information type</a>
                                </div>
                            <h2>Users</h2>
                          
                          <ul class="nav nav-tabs">
                            </ul>
                           
                            <div class="clients-list">
                            <ul class="nav nav-tabs">
                                 <cfform action="edit_my_profile_action.cfm" method="post" name="addnewinformationtype" preservedata="Yes" enctype="multipart/form-data">
                                    <cfoutput query="getuserinfo">
                                             <div class="col-md-2">
                                                <h4>Job title</h4> <input type="text" name="job_title" value="#job_title#" class="form-control">
                                            </div>

                                            <div class="col-md-2">
                                                <h4>Title</h4>
                                                <select NAME="title" value="#title#" class="form-control">
                                                 
                                                
                                                 <option value="Mr">Mr</option>
                                                 <option value="Mr">Miss</option>
                                                 </select>
                                            </div>
                                            <div class="col-md-2">
                                                <h4>First name</h4><input type="text" name="first_name" value="#first_name#" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Last name</h4><input type="text" name="last_name" value="#last_name#" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Email</h4>  <input type="text" name="email" value="#email#" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                               <h4>Phone extension</h4><input type="text" name="ext_no" value="#ext_no#" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Mobile number</h4><input type="text" name="mobile_no" value="#mobile_no#" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Sex</h4> <select NAME="sex" value="#sex#" class="form-control">
                                                
                                                
                                                 <option value="Male">Male</option>
                                                 <option value="Female">Female</option>
                                                 </select>
                                            </div>
                                             <div class="col-md-2">
                                                <h4>Active user?</h4> <select NAME="active" value="#active#" class="form-control">
                                                
                                                <option value="1">Active</option>
                                                 <option value="0">Inactive</option>
                                                 
                                                 </select>
                                            </div>
                                            <div class="col-md-2">
                                               <h4>Basecamp_user_id</h4><input type="text" name="basecamp_user_id" value="#basecamp_user_id#" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                               <h4>Username</h4><input type="text" name="username" value="#username#" class="form-control">
                                            </div>
                                            <div class="col-md-2" >
                                                <h4>Upload public image</h4>
                                                                    <label class="file">
                                                                        <input type="file" name="fileUpload"  class="form-control" fileField="fileUpload" id="fileUpload">
                                                                        <span class="file-custom"></span>
                                                                    </label>
                                            </div>
                                            </cfoutput>
                                    <div class="col-md-12">
                                      <div style="margin-top:20px; margin-bottom:20px; text-align:center;"><input type="submit" value="Submit" name="submit" class="btn btn-primary"></div>
                                    </div>
                                </cfform>
                            </ul>
                            <div class="tab-content">
                                
                            </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
               <!---  10GB of <strong>250GB</strong> Free. --->
            </div>
            <div>
               <!---  <strong>Copyright</strong> Example Company &copy; 2014-2015 --->
            </div>
        </div>

        </div>
        </div>

<cfscript>
	function arrayOfStructuresToQuery(theArray){
		var colNames = "";
		var theQuery = queryNew("");
		var i=0;
		var j=0;
		//if there's nothing in the array, return the empty query
		if(NOT arrayLen(theArray))
			return theQuery;
		//get the column names into an array =	
		colNames = structKeyArray(theArray[1]);
		//build the query based on the colNames
		theQuery = queryNew(arrayToList(colNames));
		//add the right number of rows to the query
		queryAddRow(theQuery, arrayLen(theArray));
		//for each element in the array, loop through the columns, populating the query
		for(i=1; i LTE arrayLen(theArray); i=i+1){
			for(j=1; j LTE arrayLen(colNames); j=j+1){
				querySetCell(theQuery, colNames[j], theArray[i][colNames[j]], i);
			}
		}
		return theQuery;
	}
</cfscript>


		
		
		

<cfinclude template="/common/footer.cfm">