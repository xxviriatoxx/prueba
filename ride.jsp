<%-- 
    Document   : rides
    Created on : 30-May-2020, 11:09:43
    Author     : Rober03
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="%{#session.USUARIO!=null}">
	<!DOCTYPE html>
	<html lang="en">

		<head>
			<title>Sharecar | Requests</title>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<!-- Bootstrap core CSS -->
			<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />

			<!-- Custom fonts for custome styles -->
			<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
				  rel="stylesheet">

			<!-- Custom styles -->
			<link rel="stylesheet" href="css/global-styles.css" />
			<link rel="stylesheet" href="css/tables-styles.css" />
		</head>

		<body class="bg-six">
			<!-- Navigation for logged user -->
			<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
				<div class="container">
					<a class="navbar-brand" data-text="SHARECAR" href="index.jsp">SHARECAR</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
							aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item">
								<a class="nav-link" href="find-form.jsp">Find a ride</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="offer.jsp">Offer a ride</a>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
								   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<s:property value="%{#session.USUARIO.nombre}"></s:property>
									</a>
									<div class="dropdown-menu navbar-dropdown" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="profile.jsp">Profile</a>
										<a class="dropdown-item disabled" href="ride.jsp">Rides</a>
										<a class="dropdown-item" href="request.jsp">Requests</a>
										<a class="dropdown-item" href="report.jsp">Reports</a>
										<a class="dropdown-item" href="rating.jsp">Ratings</a>
										<a class="dropdown-item" href="block.jsp">Blocks</a>
										<div class="dropdown-divider"></div>
									<s:form method="post" action="cerrarSesionUsuario" cssClass="dropdown-item p-0">
										<s:submit cssClass="text-danger btn btn-link input-logout" value="Log out"></s:submit>
									</s:form>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- Main -->
			<div class="container">
				<h1>Rides</h1>
				<div class="custom-nav">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active text-dark" id="driver-tab" data-toggle="tab" href="#driver" role="tab"
							   aria-controls="driver" aria-selected="true">Driver</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-dark" id="passenger-tab" data-toggle="tab" href="#passenger" role="tab"
							   aria-controls="passenger" aria-selected="false">Passenger</a>
						</li>
					</ul>
				</div>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="driver" role="tabpanel" aria-labelledby="driver-tab">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th class="d-lg-block d-md-none d-none" scope="col">#</th>
									<th scope="col">Origin</th>
									<th scope="col">Destiny</th>
									<th scope="col">Date</th>
									<th scope="col">Hour</th>
									<th scope="col">Passengers</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="viajesConductor">
									<tr>
										<th class="d-lg-block d-md-none d-none" scope="row"><s:property value="idViaje"></s:property></th>
										<td><s:property value="origen"></s:property></td>
										<td><s:property value="destino"></s:property></td>
										<td><s:date name = "fecha" format = "yyyy-MM-dd" /></td>
										<td><s:property value="hora"></s:property></td>
										<td><s:property value="asientos"></s:property></td>
										</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="passenger" role="tabpanel" aria-labelledby="passenger-tab">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th class="d-lg-block d-md-none d-none" scope="col">#</th>
									<th scope="col">Origin</th>
									<th scope="col">Destiny</th>
									<th scope="col">Date</th>
									<th scope="col">Hour</th>
									<th scope="col">Driver</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<s:iterator value="viajesPasajero">
										<th class="d-lg-block d-md-none d-none" scope="row"><s:property value="idViaje"></s:property></th>
										<td><s:property value="origen"></s:property></td>
										<td><s:property value="destino"></s:property></td>
										<td><s:date name = "fecha" format = "yyyy-MM-dd" /></td>
										<td><s:property value="destino"></s:property></td>
										<td><s:property value="usuario.nombre"></s:property></td>
											<td>
												<img src="img/icons/star-fill.svg" class="openRatingModal clickable" />
												<img src="img/icons/exclamation-circle.svg" class="openReportingModal clickable" />
											<s:form cssClass="block" action="nuevoBloqueo" method="post">
												<s:textfield id="idViaje" 
															 name="idViaje"
															 value="%{idViaje}"
															 hidden="true"></s:textfield>
												<s:textfield name="trash_img"
															 cssClass="icon block"
															 type="image"
															 src="img/icons/lock-fill.svg"></s:textfield>
											</s:form>
										</td>
									</s:iterator>
								</tr>


							</tbody>
						</table>
					</div>
				</div>

			</div>

			<!-- Modal Rating-->
			<div class="modal fade" id="ratingModal" tabindex="-1" role="dialog" aria-labelledby="ratingModalLabel"
				 aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="ratingModalLabel">Rating</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<s:form action="nuevaPuntuacion"  method="post">
								<form method="#" action="">
									<div class="row modal-form">
										<s:textfield name="idViaje"
													 value="%{idViaje}"
													 hidden="true"></s:textfield>
											<label class="col-12 p-0 m-0" for="rate">Rate</label>
										<s:textfield id="inputRate" 
													 name="inputRate"
													 type="number"
													 max="5"
													 min="1"
													 cssClass="col-12 mx-0 mb-2 mt-1 form-control"></s:textfield>
										<s:submit cssClass="mt-4 mx-0 col-12 btn btn-dark form-control" value="Send"></s:submit>
										</div>
								</s:form>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal Reporting-->
			<div class="modal fade" id="reportingModal" tabindex="-1" role="dialog" aria-labelledby="reportingModalLabel"
				 aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="reportingModalLabel">Reporting</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<s:form action="nuevoReporte"  method="post">
								<div class="row modal-form">
									<s:textfield name="idViaje"
												 value="%{idViaje}"
												 hidden="true"></s:textfield>
										<label class="col-12 p-0 m-0" for="category">Category</label>
										<select name="categoryInput" class="col-12 m-0 mb-2 mt-1 form-control">
											<option value="Transporte sustancias ilegales">Transporte sustancias ilegales</option>
											<option value="Conduccion temeraria">Conduccion temeraria</option>
											<option value="Otros">Otros</option>
										</select>
										<label class="col-12 p-0 m-0" for="issue">Explain your issue</label>
									<s:textarea cssClass="col-12 mb-2 mt-1 form-control" name="issueInput"></s:textarea>
									<s:submit cssClass="mt-4 mx-0 col-12 btn btn-dark form-control" value="Send"></s:submit>
									</div>
							</s:form>
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript" src="jQuery/jquery-3.4.0.min.js"></script>
			<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
			<script typw="text/javascript">
				$('.openRatingModal').on('click', function () {
					var id = $(this).closest('tr').find('th').text();
					$('.modal-form').find("input[name='idViaje']").val(id);
					$('#ratingModal').modal({show: true});
				});
				$('.openReportingModal').on('click', function () {
					var id = $(this).closest('tr').find('th').text();
					$('.modal-form').find("input[name='idViaje']").val(id);
					$('#reportingModal').modal({show: true});
				});

				$('.block').submit(function () {
					return confirm('Are you sure you want to block this user?');
				});

			</script>
		</body>

	</html>
</s:if>