package code {
	
	/***************************************************************************************************
	File			:NWControllerAdminForm
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:The sub class for the Admin panel form, event listener for the different Admin buttons, calls the URLLoader method on the main controller class Each panel has one dedicated class
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.*;
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.dataGridClasses.DataGridColumn;
	import fl.controls.DataGrid;
	import fl.data.DataProvider;
	import fl.managers.StyleManager;
	import flash.net.URLVariables;
	import com.yahoo.astra.fl.managers.AlertManager;  
 
	
	public class NWControllerAdminForm extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		public var getAdminForm:NWView;
		public var getCompanyName:String;
		public var getEmp:SimpleButton;
		public var getInventory:SimpleButton;
		public var getOrders:SimpleButton;
		public var getProducts:SimpleButton;
		public var getFormData:URLVariables;
		public var initUrlLoader: NWModel;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------
		
		function NWControllerAdminForm () {
			getFormData = new URLVariables ();
			getAdminForm = new NWView(3);
			addChild(getAdminForm);
			initUrlLoader = new NWModel ();
			
			getEmp = getAdminForm.getFormPanelAdmin.btnEmployees;
			getEmp.addEventListener (MouseEvent.CLICK, getEmployeeList);
			getInventory = getAdminForm.getFormPanelAdmin.btnInventory;
			getInventory.addEventListener (MouseEvent.CLICK, getInventoryList);
			getOrders = getAdminForm.getFormPanelAdmin.btnOrders;
			getOrders.addEventListener (MouseEvent.CLICK, getOrdersList);
			getProducts = getAdminForm.getFormPanelAdmin.btnProducts;
			getProducts.addEventListener (MouseEvent.CLICK, getProductsList);
		}
		
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		
		function getEmployeeList(e:MouseEvent):void {
			getFormData.query = "employees";
			trace("sendAdmin");
			
			initUrlLoader.querySelectEmployees(getFormData);
			
		}
		function getInventoryList(e:MouseEvent):void {
			getFormData.query = "inventory";
			//initUrlLoader = new NWModel ();
			initUrlLoader.querySelectInv(getFormData);
			trace("sendInv");
			
		}
		function getOrdersList(e:MouseEvent):void {
			getFormData.query = "orders";
			//initUrlLoader = new NWModel ();
			initUrlLoader.querySelectOrders(getFormData);
			trace("sendOrders");
			
		}
		function getProductsList(e:MouseEvent):void {
			getFormData.query = "products";
			//initUrlLoader = new NWModel ();
			initUrlLoader.querySelectProd(getFormData);
			trace("sendProducts");
			
		}
		
	}
}