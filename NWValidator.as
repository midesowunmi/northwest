package code {

	/***************************************************************************************************
	File			:NWValidator
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:The validator class provides the logic for verifying form data - an example of the strategy pattern at work
					Returns the error string or empty string if data is valid
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	
	public class NWValidator {
		
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		private var phone:String;
		private var email:String;
		private var nameField:String;
		private var formIsValid:String;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		
		function NWValidator () {
			formIsValid = "";
			
		}
		
								
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		function checkPhone(phone) {
			var regExp:RegExp = /\d{10,10}/;
			var regExp2: RegExp = /\d{3,3}[ -]{0,1}\d{3,3}[ -]{0,1}\d{4,4}$/;
			if (regExp2.exec(phone)) {
				formIsValid = "";
				return formIsValid;				
			}
			else {
				formIsValid = "error";
				return formIsValid;
				}
		}
		
		function checkEmail (email) {
		var regExp:RegExp =	/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if (regExp.exec(email)) {
				formIsValid = "";
				return formIsValid;				
			}
			else {
				formIsValid = "error";
				return formIsValid;
				}
			
		}
		
		function checkName (Name) {
			var regExp: RegExp = /[!@#$%^&*()\/\\"']/;
			if (regExp.test(Name)|| Name.length < 2) {
				formIsValid = "error";
				return formIsValid;				
			}
			else {
				formIsValid = "";
				return formIsValid;
				}
		}
		
	}
	
}