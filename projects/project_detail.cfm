<!--- OBJECTS!! --->
<cfset commonObj 	= createObject("component", "cfc.common")>	


	<cfquery name="projects_items" datasource="test">
		SELECT * FROM projects 
		LEFT JOIN project_item_types_values ON projects.id = project_item_types_values.project_id
		LEFT JOIN project_item_types ON project_item_types.type_id = project_item_types_values.type_id
		WHERE projects.basecamp_id = #url.id#
		ORDER  BY project_item_types.type_group DESC
	</cfquery>
	
	
	<cfquery name="projects_item_details" datasource="test">
		SELECT * FROM projects 
		LEFT JOIN project_item_types_values ON projects.id = project_item_types_values.project_id
		LEFT JOIN project_item_types ON project_item_types.type_id = project_item_types_values.type_id
		WHERE project_item_types.type_id IN (1,2,3,4,5,6,8,9)
		AND projects.basecamp_id = #url.id#
		ORDER  BY project_item_types.type_id DESC
	</cfquery>
	
	
	<cfset url_image = '/img/webs/ae3.int.thoughtbubble.net.jpg'>
	
	<cfset item_types = "">

	<cfloop query="projects_items">
		<cfset item_types = ListAppend(item_types, projects_items.type_name)>
	</cfloop>
	 

	
<!--- 		<cfset firstQuery = queryNew(item_types)>
		<cfset aRow = queryAddRow(firstQuery)>
		<cfloop query="projects_items">
			<cfset querySetCell(firstQuery,projects_items.type_name[currentrow],projects_items.value[currentrow],aRow)>
		</cfloop> --->


