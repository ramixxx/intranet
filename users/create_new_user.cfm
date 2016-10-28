<!--- OBJECTS!! 
<cfset commonObj    = createObject("component", "cfc.common")>  --->

 <cfquery name="qryUsers" datasource="#application.DSN#">
    SELECT * FROM users
    where username <> '#session.user.username#'
    ORDER by first_name, last_name
</cfquery> 
<cfinclude template="/common/header.cfm">

        </div>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Users</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="/projects/">Home</a>
                        </li>
                        <li>
                            <a>Users</a>
                        </li>
                        <li class="active">
                          <!---   <strong>Clients</strong> --->
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
        <div class="wrapper wrapper-content  animated fadeInRight">
            <div class="row">
                <div class="col-sm-8">
                    <div class="ibox">
                        <div class="ibox-content">
                     <span class="text-muted small pull-right">Last modification: <i class="fa fa-clock-o"></i> 2:10 pm - 12.06.2014</span>
                            <h2>Users</h2>
                          
                          <ul class="nav nav-tabs">
                            </ul>
                           
                            <div class="clients-list">
                            <ul class="nav nav-tabs">
                                 <cfform action="create_new_user_action.cfm" method="post" name="addnewinformationtype" preservedata="Yes" enctype="multipart/form-data">
                                             <div class="col-md-2">
                                                <h4>Job title</h4> <input type="text" name="job_title" class="form-control">
                                            </div>

                                            <div class="col-md-2">
                                                <h4>Title</h4>
                                                <select NAME="title" class="form-control">
                                                 
                                                
                                                 <option value="Mr">Mr</option>
                                                 <option value="Mr">Miss</option>
                                                 </select>
                                            </div>
                                            <div class="col-md-2">
                                                <h4>First name</h4><input type="text" name="first_name" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Last name</h4><input type="text" name="last_name" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Email</h4>  <input type="text" name="email" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                               <h4>Phone extension</h4><input type="text" name="ext_no" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Mobile number</h4><input type="text" name="mobile_no" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                                <h4>Sex</h4> <select NAME="sex" class="form-control">
                                                
                                                
                                                 <option value="Male">Male</option>
                                                 <option value="Female">Female</option>
                                                 </select>
                                            </div>
                                             <div class="col-md-2">
                                                <h4>Active user?</h4> <select NAME="active" class="form-control">
                                                
                                                
                                                 <option value="0">Inactive</option>
                                                 <option value="1">Active</option>
                                                 </select>
                                            </div>
                                            <div class="col-md-2">
                                               <h4>Basecamp_user_id</h4><input type="text" name="basecamp_user_id" class="form-control">
                                            </div>
                                            <div class="col-md-2">
                                               <h4>Username</h4><input type="text" name="username" class="form-control">
                                            </div>
                                            <div class="col-md-2" >
                                                <h4>Upload public image</h4>
                                                                    <label class="file">
                                                                        <input type="file" name="fileUpload" class="form-control" fileField="fileUpload" id="fileUpload">
                                                                        <span class="file-custom"></span>
                                                                    </label>
                                            </div>
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
                <div class="col-sm-4">
                    <div class="ibox ">

                        <div class="ibox-content">
                            <div class="tab-content">
                                <cfloop query="qryUsers">
                                    <cfoutput>
                                        <cfset qryProject = application.commonObj.basecamp_api(
                                                            api_url="https://basecamp.com/2544469/api/v1/people/#basecamp_user_id#/events.json"
                                                            , username="patrick.a@thoughtbubble.com"
                                                            , password="pa77cfkit"
                                                )
                                        >
                                      <div id="contact-#qryUsers.user_id#" class="tab-pane <cfif qryUsers.username eq session.user.username >active</cfif>">
                                            <div class="row m-b-lg">
                                                <div class="col-lg-4 text-center">
                                                    <h2 style="text-transform: capitalize;">#lcase(qryUsers.first_name)# #LCase(qryUsers.last_name)#</h2>

                                                    <div class="m-b-sm">
                                                        <img alt="image" class="img-circle" src="/img/user_icon.png"
                                                             style="width: 62px">
                                                    </div>
                                                </div>
                                                <div class="col-lg-8">
                                                    <strong>
                                                        About me
                                                    </strong>

                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                        tempor incididunt ut labore et dolore magna aliqua.
                                                    </p>
                                                    <button type="button" class="btn btn-primary btn-sm btn-block"><i
                                                            class="fa fa-envelope"></i> Send Message
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="client-detail">
                                            <div class="full-height-scroll">

                                                <strong>Last activity</strong>

                                                <ul class="list-group clear-list">
                                                    <li class="list-group-item fist-item">
                                                        <span class="pull-right"> 09:00 pm </span>
                                                        Please contact me
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right"> 10:16 am </span>
                                                        Sign a contract
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right"> 08:22 pm </span>
                                                        Open new shop
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right"> 11:06 pm </span>
                                                        Call back to Sylvia
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right"> 12:00 am </span>
                                                        Write a letter to Sandra
                                                    </li>
                                                </ul>
                                                <strong>Notes</strong>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                    tempor incididunt ut labore et dolore magna aliqua.
                                                </p>
                                                <hr/>
                                                <strong>Timeline activity</strong>
                                                <div id="vertical-timeline" class="vertical-container dark-timeline">
                                                                                    
                                                <cfloop query="qryProject">
                                                    <cfoutput>
                                                        <div class="vertical-timeline-block">
                                                            <div class="vertical-timeline-icon gray-bg">
                                                                <i class="fa fa-coffee"></i>
                                                            </div>
                                                            <div class="vertical-timeline-content">
                                                                <p>#qryProject.summary#
                                                                </p>
                                                                <span class="vertical-date small text-muted"> #DATETIMEFORMAT(qryProject.updated_at)# </span>
                                                            </div>
                                                        </div>
                                                    </cfoutput>
                                                </cfloop> 
                                                
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        </cfoutput>
                                    </cfloop>
                                

                                <div id="company-1" class="tab-pane">
                                    <div class="m-b-lg">
                                            <h2>--Tellus Institute</h2>

                                            <p>
                                               -- Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,written in 45 BC. This book is a treatise on.
                                            </p>
                                            <div>
                                                <small>Active project completion with: 48%</small>
                                                <div class="progress progress-mini">
                                                    <div style="width: 48%;" class="progress-bar"></div>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="client-detail">
                                        <div class="full-height-scroll">

                                            <strong>Last activity</strong>

                                            <ul class="list-group clear-list">
                                                <li class="list-group-item fist-item">
                                                    <span class="pull-right"> <span class="label label-primary">NEW</span> </span>
                                                    The point of using
                                                </li>
                                                <li class="list-group-item">
                                                    <span class="pull-right"> <span class="label label-warning">WAITING</span></span>
                                                    Lorem Ipsum is that it has
                                                </li>
                                                <li class="list-group-item">
                                                    <span class="pull-right"> <span class="label label-danger">BLOCKED</span> </span>
                                                    If you are going
                                                </li>
                                            </ul>
                                            <strong>Notes</strong>
                                            <p>
                                                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
                                            </p>
                                            <hr/>
                                            <strong>Timeline activity</strong>
                                            <div id="vertical-timeline" class="vertical-container dark-timeline">
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-coffee"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Conference on the sales results for the previous year.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 2:10 pm - 12.06.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-briefcase"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Many desktop publishing packages and web page editors now use Lorem.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 4:20 pm - 10.05.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-bolt"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>There are many variations of passages of Lorem Ipsum available.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 06:10 pm - 11.03.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon navy-bg">
                                                        <i class="fa fa-warning"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>The generated Lorem Ipsum is therefore.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 02:50 pm - 03.10.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-coffee"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Conference on the sales results for the previous year.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 2:10 pm - 12.06.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-briefcase"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Many desktop publishing packages and web page editors now use Lorem.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 4:20 pm - 10.05.2014 </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="company-2" class="tab-pane">
                                    <div class="m-b-lg">
                                        <h2>++Penatibus Consulting</h2>

                                        <p>
                                            ++There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some.
                                        </p>
                                        <div>
                                            <small>Active project completion with: 22%</small>
                                            <div class="progress progress-mini">
                                                <div style="width: 22%;" class="progress-bar"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="client-detail">
                                        <div class="full-height-scroll">

                                            <strong>Last activity</strong>

                                            <ul class="list-group clear-list">
                                                <li class="list-group-item fist-item">
                                                    <span class="pull-right"> <span class="label label-warning">WAITING</span> </span>
                                                    Aldus PageMaker
                                                </li>
                                                <li class="list-group-item">
                                                    <span class="pull-right"><span class="label label-primary">NEW</span> </span>
                                                    Lorem Ipsum, you need to be sure
                                                </li>
                                                <li class="list-group-item">
                                                    <span class="pull-right"> <span class="label label-danger">BLOCKED</span> </span>
                                                    The generated Lorem Ipsum
                                                </li>
                                            </ul>
                                            <strong>Notes</strong>
                                            <p>
                                                Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
                                            </p>
                                            <hr/>
                                            <strong>Timeline activity</strong>
                                            <div id="vertical-timeline" class="vertical-container dark-timeline">
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-coffee"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Conference on the sales results for the previous year.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 2:10 pm - 12.06.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-briefcase"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Many desktop publishing packages and web page editors now use Lorem.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 4:20 pm - 10.05.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-bolt"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>There are many variations of passages of Lorem Ipsum available.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 06:10 pm - 11.03.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon navy-bg">
                                                        <i class="fa fa-warning"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>The generated Lorem Ipsum is therefore.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 02:50 pm - 03.10.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-coffee"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Conference on the sales results for the previous year.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 2:10 pm - 12.06.2014 </span>
                                                    </div>
                                                </div>
                                                <div class="vertical-timeline-block">
                                                    <div class="vertical-timeline-icon gray-bg">
                                                        <i class="fa fa-briefcase"></i>
                                                    </div>
                                                    <div class="vertical-timeline-content">
                                                        <p>Many desktop publishing packages and web page editors now use Lorem.
                                                        </p>
                                                        <span class="vertical-date small text-muted"> 4:20 pm - 10.05.2014 </span>
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
            </div>
        </div>

<cfinclude template="/common/footer.cfm">