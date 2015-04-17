package code {
/*
	Main Class for the order tracking system initializes the Controller Class also provides the static reference to the stage for all classes
*/
	/***************************************************************************************************
	File			:NWMain
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:Main Class for the order tracking system initializes the Controller Class also provides the static reference to the stage for all classes
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	import flash.display.MovieClip;
	
	public class NWMain extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		
		public static var getNWController:NWController;
		public static var getStage;
		public static var getPanelAdmin:formPanelAdmin;
		
		public var getNWControllerAdminForm:NWControllerAdminForm;
		public var getNWControllerCustomerForm:NWControllerCustomerForm;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		
		public function NWMain () {
		
			trace(stage);
			getStage = root;
			trace(getStage);
			getNWController = new NWController ();
			getNWControllerAdminForm = new NWControllerAdminForm ();
			getNWControllerCustomerForm = new NWControllerCustomerForm ();
			addChild(getNWController);
			
			getPanelAdmin = new formPanelAdmin ();
			//addChild(getNWControllerAdminForm);
		}
								
								
	}
	
}