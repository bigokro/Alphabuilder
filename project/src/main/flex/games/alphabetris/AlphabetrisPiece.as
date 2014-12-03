package games.alphabetris
{
	import flash.events.*;
	import flash.geom.*;
	import flash.display.*;
	import flash.media.*;
	
	import mx.core.*;
	import mx.containers.*;
	import mx.events.*;
	import mx.effects.*;
	import mx.effects.easing.*;
	
	import utils.*;
	import objects.*;

	/*
	 * Pieces in the Alphabetris game, with game-specific handlers
	 */
	public class AlphabetrisPiece extends Piece
	{
		protected var slotMovement:Move = null;
		
		public function AlphabetrisPiece(partType:String)
		{			
			super(partType);
		}
		
		override public function mouseDown(event:MouseEvent):void
		{
			super.mouseDown(event);

			if (isInSlot())
			{
				AlphabetrisGame.AlphabetrisInstance.removePiece(this.order);
			}
		}
		
		override public function mouseUp(event:MouseEvent):void
		{
			endDrag();
			if (!pieceOverDropPoint(event))
			{
				AlphabetrisGame.AlphabetrisInstance.returnPiece(this);
				returnToHome();
				this.activate();
				this.state = STATE_UNSELECTED;
			}
			BuilderTool.Instance.currentState.releasePiece(this);
		}		
		
		/*
		 * Move the Piece to the slot in the stack
		 */
		public function moveToSlot(i:int):void
		{
			var slotsToMove:int = i - this.order;
			setOrder(i);
			if (slotMovement == null)
			{
				slotMovement = new Move(this);
				slotMovement.easingFunction = Linear.easeOut;
			}
			slotMovement.yFrom = this.y;
			slotMovement.yTo = this.homeY;
			slotMovement.duration = ((slotMovement.yTo - slotMovement.yFrom) / HEIGHT) * 1000;
			slotMovement.end();
			slotMovement.play();
		}
		
		public function isInSlot():Boolean
		{
			return this.order > 0;
		}
	}
}