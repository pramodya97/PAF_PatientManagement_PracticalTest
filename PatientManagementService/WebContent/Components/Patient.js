$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	// If valid------------------------
	var type = ($("#hidPatientIDSave").val() == "") ? "POST" : "PUT";
	$.ajax({
		url : "PatientsAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidPatientIDSave").val("");
	$("#formPatient")[0].reset();
}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) {
			$("#hidPatientIDSave").val( $(this).closest("tr").find('#hidItemIDUpdate').val());
			$("#patientID").val($(this).closest("tr").find('td:eq(0)').text());
			$("#firstName").val($(this).closest("tr").find('td:eq(1)').text());
			$("#email").val($(this).closest("tr").find('td:eq(2)').text());
			$("#sex").val($(this).closest("tr").find('td:eq(3)').text());			
			$("#dob").val($(this).closest("tr").find('td:eq(4)').text());
			$("#height").val($(this).closest("tr").find('td:eq(5)').text());
			$("#weight").val($(this).closest("tr").find('td:eq(6)').text());
			$("#contactNumber").val($(this).closest("tr").find('td:eq(7)').text());
			$("#maritalStatus").val($(this).closest("tr").find('td:eq(8)').text());
			$("#streetAddL1").val($(this).closest("tr").find('td:eq(9)').text());
			$("#postalCode").val($(this).closest("tr").find('td:eq(10)').text());
			$("#password").val($(this).closest("tr").find('td:eq(11)').text());
			
			
		});

//Delete============================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PatientsAPI",
		type : "DELETE",
		data : "id=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// CLIENTMODEL=========================================================================
function validateItemForm() {
	
	// NIC
	if ($("#patientID").val().trim() == "") {
		return "Enter Your NIC.";
	}
	
	/*
	var valNIC = /^[0-9]{10}[vV]$/
		var vnic = $("#patientID").val().trim()

			if(valNIC.test(vnic)== false)
			{
			 return "NOT VALID ! Please Enter Valid NIC"	
			}
	*/
	
	
	// NAME
	if ($("#firstName").val().trim() == "") {
		return "Insert Your Name.";
	}
	
	
	
	
	
	
	
//Email-----------------------------------
	
	if ($("#email").val().trim() == "")
	{
		return " Enter Your Email";
	}

	
    //email pattern
	var pattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;	
	var email = $("#email").val().trim();
	if (pattern.test(email) == false) 
	{
	return "Please Enter Valid Email";
	} 

	// dob
	if ($("#dob").val().trim() == "") {
		return "Insert Your BirthDay.";
	}
	
	// height-------------------------------
	if ($("#height").val().trim() == "") {
		return "Insert Your Height.";
	}
	// Height is numerical value
	var tmpHeight = $("#height").val().trim();
	if (!$.isNumeric(tmpHeight)) {
		return "Insert a numerical value for Height.";
	}
	// convert to decimal height
	$("#height").val(parseFloat(tmpHeight).toFixed(2));

	
	//Weight
	if ($("#weight").val().trim() == "") {
		return "Insert Your Weight.";
	}
	// weight is numerical value
	var tmpWeight = $("#weight").val().trim();
	if (!$.isNumeric(tmpWeight)) {
		return "Insert a numerical value for Weight.";
	}
	// convert to decimal height
	$("#weight").val(parseFloat(tmpWeight).toFixed(2));
	
	
	
	//Phone--------------------------------	
	if ($("#contactNumber").val().trim() == "")
	{
		return "Enter Contact No.";
	}
	
	// Check numeric value
	var phone = $("#contactNumber").val().trim();
	if (!$.isNumeric(phone)) {
		return "Insert Numbers";
	}
	
	// check contact number pattern
	var pattern = /^\d{10}$/;
	if (!pattern.test(phone)) {
		return "Please Enter 10 Numbers Contact No.";
	}
	
	

	// Address
	if ($("#streetAddL1").val().trim() == "") {
		return "Insert Your Home Address.";
	}
	
	//Postal Code
	if ($("#postalCode").val().trim() == "")
	{
		return "Enter Postal Code.";
	}
	
	//Chech Numeric values
	var pCode = $("#postalCode").val().trim();
	if (!$.isNumeric(pCode)) {
		return "Insert Numbers for Postal Code";
	}
	
	//Check length
	var pattern = /^\d{5}$/;
	if (!pattern.test(pCode)) {
		return "Please Enter 5 Numbers of Postal Code.";
	}
	
	// Password
	if ($("#password").val().trim() == "") {
		return "Insert Your Password.";
	}
	
	/*
	//Emergency Phone--------------------------------	
	if ($("#emergencynumber").val().trim() == "")
	{
		return "Enter Emergency Contact No.";
	}
	
	// Check numeric value
	var ePhone = $("#emergencynumber").val().trim();
	if (!$.isNumeric(ePhone)) {
		return "Insert Numbers";
	}
	
	// check contact number pattern
	var pattern = /^\d{10}$/;
	if (!pattern.test(ePhone)) {
		return "Please Enter 10 Numbers Contact No.";
	}
	*/
	

	return true;
}