<cfinclude template="/common/header.cfm">

        <div class="row border-bottom">
 
        </div>
		<cfhttp url="https://basecamp.com/2544469/api/v1/projects/#URL.id#/topics.json"
					method="GET"
					username="mitch.e@thoughtbubble.com"
					password="radic6basecamp"
					result="topics"
					
			>
			
			<cfset result = deserializeJSON(topics.filecontent)>
			<cfset test = arrayOfStructuresToQuery(result)>

				
		  <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h2>Project detail:</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">Home</a>
                        </li>
						 <li>
                             <a href="/projects/index.cfm">Project list</a>
                        </li>
						
                        <li class="active">
                            <strong>Project detail</strong>
                        </li>
                    </ol>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-9">
                <div class="wrapper wrapper-content animated fadeInUp">
                    <div class="ibox">
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="m-b-md">
                                        <cfoutput><a href="https://basecamp.com/2544469/projects/#url.id#" class="btn btn-white btn-xs pull-right">View In Basecamp</a>
                                        <h2> #projects_items.project_name#</h2>
										</cfoutput>
                                    </div>
                                    <dl class="dl-horizontal">
                                        <dt>Status:</dt> <dd><span class="label label-primary">Active</span></dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5">
								<dl class="dl-horizontal">
									<cfset group_counter = 0>
									<cfoutput query="projects_items" group="type_group"> 
										<cfset group_counter = group_counter + 1>
										
										<!--- #group_counter# --->
										
										<cfoutput>
											<dt>#type_description#</dt>
											<dd><!--- #LISTFIND(projects_items.type_group, '2')# --->
											<cfif projects_items.type_group EQ 2 OR projects_items.type_group EQ 3 OR projects_items.type_group EQ 4>
												<a href="#value#" target="_blank"">#value#</a>
											<cfelse>
												#value# 	
											</cfif>
											</dd>										
										</cfoutput>
									
										 <hr>
									</cfoutput>
								</dl>
                                </div>
                                <div class="col-lg-7" id="cluster_info">
                                   <!---  <dl class="dl-horizontal" >
                                        <dt>URLs:</dt>
										<dd class="project-people">
										<cfloop query="projects_item_details">
											<cfoutput>
												
												<cfif projects_item_details.type_id EQ 2>
														<button class="copy_to img-circle" style="border: 0; background: transparent" data-clipboard-text="#value#">
															<img alt="image" class="img-circle" src="/img/project_item_types/#projects_item_details.type_id#.png">
														</button>
												<cfelse>
													<a href="#value#">
														<img alt="image" class="img-circle" src="/img/project_item_types/#projects_item_details.type_id#.png">
													</a>
												</cfif>
												
											</cfoutput>
										</cfloop>
                                          </dd>
										<hr>
										<dt>Code Location:</dt> 		<dd><cfoutput>\\#firstQuery.server_name##firstQuery.code_location#</cfoutput></dd>
                                        <dt>Mac Code Location:</dt> 	<dd><cfoutput>smb://#firstQuery.server_name##firstQuery.code_location#</cfoutput></dd>
										<hr>
                                        <dt>Last Updated:</dt> <dd>16.08.2014 12:15:57</dd>
                                        <dt>Created:</dt> <dd> 	10.07.2014 23:36:57 </dd>
                                      
                                    </dl> --->
                                </div>
                            </div>
                            <!--- <div class="row">
                                <div class="col-lg-12">
                                    <dl class="dl-horizontal">
                                        <dt>Completed:</dt>
                                        <dd>
                                            <div class="progress progress-striped active m-b-sm">
                                                <div style="width: 60%;" class="progress-bar"></div>
                                            </div>
                                            <small>Project completed in <strong>60%</strong>. Remaining close the project, sign a contract and invoice.</small>
                                        </dd>
                                    </dl>
                                </div>
                            </div> --->
                            <div class="row m-t-sm">
                                <div class="col-lg-12">
                                <div class="panel blank-panel">
                                <div class="panel-heading">
                                    <div class="panel-options">
                                        <ul class="nav nav-tabs">
                                          <!---   <li class="active"><a href="#tab-1" data-toggle="tab">Users messages</a></li> --->
                                            <li class="active"><a href="#tab-1" data-toggle="tab">Last activity</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">

                                <div class="tab-content">
                         <!---        <div class="tab-pane active" id="tab-1">
                                    <div class="feed-activity-list">
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <img alt="image" class="img-circle" src="img/a2.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">2h ago</small>
                                                <strong>Mark Johnson</strong> posted message on <strong>Monica Smith</strong> site. <br>
                                                <small class="text-muted">Today 2:10 pm - 12.06.2014</small>
                                                <div class="well">
                                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                                    Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                                </div>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <img alt="image" class="img-circle" src="img/a3.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">2h ago</small>
                                                <strong>Janet Rosowski</strong> add 1 photo on <strong>Monica Smith</strong>. <br>
                                                <small class="text-muted">2 days ago at 8:30am</small>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <img alt="image" class="img-circle" src="img/a4.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right text-navy">5h ago</small>
                                                <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                                <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                                <div class="actions">
                                                    <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
                                                    <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> Love</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <img alt="image" class="img-circle" src="img/a5.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">2h ago</small>
                                                <strong>Kim Smith</strong> posted message on <strong>Monica Smith</strong> site. <br>
                                                <small class="text-muted">Yesterday 5:20 pm - 12.06.2014</small>
                                                <div class="well">
                                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
                                                    Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                                </div>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <img alt="image" class="img-circle" src="img/profile.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">23h ago</small>
                                                <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                                <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                            </div>
                                        </div>
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <img alt="image" class="img-circle" src="img/a7.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">46h ago</small>
                                                <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                                <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                            </div>
                                        </div>
                                    </div>

                                </div> --->
                                <div class="tab-pane active" id="tab-1">

                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>Status</th>
                                            <th>Title</th>
                                            <th>Created</th>
                                            <th>Updated</th>
                                            <th>Comments</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!--- <cfdump var="#test#"> --->
										<cfloop query="test">
											<cfoutput>
												<tr>
													<td>
														<span class="label label-primary"><!--- <i class="fa fa-check"></i>  ---></span>
													</td>
													<td>
													  #title#
													</td>
													<td>
														#dateTimeFormat(created_at)#
													</td>
													<td>
														#dateTimeFormat(updated_at)#
													</td>
													<td>
													<p class="small">
														#excerpt#
													</p>
													</td>

												</tr>
											</cfoutput>
										</cfloop>
                                     

                                        </tbody>
                                    </table>

                                </div>
                                </div>

                                </div>

                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="wrapper wrapper-content project-manager">
                    <h4>Project description</h4>
                    <cfoutput query="projects_items">
						<cfif projects_items.type_id EQ 6>
							<img src="http://api.screenshotmachine.com/?key=6de7b5&size=e&url=#value#" class="img-responsive">
						</cfif>
					</cfoutput>		
					
                    <p class="small">
                       Project description 
                    </p>
                    <!--- <p class="small font-bold">
                        <span><i class="fa fa-circle text-warning"></i> High priority</span>
                    </p>
                    <h5>Project tag</h5>
                    <ul class="tag-list" style="padding: 0">
                        <li><a href=""><i class="fa fa-tag"></i> Zender</a></li>
                        <li><a href=""><i class="fa fa-tag"></i> Lorem ipsum</a></li>
                        <li><a href=""><i class="fa fa-tag"></i> Passages</a></li>
                        <li><a href=""><i class="fa fa-tag"></i> Variations</a></li>
                    </ul>
                    <h5>Project files</h5>
                    <ul class="list-unstyled project-files">
                        <li><a href=""><i class="fa fa-file"></i> Project_document.docx</a></li>
                        <li><a href=""><i class="fa fa-file-picture-o"></i> Logo_zender_company.jpg</a></li>
                        <li><a href=""><i class="fa fa-stack-exchange"></i> Email_from_Alex.mln</a></li>
                        <li><a href=""><i class="fa fa-file"></i> Contract_20_11_2014.docx</a></li>
                    </ul>
                    <div class="text-center m-t-md">
                        <a href="#" class="btn btn-xs btn-primary">Add files</a>
                        <a href="#" class="btn btn-xs btn-primary">Report contact</a>

                    </div> --->
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
               <!---  10GB of <strong>250GB</strong> Free. --->
            </div>
            <div>
                <strong>Copyright</strong> TB &copy; 2016
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