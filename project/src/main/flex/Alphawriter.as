package
{
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.net.*;
	import flash.utils.*;
	
	import mx.core.*;
	import mx.containers.*;
	import mx.controls.*;
	import mx.events.*;
	
	import games.alphawriter.*;
	import objects.*;
	import utils.*;
	
	public class Alphawriter extends BuilderTool
	{
		protected var lines:Array = new Array();
		protected var parts:Array = new Array();
		
		protected var prevPoint:Point = null;
		protected var drawLines:Array = null;
		protected var allLines:Array = null;

		protected var showLines:Boolean = false;
		protected var difficult:Boolean = false;
		
		protected var fg:UIComponent = new UIComponent();
		protected var clearButton:UIComponent = null;
		protected var doneButton:UIComponent = null;
		protected var debugButton:UIComponent = null;
		protected var difficultyButton:UIComponent = null;
		protected var debugText:Text = null;

		public function Alphawriter()
		{
		}
		
		static public function get AlphawriterInstance():Alphawriter
		{
			if ( instance == null )
				instance = new Alphawriter();
			return Alphawriter(instance);
		}

		override public function startup(builderCanvas:Canvas, pictureCanvas:Canvas):void
		{
			this.builderCanvas = builderCanvas;
			this.pictureCanvas = pictureCanvas;

			this.debugText = new Text();
			this.debugText.x = 100;
			this.debugText.y = 0;
			
			this.bg = new UIComponent();
			this.bg.width = FlexGlobals.topLevelApplication.width / 2;
			this.bg.height = FlexGlobals.topLevelApplication.height;
			this.bg.graphics.beginFill(BACKGROUND_COLOR);
			this.bg.graphics.drawRect(0, 0, this.bg.width, this.bg.height);
			this.bg.graphics.endFill();
			this.builderCanvas.addChild(this.bg);
			
			this.fg.x = 0;
			this.fg.y = 0;
			this.fg.width = this.bg.width;
			this.fg.height = this.bg.height;
			clearDrawing();
			this.builderCanvas.addChild(this.fg);

			//StateDefinitions.Instance.startup(builderCanvas);
			AlphawriterStateDefinitions.Instance.startup(builderCanvas);
			WordDefinitions.Instance.startup(pictureCanvas);
			changeState(StateDefinitions.Instance.States[StateIdentifiers.BLANK]);

			setupPictureCanvas();
			setupClearButton();
			setupDoneButton();
			setupDebugButton();
			setupDifficultyButton();
			
			this.fg.addEventListener(MouseEvent.MOUSE_DOWN, startDrawing);

			if (true)
			{
				drawDebugGraphics();
			}
		}
		
		/*************************************
		 * Debug methods
		 *************************************/

		protected function drawDebugGraphics():void
		{
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(378, 151), new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), new Point(338, 309) ]));
			allLines.push(Line.pointsToLines([new Point(447, 293), new Point(438, 293), new Point(429, 293), new Point(419, 293), new Point(414, 293), new Point(402, 292), new Point(396, 292), new Point(383, 291), new Point(376, 290), new Point(369, 289), new Point(361, 289), new Point(346, 287), new Point(337, 286), new Point(329, 286), new Point(321, 285), new Point(304, 283), new Point(280, 282), new Point(266, 282), new Point(254, 282), new Point(248, 283), new Point(243, 283), new Point(238, 284), new Point(233, 285), new Point(226, 286), new Point(221, 286), new Point(220, 286) ]));
			for each (var someLines:Array in allLines)
			{
				DrawingUtils.drawLines(someLines, this.fg, Part.THICKNESS, Part.PART_COLOR, 1);
				var packed:Array = LineInterpreter.packLines(someLines, drawArea());
				var red:Boolean = true;
				for each (var packedLine:Line in packed)
				{
					if (red)
					{
						DrawingUtils.drawLines([packedLine], this.fg, 5, 0x00ff3333, 1);
					}
					else
					{
						DrawingUtils.drawLines([packedLine], this.fg, 5, 0x003333ff, 1);
					}
					red = !red;
				}
			}

		}

		protected function drawingsToLines(allLines:Array, drawArea:Rectangle):Array
		{
			var lines:Array = new Array();
			for each (var drawLines:Array in allLines)
			{
				lines = lines.concat(LineInterpreter.packLines(drawLines, drawArea));
			}
			return lines;
		}
		
		protected function linesToParts(allLines:Array, drawArea:Rectangle):Array
		{
			var lines:Array = drawingsToLines(allLines, drawArea);
			var parts:Array = new Array();
			for each (var line:Line in lines)
			{
				var percentLine:Line = DrawingUtils.percentLine(line, drawArea);

				if (line.isSignificant(drawArea))
				{
					var part:Part = Part.lineToPart(percentLine);
					parts.push(part);
				}
			}
			return parts;
		}

		/*************************************
		 * End Debug methods
		 *************************************/

		protected function setupClearButton():void
		{
			this.clearButton = setupButton("CLEAR", 0, 0, clearCanvas);
		}
		
		protected function setupDoneButton():void
		{
			this.doneButton = setupButton("DONE", 0, this.bg.height - Piece.HEIGHT, done);
		}
		
		protected function setupDebugButton():void
		{
			this.debugButton = setupButton("DEBUG ON", 0, (this.bg.height - Piece.HEIGHT) / 2, toggleDebug);
		}
		
		protected function setupDifficultyButton():void
		{
			this.difficultyButton = setupButton("HARD", 0, this.debugButton.y + Piece.HEIGHT, toggleDifficulty);
		}
		
		protected function setupButton(text:String, x:Number, y:Number, eventHandler:Function):UIComponent
		{
			var button:UIComponent = new UIComponent();
			button.x = x;
			button.y = y;
			button.width = Piece.WIDTH;
			button.height = Piece.HEIGHT;
			button.graphics.clear();
			button.graphics.beginFill(Piece.BACKGROUND_COLOR);
			button.graphics.drawRect(0, 0, Piece.WIDTH, Piece.HEIGHT);
			button.graphics.endFill();
			button.graphics.lineStyle(Piece.SHAPE_THICKNESS, Piece.SHAPE_COLOR, 1);
			//DrawingUtils.drawLines(shape, button, SHAPE_THICKNESS, SHAPE_COLOR, 1, new Rectangle(0, 0, WIDTH, HEIGHT));
			DrawingUtils.drawBorder(button, Piece.BORDER_THICKNESS, Piece.BORDER_COLOR);

			var label:UITextField = new UITextField();
			label.text = text;
			label.x = 5;
			label.y = 5;
			button.addChild(label);

			this.builderCanvas.addChild(button);
			button.addEventListener(MouseEvent.CLICK, eventHandler);
			
			return button;
		}
		
		override protected function celebrate(previousState:State, currentState:State):void
		{
			this.currentState = currentState;
			
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
			changeState(StateDefinitions.Instance.States[StateIdentifiers.BLANK]);
			clearDrawing();
		}

		protected function startDrawing(event:MouseEvent):void
		{
			drawLines = new Array();
			if (allLines == null) allLines = new Array();
			this.fg.addEventListener(MouseEvent.MOUSE_MOVE, draw);
			this.fg.addEventListener(MouseEvent.MOUSE_UP, stopDrawing);
		}

		protected function draw(event:MouseEvent):void
		{
			if (prevPoint == null) 
			{
				prevPoint = new Point(event.localX, event.localY);
			}
			else
			{
				this.fg.graphics.lineStyle(Part.THICKNESS, Part.PART_COLOR, 1);
				this.fg.graphics.moveTo(prevPoint.x, prevPoint.y);
				this.fg.graphics.lineTo(event.localX, event.localY);
					
				var currPoint:Point = new Point(event.localX, event.localY);
				var newLine:Line = new Line([prevPoint, currPoint, null]);
				drawLines.push(newLine);
				prevPoint = currPoint;
			}
		}

		protected function stopDrawing(event:MouseEvent):void
		{
			this.fg.removeEventListener(MouseEvent.MOUSE_MOVE, draw);
			this.fg.removeEventListener(MouseEvent.MOUSE_UP, stopDrawing);
			if (prevPoint != null) 
			{
				processLines();
			}
			prevPoint = null;
		}

		protected function processLines():void
		{
			allLines.push(drawLines);
			var lines:Array = LineInterpreter.packLines(drawLines, drawArea());
			
			for each (var line:Line in lines)
			{
				var percentLine:Line = DrawingUtils.percentLine(line, drawArea());

				if (line.isSignificant(drawArea()))
				{
					var part:Part = Part.lineToPart(percentLine);
					this.lines.push(percentLine);
					this.parts.push(part);
				}
				
				if (showLines)
				{
					DrawingUtils.drawLines([percentLine], this.fg, 5, 0x00ff3333, 1, drawArea());

					var midPoint:Point = line.MidPoint;
					this.fg.graphics.moveTo(midPoint.x, midPoint.y);
					this.fg.graphics.beginFill(Part.POINT_COLOR);
					this.fg.graphics.drawCircle(midPoint.x, midPoint.y, Part.RADIUS);
					
					if (line.isSignificant(drawArea()))
					{
						var label:UITextField = new UITextField();
						label.text = this.parts[this.parts.length-1].partType;
						label.x = line.EndPoint.x + 5;
						label.y = line.EndPoint.y + 5;
						this.bg.addChild(label);
					}
					else
					{
						var offset:Number = Part.RADIUS/4;
						this.fg.graphics.lineStyle(5, 0x00ff0000, 1);
						this.fg.graphics.moveTo(midPoint.x - offset, midPoint.y - offset);
						this.fg.graphics.lineTo(midPoint.x + offset, midPoint.y + offset);
						this.fg.graphics.moveTo(midPoint.x - offset, midPoint.y + offset);
						this.fg.graphics.lineTo(midPoint.x + offset, midPoint.y - offset);
					}
				}
			}
		}

		protected function clearDrawing():void
		{
			this.fg.graphics.clear();
			this.fg.graphics.beginFill(BACKGROUND_COLOR, 0);
			this.fg.graphics.drawRect(0, 0, this.bg.width, this.bg.height);
			this.fg.graphics.endFill();
			while (this.bg.numChildren > 0)
			{
				this.bg.removeChildAt(0);
			}
			this.lines = new Array();
			this.parts = new Array();
			this.allLines = new Array();
			
		}
		
		protected function clearCanvas(event:MouseEvent):void
		{
			clearDrawing();
			if (this.builderCanvas.contains(this.debugText))
			{
				this.builderCanvas.removeChild(this.debugText);
			}
		}
		
		protected function done(event:MouseEvent):void
		{
			if (showLines)
			{
				var rect:Rectangle = drawArea();
				var textStr:String = "var drawArea:Rectangle = new Rectangle("+rect.x+", "+rect.y+", "+rect.width+", "+rect.height+");\n";
				textStr += "var allLines:Array = new Array();\n";
				for each (var stroke:Array in allLines)
				{
					textStr += "allLines.push(Line.pointsToLines([";
					textStr += "new Point(" + stroke[0].StartPoint.x + ", " + stroke[0].StartPoint.y + "), ";
					for each (var line:Line in stroke)
					{
						textStr += "new Point(" + line.EndPoint.x + ", " + line.EndPoint.y + "), ";
					}
					textStr += "]));\n";
				}
				this.debugText.text = textStr;
				this.builderCanvas.addChild(this.debugText);
			}
			var state:State = State.matchState(this.parts, this.difficult);
			if (state != null)
			{
				celebrate(StateDefinitions.Instance.States[StateIdentifiers.BLANK], state);
			}
			else
			{
				clearDrawing();
			}
		}
		
		protected function toggleDebug(event:MouseEvent):void
		{
			this.showLines = !this.showLines;
			var label:UITextField = UITextField(this.debugButton.getChildAt(0));
			label.text = this.showLines ? "DEBUG OFF" : "DEBUG ON";
		}
		
		protected function toggleDifficulty(event:MouseEvent):void
		{
			this.difficult = !this.difficult;
			var label:UITextField = UITextField(this.difficultyButton.getChildAt(0));
			label.text = difficult ? "EASY" : "HARD";
		}
		
		/*******************************************
		 * FACTORY METHODS
		 *******************************************/
		 
	}
}