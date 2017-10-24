<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-drawer.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/dataTables.bootstrap.min.css">
</head>
<body class="has-drawer">
	<!-- add this class to your body for proper sizing -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/drawer.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/q2w.js"></script>

	<div class="panel panel-default has-inner-drawer" style="height: 100%">
		<div id="drawerExample2" class="drawer drawer-inside dw-xs-5 fold"
			aria-labelledby="drawerExample2">
			<div class="drawer-controls">
				<a href="#drawerExample2" data-toggle="drawer"
					href="#drawerExample2" aria-foldedopen="false"
					aria-controls="drawerExample2" class="btn btn-primary btn-sm">Menu</a>
			</div>
			<div class="drawer-contents">
				<div class="drawer-heading">
					<h2 class="drawer-title">Menu</h2>
				</div>
				<ul class="drawer-nav">
					<li role="presentation" class="active"><a href="Home.jsp">Home</a></li>
					<li role="presentation"><a href="Q2W.jsp">Q2W</a></li>
					<li role="presentation"><a href="Q2D.jsp">Q2D</a></li>
					<li role="presentation"><a href="XmlConverter.jsp">XmlConverter</a></li>
				</ul>
			</div>
		</div>
		<div class="panel-body" style="padding-left: 10%">
			<div class="container">
				<div class="row">

					<form action="/ADE.Identities.WebUi/Merge/Confirmation"
						method="post" onsubmit="return validate()" role="form">
						<div class="well well-lg">
							<ul class="nav nav-tabs">
								<li class="active sais-tab"><a data-toggle="tab" role="tab"
									data-target="#Q2WData">Q2W</a></li>
								<li class="azed-tab"><a data-toggle="tab" role="tab"
									data-target="#xmlConverterData">XmlConverter</a></li>
							</ul>

							<div class="tab-content">
								<div id="Q2WData" class="tab-pane fade in active"
									role="tabpanel">

									<div class="well well-lg">
										<ul class="nav nav-tabs">
											<li class="active sais-tab"><a data-toggle="tab"
												role="tab" data-target="#heartBeatClientData">心跳協議</a></li>
											<li class="azed-tab"><a data-toggle="tab" role="tab"
												data-target="#connectionFactoryData">資料庫連線</a></li>
											<li class="azed-tab"><a data-toggle="tab" role="tab"
												data-target="#queueOriginData">來源佇列</a></li>
											<li class="azed-tab"><a data-toggle="tab" role="tab"
												data-target="#queueDestinationData">目的佇列</a></li>
											<li class="azed-tab"><a data-toggle="tab" role="tab"
												data-target="#webServiceData">Web Service</a></li>
										</ul>

										<div class="tab-content">
											<div id="heartBeatClientData" class="tab-pane fade in active"
												role="tabpanel">
												<form>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-list-alt"></i></span> <input
															id="beatID" type="text" class="form-control"
															name="beatID" placeholder="編號">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span> <input
															id="fileName" type="text" class="form-control"
															name="fileName" placeholder="名稱">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-time"></i></span> <input
															id="timeSeries" type="text" class="form-control"
															name="timeSeries" placeholder="時間區隔">
													</div>
												</form>
											</div>
											<div id="connectionFactoryData" class="tab-pane fade in"
												role="tabpanel">
												<form>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span> <input
															id="username" type="text" class="form-control"
															name="username" placeholder="帳號">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-lock"></i></span> <input
															id="password" type="password" class="form-control"
															name="password" placeholder="密碼">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-cloud"></i></span> <input
															id="host" type="text" class="form-control"
															name="host" placeholder="主機">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-link"></i></span> <input
															id="port" type="text" class="form-control"
															name="port" placeholder="埠號">
													</div>
												</form>
											</div>
											<div id="queueOriginData" class="tab-pane fade in"
												role="tabpanel">
												<form>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span> <input
															id="queueName" type="text" class="form-control"
															name="queueName" placeholder="名稱">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-random"></i></span> <input
															id="exchangeName" type="text" class="form-control"
															name="exchangeName" placeholder="exchange name">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-link"></i></span> <input
															id="routingKey" type="password" class="form-control"
															name="routingKey" placeholder="routing key">
													</div>
												</form>
											</div>
											<div id="queueDestinationData" class="tab-pane fade in"
												role="tabpanel">
												<form>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span> <input
															id="queueName" type="text" class="form-control"
															name="queueName" placeholder="名稱">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-random"></i></span> <input
															id="exchangeName" type="text" class="form-control"
															name="exchangeName" placeholder="exchange name">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-link"></i></span> <input
															id="routingKey" type="password" class="form-control"
															name="routingKey" placeholder="routing key">
													</div>
												</form>
											</div>
											<div id="webServiceData" class="tab-pane fade in"
												role="tabpanel">
												<form>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-cloud"></i></span> <input
															id="url" type="text" class="form-control"
															name="url" placeholder="網址">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-picture"></i></span> <input
															id="type" type="text" class="form-control"
															name="type" placeholder="類型">
													</div>
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-text-height"></i></span> <input
															id="format" type="password" class="form-control"
															name="format" placeholder="格式">
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div id="xmlConverterData" class="tab-pane fade in"
									role="tabpanel">
									<table id="xmlConverterTable" class="table dt-responsive"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>Name</th>
												<th>Position</th>
												<th>Office</th>
												<th>Extn.</th>
												<th>Start date</th>
												<th>Salary</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>