package objects
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
	
	/*
	 * A Part is one part of a letter, or a letter under construction
	 * If a Piece is added to a letter, it becomes (actually, is replaced by) a Part
	 * (and the State changes).
	 *
	 * A Part actually has two representations: the part itself, 
	 * which is used to draw one part of the State to which it belongs,
	 * and a Drop Point, which is the place on the previous state to which
	 * the Piece can be added (dropped).
	 *
	 * In that sense, a Part can be considered the transition on a graph between two states.
	 * In the before state, it is a drop point. When the right piece is dropped on its drop point,
	 * the state transitions to the after state, in which the part is actually a part of the state design.
	 * The graph can transition back to the previous state by removing the Part.
	 */
	public class Part
	{
		public static var RADIUS:int = 20;
		public static var THICKNESS:int = 15;
		public static var PART_COLOR:int = 0xFF7F27;
		//public static var POINT_COLOR:int = 0x3333FF;
		public static var POINT_COLOR:int = 0xFFFFFF;
		public static var POINT_ANIMATION_COLOR:int = 0xFFFF00;

		protected var added:Boolean = false;
		protected var hovering:Boolean = false;
		protected var removing:Boolean = false;
		protected var handleEvents:Boolean = true;

		public var name:String = null;
		public var partType:String = PieceIdentifiers.I;
		protected var fromState:State = null;
		protected var toState:State = null;
		protected var fromParts:Array = new Array();
		protected var toParts:Array = new Array();

		protected var dropPoint:Point = null;
		protected var lines:Array = null;
		protected var canvas:Canvas = null;
		protected var part:UIComponent = null;
		protected var point:UIComponent = null;
		
		// For morph effect - TODO: move to tween effect
		protected var currLines:Array = null;
		protected var toLines:Array = null;
		
		public function Part(name:String, partType:String, dropPoint:Point, lines:Array, from:State, to:State)
		{			
			super();
			this.name = name;
			this.partType = partType;
			this.dropPoint = dropPoint;
			this.lines = lines;
			this.fromState = from;
			this.toState = to;
			if (from != null)
			{
				this.fromState.addNewPart(this);
			}
			if (to != null)
			{
				this.toState.addPart(this);
			}
		}
		
		public function get DropPoint():Point
		{
			return new Point(dropPoint.x, dropPoint.y);
		}
		
		public function startup(canvas:Canvas, handleEvents:Boolean = true):void
		{
			this.canvas = canvas;
			this.handleEvents = handleEvents;
			setupGraphics();
		}
		
		protected function setupGraphics():void
		{
			part = new UIComponent();
			DrawingUtils.drawEasySelectLines(lines, part, THICKNESS, THICKNESS*3, PART_COLOR, 1, drawArea());

			part.buttonMode = true;
			if (handleEvents)
			{
				part.addEventListener(MouseEvent.MOUSE_DOWN, partMouseDown);
				part.addEventListener(MouseEvent.MOUSE_UP, partMouseUp);
				part.addEventListener(MouseEvent.MOUSE_MOVE, partMouseMove);
			}
			
			point = new UIComponent();
			//point.graphics.moveTo(xForState(dropPoint.x), yForState(dropPoint.y));
			//point.graphics.beginFill(POINT_COLOR);
			//point.graphics.drawCircle(xForState(dropPoint.x), yForState(dropPoint.y), RADIUS);
			if (handleEvents)
			{
				point.addEventListener(DragEvent.DRAG_ENTER, pointDragEnter);
				point.addEventListener(DragEvent.DRAG_EXIT, pointDragExit);
				point.addEventListener(DragEvent.DRAG_DROP, pointDragDrop);
				point.addEventListener(MouseEvent.MOUSE_UP, pointMouseUp);
				//point.addEventListener(MouseEvent.MOUSE_OUT, pointMouseOut);
				//point.addEventListener(MouseEvent.MOUSE_OVER, pointMouseOver);
			}
			
			currLines = this.Lines;
			toLines = this.Lines;
		}

		public function get Lines():Array
		{
			var copy:Array = new Array();
			for each (var line:Line in lines)
			{
				copy.push(line.clone());
			}
			return copy;
		}

		public function get PartComponent():UIComponent
		{
			return this.part;
		}

		public function get StartPoint():Point
		{
			return this.lines[0].StartPoint;
		}
		
		public function get MidPoint():Point
		{
			var currLines:Array = this.Lines;
			var points:Array = new Array();
			while (currLines.length > 1)
			{
				for each (var line:Line in currLines)
				{
					points.push(line.MidPoint);
				}
				currLines = Line.pointsToLines(points);
				points = new Array();
			}
			return currLines[0].MidPoint;
		}

		public function get EndPoint():Point
		{
			return this.lines[this.lines.length-1].EndPoint;
		}
		
		public function get Length():Number
		{
			var total:Number = 0;
			for each (var line:Line in lines)
			{
				total += line.Length;
			}
			return total;
		}

		public function partMouseMove(event:MouseEvent):void
		{
			if (removing)
			{
				if (true) // Moves far enough away
				{
					removing = false;
					doRemove();
					var piece:Piece = PieceDefinitions.Instance.Pieces[partType];
					piece.mouseDown(event);
					pointMouseOut(event);
				}
			}
		}
		
		public function partMouseDown(event:MouseEvent):void
		{
			if (added)
				removing = true;
		}
		
		public function partMouseUp(event:MouseEvent):void
		{
			// Didn't move far enough away to actually remove it
			removing = false;
		}
		
		// Draw next step in morph from currLines to toLines
		public function partMorph(event:Event):void
		{
			var isMorphing:Boolean = false;
			for (var i:int = 0; i < toLines.length; i++)
			{
				var currLine:Line = Line(currLines[i]);
				var toLine:Line = Line(toLines[i]);
				
				// Start point
				currLine.StartPoint.x += (toLine.StartPoint.x - currLine.StartPoint.x) / 10;
				currLine.StartPoint.y += (toLine.StartPoint.y - currLine.StartPoint.y) / 10;

				// End point
				currLine.EndPoint.x += (toLine.EndPoint.x - currLine.EndPoint.x) / 10;
				currLine.EndPoint.y += (toLine.EndPoint.y - currLine.EndPoint.y) / 10;

				// Curve point
				if (toLine.CurvePoint != null) {
					currLine.CurvePoint.x += (toLine.CurvePoint.x - currLine.CurvePoint.x) / 10;
					currLine.CurvePoint.y += (toLine.CurvePoint.y - currLine.CurvePoint.y) / 10;
				}
				
				if (isMorphing
					|| currLine.StartPoint.x != toLine.StartPoint.x
					|| currLine.StartPoint.y != toLine.StartPoint.y
					|| currLine.EndPoint.x != toLine.EndPoint.x
					|| currLine.EndPoint.y != toLine.EndPoint.y
					|| (currLine.CurvePoint != null 
						&& (currLine.CurvePoint.x != toLine.CurvePoint.x
							|| currLine.CurvePoint.y != toLine.CurvePoint.y)))
				{
					isMorphing = true;
				}
			}
			
			part.graphics.clear();
			DrawingUtils.drawEasySelectLines(currLines, part, THICKNESS, THICKNESS*3, PART_COLOR, 1, drawArea());

			if (!isMorphing)
			{
				finishMorph();
			}
			
		}
		
		protected function finishMorph():void
		{
			part.removeEventListener(Event.ENTER_FRAME, partMorph);
		}
		
		public function pointDragEnter(event:DragEvent):void
		{
			if (event.dragSource.hasFormat("piece"))
			{
				DragManager.acceptDragDrop(this.point);
				doPointHover();
			}
		}
		
		public function pointDragExit(event:DragEvent):void
		{
			if (event.dragSource.hasFormat("piece"))
			{
				hovering = false;
				undoPointHover();
			}
		}
		
		public function pointDragDrop(event:DragEvent):void
		{
			doAdd();
		}
		
		public function pointMouseUp(event:MouseEvent):void
		{
			BuilderTool.Instance.currentPiece.stopRelease();
			doAdd();
		}
		
		public function pointMouseOut(event:MouseEvent):void
		{
			undoPointHover();
			if (BuilderTool.Instance.currentPiece != null)
			{
				BuilderTool.Instance.currentPiece.morphBack();
			}
		}
		
		public function pointMouseOver(event:MouseEvent):void
		{
			doPointHover();
			BuilderTool.Instance.currentPiece.morphTo(this);
		}
		
		public function activateDropPoint():void
		{
			added = false;
			removing = false;
			canvas.addChild(point);
			if (canvas.contains(part))
			{
				canvas.removeChild(part);
			}
		}
		
		public function activateAsAdded():void
		{
			added = true;
			removing = false;
			part.graphics.clear();
			DrawingUtils.drawEasySelectLines(currLines, part, THICKNESS, THICKNESS*3, PART_COLOR, 1, drawArea());
			canvas.addChild(part);
			if (canvas.contains(point))
			{
				canvas.removeChild(point);
			}
		}
		
		public function deactivate():void
		{
			if (canvas.contains(part))
			{
				canvas.removeChild(part);
			}
			if (canvas.contains(point))
			{
				canvas.removeChild(point);
			}
		}
		
		protected function doAdd():void
		{
			activateAsAdded();
			hovering = false;
			BuilderTool.Instance.changeState(toState);
		}
		
		protected function doRemove():void
		{
			added = false;
			removing = false;
			hovering = true;
			BuilderTool.Instance.changeState(fromState);
		}
		
		
		public function doPointHover():void
		{
			if (!added)
			{
				hovering = true;
				// Make sure the to state is in its normal state
				toState.morphBack();
				fromState.morphTo(this, toState);
			}
		}

		public function undoPointHover():void
		{
			if (!added)
			{
				hovering = false;
				fromState.morphBack();
				endDropPointHover();
			}
		}

		public function receivePiece(piece:Piece):Boolean
		{
			var accept:Boolean = false;
			if (piece.partType == this.partType)
			{
				if (piece.DropArea.intersects(point.getRect(canvas)))
				{
					accept = true;
					doAdd();
				}
			}
			return accept;
		}

		/*
		 * This maps one part (this part) to its related representation in the next State
		 * when a transition part is added to the current State.
		 *
		 * For example, in the State II, if the transition part DASH (-) is added, the 
		 * new state will be H. The toPart for the first I will be the part that is a drop point
		 * I added to HRIGHT (known as HRIGHT->H, and the toPart for the second I will be 
		 * the drop point (also the right I) on HLEFT (AKA HLEFT->H).
		 * 
		 * In some rare cases, the same piece can be added to a state in different locations,
		 * and transition to the same state. In the example above, I added to I makes State II,
		 * but the I can be added on the left OR on the right. In that case, there are two
		 * drop point, or toParts, I->II-A and I->II-B.
		 */
		public function addToPart(transitionPart:Part, toPart:Part):void
		{
			this.toParts[transitionPart.name] = toPart;
			toPart.addFromPart(transitionPart, this);
		}
		
		public function addFromPart(transitionPart:Part, fromPart:Part):void
		{
			this.fromParts[transitionPart.name] = fromPart;
		}
		
		public function getToPart(transitionPart:Part):Part
		{
			return this.toParts[transitionPart.name];
		}
		
		public function getFromPart(transitionPart:Part):Part
		{
			return this.fromParts[transitionPart.name];
		}
		
		/*
		 * Morph / tween the current part drawing to its
		 * equivalent representation in the future (or previous) state
		 */
		public function morphWith(transitionPart:Part, isTo:Boolean = true):void
		{
			var toPart:Part = getFromPart(transitionPart);
			if (isTo)
			{
				toPart = getToPart(transitionPart);
			}

			if (toPart != null)
			{
				//currLines = this.Lines;
				startMorph(toPart);
			}			
		}
		
		/*
		 * Morph / tween the current part drawing back to its
		 * original state
		 */
		public function morphBack():void
		{
			startMorph(this);
		}
		
		public function startMorph(toPart:Part, centerPart:Boolean = false):void
		{
			toLines = toPart.Lines;
			var fewer:Array = currLines;
			var more:Array = toLines;
			if (currLines.length > toLines.length)
			{
				fewer = toLines;
				more = currLines;
			}
			var lastIdx:int = fewer.length - 1;
			for (var i:int = fewer.length; i < more.length; i++)
			{
				// New lines should be 0-length line at the end point of the last line
				var newLine:Line = new Line(new Array(
					new Point(Line(fewer[lastIdx]).EndPoint.x, Line(fewer[lastIdx]).EndPoint.y),
					new Point(Line(fewer[lastIdx]).EndPoint.x, Line(fewer[lastIdx]).EndPoint.y),
					Line(more[i]).IsCurve ? new Point(Line(fewer[lastIdx]).EndPoint.x, Line(fewer[lastIdx]).EndPoint.y) : null));
				fewer.push(newLine);
			}
			
			if (centerPart)
			{
				toLines = DrawingUtils.centerLines(toLines);
			}
			
			part.addEventListener(Event.ENTER_FRAME, partMorph);
		}
		
		public function doDropPointHover():void
		{
			point.graphics.clear();
			point.graphics.moveTo(xForState(dropPoint.x), yForState(dropPoint.y));
			point.graphics.lineStyle(5, POINT_ANIMATION_COLOR, .5);
			point.graphics.beginFill(POINT_COLOR, 0);
			point.graphics.drawCircle(xForState(dropPoint.x), yForState(dropPoint.y), BuilderTool.PIECE_DROP_RANGE);
		}
		
		public function endDropPointHover():void
		{
			point.graphics.clear();
			//point.graphics.moveTo(xForState(dropPoint.x), yForState(dropPoint.y));
			//point.graphics.beginFill(POINT_COLOR);
			//point.graphics.drawCircle(xForState(dropPoint.x), yForState(dropPoint.y), RADIUS);
		}
		
		public function isAdded():Boolean
		{
			return added;
		}
		
		public function pointOverDropPoint(point:Point):Boolean
		{
			var distance:Number = Point.distance(point, 
													new Point(DrawingUtils.actualX(dropPoint.x, drawArea()), 
														DrawingUtils.actualY(dropPoint.y, drawArea())));
			if (distance <= RADIUS)
			{
				return true;
			}
			return false;
		}

		public function drawSelf(target:UIComponent):void
		{
			var thickness:int = (THICKNESS * target.width) / widthOfState();
			DrawingUtils.drawLines(lines, target, thickness, PART_COLOR, 1, new Rectangle(0, 0, target.width, target.height));
		}

		protected function xForState(x:int):int
		{
			return DrawingUtils.actualCoordinate(x, widthOfState()) + State.XPOSITION;
		}
		
		protected function widthOfState():int
		{
			return (this.canvas.width - State.XPOSITION);
		}

		protected function yForState(y:int):int
		{
			return DrawingUtils.actualCoordinate(y, heightOfState());
		}

		protected function heightOfState():int
		{
			return this.canvas.height;
		}

		public function drawArea():Rectangle
		{
			return new Rectangle(State.XPOSITION, 0, widthOfState(), heightOfState());
		}
		

		/*****************************
		 * UTILITY FUNCTIONS
		 *****************************/

		static public function lineToPart(line:Line):Part
		{
			var partType:String = Piece.determinePieceType(line);
			var part:Part = new Part(line.toString(), partType, null, new Array(line), null, null);
			return part;
		}
	}
}