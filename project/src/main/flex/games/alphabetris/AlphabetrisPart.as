package games.alphabetris
{
	import flash.events.*;
	import flash.geom.*;
	import flash.display.*;
	import flash.media.*;
	
	import mx.core.*;
	import mx.events.*;
	import mx.effects.*;
	import mx.containers.*;
	import mx.managers.DragManager;

	import utils.*;
	import objects.*
	
	/*
	 * Parts in the Alphabetris game, with game-specific handlers
	 */
	public class AlphabetrisPart extends Part
	{
		public function AlphabetrisPart(name:String, partType:String, dropPoint:Point, lines:Array, from:State, to:State)
		{			
			super(name, partType, dropPoint, lines, from, to);
		}
		
		override public function partMouseMove(event:MouseEvent):void
		{
			if (removing)
			{
				if (true) // Moves far enough away
				{
					removing = false;
					doRemove();
					var piece:Piece = BuilderTool.Instance.newPiece(partType);
					piece.startupOrderedPiece(this.canvas, 0);
					piece.mouseDown(event);
					pointMouseOut(event);
				}
			}
		}
		
	}
}