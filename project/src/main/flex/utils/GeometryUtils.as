package utils
{
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.utils.*;
	
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	import objects.*;

	public class GeometryUtils
	{
		static public function angleBetweenLines(line1:Line, line2:Line):Number
		{
			if (line1 == null || line2 == null)
			{
				return 0;
			}
			var startPoint:Point = line1.StartPoint;
			var midPoint:Point = line1.EndPoint;
			var endPoint:Point = line2.EndPoint;
			var dx1:Number = midPoint.x - startPoint.x;
			var dx2:Number = endPoint.x - midPoint.x;
			var dy1:Number = midPoint.y - startPoint.y;
			var dy2:Number = endPoint.y - midPoint.y;
			var rad1:Number = Math.atan2(dy1, dx1);
			var rad2:Number = Math.atan2(dy2, dx2);
			var angle:Number = rad2 - rad1;
			// Note: when angle crosses "West" line, result always off by 2*PI
			if ((dx1 < 0) && (dx2 < 0) && (Math.abs(angle) > Math.PI))
			{
				if (angle < 0)
					angle += 2*Math.PI;
				else
					angle -= 2*Math.PI;
			}
			return angle;
		}

		static public function radiansToDegrees(radians:Number):Number
		{
			return 180 * (radians / Math.PI)
		}

		public static const SAME:int = 0;
		public static const NORTH:int = 1;
		public static const NORTHEAST:int = 2;
		public static const EAST:int = 3;
		public static const SOUTHEAST:int = 4;
		public static const SOUTH:int = 5;
		public static const SOUTHWEST:int = 6;
		public static const WEST:int = 7;
		public static const NORTHWEST:int = 8;
		
		static public function directionToPoint(startPoint:Point, endPoint:Point, angularTolerance:Number = 0.0, radialTolerance:Number = 0.0):int
		{
			var dx:Number = endPoint.x - startPoint.x;
			var dy:Number = endPoint.y - startPoint.y;
			var distance:Number = Point.distance(startPoint, endPoint);
			if (distance <= radialTolerance)
			{
				return SAME;
			}
			var significantX:Boolean = Math.abs(dx/dy) > angularTolerance;
			var significantY:Boolean = Math.abs(dy/dx) > angularTolerance;
			if (significantX)
			{
				if (significantY)
				{
					if (dx > 0)
					{
						if (dy > 0)
						{
							return SOUTHEAST;
						}
						else
						{
							return NORTHEAST;
						}
					}
					else
					{
						if (dy > 0)
						{
							return SOUTHWEST;
						}
						else
						{
							return NORTHWEST;
						}
					}
				}
				else
				{
					if (dx > 0)
					{
						return EAST;
					}
					else
					{
						return WEST;
					}
				}
			}
			else
			{
				if (significantY)
				{
					if (dy > 0)
					{
						return SOUTH;
					}
					else
					{
						return NORTH;
					}
				}
				else
				{
					return SAME;
				}
			}
		}
		

	}
	
}