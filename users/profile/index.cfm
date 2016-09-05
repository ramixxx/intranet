<cfinclude template="/common/header.cfm">
 <cfquery name="qryUsers" datasource="#application.DSN#">
	SELECT * FROM users
	where username = '#session.user.username#'
	ORDER by first_name, last_name
</cfquery> 
<cfdump var="#qryUsers#">
<cfoutput><div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h2>Profile</h2>
		<ol class="breadcrumb">
			<li>
				<a href="index.html">Home</a>
			</li>
			<li>
				<a>Users</a>
			</li>
			<li class="active">
				<strong>Profile</strong>
			</li>
		</ol>
	</div>
	<div class="col-lg-2">

	</div>
</div>
<div class="wrapper wrapper-content">
	<div class="row animated fadeInRight">
		<div class="col-md-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>Profile Detail</h5>
				</div>
				<div>
					<div class="ibox-content no-padding border-left-right profile-image-container">
						<img alt="image" class="img-responsive" src="/img/profile_big.jpg">
					</div>
					<div class="ibox-content profile-content">
						<h4 class="profile-name"><strong>#qryUsers.first_name# #qryUsers.last_name#</strong></h4>
						<p><i class="fa fa-envelope"></i> <span class="m-l-xs">#qryUsers.email#</span></p>
						<p><i class="fa fa-mobile"></i> <span class="m-l-xs">+44 (0)74-2588-5429</span></p>
						<p><i class="fa fa-phone"></i> <span class="m-l-xs">+44 (0)20 7387 8890</span></p>
						<div>
							<i class="fa fa-map-marker" style="vertical-align:top"></i>
							<ul class="unstyled inline" style="padding:0;">
								<li>58/60 Fitzroy Street,</li>
								<li>London,</li>
								<li>W1T 5BU,</li>
								<li>United Kingdom</li>
								</li>
							</ul>
						</div>
						<h5>
							About me
						</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat.
						</p>
