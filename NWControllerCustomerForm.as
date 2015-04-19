package code {

	/***************************************************************************************************
	File			:NWControllerCustomerForm
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:Main Controller Class has listeners for the Navigation buttons adds the Forms to stage when Nav btn is clicked
					AnController for the New Customer form handles the validation using the NWValidator class. Also creates the URLVariables object with the
					values from the form
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	import flash.display.MovieClip;
	import flash.events.*;
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.managers.StyleManager;
	import flash.net.URLVariables;
	import com.yahoo.astra.fl.managers.AlertManager; 
	
	
	
	public class NWControllerCustomerForm extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		public var getCustomerForm:NWView;
		public var getCompanyName:String;
		public var getSubmitCustomer:Button;
		public var getFormData:URLVariables;
		public var initUrlLoader: NWModel;
		public var getValidator:NWValidator;
		private var checkForm:String;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		function NWControllerCustomerForm () {
			getFormData = new URLVariables ();
			getCustomerForm = new NWView(2);
			addChild(getCustomerForm);
			getSubmitCustomer = getCustomerForm.getFormPanelCustomer.btnSubmit;
			getSubmitCustomer.addEventListener (MouseEvent.CLICK, sendCustomerForm);
			//getCustomerForm.addEventListener(DataLoadedEvent.LOADED, showLoaded);
			//trace("customer form listener");
		}
		
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		function showLoaded(e:DataLoadedEvent):void {
			trace("dataLoadedEvent fired");
		}
		function sendCustomerForm(e:MouseEvent):void {
			getValidator = new NWValidator ();
			checkForm = new String("");
			var errorSkin:TextInput_errorSkin = new TextInput_errorSkin ();
			//errorSkin.upSkin = "TextInput_errorSkin";
			trace ("errorSkin.upSkin= " +errorSkin.upSkin);
			initUrlLoader = new NWModel ();
			//getCustomerForm.getFormPanelCustomer.btnSubmit.label = "Hello";
			getFormData.getCompanyName = getCustomerForm.getFormPanelCustomer.txtCompanyName.text;
			getFormData.getAdd = getCustomerForm.getFormPanelCustomer.txtCompanyAddress.text;
			getFormData.getFName = getCustomerForm.getFormPanelCustomer.txtContactFname.text;
			getFormData.getLName = getCustomerForm.getFormPanelCustomer.txtContactLname.text;
			getFormData.getEmail = getCustomerForm.getFormPanelCustomer.txtContactEmail.text;
			getFormData.getTitle = getCustomerForm.getFormPanelCustomer.txtContactTitle.text;
			getFormData.getPhone = getCustomerForm.getFormPanelCustomer.txtCompanyPhone.text;
			getFormData.query = "newCustomer";
			checkForm = validate();
			//checkForm += getValidator.checkPhone(getFormData.getPhone);
			//checkForm += getValidator.checkEmail(getFormData.getEmail);
			if(checkForm == ""){
				initUrlLoader.queryInsertCustomerForm(getFormData);
			
			}
			else {
				AlertManager.createAlert(this,"Please correct highlighted fields");
			}
			trace("checkPhone= " +getValidator.checkPhone(getFormData.getPhone));
			trace("checkName= " +getValidator.checkName(getFormData.getAdd));
			
		}
		
		function validate ():String {
			if(getValidator.checkName(getFormData.getCompanyName) == ""){
			checkForm += getValidator.checkName(getFormData.getCompanyName);
			getCustomerForm.getFormPanelCustomer.txtCompanyName.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkName(getFormData.getCompanyName);
				getCustomerForm.getFormPanelCustomer.txtCompanyName.setStyle("upSkin", TextInput_errorSkin);
			}
			if(getValidator.checkPhone(getFormData.getPhone) == ""){
			checkForm += getValidator.checkPhone(getFormData.getPhone);
			getCustomerForm.getFormPanelCustomer.txtCompanyPhone.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkPhone(getFormData.getPhone);
				getCustomerForm.getFormPanelCustomer.txtCompanyPhone.setStyle("upSkin", TextInput_errorSkin);
			}
			if(getValidator.checkName(getFormData.getAdd) == ""){
			checkForm += getValidator.checkName(getFormData.getAdd);
			getCustomerForm.getFormPanelCustomer.txtCompanyAddress.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkName(getFormData.getAdd);
				getCustomerForm.getFormPanelCustomer.txtCompanyAddress.setStyle("upSkin", TextInput_errorSkin);
			}
			if(getValidator.checkEmail(getFormData.getEmail) == ""){
			checkForm += getValidator.checkEmail(getFormData.getEmail);
			getCustomerForm.getFormPanelCustomer.txtContactEmail.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkEmail(getFormData.getEmail);
				getCustomerForm.getFormPanelCustomer.txtContactEmail.setStyle("upSkin", TextInput_errorSkin);
			}
			if(getValidator.checkName(getFormData.getFName) == ""){
			checkForm += getValidator.checkName(getFormData.getFName);
			getCustomerForm.getFormPanelCustomer.txtContactFname.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkName(getFormData.getFName);
				getCustomerForm.getFormPanelCustomer.txtContactFname.setStyle("upSkin", TextInput_errorSkin);
			}
			if(getValidator.checkName(getFormData.getLName) == ""){
			checkForm += getValidator.checkName(getFormData.getLName);
			getCustomerForm.getFormPanelCustomer.txtContactLname.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkName(getFormData.getLName);
				getCustomerForm.getFormPanelCustomer.txtContactLname.setStyle("upSkin", TextInput_errorSkin);
			}
			if(getValidator.checkName(getFormData.getTitle) == ""){
			checkForm += getValidator.checkName(getFormData.getTitle);
			getCustomerForm.getFormPanelCustomer.txtContactTitle.setStyle("upSkin", TextInput_upSkin);
			}
			else {
				checkForm += getValidator.checkName(getFormData.getTitle);
				getCustomerForm.getFormPanelCustomer.txtContactTitle.setStyle("upSkin", TextInput_errorSkin);
			}
			return checkForm;
			
		}
		
	}
}