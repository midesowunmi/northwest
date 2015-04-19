package code {

	/***************************************************************************************************
	File			:NWController
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		: Main Controller Class has listeners for the Navigation buttons adds the Forms to stage when Nav btn is clicked
					And also the Tweener effect
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	
	import flash.events.*;
	import flash.display.MovieClip;
	import caurina.transitions.Tweener;
	public class NWController extends MovieClip {
		
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		private var btnAdmin:MovieClip;
		private var btnOrderStatus:MovieClip;
		private var btnOrderNew:MovieClip;
		private var btnNewCustomer:MovieClip;
		public var getStage:MovieClip;
		
		public var getNWView:NWView;
		public var initAdminPanel:NWView;
		private var getCustomerForm:NWControllerCustomerForm;
		private var getOrderForm: NWControllerOrderForm;
		private var getAdminForm: NWControllerAdminForm;
		private var getStatusForm: NWControllerStatusForm;
		private var currPanel:MovieClip;
		private var currNav:String ="admin";
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------		
		
		public function NWController () {
			getNWView = new NWView (1);
			//initAdminPanel = new NWView(3);
			//currPanel = MovieClip(initAdminPanel);
			//NWMain.getStage.addChild (initAdminPanel);
			addChild(getNWView);
			
			addEventListener(Event.ADDED_TO_STAGE, initController);
			
			
		}
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		private function initController(e:Event):void {
			trace("initController");
			trace(NWMain.getStage);
			getCustomerForm = new NWControllerCustomerForm ();
			getOrderForm = new NWControllerOrderForm;
			getStatusForm = new NWControllerStatusForm;
			getAdminForm = new NWControllerAdminForm;
			currPanel = MovieClip (getAdminForm);
			NWMain.getStage.addChild(getAdminForm);
			trace(getNWView.getNavPanel.admin_mc.y);
			btnAdmin = getNWView.getNavPanel.admin_mc;
			btnOrderStatus = getNWView.getNavPanel.status_mc;
			btnOrderNew = getNWView.getNavPanel.neworder_mc;
			btnNewCustomer = getNWView.getNavPanel.newcustomer_mc;
			
			btnOrderStatus.alpha = 0.5;
			btnOrderNew.alpha = 0.5;
			btnNewCustomer.alpha = 0.5;
			btnAdmin.y = 14;
			btnAdmin.addEventListener(MouseEvent.MOUSE_OVER, btnAdminOver);
			//btnAdmin.addEventListener(MouseEvent.MOUSE_OUT, btnAdminOut);
			//btnAdmin.addEventListener(MouseEvent.CLICK, btnAdminClick);
			
			btnOrderStatus.addEventListener(MouseEvent.MOUSE_OVER, btnOrderStatusOver);
			btnOrderStatus.addEventListener(MouseEvent.MOUSE_OUT, btnOrderStatusOut);
			btnOrderStatus.addEventListener(MouseEvent.CLICK, btnOrderStatusClick);
						
			btnOrderNew.addEventListener(MouseEvent.MOUSE_OVER, btnOrderNewOver);
			btnOrderNew.addEventListener(MouseEvent.MOUSE_OUT, btnOrderNewOut);
			btnOrderNew.addEventListener(MouseEvent.CLICK, btnOrderNewClick);
			
			btnNewCustomer.addEventListener(MouseEvent.MOUSE_OVER, btnNewCustomerOver);
			btnNewCustomer.addEventListener(MouseEvent.MOUSE_OUT, btnNewCustomerOut);
			btnNewCustomer.addEventListener(MouseEvent.CLICK, btnNewCustomerClick);
		}
		function updateNav(currNav) {
			switch (currNav) {
				case "admin": btnAdmin.addEventListener(MouseEvent.CLICK, btnAdminClick);
				btnAdmin.addEventListener(MouseEvent.MOUSE_OUT, btnAdminOut);
				Tweener.addTween(btnAdmin, {y:25, time:1, transition:"easeoutelastic"});
				break;
				case "orderstatus" : btnOrderStatus.addEventListener(MouseEvent.CLICK, btnOrderStatusClick);
				btnOrderStatus.addEventListener(MouseEvent.MOUSE_OUT, btnOrderStatusOut);
				Tweener.addTween(btnOrderStatus, {y:25, time:1, transition:"easeoutelastic"});
				break;
				case "ordernew" : btnOrderNew.addEventListener(MouseEvent.CLICK, btnOrderNewClick);
				btnOrderNew.addEventListener(MouseEvent.MOUSE_OUT, btnOrderNewOut);
				Tweener.addTween(btnOrderNew, {y:25, time:1, transition:"easeoutelastic"});
				break;
				case "newcustomer" : btnNewCustomer.addEventListener(MouseEvent.CLICK, btnNewCustomerClick);
				btnNewCustomer.addEventListener(MouseEvent.MOUSE_OUT, btnNewCustomerOut);
				Tweener.addTween(btnNewCustomer, {y:25, time:1, transition:"easeoutelastic"});
				break;
				default: null;
				
			}
			
			
		}
		private function btnAdminOver(e:MouseEvent):void {
			
			Tweener.addTween(btnAdmin, {y:14, time:1, transition:"easeoutelastic"});
			
		}
		private function btnAdminOut(e:MouseEvent):void {
			
			Tweener.addTween(btnAdmin, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		private function btnAdminClick(e:MouseEvent):void {
			trace("click admin");
			NWView.removePanel(currPanel);
			btnAdmin..alpha = 1;
			btnOrderStatus.alpha = 0.5;
			btnOrderNew.alpha = 0.5;
			btnNewCustomer.alpha = 0.5;
			NWMain.getStage.addChild(getAdminForm); // puts the admin form on screen
			currPanel = MovieClip(getAdminForm);
			e.target.removeEventListener(MouseEvent.CLICK, btnAdminClick);
			e.target.removeEventListener(MouseEvent.MOUSE_OUT, btnAdminOut);
			if(currNav !== "admin"){
			updateNav(currNav);
			}
			currNav = "admin";
			
			//Tweener.addTween(btnAdmin, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		
		private function btnOrderStatusOver(e:MouseEvent):void {
			
			Tweener.addTween(btnOrderStatus, {y:14, time:1, transition:"easeoutelastic"});
			
		}
		private function btnOrderStatusOut(e:MouseEvent):void {
			
			Tweener.addTween(btnOrderStatus, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		private function btnOrderStatusClick(e:MouseEvent):void {
			trace("click status");
			if(formPanelAdmin.currGrid !== null){
				formPanelAdmin.currGrid.x = -800;
				
			}
			NWView.removePanel(currPanel);
			btnAdmin..alpha = 0.5;
			btnOrderStatus.alpha = 1;
			btnOrderNew.alpha = 0.5;
			btnNewCustomer.alpha = 0.5;
			NWMain.getStage.addChild(getStatusForm);
			currPanel = MovieClip(getStatusForm);
			e.target.removeEventListener(MouseEvent.CLICK, btnOrderStatusClick);
			e.target.removeEventListener(MouseEvent.MOUSE_OUT, btnOrderStatusOut);
			if(currNav !== "orderstatus"){
			updateNav(currNav);
			}
			currNav = "orderstatus";
			
			//Tweener.addTween(btnAdmin, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		private function btnOrderNewOver(e:MouseEvent):void {
			
			Tweener.addTween(btnOrderNew, {y:14, time:1, transition:"easeoutelastic"});
			
		}
		private function btnOrderNewOut(e:MouseEvent):void {
			
			Tweener.addTween(btnOrderNew, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		private function btnOrderNewClick(e:MouseEvent):void {
			if(formPanelAdmin.currGrid !== null){
				formPanelAdmin.currGrid.x = -800;				
			}
			NWView.removePanel(currPanel);
			btnAdmin..alpha = 0.5;
			btnOrderStatus.alpha = 0.5;
			btnOrderNew.alpha = 1;
			btnNewCustomer.alpha = 0.5;
			//NWMain.getStage.removeChild(currPanel);
			NWMain.getStage.addChild(getOrderForm);
			currPanel = MovieClip(getOrderForm);
			e.target.removeEventListener(MouseEvent.CLICK, btnOrderNewClick);
			e.target.removeEventListener(MouseEvent.MOUSE_OUT, btnOrderNewOut);
			if(currNav !== "ordernew"){
			updateNav(currNav);
			}
			currNav = "ordernew";
			//Tweener.addTween(btnAdmin, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		
		private function btnNewCustomerOver(e:MouseEvent):void {
			
			Tweener.addTween(btnNewCustomer, {y:14, time:1, transition:"easeoutelastic"});
			
		}
		private function btnNewCustomerOut(e:MouseEvent):void {
			
			Tweener.addTween(btnNewCustomer, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		private function btnNewCustomerClick(e:MouseEvent):void {
			if(formPanelAdmin.currGrid !== null){
				formPanelAdmin.currGrid.x = -800;				
			}
			NWView.removePanel(currPanel);
			btnAdmin..alpha = 0.5;
			btnOrderStatus.alpha = 0.5;
			btnOrderNew.alpha = 0.5;
			btnNewCustomer.alpha = 1;
			NWMain.getStage.addChild(getCustomerForm);
			currPanel = MovieClip(getCustomerForm);
			e.target.removeEventListener(MouseEvent.CLICK, btnNewCustomerClick);
			e.target.removeEventListener(MouseEvent.MOUSE_OUT, btnNewCustomerOut);
			if(currNav !== "newcustomer"){
			updateNav(currNav);
			}
			currNav = "newcustomer";
			//Tweener.addTween(btnAdmin, {y:25, time:1, transition:"easeoutelastic"});
			
		}
		
	}
	
}