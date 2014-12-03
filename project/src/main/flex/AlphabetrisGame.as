package
{
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.*;
	
	import mx.core.*;
	import mx.containers.*;
	import mx.events.*;
	
	import games.alphabetris.*;
	import objects.*;
	import utils.*;
	
	public class AlphabetrisGame extends BuilderTool
	{
		protected static var MAX_PIECES:int = 8;

		public var pieceStack:Array = new Array();
		protected var numPiecesByType:Array = new Array();

		public function AlphabetrisGame()
		{
		}
		
		static public function get AlphabetrisInstance():AlphabetrisGame
		{
			if ( instance == null )
				instance = new AlphabetrisGame();
			return AlphabetrisGame(instance);
		}

		override public function startup(builderCanvas:Canvas, pictureCanvas:Canvas):void
		{
			this.builderCanvas = builderCanvas;
			this.pictureCanvas = pictureCanvas;
			this.bg = new UIComponent();
			this.bg.width = FlexGlobals.topLevelApplication.width / 2;
			this.bg.height = FlexGlobals.topLevelApplication.height;
			//this.bg.width = builderCanvas.width;
			//this.bg.height = builderCanvas.height;
			this.bg.graphics.beginFill(BACKGROUND_COLOR);
			this.bg.graphics.drawRect(0, 0, this.bg.width, this.bg.height);
			this.bg.graphics.endFill();
			this.builderCanvas.addChild(this.bg);
			
			//PieceDefinitions.Instance.startup(builderCanvas);
			StateDefinitions.Instance.startup(builderCanvas);
			WordDefinitions.Instance.startup(pictureCanvas);
			changeState(StateDefinitions.Instance.States[StateIdentifiers.BLANK]);

			setupPictureCanvas();
				
			this.bg.addEventListener(DragEvent.DRAG_ENTER, canvasDragEnter);

			setupPartCounts();
			startNextPiece(null);
			var timer:Timer = new Timer(8000);
			timer.addEventListener(TimerEvent.TIMER, startNextPiece);
			timer.start();
		}

		protected function setupPartCounts():void
		{
			for each (var state:State in StateDefinitions.Instance.States)
			{
				for each (var part:Part in state.parts)
				{
					if (numPiecesByType[part.partType] == null)
						numPiecesByType[part.partType] = 0;
					numPiecesByType[part.partType] += 1;
				}
			}
		}
		
		override protected function celebrate(previousState:State, currentState:State):void
		{
			CelebrateGraphics.x = Piece.WIDTH;
			CelebrateGraphics.y = 0;
			if (!builderCanvas.contains(CelebrateGraphics))
			{
				builderCanvas.addChildAt(CelebrateGraphics, 1);
			}
			
			if (previousState != null)
			{
				var previousLetter:String = previousState.stateName;
				for each (var word:Word in WordDefinitions.Instance.WordsByLetter[previousLetter])
				{
					word.deactivate();
				}
			}
			
			if (currentState != null)
			{
				var currentLetter:String = currentState.stateName;
				var words:Array = WordDefinitions.Instance.WordsByLetter[currentLetter];
				if (words != null)
				{
					var wordIdx:int = Math.ceil(Math.random()*words.length) - 1;
					words[wordIdx].activate();
				}
			}
			
			// Go back to blank in a few seconds
			var timer:Timer = new Timer(3000, 1);
			timer.addEventListener(TimerEvent.TIMER, backToBlank);
			timer.start();
			
		}
		
		protected function backToBlank(event:Event):void
		{
//			for each (var state:State in StateDefinitions.Instance.States)
//			{
//				state.morphBack();
//			}
			changeState(StateDefinitions.Instance.States[StateIdentifiers.BLANK]);
		}
				
		protected function pickNextPiece():AlphabetrisPiece
		{
			//var pieceType:int = MathUtils.randomInteger(0, PieceIdentifiers.IDENTIFIERS.length);
			//return new AlphabetrisPiece(PieceIdentifiers.IDENTIFIERS[pieceType]);
			
			var totalPieces:int = 0;
			for each (var count:int in numPiecesByType)
			{
				totalPieces += count;
			}
			var pieceScore:int = MathUtils.randomInteger(0, totalPieces);
			var sofar:int = 0;
			var nextPiece:AlphabetrisPiece = null;
			for (var pieceType:String in numPiecesByType)
			{
				if (sofar + numPiecesByType[pieceType] > pieceScore)
				{
					nextPiece = new AlphabetrisPiece(pieceType);
					break;
				}
				sofar += numPiecesByType[pieceType];
			}
			return nextPiece;
		}
		
		protected function startNextPiece(event:Event):void
		{
			if (pieceStack.length < MAX_PIECES)
			{
				var nextPiece:AlphabetrisPiece = pickNextPiece();
				pieceStack.push(nextPiece);
				// put it on stack
				nextPiece.startupPiece(this.builderCanvas, 0, 0);
				// start tween to bottom
				nextPiece.moveToSlot(indexToOrder(pieceStack.length - 1));
			}
			else
			{
				// GAME OVER!
			}
		}
		
		public function removePiece(order:int):void
		{
			var index:int = orderToIndex(order);
			var piece:AlphabetrisPiece = pieceStack[index];
			piece.setOrder(0);
			pieceStack.splice(index, 1);
			var i:int;
			for (i = 0; i < pieceStack.length; i++)
			{
				// move others down
				pieceStack[i].moveToSlot(indexToOrder(i));
			}			
		}
		
		public function returnPiece(piece:AlphabetrisPiece):void
		{
			pieceStack.push(piece);
			piece.setOrder(orderToIndex(pieceStack.length-1));
		}
		
		/*
		 * Converts a Piece order value to a stack index
		 */
		protected function orderToIndex(order:int):int
		{
			return MAX_PIECES - order;
		}
		
		/*
		 * Converts a stack index value to a Piece order number
		 */
		protected function indexToOrder(index:int):int
		{
			return MAX_PIECES - index;
		}

		
		/*******************************************
		 * FACTORY METHODS
		 *******************************************/
		 
		 override public function newPiece(type:String):Piece
		 {
			return new AlphabetrisPiece(type);
		 }
		 
		 override public function newPart(name:String, partType:String, dropPoint:Point, lines:Array, from:State, to:State):Part
		 {
			return new AlphabetrisPart(name, partType, dropPoint, lines, from, to);
		 }
		 
	}
}