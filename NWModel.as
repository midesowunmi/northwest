package code {

	/***************************************************************************************************
	File			:NWModel
	Package			:code
	Project         :NorthWest Order Tracking System 
	Developer		:Mide Sowunmi
	Creation Date	:Nov. 14, 2009
	Description		:main model class provides database connection for all SQL queries, URLRequest to the PHP file that connects to the mySQL database
					Also sends the URLVariables that contain the query id (used to select the right query) and the form data i.e field values
	****************************************************************************************************/

	// -----------------------------------
	// ------------ IMPORTS --------------
	// -----------------------------------
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.events.*;
	import flash.xml.*;
	import com.yahoo.astra.fl.managers.AlertManager; 
	
	public class NWModel extends MovieClip {
		// -----------------------------------
		// ----------- CONSTANTS -------------
		// -----------------------------------

	
		// -----------------------------------
		// ----- VARIABLE DECLARATIONS -------
		// -----------------------------------	
		public var myUrlLoader:URLLoader;
		public var myUrlReq:URLRequest;
		public var myUrlVars:URLVariables;
		static var xmlQuery:XML;
		static var xmlEmp:XML;
		static var xmlOrders:XML;
		static var xmlInv:XML;
		static var xmlProd:XML;
		static var yourOrderStatus:String;
		private var getPanelOrder:formPanelOrder;
		private var getPanelStatus:formPanelStatus;
		//private var getPanelAdmin:formPanelAdmin;
		
		// -----------------------------------
		// ------- GETTERS & SETTERS ---------
		// -----------------------------------


		// -----------------------------------
		// ----------- CONSTRUCTOR -----------
		// -----------------------------------	
		public function NWModel () {

			trace("init NWModel");
			getPanelOrder = new formPanelOrder ();
			getPanelStatus = new formPanelStatus ();
			//getPanelAdmin = new formPanelAdmin ();
			
						
		}
		
						
		// -----------------------------------
		// ------------ METHODS --------------
		// -----------------------------------	
		public function queryInsertCustomerForm(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, formLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			trace("panel = " +NWMain.getStage.getChildAt(1).name);//getChildByName("getFormPanelCustomer"));
			
		}
		public function formLoaded(e:Event):void {
			
			xmlQuery = new XML();
			//getPanelOrder = new formPanelOrder ();
			trace("loaded");
			trace(e.target.data);
			//xmlQuery.ignoreWhitespace;
			//xmlQuery = XML(e.target.data);
			//getPanelOrder.populateCombo();
			var getPanel:DisplayObject = NWMain.getStage.getChildAt(1);
			AlertManager.createAlert(getPanel,e.target.data);
						
		}
		public function queryInsertOrderForm(myUrlVars):void {
			this.dispatchEvent(new DataLoadedEvent(DataLoadedEvent.LOADED,true,false));
			trace("dispatch LOADED");
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, orderSent);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		public function orderSent(e:Event):void {
			//trace(e.target.data);
			var getPanel:DisplayObject = NWMain.getStage.getChildAt(1);
			AlertManager.createAlert(getPanel,e.target.data);
			
		}
		public function querySelectOrderForm(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, productsLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		public function productsLoaded(e:Event):void {
			trace("product List loaded");
			xmlQuery = new XML();
			xmlQuery.ignoreWhitespace;
			xmlQuery = XML(e.target.data);
			getPanelOrder.populateCombo();
		}
		public function querySelectStatusForm(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, statusLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		public function statusLoaded (e:Event):void {
			trace(e.target.data);
			yourOrderStatus = e.target.data;
			getPanelStatus.showStatus ();
		}
		public function querySelectEmployees(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, empLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		function empLoaded (e:Event):void {
			//trace(e.target.data);
			trace("emp List loaded");
			xmlEmp = new XML();
			xmlEmp.ignoreWhitespace;
			xmlEmp = XML(e.target.data);
			var getPanel:DisplayObject = NWMain.getStage.getChildAt(1);
			trace("getPanel is " +NWMain.getStage.numChildren);
			NWMain.getPanelAdmin.populateEmpGrid();
		}
		public function querySelectOrders(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, ordersLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		function ordersLoaded (e:Event):void {
			//trace(e.target.data);
			xmlOrders = new XML();
			xmlOrders.ignoreWhitespace;
			xmlOrders = XML(e.target.data);
			NWMain.getPanelAdmin.populateOrdersGrid();
			
		}
		
		public function querySelectInv(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, invLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		function invLoaded (e:Event):void {
			//trace(e.target.data);
			xmlInv = new XML();
			xmlInv.ignoreWhitespace;
			xmlInv = XML(e.target.data);
			NWMain.getPanelAdmin.populateInvGrid();
			
		}
		public function querySelectProd(myUrlVars):void {
			myUrlLoader = new URLLoader ();
			myUrlLoader.addEventListener(Event.COMPLETE, prodLoaded);
			myUrlLoader.addEventListener(IOErrorEvent.IO_ERROR, error);
			myUrlReq = new URLRequest("http://www.tutu-inc.com/php/flashForm.php");
			myUrlReq.method = URLRequestMethod.POST;
			myUrlReq.data = myUrlVars;
			trace("myUrlVars = " +myUrlVars);
			myUrlLoader.load(myUrlReq);
			
		}
		function prodLoaded (e:Event):void {
			trace(e.target.data);
			xmlProd = new XML();
			xmlProd.ignoreWhitespace;
			xmlProd = XML(e.target.data);
			NWMain.getPanelAdmin.populateProductGrid();
			
		}
		function error(e:IOErrorEvent):void {
			trace("there was an error loading your form into the database");
			
		}
	}
	
}