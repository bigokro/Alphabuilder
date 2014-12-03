package objects
{
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	
	import mx.core.*;

	public class DropPoint extends BuilderObject
	{
		protected var hovering:Boolean = false;
		protected var newState:String = StateIdentifiers.BLANK;
		
		public function DropPoint()
		{			
			super();
		}
		
		public function startupDropPoint(location:Point, nextState:String):void
		{
			super.startupBuilderObject(StatesResourceManager.DropPointGraphics, location, ZOrders.STATEZORDER);
		}
		
		override public function shutdown():void
		{
			super.shutdown();
		}
		
		override public function enterFrame(dt:Number):void
		{
			super.enterFrame(dt);
		}
		
		override public function mouseMove(event:MouseEvent):void
		{
			// TODO: if dragging over this drop point (or moving out), change graphics
		}
		
		override public function mouseDown(event:MouseEvent):void
		{
		}
		
		override public function mouseUp(event:MouseEvent):void
		{
			// TODO: handle drop
			if (hovering)
			{
				doDrop();
			}
		}
		
		protected function doDrop()
		{
			BuilderTool.changeState(newState);
		}
	}
}