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

	public class LineInterpreter
	{
		public static const CLOCKWISE:int = 1;
		public static const COUNTERCLOCKWISE:int = -1;
		public static const STRAIGHT:int = 0;
		
		public static var CHANGE_ANGLE:Number = Math.PI*3/8;
		public static var LOOP_ANGLE:Number = Math.PI*7/4;
		public static var RELEVANT_TREND_ANGLE:Number = Math.PI/8;
		public static var RELEVANT_LENGTH_RATIO:Number = 0.1;
		public static var SHARP_CHANGE_RATIO:Number = 0.30;
		public static var ANGLE_DEVIATION_RATIO:Number = 2.2;
		
		static public function directionOfCurve(startPoint:Point, midPoint:Point, endPoint:Point):int
		{
			return directionOfCurveLines([
				new Line([startPoint, midPoint, null]),
				new Line([midPoint, endPoint, null])
			]);
		}

		static public function directionOfCurveLines(lines:Array):int
		{
			var angle:Number = angleOfCurve(lines);
			return directionOfAngle(angle);
		}
		
		static public function directionOfAngle(angle:Number):int
		{
			if (angle > 0)
			{
				return CLOCKWISE;
			}
			else if (angle < 0)
			{
				return COUNTERCLOCKWISE;
			}
			return STRAIGHT;
		}
		
		static public function angleOfCurve(lines:Array):Number
		{
			if (lines == null) return 0;
			var angle:Number = 0;
			for (var i:int = 0; i < lines.length - 1; i++)
			{
				var thisLine:Line = lines[i];
				var nextLine:Line = lines[i+1];
				angle += GeometryUtils.angleBetweenLines(thisLine, nextLine);
			}
			return angle;
		}
		
		static public function packLines(lines:Array, area:Rectangle):Array
		{
			if (lines == null) return null;
			var packed:Array = new Array();
			var stats:Array = calculateLineStats(lines, area);
			var sections:Array = [stats];
			sections = breakS(sections, area);
			sections = breakLoops(sections, area);
			sections = breakJ(sections, area);
			sections = breakL(sections, area);
			sections = breakSharpAngles(sections, area);
			
			for each (stats in sections)
			{
				var linesToPack:Array = getLinesFromStats(stats);
				packed.push(packLine(linesToPack));
			}
			packed = joinContiguousLines(packed, area);
			return packed;	
		}
		
		static public function breakSharpAngles(sections:Array, area:Rectangle):Array
		{
			var result:Array = new Array();
			for each (var stats:Array in sections)
			{
				if (stats.length > 0)
				{
					var breakPoint:int = -1;

					for (var i:int = 0; (i < stats.length) && (breakPoint < 0); i++)
					{
						var stat:Object = stats[i];
						if ((stat.totalLength > (area.width * RELEVANT_LENGTH_RATIO)) 
							&& (Math.abs(stat.angle) > CHANGE_ANGLE))
						{
							breakPoint = i;
						}
					}
					if (breakPoint > 0)
					{
						var splitStats:Array = splitLineStats(stats, breakPoint, area);
						result.push(splitStats.shift());
						result = result.concat(breakSharpAngles(splitStats, area));
					}
					else
					{
						result.push(stats);
					}
				}
			}
			return result;	
		}
		
		/*
		 * Takes a list of Lines, and returns an ordered Array (in the same order)
		 * of maps with the following keys:
		 * 	line: the original line
		 * 	length: the length of the line
		 *	totalLength: the sum of the length of all lines up to and including this one
		 *	angle: the angle between the current line and the next line
		 *	totalAngle: the sum of angles of all lines up to and including the angle value of this entry
		 */
		static public function calculateLineStats(lines:Array, area:Rectangle):Array
		{
			if (lines == null) return null;
			var result:Array = new Array();
			for (var i:int = 0; i < lines.length; i++)
			{
				var prevLine:Line = (i > 0 ? lines[i] : null);
				var thisLine:Line = lines[i];
				var nextLine:Line = (i < lines.length-1 ? lines[i+1] : null);
				var prevWindowPoint:Point = findPreviousWindowPoint(lines, i, area);
				var nextWindowPoint:Point = findNextWindowPoint(lines, i, area);
				var prevWindow:Line = new Line([prevWindowPoint, thisLine.StartPoint, null]);
				var nextWindow:Line = new Line([thisLine.StartPoint, nextWindowPoint, null]);
				var map:Object = new Object();
				map.line = thisLine;
				map.length = thisLine.Length;
				map.totalLength = (prevLine != null ? map.length + result[i-1].totalLength : map.length);
				map.angle = (nextLine != null ? GeometryUtils.angleBetweenLines(thisLine, nextLine) : 0);
				map.totalAngle = (prevLine != null ? map.angle + result[i-1].totalAngle : map.angle);
				map.slope = (thisLine.EndPoint.y - thisLine.StartPoint.y) / (thisLine.EndPoint.x - thisLine.StartPoint.x);
				map.windowSlope = (nextWindowPoint.y - thisLine.StartPoint.y) / (nextWindowPoint.x - thisLine.StartPoint.x);
				map.windowAngle = GeometryUtils.angleBetweenLines(prevWindow, nextWindow);
				result.push(map);
			}
			return result;
		}
		
		static protected function findPreviousWindowPoint(lines:Array, index:int, area:Rectangle):Point
		{
			if (index == 0) return lines[0].StartPoint;
			var relevantLength:Number = area.width * RELEVANT_LENGTH_RATIO;
			var totalLength:Number = 0;
			for (var i:int = index-1; i > 0 && totalLength < relevantLength; i--)
			{
				totalLength += lines[i].Length;
			}
			return lines[i].StartPoint;
		}
		
		static protected function findNextWindowPoint(lines:Array, index:int, area:Rectangle):Point
		{
			if (index == lines.length-1) return lines[lines.length-1].EndPoint;
			var relevantLength:Number = area.width * RELEVANT_LENGTH_RATIO;
			var totalLength:Number = 0;
			for (var i:int = index+1; i < lines.length-1 && totalLength < relevantLength; i++)
			{
				totalLength += lines[i].Length;
			}
			return lines[i].EndPoint;
		}

		static public function splitLineStats(stats:Array, index:int, area:Rectangle):Array
		{
			var result:Array = new Array();
			var first:Array = stats.slice(0, index);
			var second:Array = stats.slice(index);
			first = calculateLineStats(getLinesFromStats(first), area);
			second = calculateLineStats(getLinesFromStats(second), area);
			result.push(first);
			result.push(second);
			return result;
		}
		
		static public function getLinesFromStats(stats:Array):Array
		{
			var lines:Array = new Array();
			for each (var map:Object in stats)
			{
				lines.push(map.line);
			}
			return lines;
		}
		
		// Modifies lines to contain only first 180 degrees of turn
		// Returns new set of stats
		static protected function breakLoops(sections:Array, area:Rectangle):Array
		{
			var result:Array = new Array();
			for each (var stats:Array in sections)
			{
				if (stats.length > 0)
				{
					var totalAngle:Number = stats[stats.length-1].totalAngle;
					// Only break a loop that ends near the start
					var distance:Number = Point.distance(stats[0].line.StartPoint, stats[stats.length-1].line.EndPoint);
					if ((Math.abs(totalAngle) > LOOP_ANGLE) && (distance < (area.width * RELEVANT_LENGTH_RATIO)))
					{
						var angle:Number = stats[0].totalAngle;
						var index:int = 0;
						for (index = 0; (index < stats.length) && (Math.abs(angle) < Math.PI); index++)
						{
							angle = stats[index].totalAngle;
						}
						result = result.concat(splitLineStats(stats, index, area));
					}
					else
					{
						result.push(stats);
					}
				}
			}
			return result;
		}
		
		static public function breakJ(sections:Array, area:Rectangle):Array
		{
			var result:Array = new Array();
			for each (var stats:Array in sections)
			{
				if (stats.length > 0)
				{
					var lines:Array = getLinesFromStats(stats);
					var packed:Line = packLine(lines);
					if (packed.IsCurve)
					{
						var direction:int = GeometryUtils.directionToPoint(packed.StartPoint, packed.EndPoint, 0.3);
						// We only care about J-style hooks - SW to NE or NE to SW
						if (direction == GeometryUtils.NORTHEAST || direction == GeometryUtils.SOUTHWEST)
						{
							// Hooking - check for "J"
							var curveAngle:Number = stats[stats.length-1].totalAngle;
							var found:Boolean = false;
							var isJ:Boolean = (Math.abs(curveAngle) > (Math.PI - CHANGE_ANGLE));
							var index:int = 0;
							if (isJ)
							{
								for (index = 0; index < lines.length && !found; index++)
								{
									if (isJBreakPoint(packed, lines[index], lines))
									{
										found = true;
									}
								}
							}
							if (found)
							{
								var splitStats:Array = splitLineStats(stats, index, area);
								result.push(splitStats.shift());
								result.push(splitStats.shift());
							}
							else
							{
								result.push(stats);
							}
						}
						else
						{
							result.push(stats);
						}
					}
					else
					{
						result.push(stats);
					}
				}
			}
			return result;
		}
		
		static public function breakL(sections:Array, area:Rectangle):Array
		{
			var result:Array = new Array();
			for each (var stats:Array in sections)
			{
				if (stats.length > 0)
				{
					if (hasTurn(stats))
					{
						var totalAngle:Number = 0;
						for each (var map:Object in stats)
						{
							totalAngle += Math.abs(map.windowAngle);
						}
						var averageAngle:Number = totalAngle / stats.length;
						var deviationAngle:Number = averageAngle * ANGLE_DEVIATION_RATIO;
						var maxAngle:Number = 0;
						var breakPoint:int = 0;
						// Ignore the first and last 5 lines
						for (var i:int=5; i < stats.length-5; i++)
						{
							var stat:Object = stats[i];
							if (Math.abs(stat.windowAngle) > deviationAngle)
							{
								if (Math.abs(stat.windowAngle) > maxAngle)
								{
									maxAngle = Math.abs(stat.windowAngle);
									breakPoint = i;
								}
							}
						}
						if (breakPoint > 0)
						{
							var splitStats:Array = splitLineStats(stats, breakPoint, area);
							result.push(splitStats.shift());
							result = result.concat(breakL(splitStats, area));
						}
						else
						{
							result.push(stats);
						}
					}
					else
					{
						result.push(stats);
					}
				}
			}
			return result;
		}

		// Looks for S-curves, in which a line curves one way, then back another
		// Breaks them up into separate sets
		static public function breakS(sections:Array, area:Rectangle):Array
		{
			var result:Array = new Array();
			for each (var stats:Array in sections)
			{
				if (stats.length > 0)
				{
					var breakPoint:int = -1;
					for (var i:int=0; (i < stats.length) && (breakPoint < 0); i++)
					{
						var totalAngle:Number = stats[i].totalAngle;
						if (Math.abs(totalAngle) >= CHANGE_ANGLE)
						{
							if (i+4 < stats.length)
							{
								var directionOfTotalAngle:int = directionOfAngle(totalAngle);
								var isBreak:Boolean = true;
								for (var j:int=0; (j < 5) && isBreak; j++)
								{
									var currAngle:Number = stats[i+j].angle;
									if (directionOfAngle(currAngle) == directionOfTotalAngle)
									{
										isBreak = false;
									}
								}
								if (isBreak)
								{
									// Test to see if second half is a curve in the opposite direction
									var splitSections:Array = splitLineStats(stats, i, area);
									var secondHalf:Array = splitSections[1];
									isBreak = false;
									for (var k:int=0; k < secondHalf.length && !isBreak; k++)
									{	
										var futureAngle:Number = secondHalf[k]["totalAngle"];
										if (Math.abs(futureAngle) >= CHANGE_ANGLE && directionOfAngle(futureAngle) != directionOfTotalAngle)
										{
											isBreak = true;
										}
									}
									if (isBreak)
									{
										breakPoint = i;
									}
								}
							}
						}
					}
					if (breakPoint >= 0)
					{
						var newSections:Array = splitLineStats(stats, breakPoint, area);
						result.push(newSections.shift());
						result = result.concat(breakS(newSections, area));
					}
					else
					{
						result.push(stats);
					}
				}
			}
			return result;
		}
		
		static protected function joinContiguousLines(packed:Array, area:Rectangle):Array
		{
			var result:Array = packed.slice();
			var relevantDistance:Number = area.width * RELEVANT_LENGTH_RATIO;
			for (var i:int=0; i < result.length; i++)
			{
				var line:Line = result[i];
				if (!line.IsCurve)
				{
					for (var j:int=i+1; j < result.length; j++)
					{
						var nextLine:Line = result[j];
						if (!nextLine.IsCurve)
						{
							var firstLine:Line = null;
							var secondLine:Line = null;
							if (GeometryUtils.directionToPoint(line.StartPoint, nextLine.EndPoint, 0, relevantDistance) == GeometryUtils.SAME)
							{
								firstLine = nextLine;
								secondLine = line;
							}
							else if (GeometryUtils.directionToPoint(line.EndPoint, nextLine.StartPoint, 0, relevantDistance) == GeometryUtils.SAME)
							{
								firstLine = line;
								secondLine = nextLine;
							}
							if (firstLine != null)
							{
								var angle:Number = GeometryUtils.angleBetweenLines(firstLine, secondLine);
								if (Math.abs(angle) < (Math.PI/8))
								{
									var newLine:Line = packLine([firstLine, secondLine]);
									result[i] = newLine;
									result.splice(j, 1);
									i -= 1;
									j = result.length;
								}
 							}
						}
					}
				}
			}
			return result;
		}
		
		static protected function hasTurn(stats:Array):Boolean
		{
			var found:Boolean = false;
			for each (var stat:Object in stats)
			{
				if (Math.abs(stat.totalAngle) > CHANGE_ANGLE)
				{
					found = true;
					break;
				}
			}		
			return found;
		}
		
		static protected function isJBreakPoint(packedLine:Line, currLine:Line, allLines:Array):Boolean
		{
			var found:Boolean = false;
			var lineType:String = Piece.determinePieceType(packedLine);
			var matchX:Boolean = true;
			var lessThan:Boolean = true;
			var matchValue:Number = 0;
			var firstPoint:Point = allLines[0].StartPoint;
			var lastPoint:Point = allLines[allLines.length-1].EndPoint;
			var curvePoint:Point = packedLine.CurvePoint;
			var currPoint:Point = currLine.EndPoint;
			if (lineType == PieceIdentifiers.U || lineType == PieceIdentifiers.CARET)
			{
				matchX = false;
			}
			if (matchX)
			{
				if (firstPoint.x > lastPoint.x)
				{
					if (firstPoint.x > curvePoint.x)
					{
						lessThan = true;
						matchValue = lastPoint.x;
					}
					else
					{
						lessThan = true;
						matchValue = firstPoint.x;
					}
				}
				else
				{
					if (firstPoint.x > curvePoint.x)
					{
						lessThan = false;
						matchValue = firstPoint.x;
					}
					else
					{
						lessThan = false;
						matchValue = lastPoint.x;
					}
				}
			}
			else
			{
				if (firstPoint.y > lastPoint.y)
				{
					if (firstPoint.y > curvePoint.y)
					{
						lessThan = true;
						matchValue = lastPoint.y;
					}
					else
					{
						lessThan = true;
						matchValue = firstPoint.y;
					}
				}
				else
				{
					if (firstPoint.y > curvePoint.y)
					{
						lessThan = false;
						matchValue = firstPoint.y;
					}
					else
					{
						lessThan = false;
						matchValue = lastPoint.y;
					}
				}
			}
			if (matchX)
			{
				if (lessThan && (currPoint.x <= matchValue))
				{
					found = true;
				}
				else if (!lessThan && (currPoint.x >= matchValue))
				{
					found = true;
				}
			}
			else
			{
				if (lessThan && (currPoint.y <= matchValue))
				{
					found = true;
				}
				else if (!lessThan && (currPoint.y >= matchValue))
				{
					found = true;
				}
			}
			return found;
		}
		
		static public function angleBetweenWindows(currWindow:Array, nextWindow:Array):Number
		{
			if (currWindow.length == 0 || nextWindow.length == 0)
			{
				return 0;
			}
			var startPoint:Point = currWindow[0].StartPoint;
			var midPoint:Point = nextWindow[0].StartPoint;
			var endPoint:Point = nextWindow[nextWindow.length-1].EndPoint;
			var currWindowLine:Line = new Line([startPoint, midPoint, null]);
			var nextWindowLine:Line = new Line([midPoint, endPoint, null]);
			var angle:Number = GeometryUtils.angleBetweenLines(currWindowLine, nextWindowLine);
			return angle;
		}
		
		public static var MIN_CURVE_ANGLE:Number = Math.PI/4;

		static public function packLine(lines:Array):Line
		{
			if (lines == null || lines.length == 0) return null;
			
			var startPoint:Point = lines[0].StartPoint;
			var endPoint:Point = lines[lines.length-1].EndPoint;
			var curvePoint:Point = null;
			var midLength:Number = LineInterpreter.totalLength(lines) / 2;

			var currLength:Number = 0;
			for each (var line:Line in lines)
			{
				currLength += line.Length;
				if (curvePoint == null)
				{
					if (currLength >= midLength)
					{
						curvePoint = line.EndPoint;
					}
				}
			}
			
			if (curvePoint == endPoint)
			{
				curvePoint = null;
			}
			else
			{
				var curveAngle:Number = GeometryUtils.angleBetweenLines(
											new Line([startPoint, curvePoint, null]), 
											new Line([curvePoint, endPoint, null]));
				if (Math.abs(curveAngle) < MIN_CURVE_ANGLE)
				{
					curvePoint = null;
				}
			}
			var startPointLocation:Number = startPoint.x*2 + startPoint.y;
			var endPointLocation:Number = endPoint.x*2 + endPoint.y;
			var result:Line = new Line([startPoint, endPoint, curvePoint]); 
			if (endPointLocation < startPointLocation)
			{
				result = new Line([endPoint, startPoint, curvePoint]); 
			}
			return result;
		}

		
		static public function areLinesSignificant(lines:Array, area:Rectangle, ratio:Number = 0.0):Boolean
		{
			var lengthRatio:Number = ratio == 0.0 ? RELEVANT_LENGTH_RATIO : ratio;
			return (totalLength(lines) / area.width) > lengthRatio;
		}

		static public function totalLength(lines:Array):Number
		{
			var total:Number = 0;
			for each (var line:Line in lines)
			{
				total += line.Length;
			}
			return total;
		}
		
		static protected function sharpAnglePercent(stats:Array):String
		{
			var totalAngle:Number = 0;
			for each (var map:Object in stats)
			{
				totalAngle += Math.abs(map.windowAngle);
			}
			var averageAngle:Number = totalAngle / stats.length;
			var deviationAngle:Number = averageAngle * 2.5;
			var sharpCount:int = 0;
			var sharpString:String = "";
			for each (var stat:Object in stats)
			{
				if (Math.abs(stat.windowAngle) > deviationAngle)
				{
					sharpCount += 1;
					sharpString += ",1";
				}
				else
				{
					sharpString += ",0";
				}
			}
			//return (sharpCount / stats.length);
			return sharpString;
		}

		
	}
	
}