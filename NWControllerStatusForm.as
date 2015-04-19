package code {
	

	/***************************************************************************************************
	File			:NWControllerStatusForm
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:The sub class for the Order Status form, event listener for the submit button calls the URLLoader method on the main controller class
					Each panel has one dedicated class
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	import flash.display.MovieClip;
	import flash.events.*;
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.ComboBox;
	import flash.text.TextField;
	import fl.managers.StyleManager;
	import flash.net.URLVariables;
	import com.yahoo.astra.fl.managers.AlertManager; 
	
	
	public class NWControllerStatusForm extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		static var getStatusForm:NWView;
		static var getCombo:ComboBox;
		static var getComboQty1:ComboBox;
		static var getYourStatus:TextField;
		static var getTextField:TextField;
		public var getSubmitStatus:Button;
		public var getFormData:URLVariables;
		public var initUrlLoader: NWModel;
		private var checkForm:String;
		
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		function NWControllerStatusForm () {
			getFormData = new URLVariables ();
			getStatusForm = new NWView(5);
			addChild(getStatusForm);
			getSubmitStatus = getStatusForm.getFormPanelStatus.btnStatus;
			getYourStatus = getStatusForm.getFormPanelStatus.txtOrderStatus;
			getSubmitStatus.addEventListener (MouseEvent.CLICK, sendStatusForm);
			
		}
		function sendStatusForm(e:MouseEvent):void {
			
			initUrlLoader = new NWModel ();
			getYourStatus.text ="Please wait...";
			getFormData.getOrderNbr = getStatusForm.getFormPanelStatus.txtOrderNbr.text;
			
			//getFormData.getPhone = getStatusForm.getFormPanelStatus.txtCompanyPhone.text;
			getFormData.query = "orderStatus";
			initUrlLoader.querySelectStatusForm(getFormData);
						
			
		}
		
				
	}
}