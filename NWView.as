package code {

	/***************************************************************************************************
	File			:NWView
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:The main view Class interface to create all panels using the integer argument it's like a factory with concrete methods
					sets the coordinates for the panels
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	import flash.display.*;
	import flash.events.*;
	
	public class NWView extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		public var getNavPanel: navPanel;
		public var getFormPanelAdmin: formPanelAdmin;
		public var getFormPanelCustomer: formPanelCustomer;
		public var getFormPanelOrder: formPanelOrder;
		public var getFormPanelStatus: formPanelStatus;
		public var init:int;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		
		public function NWView (init) {
			switch (init){
				
				case 1 : makeNavPanel();
				break;
				case 2 : makeCustomerForm();
				break;
				case 3 : makeAdminForm();
				break;
				case 4 : makeOrderForm();
				break;
				case 5 : makeStatusForm();
				break;
				default: null;
			}
			
			
		}
		
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		internal function makeNavPanel () {
			getNavPanel = new navPanel;
			getNavPanel.x = 365;
			getNavPanel.y = 70;
			addChild(getNavPanel);
		}
		internal function makeCustomerForm () {
			getFormPanelCustomer = new formPanelCustomer ();
			getFormPanelCustomer.x = 392;
			getFormPanelCustomer.y = 549;
			addChild(getFormPanelCustomer);
			
			
		}
		internal function makeAdminForm () {
			getFormPanelAdmin = new formPanelAdmin ();
			getFormPanelAdmin.x = 392;
			getFormPanelAdmin.y = 549;
			addChild(getFormPanelAdmin);
			
		}
		internal function makeOrderForm () {
			getFormPanelOrder = new formPanelOrder ();
			getFormPanelOrder.x = 392;
			getFormPanelOrder.y = 549;
			//getFormPanelOrder.alpha = 0.5;
			addChild(getFormPanelOrder);
			
		}
		internal function makeStatusForm () {
			getFormPanelStatus = new formPanelStatus ();
			getFormPanelStatus.x = 392;
			getFormPanelStatus.y = 549;
			//getFormPanelStatus.alpha = 0.5;
			addChild(getFormPanelStatus);
			
		}
		static function removePanel (currPanel) {
			NWMain.getStage.removeChild(currPanel);
			trace("static");
			
		}
	}
	
}