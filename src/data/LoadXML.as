package data
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class LoadXML extends EventDispatcher
	{
		public static const XML_LOADED		: String = "XML.Loaded";
		private static const URL		: String = "./xml/";
		
		private var _xml					: XML;
		
		public function LoadXML()
		{
			// ...
		}
		
		public function init($xml:String) : void
		{
			var _loader : URLLoader = new URLLoader();	
			_loader.load(new URLRequest(URL + $xml));
			_loader.addEventListener(Event.COMPLETE, _processXML);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
		}
		
		private function _processXML($e:Event) : void
		{
			_xml = new XML($e.target.data);
			dispatchEvent(new Event(LoadXML.XML_LOADED));
		}
		
		private function _onIOError($e:IOErrorEvent) : void
		{
			trace ("Data did not load :: " + $e);
		}
		
		public function get data() : XML
		{
			return _xml;
		}
	}
}