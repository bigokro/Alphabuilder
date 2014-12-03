package objects
{
	import flash.events.*;
	import flash.geom.*;
	import flash.display.*;
	import flash.media.*;
	
	import mx.core.*;
	import mx.containers.*;
	import mx.events.*;
	import mx.managers.DragManager;
	
	import utils.*;

	/*
	 * A piece is something that can be used to build a letter.
	 * When added to the canvas, a Piece becomes a Part (of the letter)
	 */
	public class Piece extends UIComponent
	{
		public static var SHAPE_THICKNESS:int = 5;
		public static var BORDER_THICKNESS:int = 2;
		public static var SHAPE_COLOR:int = 0xFF7F27;
		public static var BORDER_COLOR:int = 0x000000;
		public static var BACKGROUND_COLOR:int = 0xFFFFFF;

		protected static var STATE_UNSELECTED:int = 0;
		protected static var STATE_SELECTED:int = 0;
		protected static var STATE_MORPHING:int = 1;
		protected static var STATE_DROPABLE:int = 2;
		protected static var STATE_MORPHING_BACK:int = 0;
		
		//public static var WIDTH:int = MathUtils.max(FlexGlobals.topLevelApplication.width / 10, FlexGlobals.topLevelApplication.height / 8);
		//public static var HEIGHT:int = WIDTH;
		public static var HEIGHT:int = FlexGlobals.topLevelApplication.height / 8;
		public static var WIDTH:int = HEIGHT;
		
		public var partType:String = PieceIdentifiers.I;
		protected var order:int = 0;
		protected var canvas:Canvas = null;
		protected var image:DisplayObject = null;
		protected var shape:Array = null;
		protected var part:Part = null;
		protected var currentTarget:Part = null;
		protected var state:int = STATE_UNSELECTED;
		protected var homeX:int = 0;
		protected var homeY:int = 0;

		public function Piece(partType:String)
		{			
			super();
			this.shape = PieceIdentifiers.SHAPES[partType];
			this.partType = partType;
			this.part = BuilderTool.Instance.newPart("Piece-"+partType, partType, new Point(0,0), DrawingUtils.resizeLines(shape, .5), null, null);
			setupGraphics();
		}
		
		protected function setupGraphics():void
		{
			this.width = WIDTH;
			this.height = HEIGHT;
			
			this.graphics.clear();
			this.graphics.beginFill(BACKGROUND_COLOR);
			this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
			this.graphics.endFill();
			this.graphics.lineStyle(SHAPE_THICKNESS, SHAPE_COLOR, 1);
			DrawingUtils.drawLines(shape, this, SHAPE_THICKNESS, SHAPE_COLOR, 1, new Rectangle(0, 0, WIDTH, HEIGHT));

			DrawingUtils.drawBorder(this, BORDER_THICKNESS, BORDER_COLOR);
		}				

		public function startupPiece(canvas:Canvas, x:int, y:int):void
		{
			this.canvas = canvas;
			this.homeX = x;
			this.homeY = y;
			setupGraphics();
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			this.buttonMode = true;
			canvas.addChild(this);
			this.part.startup(canvas, false);
			returnToHome();
			this.state = STATE_UNSELECTED;
		}

		public function startupOrderedPiece(canvas:Canvas, order:int):void
		{
			this.order = order;
			startupPiece(canvas, 0, calculateHomeY());
		}

		public function startupCustomPiece(canvas:Canvas, order:int, shape:Array):void
		{
			this.shape = shape;
			startupOrderedPiece(canvas, order);
		}
		
		public function get DropArea():Rectangle
		{
			return new Rectangle(this.x, this.y, WIDTH, HEIGHT);
		}
		
		public function get MidPoint():Point
		{
			// TODO: handle multiple lines and curves
			return Line(shape[0]).MidPoint;
		}
		
		public function mouseDown(event:MouseEvent):void
		{
			this.state = STATE_SELECTED;
			
			if (canvas.contains(this))
			{
				canvas.removeChild(this);
			}
			part.activateAsAdded();
			//var ds:DragSource = new DragSource();
			//ds.addData(this, "piece");               
			//DragManager.doDrag(this, ds, event, part.PartComponent, -WIDTH/2, -HEIGHT/2, 1.0);
			centerOnEvent(event, part.PartComponent);
			BuilderTool.Instance.currentPiece = this;
			BuilderTool.Instance.currentState.selectPiece(this)
			canvas.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			canvas.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			canvas.addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		public function enterFrame(event:Event):void
		{
			centerOnMouse(part.PartComponent);
		}

		public function mouseUp(event:MouseEvent):void
		{
			endDrag();
			returnToHome();
			this.activate();
			this.state = STATE_UNSELECTED;
			BuilderTool.Instance.currentState.releasePiece(this)
		}

	   public function stopRelease():void
	   {
		   endDrag();
	   }

	   protected function endDrag():void
	   {
		   canvas.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		   canvas.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		   canvas.removeEventListener(Event.ENTER_FRAME, enterFrame);
		   BuilderTool.Instance.currentPiece = null;
		   part.deactivate();
		   //part.morphBack();
	   }
					   
		// Check for the nearest drop point
		// If close enough, start morphing to that shape
		// If within drop range, start animation for drop
		public function mouseMove(event:MouseEvent):void
		{
			var area:Rectangle = BuilderTool.Instance.currentState.drawArea();
			var nearestPoint:Part = BuilderTool.Instance.currentState.findNearestDropPoint(this, new Point(event.stageX, event.stageY));
			if (nearestPoint == null) 
			{
				// This piece can't be added to the current state
				return;
			}
			var distance:Number = Point.distance(new Point(event.stageX, event.stageY), 
													DrawingUtils.actualPoint(nearestPoint.DropPoint, area));
			if (currentTarget != nearestPoint)
			{
				if (currentTarget != null)
				{
					currentTarget.pointMouseOut(event);
					currentTarget.endDropPointHover();
				}
			}
			if (state == STATE_UNSELECTED)
			{
				if (distance <= BuilderTool.PIECE_MORPH_RANGE)
				{
					setStateMorphing(event, nearestPoint);
				}
				if (distance <= BuilderTool.PIECE_DROP_RANGE)
				{
					setStateDropable(event, nearestPoint);
				}
			}
			else if (state == STATE_MORPHING)
			{
				if (distance > BuilderTool.PIECE_MORPH_RANGE)
				{
					setStateUnselected(event, nearestPoint)
				}
				else
				{
					if (currentTarget != nearestPoint)
					{
						setStateMorphing(event, nearestPoint);
					}
					
					if (distance <= BuilderTool.PIECE_DROP_RANGE)
					{
						setStateDropable(event, nearestPoint);
					}
				}
			}
			else if (state == STATE_DROPABLE)
			{
				if (distance > BuilderTool.PIECE_MORPH_RANGE)
				{
					setStateUnselected(event, nearestPoint)
				}
				else if (distance > BuilderTool.PIECE_DROP_RANGE)
				{
					setStateMorphing(event, nearestPoint);
				}
				else if (currentTarget != nearestPoint)
				{
					setStateDropable(event, nearestPoint);
				}
			}
			currentTarget = nearestPoint;
		}
		
		protected function setStateUnselected(event:MouseEvent, nearestPoint:Part):void
		{
			state = STATE_UNSELECTED;
			morphBack();
			nearestPoint.pointMouseOut(event);
			nearestPoint.endDropPointHover();
		}
		
		protected function setStateMorphing(event:MouseEvent, nearestPoint:Part):void
		{
			state = STATE_MORPHING;
			morphTo(nearestPoint);
			nearestPoint.pointMouseOver(event);
			nearestPoint.endDropPointHover();
		}
		
		protected function setStateDropable(event:MouseEvent, nearestPoint:Part):void
		{
			// Start drop point animation
			state = STATE_DROPABLE;
			morphTo(nearestPoint);
			nearestPoint.pointMouseOver(event);
			nearestPoint.doDropPointHover();
		}
		
		protected function dropPointUnderMouse(event:MouseEvent):Part
		{
			var pos:Point = new Point(event.stageX, event.stageY);
			var objs:Array = canvas.getObjectsUnderPoint(pos);
			for each (var object:Object in objs)
			{
				if (object is Part 
					&& !Part(object).isAdded()
					&& object != part)
				{
					return Part(object);
				}
			}
			return null;
		}
		
		public function morphTo(toPart:Part):void
		{
			this.part.startMorph(toPart, true);
		}

		public function morphBack():void
		{
			this.part.morphBack();
		}

		public function centerOnEvent(event:MouseEvent, element:UIComponent):void
		{
			centerOnMouse(element);
		}
		
		public function centerOnMouse(element:UIComponent):void
		{
			// move element to mouse position
			//element.x = this.canvas.mouseX - element.width/2;
			//element.y = this.canvas.mouseY - element.height/2;
			element.x = this.canvas.mouseX - (this.canvas.width + WIDTH)/2;
			element.y = this.canvas.mouseY - this.canvas.height/2;
		}
		
        public function dragEnter(event:DragEvent):void {
			// Just to get rid of the ugly no drop icon
			DragManager.acceptDragDrop(Piece(event.currentTarget));
		}
			
		protected function calculateHomeY():Number
		{
			return HEIGHT * (order-1);
		}
		
		public function returnToHome():void
		{
			this.x = this.homeX;
			this.y = this.homeY;
			this.alpha = 1.0;
			this.visible = true;
		}
		
		public function activate():void
		{
			if (!canvas.contains(this))
			{
				canvas.addChild(this);
			}
			part.deactivate();
		}
		
		public function deactivate():void
		{
			if (canvas.contains(this))
			{
				canvas.removeChild(this);
			}
		}

		public function pieceOverDropPoint(event:MouseEvent):Boolean
		{
			var point:Point = new Point(event.stageX, event.stageY);
			//var objs:Array = this.canvas.getObjectsUnderPoint(point);
			return BuilderTool.Instance.currentState.pieceOverDropPoint(this, point);
		}
		
		protected function relativeX(x:int):int
		{
			return DrawingUtils.actualCoordinate(x, WIDTH);
		}
		
		protected function relativeY(y:int):int
		{
			return DrawingUtils.actualCoordinate(y, HEIGHT);
		}
		
		public function setOrder(order:int):void
		{
			this.order = order;
			this.homeY = calculateHomeY();
		}
		
		static public function determinePieceType(line:Line):String
		{
			var leftmost:Point = line.StartPoint.x <= line.EndPoint.x ? line.StartPoint : line.EndPoint;
			var rightmost:Point = line.StartPoint.x <= line.EndPoint.x ? line.EndPoint : line.StartPoint;
			var topmost:Point = line.StartPoint.y <= line.EndPoint.y ? line.StartPoint : line.EndPoint;
			var bottommost:Point = line.StartPoint.y <= line.EndPoint.y ? line.EndPoint : line.StartPoint;
			var deltaX:Number = Math.abs(line.StartPoint.x - line.EndPoint.x) / line.Length;
			var deltaY:Number = Math.abs(line.StartPoint.y - line.EndPoint.y) / line.Length;

			if (line.IsCurve)
			{
				if (line.CurvePoint.x > rightmost.x)
				{
					return PieceIdentifiers.RIGHTPAREN;
				}
				else if (line.CurvePoint.x < leftmost.x)
				{
					return PieceIdentifiers.C;
				}
				else if (line.CurvePoint.y < topmost.y)
				{
					return PieceIdentifiers.CARET;
				}
				else if (line.CurvePoint.y > bottommost.y)
				{
					return PieceIdentifiers.U;
				}
			}
			if (deltaX < 0.20)
			{
				return PieceIdentifiers.I;
			}
			if (deltaY < 0.20)
			{
				return PieceIdentifiers.DASH;
			}
			if (leftmost == line.StartPoint && topmost == line.StartPoint)
			{
				return PieceIdentifiers.BACKSLASH;
			}
			return PieceIdentifiers.SLASH;
		}
		
		static public function relativeLocation(thisPart:Part, thatPart:Part):int
		{
			var avgSize:Number = (thisPart.Length + thatPart.Length) / 2;
			var thisMidPoint:Point = thisPart.MidPoint;
			var thatMidPoint:Point = thatPart.MidPoint;
			//return GeometryUtils.directionToPoint(thisMidPoint, thatMidPoint, 0.2, avgSize/10);
			return GeometryUtils.directionToPoint(thisMidPoint, thatMidPoint, 0.2, avgSize/5);
		}
	}
}