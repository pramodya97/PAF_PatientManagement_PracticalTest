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
				<h1 id="heading">Patient Registration</h1>				
				<br>
			 <form id="formPatient" name="formPatient">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>NIC Number</label>
                        <input id="patientID" name="patientID" type="text" class="form-control form-control-sm" placeholder="Your NIC Number">
                    </div>
                    <div class="col-sm-6">
                        <label>Full Name</label>
                        <input id="firstName" name="firstName" type="text" class="form-control form-control-sm" placeholder="Your Name"> 
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Email</label>
                       <input id="email" name="email" type="text" class="form-control form-control-sm" placeholder="Your Email">
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
                         <input id="height" name="height" type="number" class="form-control form-control-sm" placeholder="Your Height (cm)">
                    </div>
                    <div class="col-sm-6">
                        <label>Weight</label>
                        <input id="weight" name="weight" type="number" class="form-control form-control-sm" placeholder="Your Weight (KG)">
                    </div>
                    
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Contact Number</label>
                        <input id="contactNumber" name="contactNumber" type="number" class="form-control form-control-sm" placeholder="Your Contact Number">
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
                        <input id="streetAddL1" name="streetAddL1" type="text" class="form-control form-control-sm" placeholder="Your Home Address">
                    </div>
                    <div class="col-sm-3">
                        <label>Postal Code</label>
                        <input id="postalCode" name="postalCode" type="number" class="form-control form-control-sm" placeholder="your Postal Code">
                    </div>
                    
                </div>

                <div class="form-group row">
                    <div class="col-sm-6">
                        <label>Password</label>
                        <input id="password" name="password" type="password" class="form-control form-control-sm" placeholder="your Password">
                    </div>
                    
                </div>

                <div class="form-group row">
                    <div class="col-sm-4">
                        <label>Emergency Contact Name</label>
                        <input id="emergencyCNanme" name="emergencyCNanme" type="text" class="form-control form-control-sm" placeholder="Emergency Contact Name">
                    </div>
                    <div class="col-sm-4">
                        <label>Emergency Contact Relationship</label>
                        <input id="emergencyCrelationship" name="emergencyCrelationship" type="text" class="form-control form-control-sm" placeholder="Emergency Contact Relationship">
                    </div>
                     <div class="col-sm-4">
                        <label>Emergency Contact Number</label>
                         <input id="emergencynumber" name="emergencynumber" type="number" class="form-control form-control-sm" placeholder="Emergency Contact Number">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-3">
                        <label>Take Medications (Yes | No)</label>
                       
                        <select id="takeMedication" name="takeMedication" class="form-control form-control-sm">
 									 <option value="Yes">Yes. I am</option>
 									 <option value="No">No</option>
 									 
						</select>
                    </div>
                    <div class="col-sm-9">
                        <label>Current Medications</label>
                        <input id="currentMedication" name="currentMedication" type="text" class="form-control form-control-sm" placeholder="Your Madication Details">
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
	</body>
</html>