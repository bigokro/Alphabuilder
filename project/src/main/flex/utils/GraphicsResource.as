package utils
{
	import flash.display.*;
	import flash.geom.*;
	import mx.core.*;
	import mx.containers.*;
		
	public class GraphicsResource extends UIComponent
	{
		public var bitmap:BitmapData = null;
		public var image:DisplayObject = null;
		public var frames:int = 1;
		public var fps:Number = 0;
		public var drawRect:Rectangle = null;
		
		public function GraphicsResource(image:DisplayObject, frames:int = 1, fps:Number = 0, drawRect:Rectangle = null)
		{
			this.image = image;
			bitmap = createBitmapData(image);
			this.frames = frames;
			this.fps = fps;
			if (drawRect == null)
				this.drawRect = bitmap.rect;
			else
				this.drawRect = drawRect;
		}
		
		protected function createBitmapData(image:DisplayObject):BitmapData
		{
			var bitmapData:BitmapData = new BitmapData(image.width, image.height);
			this.addChild(image);
			return bitmapData;
		}

	}
}