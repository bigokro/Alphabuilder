package objects
{
	import flash.events.*;
	import flash.geom.*;
	import flash.display.*;
	import flash.media.*;
	
	import mx.core.*;
	import mx.containers.*;
	import mx.events.*;

	public class Word
	{
		public var name:String = null;
		public var category:String = null;
		public var images:Array = null;
		private var container:UIComponent = new UIComponent();
		private var canvas:Canvas = null;
		
		public function Word(name:String, category:String, images:Array):void
		{			
			super();
			this.name = name;
			this.category = category;
			this.images = images;
		}

		public function startup(canvas:Canvas):void
		{
			this.canvas = canvas;
		}
		
		public function activate():void
		{
			var image:int = Math.ceil(Math.random()*images.length) - 1;
			if (!container.contains(images[image]))
			{
				container.width = images[image].width;
				container.height = images[image].height;
				container.addChild(images[image]);
			}
			if (!canvas.contains(container))
			{
				canvas.addChild(container);
			}
		}
		
		public function get FirstLetter():String
		{
			return this.name.charAt(0);
		}
		
		public function deactivate():void
		{
			sendPictureToLetter(container);
			container = new UIComponent();
		}
		
		public function goToLetter(event:Event):void
		{
			deactivate();
		}
		
		public function pictureMouseClickOn(event:MouseEvent):void
		{
			var picture:UIComponent = UIComponent(event.currentTarget);
			picture.parent.removeChild(picture);
			picture.scaleX = 1.0;
			picture.scaleY = 1.0;
			if (!canvas.contains(picture))
			{
				canvas.addChild(picture);
			}
			picture.removeEventListener(MouseEvent.CLICK, pictureMouseClickOn);
			picture.addEventListener(MouseEvent.CLICK, pictureMouseClickOff);
		}
		
		public function pictureMouseClickOff(event:MouseEvent):void
		{
			var picture:UIComponent = UIComponent(event.currentTarget);
			sendPictureToLetter(picture);
			picture.removeEventListener(MouseEvent.CLICK, pictureMouseClickOff);
			picture.addEventListener(MouseEvent.CLICK, pictureMouseClickOn);
		}

		protected function sendPictureToLetter(picture:UIComponent):void
		{
			if (canvas.contains(picture))
			{
				canvas.removeChild(picture);
			}
			//var letter:UIComponent = AlphabetrisGame.Instance.letters[this.FirstLetter];
			var letter:UIComponent = BuilderTool.Instance.letters[this.FirstLetter];
			if (!letter.contains(picture))
			{
				picture.scaleX = letter.width / picture.width;
				picture.scaleY = letter.height / picture.height;
				letter.addChild(picture);
				picture.addEventListener(MouseEvent.CLICK, pictureMouseClickOn);
			}
		}
	}
	
}