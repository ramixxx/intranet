<!--- OBJECTS!! --->
<cfset commonObj    = createObject("component", "cfc.common")>  



<cfquery name="projects" datasource="test">
    SELECT * FROM projects 
    WHERE is_active = 1
    AND is_archived = 1
    <!--- LEFT JOIN project_item_types ON projects.id = project_item_types.project_id
    WHERE type_id IN (1,3,4,5,6) --->
</cfquery>


<cfquery datasource="test" name="send_message">
  SELECT message_id,send_from,send_to,message_text
  FROM send_message
 WHERE send_from = '#SESSION.user.username#' 
</cfquery>


<cfquery datasource="test" name="receive_message">
  SELECT message_id,send_from,send_to,message_text
  FROM send_message
 WHERE send_to = '#SESSION.user.username#' 
</cfquery>

<cfquery datasource="test" name="allusers">
  SELECT username FROM users
</cfquery>




<cfinclude template="/common/header.cfm">

<!--- <head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head> --->


<!---         <div id="page-wrapper" class="gray-bg"> --->
        <div class="row border-bottom">
      <!---   <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0"> --->
<!---         <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div> --->
         <!---    <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message">Welcome to INSPINIA+ Admin Theme.</span>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <!--- <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a7.jpg">
                                </a>
                                <div class="media-body">
                                    <small class="pull-right">46h ago</small>
                                    <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                    <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>0
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a4.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">5h ago</small>
                                    <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                    <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/profile.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right">23h ago</small>
                                    <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                    <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="mailbox.html">
                                    <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="profile.html">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="grid_options.html">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="notifications.html">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li> --->


                <li>
                    <a href="login.html">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
            </ul>

        </nav> --->
        </div>
                
