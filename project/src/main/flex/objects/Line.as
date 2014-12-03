package objects
{
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.utils.*;
	
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	import utils.*;

	public class Line
	{
		protected var points:Array = null;
	
		public function Line(points:Array)
		{			
			this.points = points;
		}
		
		public function get StartPoint():Point
		{
			return points[0];
		}	
		
		public function get Points():Array
		{
			return points;
		}	
		
		public function get EndPoint():Point
		{
			return points[1];
		}	
		
		public function get CurvePoint():Point
		{
			return points[2];
		}	

		public function get MidPoint():Point
		{
			return Line.determineCenter(points);
		}	
		
		public function get Length():Number
		{
			return Point.distance(this.StartPoint, this.EndPoint)
		}
		
		public function get xDirection():int
		{
			return Line.directionOnAxis(this.StartPoint.x, this.EndPoint.x, this.Length);
		}
		
		public function get yDirection():int
		{
			return Line.directionOnAxis(this.StartPoint.y, this.EndPoint.y, this.Length);
		}
		
		public function get IsCurve():Boolean
		{
			return this.CurvePoint != null;
		}

		public function isSignificant(area:Rectangle):Boolean
		{
			return Line.isLineSignificant(this, area);
		}

		public function clone():Line
		{
			return new Line(new Array(
				new Point(this.StartPoint.x, this.StartPoint.y),
				new Point(this.EndPoint.x, this.EndPoint.y),
				this.CurvePoint == null ? null : new Point(this.CurvePoint.x, this.CurvePoint.y)));
		}
		
		public function toString():String
		{
			return "<Line: Start"+this.StartPoint+", End"+this.EndPoint+", Curve"+(this.IsCurve ? this.CurvePoint : "(null)")+">";
		}
		
		/****************************
		 * Utility Methods
		 ****************************/
		
		public static const POSITIVE:int = 1;
		public static const NEGATIVE:int = -1;
		public static const INSIGNIFICANT:int = 0;
		
		static public function determineCenter(line:Array):Point
		{
			var startPoint:Point = Point(line[0]);
			var endPoint:Point = Point(line[1]);
			var midPoint1:Point = Point(line[2]);
			var midPoint2:Point = Point(line[2]);
			if (line[2] == null)
			{
				midPoint1 = Point(line[0]);
				midPoint2 = Point(line[1]);
			}
			var x:Number = (startPoint.x + endPoint.x + midPoint1.x + midPoint2.x) / 4;
			var y:Number = (startPoint.y + endPoint.y + midPoint1.y + midPoint2.y) / 4;
			return new Point(x, y);
		}
		
		
		static public function directionOnAxis(startValue:Number, endValue:Number, distance:Number, threshold:Number = 0.3):int
		{
			var delta:Number = endValue - startValue;
			if (delta == 0)
			{
				return Line.INSIGNIFICANT;
			}
			var significance:Number = delta/distance;
			if (Math.abs(significance) > threshold)
			{
				if (delta > 0)
				{
					return Line.POSITIVE;
				}
				return Line.NEGATIVE;
			}
			return Line.INSIGNIFICANT;
		}
		
		static public function isLineSignificant(line:Line, area:Rectangle):Boolean
		{
			return LineInterpreter.areLinesSignificant([line], area);
		}
		
		static public function pointsToLines(points:Array):Array
		{
			var lines:Array = new Array();
			for (var i:int=0; i < points.length-1; i++)
			{
				lines.push(new Line([points[i], points[i+1], null]));
			}
			return lines;
		}
	}
	
}