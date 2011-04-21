package 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	
	public class Main extends Sprite 
	{
		
		private var _data:ByteArray;
		
		public function Main():void 
		{
			// create clickable region
			var input:FileReference = new FileReference();
			
			input.addEventListener(Event.SELECT, function (event:Event):void {
				input.load();
			});
			
			input.addEventListener(Event.COMPLETE, function (event:Event):void {
				// decode and save file
				var content:String = input.data.readUTFBytes(input.data.length);
				var file:FileReference = new FileReference();
				file.save(Base64.decode(content), "cert.spc");					
			});

			var textfield:TextField = new TextField();
			textfield.defaultTextFormat = new TextFormat("Arial", "10", 0x000000, null, null, null, null, null, "center");
			textfield.background = true;
			textfield.backgroundColor = 0xCCCCCC;
			textfield.width = 100;
			textfield.height = 20;
			textfield.x = 10;
			textfield.y = 10;
			textfield.selectable = false;
			textfield.text = "Open";
			stage.addChild(textfield);
			
			textfield.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
				input.browse();
			});
		}
		
	}
	
}