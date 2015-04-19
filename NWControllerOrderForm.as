package code {

	/***************************************************************************************************
	File			:NWControllerOrderForm
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:The sub controller for new order form gets the form data and passes them into the URLVariable object attributes.
					has event listener for the submit button and instantiates NWModel doe database access to insert new order
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
	
	
	public class NWControllerOrderForm extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		static var getOrderForm:NWView;
		static var getCombo:ComboBox;
		static var getComboQty1:ComboBox;
		static var getTextField:TextField;
		public var getSubmitOrder:Button;
		public var getFormData:URLVariables;
		public var initUrlLoader: NWModel;
		private var checkForm:String;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		function NWControllerOrderForm () {
			getFormData = new URLVariables ();
			getOrderForm = new NWView(4);
			addChild(getOrderForm);
			getSubmitOrder = getOrderForm.getFormPanelOrder.btnOrder;
			getSubmitOrder.addEventListener (MouseEvent.CLICK, sendOrderForm);
			getCombo = getOrderForm.getFormPanelOrder.cbProductList;
			getComboQty1 = getOrderForm.getFormPanelOrder.productQty1;
			getTextField = getOrderForm.getFormPanelOrder.txtProductName;;
		}
		
				
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		function sendOrderForm(e:MouseEvent):void {
			
			initUrlLoader = new NWModel ();
			initUrlLoader.addEventListener(DataLoadedEvent.LOADED, showLoaded);
			getFormData.getProduct1 = formPanelOrder.getProduct1;//getOrderForm.getFormPanelOrder.cbProductList.value;
			getFormData.getQty1 = formPanelOrder.getQty1;//getOrderForm.getFormPanelOrder.productQty1.selectedIndex;
			getFormData.getPrice1 = formPanelOrder.getPrice1;
			getFormData.getOrderTotal = Number(formPanelOrder.getQty1 * formPanelOrder.getPrice1);
			trace("qty = "+ formPanelOrder.getQty1);
			//getFormData.getTitle = getOrderForm.getFormPanelOrder.txtContactTitle.text;
			//getFormData.getPhone = getOrderForm.getFormPanelOrder.txtCompanyPhone.text;
			getFormData.query = "newOrder";
			initUrlLoader.queryInsertOrderForm(getFormData);
						
			
		}
		function showLoaded(e:DataLoadedEvent):void {
			trace("dataloaded event!!!");
		}
				
	}
}