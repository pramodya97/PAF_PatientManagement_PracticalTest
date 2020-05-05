<%@page import="com.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Patient Registration Service </title>
		<link rel="stylesheet" href="Views/bootstrap.min.css.css">
		<script src="Components/jquery-3.4.1.min.js"></script>
		<script src="Components/Patient.js"></script>
	</head>
	
<body>
	<div class="container py-5">
		<div class="row">
		
		
		
			<div class="col-md-10 mx-auto">
				<h1 id="heading">Patient Management DashBoard</h1>				
				<br>
					<form id="formPatient" name="formPatient">
 					
 					<div class="form-group row">
                    <div class="col-sm-6">
                        <label>Patient ID</label>
                        <input id="patientID" name="patientID" type="text" class="form-control form-control-sm" placeholder="Update Patient ID">
                    </div>
                    <div class="col-sm-6">
                        <label>Full Name</label>
                        <input id="firstName" name="firstName" type="text" class="form-control form-control-sm" placeholder="Update Patient Name"> 
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Email</label>
                       <input id="email" name="email" type="text" class="form-control form-control-sm" placeholder="Update Patient Email">
                    </div>
                    <div class="col-sm-3">
                        <label>Sex</label>
                          <select id="sex" name="sex" class="form-control form-control-sm">
 									 <option value="Male">Male</option>
 									 <option value="Female">Female</option>
 									 
						</select>
                    </div>

                    <div class="col-sm-3">
                        <label>Date of Birth</label>
                        <input id="dob" name="dob" type="date" class="form-control form-control-sm">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>height</label>
                         <input id="height" name="height" type="number" class="form-control form-control-sm" placeholder="Update Patient Height (cm)">
                    </div>
                    <div class="col-sm-6">
                        <label>Weight</label>
                        <input id="weight" name="weight" type="number" class="form-control form-control-sm" placeholder="Update Patient Weight">
                    </div>
                    
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Contact Number</label>
                        <input id="contactNumber" name="contactNumber" type="number" class="form-control form-control-sm" placeholder="Update Patient Contact Number">
                    </div>
                    <div class="col-sm-6">
                        <label>Marital Status</label>
                       <select id="maritalStatus" name="maritalStatus" class="form-control form-control-sm">
 									 <option value="Married">Married</option>
 									 <option value="Single">Single</option>
 									 
						</select>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Home Address</label>
                        <input id="streetAddL1" name="streetAddL1" type="text" class="form-control form-control-sm" placeholder="Update Patient Home Address">
                    </div>
                    <div class="col-sm-3">
                        <label>Postal Code</label>
                        <input id="postalCode" name="postalCode" type="number" class="form-control form-control-sm" placeholder="Update Patient Postal Code">
                    </div>
                    
                </div>

                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Password</label>
                        <input id="password" name="password" type="password" class="form-control form-control-sm" placeholder="Update Patient Password">
                    </div>
                    
                </div>
 					
 					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary px-4 float-right">
 					
 					<input type="hidden" id="hidPatientIDSave" name="hidPatientIDSave" value="">
					
					</form>
					
					<div class="form-group row">
					<div class="col-sm-6">
					<div id="alertSuccess" class="alert alert-success"></div>
					<div id="alertError" class="alert alert-danger"></div>
					</div>
					<br>
					</div>
					
					
				
				</div>

			
 			
 			
 			
						
				</div>
				
				
 			</div>
 			
 			<div class="col-md-7">
				<div class="container">
					<h4>Appointment Type Table</h4>
					<br><br>
							<div id="divItemsGrid" class="table table-striped">
							 <%
							 Patient patient = new Patient();
							 out.print(patient.readPatientDetails());
							 %>
						</div>
				</div>
			</div>
	</body>
</html>