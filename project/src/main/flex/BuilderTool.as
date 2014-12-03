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
	import mx.managers.DragManager;
	
	import objects.*;
	import utils.*;
	
	public class BuilderTool
	{
		[Embed(source="../media/states/celebrate.png")]
		public static var CelebrateImage:Class;
		public static var CelebrateGraphics:GraphicsResource = new GraphicsResource(new CelebrateImage());
		public static var PIECE_MORPH_RANGE:int = 150;	// In % value of total canvas
		public static var PIECE_DROP_RANGE:int = 100;	// In % value of total canvas
		protected static var BACKGROUND_COLOR:int = 0xFFFFFF;
	
		protected static var instance:BuilderTool = null;
		
		public var currentState:State = null;
		public var currentPiece:Piece = null;
		public var letters:Array = new Array();
		protected var builderCanvas:Canvas = null;
		protected var pictureCanvas:Canvas = null;
		protected var bg:UIComponent = null;

		static public function get Instance():BuilderTool
		{
			if ( instance == null )
				instance = new BuilderTool();
			return instance;
		}
		
		
		public function BuilderTool()
		{
	
		}
		
		public function startup(builderCanvas:Canvas, pictureCanvas:Canvas):void
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
			
			PieceDefinitions.Instance.startup(builderCanvas);
			StateDefinitions.Instance.startup(builderCanvas);
			WordDefinitions.Instance.startup(pictureCanvas);
			changeState(StateDefinitions.Instance.States[StateIdentifiers.BLANK]);

			setupPictureCanvas();
				
			this.bg.addEventListener(DragEvent.DRAG_ENTER, canvasDragEnter);
		}
		
		protected function setupPictureCanvas():void
		{
			var picbg:UIComponent = new UIComponent();
			picbg.width = FlexGlobals.topLevelApplication.width / 2;
			picbg.height = FlexGlobals.topLevelApplication.height;
			DrawingUtils.drawBorder(picbg);
			this.pictureCanvas.addChild(picbg);

			var count:int = 0;
			var letterGrid:Grid = new Grid();
			var row:GridRow = null
			var stateKeys:Array = ArrayUtils.getKeysForArray(StateDefinitions.Instance.States);
			for each (var key:String in stateKeys.sort())
			{
				var state:State = StateDefinitions.Instance.States[key];
				if (state.isLetter)
				{
					if (count % 4 == 0)
					{
						row = new GridRow();
						letterGrid.addChild(row);
					}
					var letterItem:GridItem = new GridItem();
					row.addChild(letterItem);
					var letterBox:UIComponent = new UIComponent();
					letterBox.width = Piece.WIDTH;
					letterBox.height = Piece.HEIGHT;
					DrawingUtils.drawBorder(letterBox);
					state.drawSelf(letterBox);
					letterItem.addChild(letterBox);
					this.letters[state.stateName] = letterBox;
					
					count++;
				}
			}
			this.pictureCanvas.addChild(letterGrid);
		}

        public function canvasDragEnter(event:DragEvent):void {
			// Just to get rid of the ugly no drop icon
			DragManager.acceptDragDrop(UIComponent(event.currentTarget));
		}
			
		public function changeState(state:State):void
		{
			var previousState:State = currentState;
			currentState = state;
			if (previousState != null)
				previousState.deactivate();
			state.activate();
			
			// Reset part sources
			for each (var piece:Piece in PieceDefinitions.Instance.Pieces)
			{
				piece.returnToHome();
				if (currentState.partCanBeAdded(piece.partType))
					piece.activate();
				else
					piece.deactivate();
			}
			
			if (state.isLetter)
			{
				celebrate(previousState, currentState);
			}
			else
			{
				backToNormal(previousState, currentState);
			}
		}
		
		public function shutdown():void
		{
		}

		protected function celebrate(previousState:State, currentState:State):void
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
			
			// Move the picture to the letter in a few seconds
			var timer:Timer = new Timer(4000, 1);
			timer.addEventListener(TimerEvent.TIMER, words[wordIdx].goToLetter);
			timer.start();

		}
		
		protected function backToNormal(previousState:State, currentState:State):void
		{
			if (builderCanvas.contains(CelebrateGraphics))
			{
				builderCanvas.removeChild(CelebrateGraphics);
			}
			
			if (previousState != null)
			{
				var previousLetter:String = previousState.stateName;
				for each (var word:Word in WordDefinitions.Instance.WordsByLetter[previousLetter])
				{
					word.deactivate();
				}
			}
		}

		public function drawArea():Rectangle
		{
			return new Rectangle(State.XPOSITION, 0, builderCanvas.width, builderCanvas.height);
		}
		
		/*******************************************
		 * FACTORY METHODS
		 *******************************************/
		 
		 public function newPiece(type:String):Piece
		 {
			return new Piece(type);
		 }
		 
		 public function newPart(name:String, partType:String, dropPoint:Point, lines:Array, from:State, to:State):Part
		 {
			return new Part(name, partType, dropPoint, lines, from, to);
		 }
		 
		 public function newState(stateName:String, isLetter:Boolean, sound:SoundAsset):State
		 {
			return new State(stateName, isLetter, sound);
		 }
		 
		 public function newWord(name:String, category:String, images:Array):Word
		 {
			return new Word(name, category, images);
		 }
	}
}