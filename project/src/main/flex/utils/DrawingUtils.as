package utils
{
	import flash.geom.*;
	import mx.core.*;
	
	import objects.*;

	public final class DrawingUtils
	{
		/*
		 * Draws a series of lines and curves defined in an array of arrays
		 * Each array entry consistes of 3 points: start point, end point, and optional curve point for curves
		 * The points are defined in relative terms (as a percentage of the whole drawing area
		 */
		static public function drawLines(lines:Array, target:UIComponent, 
				thickness:int, color:int, transparency:int, area:Rectangle = null) : void
		{
			target.graphics.lineStyle(thickness, color, transparency);
			for each (var line:Line in lines)
			{
				if (area != null)
				{
					line = actualLine(line, area);
				}
				target.graphics.moveTo(line.StartPoint.x, line.StartPoint.y);
				if (line.IsCurve)
				{
					target.graphics.curveTo(
						line.CurvePoint.x, line.CurvePoint.y, 
						line.EndPoint.x, line.EndPoint.y);
				}
				else
				{
					target.graphics.lineTo(line.EndPoint.x, line.EndPoint.y);
				}
			}
		}
	
		/*
		 * Draws lines as with the drawLines() method,
		 * but underneath each line, it draws a background line with transparency 0 (invisible) 
		 * with the thickness provided by the clickThicknes parameter.
		 * 
		 * This allows for the creation of lines with a clickable region wider than the region visible to the eye.
		 */
		static public function drawEasySelectLines(lines:Array, target:UIComponent, 
				thickness:int, clickThickness:int, color:int, transparency:int, area:Rectangle) : void
		{
			drawLines(lines, target, clickThickness, color, 0, area);
			drawLines(lines, target, thickness, color, transparency, area);
		}
	
		/*
		 * Calculates an actual point value based on a relative percent value and the actual size
		 */
		static public function actualCoordinate(relativeValue:Number, size:int) : int
		{
			return (relativeValue * size) / 100;
		}
	
		/*
		 * Calculates an actual point value based on a relative percent value and the drawing area
		 */
		static public function actualX(relativeX:Number, area:Rectangle) : int
		{
			return actualCoordinate(relativeX, area.width) + area.x;
		}
	
		/*
		 * Calculates an actual point value based on a relative percent value and the drawing area
		 */
		static public function actualY(relativeY:Number, area:Rectangle) : int
		{
			return actualCoordinate(relativeY, area.height) + area.y;
		}
		
		static public function actualPoint(relativePoint:Point, area:Rectangle) : Point
		{
			return new Point(actualX(relativePoint.x, area), actualY(relativePoint.y, area));
		}

		static public function actualLine(relativeLine:Line, area:Rectangle) : Line
		{
			if (relativeLine == null) return null;
			var actualLine:Line = new Line([
				actualPoint(relativeLine.StartPoint, area),
				actualPoint(relativeLine.EndPoint, area),
				relativeLine.IsCurve ? actualPoint(relativeLine.CurvePoint, area) : null
			]);
			return actualLine;
		}
	
		/*
		 * Calculates a percent point value based on an actual value and the actual size
		 */
		static public function percentCoordinate(value:Number, size:int) : int
		{
			return (value * 100) / size;
		}
	
		/*
		 * Calculates a percent point value based on an actual value and the drawing area
		 */
		static public function percentX(actualX:Number, area:Rectangle) : int
		{
			return percentCoordinate(actualX - area.x, area.width);
		}
	
		/*
		 * Calculates a percent point value based on an actual value and the drawing area
		 */
		static public function percentY(actualY:Number, area:Rectangle) : int
		{
			return percentCoordinate(actualY - area.y, area.width);
		}
		
		static public function percentPoint(actualPoint:Point, area:Rectangle) : Point
		{
			return new Point(percentX(actualPoint.x, area), percentY(actualPoint.y, area));
		}

		static public function percentLine(actualLine:Line, area:Rectangle) : Line
		{
			if (actualLine == null) return null;
			var percentLine:Line = new Line([
				percentPoint(actualLine.StartPoint, area),
				percentPoint(actualLine.EndPoint, area),
				actualLine.IsCurve ? percentPoint(actualLine.CurvePoint, area) : null
			]);
			return percentLine;
		}

		
		/*
		 * Finds the center point for the lines provided, and modifies the x/y values
		 * so that the ceter point is at 50, 50
		 */
		static public function centerLines(lines:Array) : Array
		{
			var xMin:int = 100;
			var xMax:int = 0;
			var yMin:int = 100;
			var yMax:int = 0;
			var line:Line = null;
			var point:Point = null;
			
			for each (line in lines)
			{
				for each(point in line.Points)
				{
					if (point.x < xMin) xMin = point.x;
					if (point.x > xMax) xMax = point.x;
					if (point.y < yMin) yMin = point.y;
					if (point.y > yMax) yMax = point.y;
				}
			}

			var deltaX:int = 50 - ((xMax + xMin) / 2);
			var deltaY:int = 50 - ((yMax + yMin) / 2);

			var newLines:Array = new Array();
			for each (line in lines)
			{
				var newLine:Array = new Array();
				for (var i:int = 0; i < line.Points.length; i++)
				{
					point = line.Points[i];
					if (point != null)
					{
						var newPoint:Point = new Point(point.x + deltaX, point.y + deltaY);
						newLine[i] = newPoint;
					}
					else
					{
						newLine[i] = null;
					}
				}
				newLines.push(new Line(newLine));
			}
			
			return newLines;
		}

		/*
		 * "Resizes" the lines by modifying all their points by the factor provided
		 * (using pure multiplication), based on a center of (50, 50)
		 * factor > 1 will enlarge; < 1 will reduce
		 */
		static public function resizeLines(lines:Array, factor:Number) : Array
		{
			var newLines:Array = new Array();
			for each (var line:Line in lines)
			{
				var newLine:Array = new Array();
				for (var i:int = 0; i < line.Points.length; i++)
				{
					var point:Point = line.Points[i];
					if (point != null)
					{
						var newPoint:Point = new Point(((point.x - 50) * factor) + 50, ((point.y - 50) * factor) + 50);
						newLine[i] = newPoint;
					}
					else
					{
						newLine[i] = null;
					}
				}
				newLines.push(new Line(newLine));
			}
			
			return newLines;
		}

		/*
		 * Draws a border of the indicated color and thickness around the graphic component provided
		 */
		static public function drawBorder(canvas:UIComponent, thickness:int = 2, color:int = 0x000000):void
		{
			canvas.graphics.lineStyle(thickness, color, 1);
			canvas.graphics.moveTo(0, 0);
			canvas.graphics.lineTo(canvas.width, 0);
			canvas.graphics.lineTo(canvas.width, canvas.height);
			canvas.graphics.lineTo(0, canvas.height);
			canvas.graphics.lineTo(0, 0);
		}
	}
	
}