<!--- 						<div class="row m-t-lg">
							<div class="col-md-4">
								<span class="bar">5,3,9,6,5,9,7,3,5,2</span>
								<h5><strong>169</strong> Posts</h5>
							</div>
							<div class="col-md-4">
								<span class="line">5,3,9,6,5,9,7,3,5,2</span>
								<h5><strong>28</strong> Following</h5>
							</div>
							<div class="col-md-4">
								<span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
								<h5><strong>240</strong> Followers</h5>
							</div>
						</div> --->
					</div>
					<div class="ibox-content NO PADDING">
						<form action="" method="post">
								
							<div class="row profile-image-container hide">
								<img alt="image" class="img-responsive" src="/img/profile_big.jpg">
								<div class="row col-md-12">
								<span class="btn btn-success fileinput-button">
									<i class="glyphicon glyphicon-plus"></i>
									<span>Add files...</span>
									<input id="fileupload" class="input form-control" type="file" name="profile_image">
								</span>
								</div>
							</div>
							<div class="row profile-form hide">
								<div class="col-md-6 no-padding-r m-b">
									<input class="input form-control" type="text" placeholder="First Name" value="#qryUsers.first_name#" name="first_name">
								</div>
								<div class="col-md-6 m-b">
									<input class="input form-control" type="text" placeholder="Last Name" value="#qryUsers.last_name#" name="last_name">
								</div>
								<div class="col-md-12 m-b">
									<input class="input form-control" type="email" placeholder="email@yourdomain.com" value="#qryUsers.email#" name="email">
								</div>
								<div class="col-md-4 no-padding-r m-b">
									<input class="input form-control" type="text" placeholder="020" name="phone_1">
								</div>
								<div class="col-md-4 no-padding-r m-b">
									<input class="input form-control" type="text" placeholder="5555" name="phone_2">
								</div>
								<div class="col-md-4 m-b">
									<input class="input form-control" type="text" placeholder="5555" name="phone_3">
								</div>
								<div class="col-md-4 no-padding-r m-b">
									<input class="input form-control" type="text" placeholder="077" name="mobile_1">
								</div>
								<div class="col-md-4 no-padding-r m-b">
									<input class="input form-control" type="text" placeholder="5555" name="mobile_2">
								</div>
								<div class="col-md-4 m-b">
									<input class="input form-control" type="text" placeholder="5555" name="mobile_3">
								</div>
								<div class="col-md-12 m-b">
									<textarea class="input form-control" placeholder="About Me" maxlength="250" rows="10" name="profile_description"></textarea>
								</div>
								<div class="col-md-6 m-b">
									<input class="btn btn-primary btn-block btn-sm" type="submit" name="Submit" value="Submit">
								</div>
								<div class="col-md-6 m-b">
									<button id="cancel-profile-btn" class="btn btn-primary btn-block btn-sm" type="button">Cancel</button>
								</div>
							</div>
							<div class="row user-button">
							<cfif session.user.username neq qryUsers.username>
								<div class="col-md-6">
									<a href="mailto:#qryUsers.email#" class="btn btn-primary btn-sm btn-block" ><i class="fa fa-envelope"></i> Send Message</a>
								</div>
								<div class="col-md-6">
									<button type="button" class="btn btn-default btn-sm btn-block"><i class="fa fa-coffee"></i> Buy a coffee</button>
								</div>
							</cfif>
								<div class="col-md-12">
									<button id="edit-profile-btn" type="button" class="btn btn-primary btn-sm btn-block show"><i class="fa fa-pencil"></i> Edit Profile</button>
								</div>
							</div>
						</form>
					</div>
			</div>
		</div>
			</div>
		<div class="col-md-8">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>Activites</h5>
					<div class="ibox-tools">
						<a class="collapse-link">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a class="dropdown-toggle" data-toggle="dropdown" href="##">
							<i class="fa fa-wrench"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li><a href="##">Config option 1</a>
							</li>
							<li><a href="##">Config option 2</a>
							</li>
						</ul>
						<a class="close-link">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">

					<div>
						<div class="feed-activity-list">

							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/a1.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right text-navy">1m ago</small>
									<strong>Sandra Momot</strong> started following <strong>Monica Smith</strong>. <br>
									<small class="text-muted">Today 4:21 pm - 12.06.2014</small>
									<div class="actions">
										<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
										<a class="btn btn-xs btn-danger"><i class="fa fa-heart"></i> Love</a>
									</div>
								</div>
							</div>

							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/profile.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">5m ago</small>
									<strong>Monica Smith</strong> posted a new blog. <br>
									<small class="text-muted">Today 5:60 pm - 12.06.2014</small>

								</div>
							</div>

							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/a2.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">2h ago</small>
									<strong>Mark Johnson</strong> posted message on <strong>Monica Smith</strong> site. <br>
									<small class="text-muted">Today 2:10 pm - 12.06.2014</small>
									<div class="well">
										Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
										Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
									</div>
									<div class="pull-right">
										<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
										<a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> Love</a>
										<a class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> Message</a>
									</div>
								</div>
							</div>
							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/a3.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">2h ago</small>
									<strong>Janet Rosowski</strong> add 1 photo on <strong>Monica Smith</strong>. <br>
									<small class="text-muted">2 days ago at 8:30am</small>
									<div class="photos">
										<a target="_blank" href="http://24.media.tumblr.com/20a9c501846f50c1271210639987000f/tumblr_n4vje69pJm1st5lhmo1_1280.jpg"> <img alt="image" class="feed-photo" src="/img/p1.jpg"></a>
										<a target="_blank" href="http://37.media.tumblr.com/9afe602b3e624aff6681b0b51f5a062b/tumblr_n4ef69szs71st5lhmo1_1280.jpg"> <img alt="image" class="feed-photo" src="/img/p3.jpg"></a>
										</div>
								</div>
							</div>
							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/a4.jpg">
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
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/a5.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">2h ago</small>
									<strong>Kim Smith</strong> posted message on <strong>Monica Smith</strong> site. <br>
									<small class="text-muted">Yesterday 5:20 pm - 12.06.2014</small>
									<div class="well">
										Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.
										Over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
									</div>
									<div class="pull-right">
										<a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> Like </a>
									</div>
								</div>
							</div>
							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/profile.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">23h ago</small>
									<strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
									<small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
								</div>
							</div>
							<div class="feed-element">
								<a href="##" class="pull-left">
									<img alt="image" class="img-circle" src="/img/a7.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">46h ago</small>
									<strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
									<small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
								</div>
							</div>
						</div>

						<button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> Show More</button>

					</div>

				</div>
			</div>

		</div>
	</div>
</div>
</cfoutput>




<cfinclude template="/common/footer.cfm">