<!---       <cfhttp url="https://basecamp.com/2544469/api/v1/projects.json"
                    method="GET"
                    username="mitch.e@thoughtbubble.com"
                    password="radic6basecamp"
            >
            
            <cfset result = deserializeJSON(cfhttp.filecontent)>
            <cfset test = arrayOfStructuresToQuery(result)> --->
            <!--- <cfdump var="#result#">  --->
            
            
             <!--- <cfdump var="#test#">   --->
            
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
                            <h5>All projects assigned to this account</h5><div style="text-align:right"><a  class="btn btn-primary btn-xs" href="create_archived_project_form.cfm">New archived project</a></div>
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

    <!---                               <cfloop query="test">
                                        <tr>
                                        <cfoutput>
                                        <td class="project-status">
                                        <cfif dateDiff('d',dateTimeFormat(updated_at),now()) LT 15>
                                            <span class="label label-primary">Active</span>
                                        <cfelseif dateDiff('d',dateTimeFormat(updated_at),now()) GT 15 AND dateDiff('d',dateTimeFormat(updated_at),now()) LT 60>
                                            <span class="label label-warning">Alive</span>
                                        <cfelseif dateDiff('d',dateTimeFormat(updated_at),now()) GTE 60>
                                            <span class="label label-danger">Sleeping</span>
                                        </cfif>
                                        </td>
                                        <td class="project-title">
                                            <a href="project_detail.cfm?id=#id#">#name#</a>
                                            <br/>
                                            <small>Updated #dateTimeFormat(updated_at)#</small>
                                        </td>
                                        <!--- <td class="project-completion">
                                                <small>Completion with: 48%</small>
                                                <div class="progress progress-mini">
                                                    <div style="width: 48%;" class="progress-bar"></div>
                                                </div>
                                        </td> --->
                                        <td class="project-people">
                                            <a href=""><img alt="image" class="img-circle" src="https://placeholdit.imgix.net/~text?txtsize=55&txt=LIVE&w=150&h=150&bg=A0E037"></a>
                                            <a href=""><img alt="image" class="img-circle" src="https://placeholdit.imgix.net/~text?txtsize=55&txt=UAT&w=150&h=150&bg=efd249"></a>
                                            <a href=""><img alt="image" class="img-circle" src="https://placeholdit.imgix.net/~text?txtsize=55&txt=INT&w=150&h=150&bg=2372b2"></a>
                                            <a href=""><img alt="image" class="img-circle" src="https://placeholdit.imgix.net/~text?txtsize=55&txt=LOCAL&w=150&h=150"></a>
                                        </td>
                                        <td class="project-actions">
                                            <a href="#app_url#" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> View </a>
                                            <a href="#app_url#" class="btn btn-white btn-sm"><i class="fa fa-pencil"></i> Edit </a>
                                        </td>
                                    </tr>
                                   </cfoutput>
                                    </cfloop> --->                              
                                    <cfoutput query="projects" group="id">                                  
                                        
                                        <tr>

                                        <td class="project-status">
                                        <!--- <cfif dateDiff('d',dateTimeFormat(updated_at),now()) LT 15>
                                            <span class="label label-primary">Active</span>
                                        <cfelseif dateDiff('d',dateTimeFormat(updated_at),now()) GT 15 AND dateDiff('d',dateTimeFormat(updated_at),now()) LT 60>
                                            <span class="label label-warning">Alive</span>
                                        <cfelseif dateDiff('d',dateTimeFormat(updated_at),now()) GTE 60>
                                            <span class="label label-danger">Sleeping</span>
                                        </cfif> --->
                                        </td>
                                        <td class="project-title">
                                            <a href="project_detail.cfm?id=#basecamp_id#">#project_name# <!--- #name# ---></a>
                                            <br/>
                                            <small>Updated <!--- #dateTimeFormat(updated_at)# ---></small>
                                        </td>
                                        <!--- <td class="project-completion">
                                                <small>Completion with: 48%</small>
                                                <div class="progress progress-mini">
                                                    <div style="width: 48%;" class="progress-bar"></div>
                                                </div>
                                        </td> --->
                                        
                                        <cfquery name="projects_items" datasource="test">
                                            SELECT * FROM projects 
                                            LEFT JOIN project_item_types_values ON projects.id = project_item_types_values.project_id
                                            LEFT JOIN project_item_types ON project_item_types.type_id = project_item_types_values.type_id
                                            WHERE project_item_types_values.show_in_view = 1
                                            AND projects.id = #projects.id#
                                            ORDER  BY project_item_types.type_id DESC
                                        </cfquery>

                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.10/clipboard.min.js"></script>
                                        <script>
                                            var clipboard = new Clipboard('.copy_to');
                                                clipboard.on('success', function(e) {
                                                    //console.info('Action:', e.action);
                                                    //console.info('Text:', e.text);
                                                    //console.info('Trigger:', e.trigger);

                                                    //e.clearSelection();
                                            });

                                            clipboard.on('error', function(e) {
                                                //console.error('Action:', e.action);
                                                //console.error('Trigger:', e.trigger);
                                            });
                                        </script>
                                        
                                        <td class="project-people">  
                                        <cfloop query="projects_items">
                                            <cfif projects_items.type_id EQ 2>
                                            
                                            <button class="copy_to img-circle" style="border: 0; background: transparent" data-clipboard-text="#value#">
                                                <img alt="image" class="img-circle" src="/img/project_item_types/#projects_items.type_id#.png">
                                            </button>
                                                
                                            <cfelse>
                                               
                                            <a href="#value#">
                                                <img alt="image" class="img-circle" src="/img/project_item_types/#projects_items.type_id#.png">
                                            </a>
                                                
                                            </cfif>

                                        </cfloop>
                                        <a href="edit_project.cfm?project_id=#projects.id#" class="btn btn-white btn-sm">Edit project</a>
                                        
                                        <cfoutput>#projects.id#</cfoutput>
                                   
                                            <a href="https://basecamp.com/2544469/projects/#basecamp_id#" class="btn btn-white btn-sm"><i class="fa fa-folder"></i> View on basecamp </a>
                                         

                                            
                                       
                                              
                                              <!-- Trigger the modal with a button -->
                                              

                                              <button type="button"  class="btn btn-white btn-sm public_chat" data-toggle="modal" data-myid='#id#' data-target="##myModal_#id#"><i class="fa fa-weixin" aria-hidden="true" 
                                              style="margin-right:3px;"></i>Public chat</button>

                                              

                                                                                           <!-- Modal -->
                                              <div class="modal fade" id="myModal_#id#" role="dialog">
                                                <div class="modal-dialog">
                                               
                                                  <!-- Modal content-->
                                                  <div class="modal-content">
                                                    <div class="modal-header">
                                                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                      <h4 class="modal-title">Public chat - #projects.project_name#</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                    
                                                    
                                                        <form action="" method="post" id="form_message">
                                                            
                                                                <div class="input-group">
                                                                    <cfoutput>
                                                                            <input type="hidden" class="form-control" name="message_id" id="messageid" value="#send_message.message_id#">
                                                                    </cfoutput>
                                                                    <input type="hidden" class="form-control" name="send_from" id="sessionusername" value="#SESSION.user.username#">
                                                                    <input type="hidden" class="form-control" name="send_to" id="toallusers" value="#allusers.username#">
                                                                    <input type="textarea" class="form-control" name="new_message" size="100%" id="newmessage_#id#"  autocomplete="false" autofocus value="" required >
                                                                 
                                                                        <input type="hidden" class="form-control" name="project_id" id="projectid_#id#" value="#id#">
                                                                        
                                                                 
                                                                    <br />
                                                                </div>

                                                            <div id="updateid_#id#">
                                                              
                                                            </div>
                                                  
                                                             

                                        </form>  




                                                    <div class="modal-footer">
                                                      <input type="submit" name="submit" value="Send" class="btn btn-primary sendmessage" myprojectid="#id#">
                                                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

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


<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<script> 
 $(document).ready(function() {

$(".public_chat").on('click', function(e){

    var project_id = $(this).attr('data-myid');

    $("#updateid_" + project_id).load("populatechatpublic.cfm?project_id='+ project_id+'&<cfoutput>#CGI.QUERY_STRING#</cfoutput>");
        var refreshId = setInterval(function() {
          $("#updateid_" + project_id).load('populatechatpublic.cfm?project_id='+ project_id+'&randval='+ Math.random()+'&<cfoutput>#CGI.QUERY_STRING#</cfoutput>');
       }, 500);
   $.ajaxSetup({ cache: false });


});
   
});
</script>

<script>

$(".sendmessage").on('click', function(e){
    
        e.originalEvent.defaultPrevented;

       
            var send_from = $('#sessionusername').val();
            var send_to = $('#toallusers').val();
           // var new_message = $('#newmessage').val();

            var project_id = $(this).attr('myprojectid');
           
           //alert(project_id) ;
            var new_message = $('#newmessage_' + project_id).val();
            //alert(new_message);
        $.post('_ajax_public_chat.cfm', {
            
           
                send_from: send_from,
                send_to: send_to,
                new_message: new_message,
                project_id: project_id
                
            
            }, function(data) {
                
                        
        $('#updateid_' + project_id).html(data);  
                
                            
            });
        
            return false;




});
</script>


        
        
        

<cfinclude template="/common/footer.cfm">
                                       

                           


