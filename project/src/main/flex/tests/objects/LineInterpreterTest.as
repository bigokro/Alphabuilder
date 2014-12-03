package tests.objects
{
	import flash.geom.*;
	
	import objects.*;
	
	import org.flexunit.Assert;
	
	import utils.*;

	public class LineInterpreterTest extends LineInterpreter
	{
		private static var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
	
		[Before]
		public function setUp():void
		{
		}

		[After]
		public function tearDown():void
		{
		}

		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}

		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}

		/*************************************
		 * angleOfCurve
		 *************************************/

		[Test]
		public function testAngleOfCurve2Lines():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(150, 150)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			Assert.assertEquals(Math.PI/4, angle);
		}
		
		[Test]
		public function testAngleOfCurve2LinesCClock():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(150, 50)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			Assert.assertEquals(-Math.PI/4, angle);
		}

		[Test]
		public function testAngleOfCurve2ObtuseLines():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(50, 150)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			Assert.assertEquals(Math.PI*3/4, angle);
		}

		[Test]
		public function testAngleOfCurveMultipleLines():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(110, 110),
								new Point(120, 120),
								new Point(130, 130),
								new Point(140, 140),
								new Point(150, 150)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			Assert.assertEquals(Math.PI/4, angle);
		}
		
		[Test]
		public function testAngleOfCurveRoughCurve():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(120, 120),
								new Point(110, 110),
								new Point(130, 130),
								new Point(150, 150)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			Assert.assertEquals(Math.PI/4, angle);
		}
		
		
		[Test]
		public function testAngleOfCurveReallyRoughCurve():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(105, 120),
								new Point(110, 110),
								new Point(130, 130),
								new Point(150, 150)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			assertSameAngles(Math.PI/4, angle);
		}
		
		[Test]
		public function testAngleOfCurveCompleteLoop():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(105, 105),
								new Point(105, 110),
								new Point(100, 115),
								new Point(95, 115),
								new Point(90, 110),
								new Point(90, 105),
								new Point(95, 100),
								new Point(100, 100)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			assertSameAngles(2 * Math.PI, angle);
		}
		
		[Test]
		public function testAngleOfCurve180Degrees():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(105, 105),
								new Point(105, 110),
								new Point(100, 115),
								new Point(95, 115)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			assertSameAngles(Math.PI, angle);
		}
		
		[Test]
		public function testAngleOfCurve225Degrees():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(0, 100),
								new Point(100, 100),
								new Point(105, 105),
								new Point(105, 110),
								new Point(100, 115),
								new Point(95, 115),
								new Point(90, 110)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			assertSameAngles(Math.PI * 5/4, angle);
		}
		
		[Test]
		public function testAngleOfCurve45DegreesWest():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(100, 100),
								new Point(95, 100),
								new Point(90, 95)
							]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			assertSameAngles(Math.PI/4, angle);
		}
		
		[Test]
		public function testAngleOfCurveRealO():void
		{
			var lines:Array = Line.pointsToLines([new Point(337, 154), new Point(325, 157), new Point(319, 158), new Point(314, 159), new Point(311, 160), new Point(305, 162), new Point(298, 164), new Point(294, 165), new Point(290, 167), new Point(287, 168), new Point(282, 171), new Point(278, 173), new Point(274, 176), new Point(270, 179), new Point(261, 186), new Point(257, 189), new Point(253, 193), new Point(245, 201), new Point(237, 210), new Point(229, 220), new Point(225, 225), new Point(222, 230), new Point(218, 236), new Point(215, 241), new Point(212, 247), new Point(209, 252), new Point(207, 259), new Point(204, 272), new Point(203, 278), new Point(203, 285), new Point(203, 292), new Point(204, 299), new Point(206, 306), new Point(208, 313), new Point(210, 320), new Point(217, 333), new Point(225, 346), new Point(235, 357), new Point(247, 367), new Point(253, 371), new Point(260, 374), new Point(266, 378), new Point(274, 380), new Point(281, 382), new Point(289, 384), new Point(296, 385), new Point(313, 385), new Point(322, 385), new Point(331, 385), new Point(339, 384), new Point(348, 382), new Point(357, 380), new Point(366, 377), new Point(374, 374), new Point(382, 370), new Point(389, 365), new Point(396, 360), new Point(402, 354), new Point(408, 347), new Point(419, 333), new Point(427, 318), new Point(430, 309), new Point(434, 292), new Point(435, 272), new Point(433, 252), new Point(431, 242), new Point(425, 222), new Point(416, 204), new Point(404, 187), new Point(397, 180), new Point(379, 169), new Point(358, 163), new Point(348, 161), new Point(338, 161) ]);
			var angle:Number = LineInterpreter.angleOfCurve(lines);
			Assert.assertTrue(angle < (-Math.PI*2 * 3/4) && angle > (-Math.PI*2 * 5/4));
		}
		

		/*************************************
		 * totalLength
		 *************************************/
		
		[Test]
		public function testTotalLengthStraightLine():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(100, 100),
								new Point(200, 100),
								new Point(300, 100)
							]);
			var length:Number = LineInterpreter.totalLength(lines);
			assertSameAngles(200, length);
		}
		
		[Test]
		public function testTotalLengthZeroLengthLine():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(100, 100),
								new Point(100, 100),
								new Point(300, 100)
							]);
			var length:Number = LineInterpreter.totalLength(lines);
			Assert.assertEquals(200, length);
		}
		
		[Test]
		public function testTotalLengthStraightLineBackToStart():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(100, 100),
								new Point(200, 100),
								new Point(100, 100)
							]);
			var length:Number = LineInterpreter.totalLength(lines);
			Assert.assertEquals(200, length);
		}
		
		[Test]
		public function testTotalLengthRightAngles():void
		{
			var lines:Array = Line.pointsToLines([
								new Point(100, 100),
								new Point(200, 100),
								new Point(200, 200)
							]);
			var length:Number = LineInterpreter.totalLength(lines);
			Assert.assertEquals(200, length);
		}
		
		[Test]
		public function testTotalLengthAllAngles():void
		{
			var point1:Point = new Point(100, 100);
			var point2:Point = new Point(120, 110);
			var point3:Point = new Point(102, 151);
			var point4:Point = new Point(193, 122);
			var point5:Point = new Point(140, 128);
			var lines:Array = Line.pointsToLines([
								point1,
								point2,
								point3,
								point4,
								point5
							]);
			var length:Number = LineInterpreter.totalLength(lines);
			var expected:Number = 
				Point.distance(point1, point2)
				+ Point.distance(point2, point3)
				+ Point.distance(point3, point4)
				+ Point.distance(point4, point5);
			Assert.assertEquals(expected, length);
		}
		
		/*************************************
		 * packLine
		 *************************************/
		
		[Test]
		public function testPackLineNull():void
		{
			var line:Line = LineInterpreter.packLine(null);
			Assert.assertEquals(null, line);
		}
		
		[Test]
		public function testPackLineEmpty():void
		{
			var line:Line = LineInterpreter.packLine(new Array());
			Assert.assertEquals(null, line);
		}
		
		[Test]
		public function testPackLineSimpleDash():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleI():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleSlash():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(200, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleDashTwoLines():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 100);
			var endPoint:Point = new Point(300, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleITwoLines():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(100, 200);
			var endPoint:Point = new Point(100, 300);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleSlashTwoLines():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 200);
			var endPoint:Point = new Point(300, 300);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleSlashTwoLinesReversed():void
		{
			var startPoint:Point = new Point(300, 300);
			var midPoint:Point = new Point(200, 200);
			var endPoint:Point = new Point(100, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.EndPoint);
			Assert.assertEquals(endPoint, line.StartPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineComplexI():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(101, 105),
								new Point(104, 115),
								new Point(102, 123),
								new Point( 98, 153),
								new Point(101, 167),
								new Point( 97, 180),
								new Point(101, 187),
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleC():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(50, 150);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(80, 110),
								new Point( 65, 130),
								midPoint,
								new Point(67, 170),
								new Point(85, 185),
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleRightParen():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 150);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(120, 110),
								new Point(135, 130),
								midPoint,
								new Point(133, 170),
								new Point(115, 185),
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleCaret():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 50);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 80),
								new Point(130, 65),
								midPoint,
								new Point(170, 67),
								new Point(185, 85),
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}
		
		[Test]
		public function testPackLineSimpleCaret2():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 55);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 80),
								new Point(140, 60),
								midPoint,
								new Point(160, 60),
								new Point(190, 80),
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}

		[Test]
		public function testPackLineSimpleU():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 150);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 120),
								new Point(130, 135),
								midPoint,
								new Point(170, 130),
								new Point(185, 115),
								endPoint
							]);
			var line:Line = LineInterpreter.packLine(lines);
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}

		
		/*************************************
		 * packLines
		 *************************************/
		
		[Test]
		public function testPackLinesNull():void
		{
			var result:Array = LineInterpreter.packLines(null, drawArea);
			Assert.assertNull(result);
		}
		
		[Test]
		public function testPackLinesEmpty():void
		{
			var result:Array = LineInterpreter.packLines(new Array(), drawArea);
			Assert.assertEquals(0, result.length);
		}
		
		[Test]
		public function testPackLinesSimpleDash():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleI():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleSlash():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(200, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleDashTwoLines():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 100);
			var endPoint:Point = new Point(300, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleITwoLines():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(100, 200);
			var endPoint:Point = new Point(100, 300);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleSlashTwoLines():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 200);
			var endPoint:Point = new Point(300, 300);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleSlashTwoLinesReversed():void
		{
			var startPoint:Point = new Point(300, 300);
			var midPoint:Point = new Point(200, 200);
			var endPoint:Point = new Point(100, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								midPoint,
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(endPoint, line.StartPoint);
			Assert.assertEquals(startPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesComplexI():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(101, 105),
								new Point(104, 115),
								new Point(102, 123),
								new Point( 98, 153),
								new Point(101, 167),
								new Point( 97, 180),
								new Point(101, 187),
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleRightParen():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(145, 150);
			var endPoint:Point = new Point(100, 200);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(120, 110),
								new Point(140, 130),
								midPoint,
								new Point(140, 170),
								new Point(120, 190),
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleCaret():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 55);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 80),
								new Point(140, 60),
								midPoint,
								new Point(160, 60),
								new Point(190, 80),
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesSimpleU():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 145);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 120),
								new Point(140, 140),
								midPoint,
								new Point(160, 140),
								new Point(190, 120),
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(midPoint, line.CurvePoint);
		}
		
		[Test]
		public function testPackLinesRealZ():void
		{
			var startPoint:Point = new Point(231, 168);
			var dashEndPoint:Point = new Point(452, 173);
			var slashEndPoint:Point = new Point(245, 343);
			var endPoint:Point = new Point(452, 338);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(245, 166),
								new Point(255, 165),
								new Point(262, 164),
								new Point(267, 164),
								new Point(271, 164),
								new Point(275, 164),
								new Point(285, 164),
								new Point(290, 164),
								new Point(295, 164),
								new Point(300, 164),
								new Point(306, 164),
								new Point(311, 164),
								new Point(323, 164),
								new Point(329, 164),
								new Point(335, 164),
								new Point(341, 164),
								new Point(347, 164),
								new Point(353, 164),
								new Point(359, 163),
								new Point(365, 163),
								new Point(378, 163),
								new Point(384, 163),
								new Point(390, 162),
								new Point(396, 162),
								new Point(402, 162),
								new Point(408, 162),
								new Point(413, 162),
								new Point(419, 162),
								new Point(429, 161),
								new Point(433, 161),
								new Point(438, 161),
								new Point(442, 161),
								new Point(445, 161),
								new Point(448, 161),
								new Point(450, 161),
								new Point(452, 161),
								new Point(453, 161),
								dashEndPoint,
								new Point(454, 162),
								new Point(454, 163),
								new Point(452, 164),
								new Point(451, 165),
								new Point(448, 167),
								new Point(442, 173),
								new Point(438, 176),
								new Point(433, 180),
								new Point(428, 184),
								new Point(418, 192),
								new Point(406, 202),
								new Point(400, 207),
								new Point(393, 212),
								new Point(387, 218),
								new Point(380, 224),
								new Point(372, 230),
								new Point(365, 236),
								new Point(357, 243),
								new Point(341, 256),
								new Point(333, 263),
								new Point(325, 269),
								new Point(317, 276),
								new Point(302, 289),
								new Point(287, 302),
								new Point(281, 310),
								new Point(269, 318),
								new Point(260, 327),
								new Point(256, 330),
								new Point(253, 333),
								new Point(250, 336),
								new Point(247, 340),
								new Point(246, 341),
								slashEndPoint,
								new Point(246, 343),
								new Point(249, 342),
								new Point(253, 340),
								new Point(256, 339),
								new Point(260, 337),
								new Point(264, 336),
								new Point(272, 333),
								new Point(277, 332),
								new Point(283, 331),
								new Point(288, 330),
								new Point(300, 329),
								new Point(307, 328),
								new Point(321, 327),
								new Point(328, 326),
								new Point(343, 325),
								new Point(358, 324),
								new Point(365, 324),
								new Point(379, 323),
								new Point(399, 323),
								new Point(405, 324),
								new Point(418, 326),
								new Point(429, 329),
								new Point(434, 330),
								new Point(444, 334),
								new Point(448, 336),
								endPoint
							]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(3, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(dashEndPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
			line = result[1];
			Assert.assertEquals(dashEndPoint, line.EndPoint);
			Assert.assertEquals(slashEndPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
			line = result[2];
			Assert.assertEquals(slashEndPoint, line.StartPoint);
			Assert.assertEquals(endPoint, line.EndPoint);
			Assert.assertEquals(null, line.CurvePoint);
		}

		
		[Test]
		public function testPackLinesRealO():void
		{
			var startPoint:Point = new Point(337, 154);
			var midPoint:Point = new Point(357, 380);
			var endPoint:Point = new Point(338, 161);
			var lines:Array = Line.pointsToLines([startPoint, new Point(325, 157), new Point(319, 158), new Point(314, 159), new Point(311, 160), new Point(305, 162), new Point(298, 164), new Point(294, 165), new Point(290, 167), new Point(287, 168), new Point(282, 171), new Point(278, 173), new Point(274, 176), new Point(270, 179), new Point(261, 186), new Point(257, 189), new Point(253, 193), new Point(245, 201), new Point(237, 210), new Point(229, 220), new Point(225, 225), new Point(222, 230), new Point(218, 236), new Point(215, 241), new Point(212, 247), new Point(209, 252), new Point(207, 259), new Point(204, 272), new Point(203, 278), new Point(203, 285), new Point(203, 292), new Point(204, 299), new Point(206, 306), new Point(208, 313), new Point(210, 320), new Point(217, 333), new Point(225, 346), new Point(235, 357), new Point(247, 367), new Point(253, 371), new Point(260, 374), new Point(266, 378), new Point(274, 380), new Point(281, 382), new Point(289, 384), new Point(296, 385), new Point(313, 385), new Point(322, 385), new Point(331, 385), new Point(339, 384), new Point(348, 382), new Point(357, 380), midPoint, new Point(374, 374), new Point(382, 370), new Point(389, 365), new Point(396, 360), new Point(402, 354), new Point(408, 347), new Point(419, 333), new Point(427, 318), new Point(430, 309), new Point(434, 292), new Point(435, 272), new Point(433, 252), new Point(431, 242), new Point(425, 222), new Point(416, 204), new Point(404, 187), new Point(397, 180), new Point(379, 169), new Point(358, 163), new Point(348, 161), endPoint ]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(2, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(midPoint, line.EndPoint);
			Assert.assertEquals(PieceIdentifiers.C, Piece.determinePieceType(line));
			line = result[1];
			Assert.assertEquals(midPoint, line.EndPoint);
			Assert.assertEquals(endPoint, line.StartPoint);
			Assert.assertEquals(PieceIdentifiers.RIGHTPAREN, Piece.determinePieceType(line));
		}
		
		[Test]
		public function testPackLinesRealFDash():void
		{
			var startPoint:Point = new Point(403, 296);
			var endPoint:Point = new Point(240, 307);
			var lines:Array = Line.pointsToLines([startPoint, new Point(399, 298), new Point(397, 298), new Point(391, 299), new Point(388, 300), new Point(381, 301), new Point(374, 302), new Point(370, 302), new Point(365, 303), new Point(361, 303), new Point(351, 303), new Point(341, 303), new Point(335, 303), new Point(330, 304), new Point(324, 304), new Point(314, 304), new Point(303, 304), new Point(298, 304), new Point(293, 304), new Point(288, 304), new Point(283, 304), new Point(279, 304), new Point(270, 305), new Point(266, 305), new Point(263, 306), new Point(260, 306), new Point(254, 307), new Point(247, 308), new Point(244, 309), new Point(242, 309), new Point(241, 309), new Point(240, 309), new Point(240, 308), endPoint ]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(2, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.EndPoint);
			Assert.assertEquals(PieceIdentifiers.DASH, Piece.determinePieceType(line));
			Assert.assertTrue("First line is significant", line.isSignificant(drawArea));
			line = result[1];
			Assert.assertEquals(endPoint, line.StartPoint);
			Assert.assertFalse("Second line is insignificant", line.isSignificant(drawArea));
		}
		
		[Test]
		public function testPackLinesRealFDash2():void
		{
			var startPoint:Point = new Point(344, 259);
			var endPoint:Point = new Point(225, 260);
			var lines:Array = Line.pointsToLines([startPoint, new Point(337, 260), new Point(329, 260), new Point(325, 260), new Point(320, 260), new Point(314, 261), new Point(308, 261), new Point(302, 261), new Point(295, 261), new Point(288, 261), new Point(281, 261), new Point(273, 260), new Point(265, 260), new Point(258, 260), new Point(244, 260), new Point(238, 260), new Point(232, 260), new Point(228, 260), endPoint ]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(1, result.length);
			var line:Line = result[0];
			Assert.assertEquals(endPoint, line.StartPoint);
			Assert.assertEquals(startPoint, line.EndPoint);
			Assert.assertEquals(PieceIdentifiers.DASH, Piece.determinePieceType(line));
		}
		
		[Test]
		public function testPackLinesRealNTwoStrokes():void
		{
			var startPoint:Point = new Point(258, 198);
			var endPoint:Point = new Point(362, 147);
			var lines:Array = Line.pointsToLines([startPoint, new Point(263, 205), new Point(269, 214), new Point(278, 230), new Point(281, 236), new Point(284, 242), new Point(288, 249), new Point(296, 264), new Point(308, 289), new Point(317, 306), new Point(321, 313), new Point(325, 321), new Point(328, 327), new Point(332, 334), new Point(335, 339), new Point(341, 347), new Point(346, 352), new Point(350, 353), new Point(353, 350), new Point(355, 347), new Point(357, 338), new Point(359, 325), new Point(360, 309), new Point(360, 282), new Point(361, 261), new Point(361, 238), new Point(361, 227), new Point(360, 205), new Point(359, 186), new Point(359, 177), new Point(359, 169), new Point(359, 162), new Point(360, 151), endPoint ]);
			var result:Array = LineInterpreter.packLines(lines, drawArea);
			Assert.assertEquals(2, result.length);
			var line:Line = result[0];
			Assert.assertEquals(startPoint, line.StartPoint);
			Assert.assertEquals(PieceIdentifiers.BACKSLASH, Piece.determinePieceType(line));
			line = result[1];
			Assert.assertEquals(endPoint, line.StartPoint);
			Assert.assertEquals(PieceIdentifiers.I, Piece.determinePieceType(line));
		}

		/*************************************
		 * angleBetweenWindows
		 *************************************/
		
		[Test]
		public function testAngleBetweenWindowsNoEndWindow():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(200, 100);
			var startWindow:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var endWindow:Array = new Array();
			var angle:Number = LineInterpreter.angleBetweenWindows(startWindow, endWindow);
			assertSameAngles(0, angle);
		}
		
		[Test]
		public function testAngleBetweenWindowsNoStartWindow():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(200, 100);
			var startWindow:Array = new Array();
			var endWindow:Array = Line.pointsToLines([
								startPoint,
								endPoint
							]);
			var angle:Number = LineInterpreter.angleBetweenWindows(startWindow, endWindow);
			assertSameAngles(0, angle);
		}
		
		[Test]
		public function testAngleBetweenWindowsSingleLineWindows():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 100);
			var endPoint:Point = new Point(300, 200);
			var startWindow:Array = Line.pointsToLines([
								startPoint,
								midPoint
							]);
			var endWindow:Array = Line.pointsToLines([
								midPoint,
								endPoint
							]);
			var angle:Number = LineInterpreter.angleBetweenWindows(startWindow, endWindow);
			assertSameAngles(Math.PI/4, angle);
		}
		 

		/*************************************
		 * breakBySharpAngles
		 *************************************/
		
		[Test]
		public function testBreakSharpAnglesRealFTwoStrokes():void
		{
			var startPoint:Point = new Point(419, 166);
			var midPoint:Point = new Point(231, 173);
			var endPoint:Point = new Point(258, 415);
			var lines:Array = Line.pointsToLines([startPoint, new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakSharpAngles([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(39, results[0].length);
			assertSamePoint(startPoint, results[0][0].line.StartPoint);
			assertSamePoint(midPoint, results[0][38].line.EndPoint);
			var line:Line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[0]));
			Assert.assertEquals("First part is Dash", PieceIdentifiers.DASH, Piece.determinePieceType(line));
			Assert.assertEquals(38, results[1].length);
			assertSamePoint(midPoint, results[1][0].line.StartPoint);
			assertSamePoint(endPoint, results[1][37].line.EndPoint);
			line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[1]));
			Assert.assertEquals("Second part is I", PieceIdentifiers.I, Piece.determinePieceType(line));
		}
		
		[Test]
		public function testBreakSharpAnglesRealBTwoStrokes2():void
		{
			var startPoint:Point = new Point(234, 197);
			var midPoint:Point = new Point(272, 305);
			var endPoint:Point = new Point(235, 409);
			var lines:Array = Line.pointsToLines([startPoint, new Point(243, 196), new Point(254, 195), new Point(267, 195), new Point(275, 195), new Point(283, 195), new Point(292, 196), new Point(310, 200), new Point(328, 206), new Point(336, 209), new Point(344, 213), new Point(351, 218), new Point(356, 222), new Point(360, 227), new Point(364, 237), new Point(363, 242), new Point(361, 247), new Point(358, 252), new Point(354, 257), new Point(349, 262), new Point(336, 271), new Point(330, 275), new Point(324, 279), new Point(318, 282), new Point(306, 289), new Point(301, 291), new Point(296, 294), new Point(291, 296), new Point(286, 298), new Point(282, 300), new Point(279, 302), new Point(272, 305), new Point(270, 306), new Point(271, 305), new Point(275, 303), new Point(278, 302), new Point(286, 300), new Point(291, 299), new Point(302, 298), new Point(313, 298), new Point(320, 299), new Point(332, 302), new Point(353, 312), new Point(359, 316), new Point(370, 327), new Point(378, 341), new Point(380, 348), new Point(381, 363), new Point(380, 372), new Point(375, 387), new Point(370, 394), new Point(360, 407), new Point(354, 412), new Point(341, 420), new Point(333, 423), new Point(316, 425), new Point(286, 424), new Point(275, 421), new Point(254, 416), endPoint]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakSharpAngles([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(31, results[0].length);
			assertSamePoint(startPoint, results[0][0].line.StartPoint);
			assertSamePoint(midPoint, results[0][30].line.EndPoint);
			var line:Line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[0]));
			Assert.assertEquals("First part is RightParen", PieceIdentifiers.RIGHTPAREN, Piece.determinePieceType(line));
			Assert.assertEquals(28, results[1].length);
			assertSamePoint(midPoint, results[1][0].line.StartPoint);
			assertSamePoint(endPoint, results[1][27].line.EndPoint);
			line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[1]));
			Assert.assertEquals("Second part is RightParen", PieceIdentifiers.RIGHTPAREN, Piece.determinePieceType(line));
		}
		
		/*************************************
		 * breakLoops
		 *************************************/
		
		[Test]
		public function testBreakLoopsRealO():void
		{
			var lines:Array = Line.pointsToLines([new Point(337, 154), new Point(325, 157), new Point(319, 158), new Point(314, 159), new Point(311, 160), new Point(305, 162), new Point(298, 164), new Point(294, 165), new Point(290, 167), new Point(287, 168), new Point(282, 171), new Point(278, 173), new Point(274, 176), new Point(270, 179), new Point(261, 186), new Point(257, 189), new Point(253, 193), new Point(245, 201), new Point(237, 210), new Point(229, 220), new Point(225, 225), new Point(222, 230), new Point(218, 236), new Point(215, 241), new Point(212, 247), new Point(209, 252), new Point(207, 259), new Point(204, 272), new Point(203, 278), new Point(203, 285), new Point(203, 292), new Point(204, 299), new Point(206, 306), new Point(208, 313), new Point(210, 320), new Point(217, 333), new Point(225, 346), new Point(235, 357), new Point(247, 367), new Point(253, 371), new Point(260, 374), new Point(266, 378), new Point(274, 380), new Point(281, 382), new Point(289, 384), new Point(296, 385), new Point(313, 385), new Point(322, 385), new Point(331, 385), new Point(339, 384), new Point(348, 382), new Point(357, 380), new Point(366, 377), new Point(374, 374), new Point(382, 370), new Point(389, 365), new Point(396, 360), new Point(402, 354), new Point(408, 347), new Point(419, 333), new Point(427, 318), new Point(430, 309), new Point(434, 292), new Point(435, 272), new Point(433, 252), new Point(431, 242), new Point(425, 222), new Point(416, 204), new Point(404, 187), new Point(397, 180), new Point(379, 169), new Point(358, 163), new Point(348, 161), new Point(338, 161) ]);
			var originalLength:int = lines.length;
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakLoops([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertTrue("First set > 0", results[0].length > 0);
			Assert.assertTrue("Second set > 0", results[1].length > 0);
			Assert.assertEquals("End point of first window same as start of next", results[0][results[0].length-1].line.EndPoint, results[1][0].line.StartPoint);
			Assert.assertTrue("Curve of first window ~180 degrees", Math.abs(results[0][results[0].length-1].totalAngle) > Math.PI*7/8);
			Assert.assertTrue("Curve of first window < 225 degrees", Math.abs(results[0][results[0].length-1].totalAngle) < (Math.PI * 5/4));
			Assert.assertTrue("Curve of remainder window > 0 degrees", Math.abs(results[1][results[1].length-1].totalAngle) > 0);
			Assert.assertTrue("Curve of remainder window < 180 degrees", Math.abs(results[1][results[1].length-1].totalAngle) < Math.PI);
		}

		[Test]
		public function testBreakLoopsSimpleCaret():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 55);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 80),
								new Point(140, 60),
								midPoint,
								new Point(160, 60),
								new Point(190, 80),
								endPoint
							]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakLoops([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(6, results[0].length);
		}
		
		[Test]
		public function testBreakLoopsRealFTwoStrokes():void
		{
			var startPoint:Point = new Point(419, 166);
			var endPoint:Point = new Point(258, 415);
			var lines:Array = Line.pointsToLines([startPoint, new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakLoops([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(77, results[0].length);
		}
		
		[Test]
		public function testBreakLoopsRealG():void
		{
			var startPoint:Point = new Point(378, 151);
			var endPoint:Point = new Point(338, 309);
			var lines:Array = Line.pointsToLines([startPoint, new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakLoops([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(126, results[0].length);
		}

		
		/*************************************
		 * breakJ
		 *************************************/
		
		[Test]
		public function testbreakJRealFTwoStrokesSlightCurveAtBottom():void
		{
			var lines:Array = Line.pointsToLines([new Point(371, 175), new Point(355, 179), new Point(350, 180), new Point(347, 180), new Point(344, 180), new Point(341, 180), new Point(338, 181), new Point(335, 181), new Point(331, 181), new Point(328, 181), new Point(320, 181), new Point(316, 181), new Point(312, 181), new Point(308, 181), new Point(304, 181), new Point(300, 181), new Point(296, 180), new Point(292, 180), new Point(288, 180), new Point(284, 180), new Point(280, 179), new Point(276, 179), new Point(272, 179), new Point(268, 178), new Point(264, 178), new Point(256, 177), new Point(252, 177), new Point(248, 177), new Point(245, 176), new Point(242, 176), new Point(239, 176), new Point(236, 175), new Point(233, 175), new Point(231, 175), new Point(228, 175), new Point(226, 175), new Point(225, 175), new Point(223, 175), new Point(222, 175), new Point(221, 175), new Point(220, 175), new Point(220, 176), new Point(219, 177), new Point(219, 178), new Point(219, 180), new Point(219, 181), new Point(220, 183), new Point(220, 185), new Point(220, 187), new Point(220, 190), new Point(221, 193), new Point(221, 196), new Point(221, 199), new Point(221, 203), new Point(222, 208), new Point(222, 212), new Point(222, 223), new Point(222, 229), new Point(222, 235), new Point(222, 241), new Point(221, 248), new Point(221, 255), new Point(220, 263), new Point(220, 270), new Point(219, 278), new Point(219, 286), new Point(218, 294), new Point(217, 302), new Point(217, 309), new Point(217, 317), new Point(216, 324), new Point(216, 331), new Point(217, 337), new Point(219, 348), new Point(223, 358) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		[Test]
		public function testbreakJRealI():void
		{
			var lines:Array = Line.pointsToLines([new Point(298, 144), new Point(299, 149), new Point(299, 155), new Point(301, 162), new Point(302, 170), new Point(303, 175), new Point(304, 180), new Point(304, 186), new Point(305, 191), new Point(305, 197), new Point(305, 203), new Point(305, 209), new Point(306, 222), new Point(306, 228), new Point(306, 235), new Point(306, 241), new Point(305, 248), new Point(305, 255), new Point(305, 261), new Point(304, 268), new Point(304, 275), new Point(303, 283), new Point(303, 290), new Point(303, 298), new Point(303, 305), new Point(303, 312), new Point(303, 319), new Point(304, 326), new Point(304, 333), new Point(305, 339), new Point(306, 344), new Point(307, 352), new Point(308, 355), new Point(308, 358), new Point(309, 360), new Point(310, 361) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(35, results[0].length);
			Assert.assertEquals(GeometryUtils.SOUTH, GeometryUtils.directionToPoint(results[0][0].line.StartPoint, results[0][34].line.EndPoint, Math.PI/8));
		}
		
		[Test]
		public function testbreakJRealC():void
		{
			var lines:Array = Line.pointsToLines([new Point(342, 187), new Point(328, 185), new Point(322, 185), new Point(315, 186), new Point(311, 187), new Point(308, 187), new Point(304, 188), new Point(300, 189), new Point(296, 191), new Point(292, 192), new Point(287, 194), new Point(283, 196), new Point(279, 198), new Point(274, 201), new Point(270, 203), new Point(265, 206), new Point(261, 210), new Point(257, 213), new Point(253, 217), new Point(248, 220), new Point(244, 224), new Point(240, 228), new Point(237, 233), new Point(234, 237), new Point(230, 241), new Point(228, 246), new Point(226, 250), new Point(224, 255), new Point(222, 260), new Point(221, 264), new Point(221, 269), new Point(220, 273), new Point(220, 278), new Point(220, 282), new Point(220, 286), new Point(221, 289), new Point(222, 293), new Point(224, 296), new Point(226, 300), new Point(228, 303), new Point(231, 306), new Point(234, 309), new Point(238, 312), new Point(242, 315), new Point(251, 321), new Point(256, 324), new Point(261, 327), new Point(266, 329), new Point(272, 331), new Point(278, 334), new Point(284, 336), new Point(290, 338), new Point(301, 341), new Point(307, 343), new Point(314, 344), new Point(320, 345), new Point(326, 345), new Point(332, 346), new Point(339, 346), new Point(345, 347), new Point(350, 347), new Point(356, 347), new Point(360, 346) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(62, results[0].length);
		}
		
		[Test]
		public function testbreakJRealJ():void
		{
			var lines:Array = Line.pointsToLines([new Point(414, 89), new Point(414, 111), new Point(416, 120), new Point(417, 125), new Point(418, 131), new Point(419, 138), new Point(420, 145), new Point(421, 152), new Point(421, 159), new Point(421, 167), new Point(421, 175), new Point(421, 182), new Point(421, 190), new Point(421, 198), new Point(421, 206), new Point(421, 214), new Point(421, 223), new Point(420, 231), new Point(420, 240), new Point(419, 257), new Point(418, 275), new Point(417, 283), new Point(416, 292), new Point(416, 300), new Point(415, 308), new Point(413, 316), new Point(412, 324), new Point(411, 332), new Point(409, 339), new Point(407, 346), new Point(403, 360), new Point(401, 366), new Point(398, 371), new Point(395, 376), new Point(391, 381), new Point(388, 385), new Point(384, 388), new Point(380, 391), new Point(376, 394), new Point(371, 396), new Point(367, 398), new Point(362, 400), new Point(357, 401), new Point(352, 401), new Point(347, 401), new Point(342, 400), new Point(336, 399), new Point(331, 397), new Point(326, 394), new Point(321, 390), new Point(316, 386), new Point(311, 380), new Point(306, 374), new Point(300, 366), new Point(291, 349), new Point(282, 330), new Point(275, 311), new Point(273, 303), new Point(271, 296) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(lines.length, results[0].length + results[1].length);
			Assert.assertEquals(23, results[0].length);
			assertSamePoint(new Point(414, 89), results[0][0].line.StartPoint);
			assertSamePoint(new Point(416, 300), results[0][22].line.EndPoint);
			var line:Line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[0]));
			Assert.assertEquals("First part is I", PieceIdentifiers.I, Piece.determinePieceType(line));
			Assert.assertEquals(35, results[1].length);
			assertSamePoint(new Point(416, 300), results[1][0].line.StartPoint);
			assertSamePoint(new Point(271, 296), results[1][34].line.EndPoint);
			line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[1]));
			Assert.assertEquals("Second part is U", PieceIdentifiers.U, Piece.determinePieceType(line));
		}
		
		
		[Test]
		public function testbreakJSimpleCaret():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 55);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 80),
								new Point(140, 60),
								midPoint,
								new Point(160, 60),
								new Point(190, 80),
								endPoint
							]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(6, results[0].length);
		}
		
		[Test]
		public function testbreakJRealTwoStrokeF():void
		{
			var startPoint:Point = new Point(419, 166);
			var midPoint:Point = new Point(254, 173);
			var endPoint:Point = new Point(258, 415);
			var lines:Array = Line.pointsToLines([startPoint, new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(27, results[0].length);
			assertSamePoint(startPoint, results[0][0].line.StartPoint);
			assertSamePoint(midPoint, results[0][26].line.EndPoint);
			var line:Line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[0]));
			Assert.assertEquals("First part is Dash", PieceIdentifiers.DASH, Piece.determinePieceType(line));
			Assert.assertEquals(50, results[1].length);
			assertSamePoint(midPoint, results[1][0].line.StartPoint);
			assertSamePoint(endPoint, results[1][49].line.EndPoint);
			line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[1]));
			Assert.assertEquals("Second part is I", PieceIdentifiers.I, Piece.determinePieceType(line));
		}
		
		[Test]
		public function testbreakJRealG():void
		{
			var startPoint:Point = new Point(378, 151);
			var endPoint:Point = new Point(338, 309);
			var lines:Array = Line.pointsToLines([startPoint, new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakJ([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(126, results[0].length);
			assertSamePoint(startPoint, results[0][0].line.StartPoint);
			assertSamePoint(endPoint, results[0][125].line.EndPoint);
			var line:Line = LineInterpreter.packLine(LineInterpreter.getLinesFromStats(results[0]));
			Assert.assertEquals("Part is C", PieceIdentifiers.C, Piece.determinePieceType(line));
		}

		/*************************************
		 * breakS
		 *************************************/
		
		[Test]
		public function testBreakSRealS():void
		{
			var lines:Array = Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakS([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(43, results[0].length);
			Assert.assertEquals(lines.length-43, results[1].length);
			Assert.assertEquals(LineInterpreter.COUNTERCLOCKWISE, 
								LineInterpreter.directionOfAngle(results[0][results[0].length-1].totalAngle));
			Assert.assertEquals(LineInterpreter.CLOCKWISE, 
								LineInterpreter.directionOfAngle(results[1][results[1].length-1].totalAngle));
		}
		
		[Test]
		public function testbreakSSimpleCaret():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(150, 55);
			var endPoint:Point = new Point(200, 100);
			var lines:Array = Line.pointsToLines([
								startPoint,
								new Point(110, 80),
								new Point(140, 60),
								midPoint,
								new Point(160, 60),
								new Point(190, 80),
								endPoint
							]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakS([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(6, results[0].length);
		}

		
		[Test]
		public function testBreakSRealFTwoStrokes():void
		{
			var startPoint:Point = new Point(419, 166);
			var endPoint:Point = new Point(258, 415);
			var lines:Array = Line.pointsToLines([startPoint, new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakS([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(77, results[0].length);
		}
		
		[Test]
		public function testBreakSRealVOneStroke():void
		{
			var startPoint:Point = new Point(185, 158);
			var endPoint:Point = new Point(374, 177);
			var lines:Array = Line.pointsToLines([startPoint, new Point(194, 178), new Point(199, 184), new Point(208, 197), new Point(211, 202), new Point(215, 207), new Point(219, 213), new Point(226, 225), new Point(230, 232), new Point(238, 246), new Point(246, 261), new Point(249, 269), new Point(253, 277), new Point(256, 286), new Point(260, 294), new Point(263, 302), new Point(266, 310), new Point(269, 317), new Point(272, 324), new Point(274, 330), new Point(276, 336), new Point(278, 340), new Point(280, 344), new Point(282, 350), new Point(283, 352), new Point(284, 353), new Point(285, 353), new Point(286, 353), new Point(287, 353), new Point(288, 351), new Point(289, 349), new Point(292, 343), new Point(294, 338), new Point(295, 333), new Point(297, 327), new Point(299, 321), new Point(301, 314), new Point(303, 306), new Point(305, 298), new Point(310, 280), new Point(313, 270), new Point(315, 260), new Point(318, 251), new Point(324, 233), new Point(329, 217), new Point(332, 210), new Point(339, 198), new Point(346, 187), new Point(350, 183), new Point(358, 176), new Point(366, 173), new Point(369, 172), new Point(373, 175), endPoint ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakS([stats], drawArea);
			Assert.assertEquals(1, results.length);
			Assert.assertEquals(77, results[0].length);
		}
		
		/*************************************
		 * calculateLineStats
		 *************************************/
		
		[Test]
		public function testCalculateLineStatsRealS():void
		{
			var lines:Array = Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			Assert.assertEquals(lines.length, stats.length);
			for (var i:int=0; i < lines.length; i++)
			{
				Assert.assertEquals(lines[i], stats[i].line);
				Assert.assertEquals(lines[i].Length, stats[i].length);
				Assert.assertEquals("Total angle at "+i+" is counterclockwise",
						LineInterpreter.COUNTERCLOCKWISE, LineInterpreter.directionOfAngle(stats[i].totalAngle));
			}
		}
		
		/*************************************
		 * splitLineStats
		 *************************************/
		
		[Test]
		public function testSplitLineStatsRealS():void
		{
			var lines:Array = Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.splitLineStats(stats, 44, drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(44, results[0].length);
			Assert.assertEquals(lines.length-44, results[1].length);
			assertSameAngles(results[1][0].angle, results[1][0].totalAngle);
			assertSameValues(results[1][0].length, results[1][0].totalLength);
		}

		
		/*************************************
		 * breakL
		 *************************************/
		
		[Test]
		public function testBreakLA1():void
		{
			var lines:Array = Line.pointsToLines([new Point(285, 138), new Point(284, 142), new Point(283, 146), new Point(283, 149), new Point(282, 158), new Point(281, 161), new Point(281, 165), new Point(280, 174), new Point(280, 179), new Point(279, 184), new Point(279, 189), new Point(278, 194), new Point(278, 199), new Point(277, 204), new Point(276, 210), new Point(275, 215), new Point(274, 220), new Point(272, 226), new Point(269, 238), new Point(267, 244), new Point(265, 250), new Point(262, 256), new Point(260, 262), new Point(258, 269), new Point(255, 276), new Point(253, 282), new Point(250, 289), new Point(248, 296), new Point(245, 303), new Point(242, 310), new Point(239, 317), new Point(236, 324), new Point(233, 331), new Point(230, 338), new Point(227, 345), new Point(224, 352), new Point(221, 359), new Point(219, 365), new Point(217, 371), new Point(214, 377), new Point(213, 382), new Point(211, 387), new Point(210, 392), new Point(209, 396), new Point(209, 400), new Point(209, 403), new Point(209, 406), new Point(210, 408), new Point(212, 410) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		[Test]
		public function testBreakLA2():void
		{
			var lines:Array = Line.pointsToLines([new Point(290, 125), new Point(294, 128), new Point(295, 130), new Point(299, 138), new Point(300, 141), new Point(301, 145), new Point(303, 149), new Point(304, 154), new Point(306, 159), new Point(308, 165), new Point(313, 178), new Point(316, 185), new Point(320, 192), new Point(323, 199), new Point(327, 207), new Point(331, 215), new Point(336, 224), new Point(340, 232), new Point(345, 241), new Point(350, 250), new Point(355, 259), new Point(360, 268), new Point(365, 278), new Point(370, 287), new Point(375, 295), new Point(380, 303), new Point(385, 311), new Point(390, 319), new Point(394, 326), new Point(398, 333), new Point(402, 339), new Point(405, 344), new Point(408, 349), new Point(414, 357), new Point(418, 362), new Point(420, 365), new Point(421, 366), new Point(422, 367), new Point(423, 368), new Point(424, 369), new Point(425, 369) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		[Test]
		public function testBreakLA3():void
		{
			var lines:Array = Line.pointsToLines([new Point(361, 280), new Point(360, 280), new Point(355, 281), new Point(344, 281), new Point(339, 281), new Point(328, 281), new Point(316, 281), new Point(309, 281), new Point(296, 283), new Point(282, 284), new Point(275, 285), new Point(268, 286), new Point(261, 288), new Point(254, 289), new Point(248, 291), new Point(242, 292), new Point(236, 294), new Point(231, 295), new Point(228, 296) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		[Test]
		public function testBreakLC():void
		{
			var lines:Array = Line.pointsToLines([new Point(342, 187), new Point(328, 185), new Point(322, 185), new Point(315, 186), new Point(311, 187), new Point(308, 187), new Point(304, 188), new Point(300, 189), new Point(296, 191), new Point(292, 192), new Point(287, 194), new Point(283, 196), new Point(279, 198), new Point(274, 201), new Point(270, 203), new Point(265, 206), new Point(261, 210), new Point(257, 213), new Point(253, 217), new Point(248, 220), new Point(244, 224), new Point(240, 228), new Point(237, 233), new Point(234, 237), new Point(230, 241), new Point(228, 246), new Point(226, 250), new Point(224, 255), new Point(222, 260), new Point(221, 264), new Point(221, 269), new Point(220, 273), new Point(220, 278), new Point(220, 282), new Point(220, 286), new Point(221, 289), new Point(222, 293), new Point(224, 296), new Point(226, 300), new Point(228, 303), new Point(231, 306), new Point(234, 309), new Point(238, 312), new Point(242, 315), new Point(251, 321), new Point(256, 324), new Point(261, 327), new Point(266, 329), new Point(272, 331), new Point(278, 334), new Point(284, 336), new Point(290, 338), new Point(301, 341), new Point(307, 343), new Point(314, 344), new Point(320, 345), new Point(326, 345), new Point(332, 346), new Point(339, 346), new Point(345, 347), new Point(350, 347), new Point(356, 347), new Point(360, 346) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		[Test]
		public function testBreakLETwoStrokes():void
		{
			var lines:Array = Line.pointsToLines([new Point(379, 144), new Point(372, 146), new Point(367, 147), new Point(364, 148), new Point(360, 148), new Point(356, 149), new Point(352, 150), new Point(348, 150), new Point(343, 151), new Point(333, 152), new Point(328, 152), new Point(323, 153), new Point(318, 153), new Point(312, 153), new Point(306, 153), new Point(301, 153), new Point(296, 153), new Point(290, 153), new Point(285, 153), new Point(281, 152), new Point(276, 152), new Point(271, 152), new Point(267, 152), new Point(263, 152), new Point(260, 152), new Point(256, 152), new Point(253, 152), new Point(250, 151), new Point(247, 151), new Point(245, 151), new Point(242, 151), new Point(240, 151), new Point(238, 151), new Point(236, 150), new Point(234, 150), new Point(232, 150), new Point(230, 150), new Point(229, 150), new Point(228, 150), new Point(227, 151), new Point(226, 151), new Point(226, 152), new Point(226, 154), new Point(227, 155), new Point(227, 156), new Point(228, 158), new Point(230, 162), new Point(231, 164), new Point(232, 166), new Point(233, 169), new Point(234, 172), new Point(235, 175), new Point(236, 178), new Point(237, 182), new Point(237, 186), new Point(238, 190), new Point(239, 194), new Point(239, 198), new Point(239, 203), new Point(239, 208), new Point(239, 213), new Point(239, 218), new Point(239, 223), new Point(238, 229), new Point(237, 235), new Point(236, 247), new Point(235, 253), new Point(235, 259), new Point(234, 272), new Point(234, 278), new Point(235, 284), new Point(235, 291), new Point(236, 297), new Point(237, 304), new Point(239, 310), new Point(240, 316), new Point(241, 322), new Point(242, 328), new Point(243, 333), new Point(244, 338), new Point(245, 342), new Point(245, 347), new Point(246, 351), new Point(247, 357), new Point(247, 360), new Point(247, 363), new Point(248, 365), new Point(248, 367), new Point(248, 368), new Point(248, 370), new Point(248, 371), new Point(249, 373), new Point(249, 375), new Point(250, 375), new Point(250, 376), new Point(251, 376), new Point(252, 376), new Point(253, 376), new Point(255, 376), new Point(257, 376), new Point(262, 375), new Point(268, 374), new Point(274, 373), new Point(278, 372), new Point(282, 371), new Point(286, 369), new Point(290, 368), new Point(295, 366), new Point(299, 364), new Point(305, 362), new Point(316, 358), new Point(323, 355), new Point(329, 353), new Point(336, 351), new Point(343, 350), new Point(350, 348), new Point(356, 347), new Point(363, 347), new Point(376, 345), new Point(382, 345), new Point(388, 344) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(3, results.length);
		}
		
		[Test]
		public function testBreakLF():void
		{
			var lines:Array = Line.pointsToLines([new Point(419, 166), new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), new Point(258, 415) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(2, results.length);
			Assert.assertEquals(29, results[0].length);
			Assert.assertEquals(12, results[1].length);
			Assert.assertEquals(36, results[2].length);
		}
		
		[Test]
		public function testBreakLFTwoStrokesSlightTurnAtBottom():void
		{
			var lines:Array = Line.pointsToLines([new Point(371, 175), new Point(355, 179), new Point(350, 180), new Point(347, 180), new Point(344, 180), new Point(341, 180), new Point(338, 181), new Point(335, 181), new Point(331, 181), new Point(328, 181), new Point(320, 181), new Point(316, 181), new Point(312, 181), new Point(308, 181), new Point(304, 181), new Point(300, 181), new Point(296, 180), new Point(292, 180), new Point(288, 180), new Point(284, 180), new Point(280, 179), new Point(276, 179), new Point(272, 179), new Point(268, 178), new Point(264, 178), new Point(256, 177), new Point(252, 177), new Point(248, 177), new Point(245, 176), new Point(242, 176), new Point(239, 176), new Point(236, 175), new Point(233, 175), new Point(231, 175), new Point(228, 175), new Point(226, 175), new Point(225, 175), new Point(223, 175), new Point(222, 175), new Point(221, 175), new Point(220, 175), new Point(220, 176), new Point(219, 177), new Point(219, 178), new Point(219, 180), new Point(219, 181), new Point(220, 183), new Point(220, 185), new Point(220, 187), new Point(220, 190), new Point(221, 193), new Point(221, 196), new Point(221, 199), new Point(221, 203), new Point(222, 208), new Point(222, 212), new Point(222, 223), new Point(222, 229), new Point(222, 235), new Point(222, 241), new Point(221, 248), new Point(221, 255), new Point(220, 263), new Point(220, 270), new Point(219, 278), new Point(219, 286), new Point(218, 294), new Point(217, 302), new Point(217, 309), new Point(217, 317), new Point(216, 324), new Point(216, 331), new Point(217, 337), new Point(219, 348), new Point(223, 358) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(2, results.length);
		}
		

		[Test]
		public function testBreakLKTwoStrokes():void
		{
			var lines:Array = Line.pointsToLines([new Point(422, 127), new Point(423, 127), new Point(410, 143), new Point(404, 151), new Point(401, 155), new Point(395, 162), new Point(391, 166), new Point(383, 173), new Point(379, 177), new Point(374, 181), new Point(369, 185), new Point(359, 194), new Point(347, 203), new Point(342, 207), new Point(330, 216), new Point(325, 220), new Point(320, 224), new Point(315, 228), new Point(310, 232), new Point(305, 235), new Point(297, 243), new Point(292, 246), new Point(289, 250), new Point(285, 253), new Point(281, 255), new Point(278, 258), new Point(275, 260), new Point(272, 261), new Point(270, 262), new Point(268, 263), new Point(266, 264), new Point(264, 265), new Point(263, 265), new Point(261, 265), new Point(261, 266), new Point(262, 266), new Point(265, 267), new Point(266, 268), new Point(271, 270), new Point(274, 271), new Point(278, 273), new Point(282, 275), new Point(286, 278), new Point(290, 280), new Point(301, 286), new Point(319, 294), new Point(334, 300), new Point(342, 304), new Point(351, 307), new Point(359, 311), new Point(376, 319), new Point(385, 323), new Point(401, 333), new Point(416, 344), new Point(423, 350), new Point(436, 360), new Point(442, 364) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(2, results.length);
		}

		[Test]
		public function testBreakLLOneStrokeSlightCurveOnEnd():void
		{
			var lines:Array = Line.pointsToLines([new Point(228, 132), new Point(227, 147), new Point(227, 154), new Point(227, 158), new Point(228, 163), new Point(228, 168), new Point(228, 179), new Point(228, 193), new Point(229, 207), new Point(229, 214), new Point(229, 222), new Point(230, 229), new Point(230, 237), new Point(230, 244), new Point(230, 251), new Point(230, 258), new Point(230, 272), new Point(229, 285), new Point(228, 300), new Point(228, 306), new Point(228, 313), new Point(227, 319), new Point(227, 325), new Point(227, 331), new Point(226, 336), new Point(226, 340), new Point(225, 347), new Point(225, 353), new Point(225, 356), new Point(225, 357), new Point(226, 359), new Point(226, 360), new Point(228, 362), new Point(229, 362), new Point(231, 363), new Point(235, 363), new Point(238, 363), new Point(240, 363), new Point(244, 363), new Point(248, 362), new Point(252, 361), new Point(257, 361), new Point(261, 360), new Point(267, 360), new Point(272, 359), new Point(278, 358), new Point(285, 358), new Point(291, 357), new Point(298, 356), new Point(305, 355), new Point(320, 353), new Point(336, 351), new Point(352, 350), new Point(360, 349), new Point(367, 349), new Point(374, 350), new Point(388, 352), new Point(399, 356), new Point(409, 361), new Point(413, 364) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(2, results.length);
		}
		
		[Test]
		public function testBreakLP():void
		{
			var lines:Array = Line.pointsToLines([new Point(269, 145), new Point(278, 144), new Point(284, 144), new Point(292, 144), new Point(296, 144), new Point(305, 144), new Point(322, 144), new Point(328, 144), new Point(334, 145), new Point(341, 146), new Point(354, 148), new Point(367, 153), new Point(373, 156), new Point(385, 162), new Point(395, 170), new Point(403, 179), new Point(410, 188), new Point(413, 193), new Point(416, 203), new Point(417, 213), new Point(416, 222), new Point(414, 227), new Point(408, 236), new Point(400, 244), new Point(395, 247), new Point(389, 250), new Point(383, 253), new Point(368, 258), new Point(360, 260), new Point(351, 262), new Point(342, 263), new Point(325, 264), new Point(317, 265), new Point(302, 266), new Point(296, 266), new Point(291, 266), new Point(287, 266), new Point(285, 266), new Point(284, 266), new Point(284, 265) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		[Test]
		public function testBreakLSharpP():void
		{
			var lines:Array = Line.pointsToLines([new Point(278, 199), new Point(281, 198), new Point(286, 197), new Point(289, 196), new Point(292, 195), new Point(295, 195), new Point(303, 193), new Point(307, 193), new Point(312, 193), new Point(317, 193), new Point(328, 194), new Point(341, 196), new Point(355, 202), new Point(361, 206), new Point(368, 210), new Point(374, 215), new Point(385, 226), new Point(389, 231), new Point(393, 237), new Point(396, 242), new Point(397, 247), new Point(398, 252), new Point(398, 257), new Point(396, 261), new Point(389, 269), new Point(379, 274), new Point(373, 277), new Point(365, 279), new Point(358, 280), new Point(341, 282), new Point(332, 283), new Point(323, 283), new Point(315, 284), new Point(298, 284), new Point(290, 284), new Point(270, 285), ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:Array = LineInterpreter.breakL([stats], drawArea);
			Assert.assertEquals(1, results.length);
		}
		
		/*************************************
		 * sharpAnglePercent
		 *************************************/
		
		[Test]
		public function testSharpAnglePercentF():void
		{
			var lines:Array = Line.pointsToLines([new Point(419, 166), new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), new Point(258, 415) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:String = LineInterpreter.sharpAnglePercent(stats);
			//Assert.assertEquals("", results);
		}

		[Test]
		public function testSharpAnglePercentKTwoStrokes():void
		{
			var lines:Array = Line.pointsToLines([new Point(422, 127), new Point(423, 127), new Point(410, 143), new Point(404, 151), new Point(401, 155), new Point(395, 162), new Point(391, 166), new Point(383, 173), new Point(379, 177), new Point(374, 181), new Point(369, 185), new Point(359, 194), new Point(347, 203), new Point(342, 207), new Point(330, 216), new Point(325, 220), new Point(320, 224), new Point(315, 228), new Point(310, 232), new Point(305, 235), new Point(297, 243), new Point(292, 246), new Point(289, 250), new Point(285, 253), new Point(281, 255), new Point(278, 258), new Point(275, 260), new Point(272, 261), new Point(270, 262), new Point(268, 263), new Point(266, 264), new Point(264, 265), new Point(263, 265), new Point(261, 265), new Point(261, 266), new Point(262, 266), new Point(265, 267), new Point(266, 268), new Point(271, 270), new Point(274, 271), new Point(278, 273), new Point(282, 275), new Point(286, 278), new Point(290, 280), new Point(301, 286), new Point(319, 294), new Point(334, 300), new Point(342, 304), new Point(351, 307), new Point(359, 311), new Point(376, 319), new Point(385, 323), new Point(401, 333), new Point(416, 344), new Point(423, 350), new Point(436, 360), new Point(442, 364) ]);
			var stats:Array = LineInterpreter.calculateLineStats(lines, drawArea);
			var results:String = LineInterpreter.sharpAnglePercent(stats);
			//Assert.assertEquals("", results);
		}

		/*************************************
		 * Utility methods
		 *************************************/

		 protected function assertSameAngles(expected:Number, actual:Number):void
		{
			var approxExpected:Number = Math.floor(expected*1000)/1000;
			var approxActual:Number = Math.floor(actual*1000)/1000;
			Assert.assertEquals(approxExpected, approxActual);
		}

		 protected function assertSameValues(expected:Number, actual:Number):void
		{
			assertSameAngles(expected, actual);
		}
		
		protected function assertArraysEqual(expected:Array, actual:Array):void
		{
			Assert.assertEquals(expected.length, actual.length);
			for (var i:int = 0; i < expected.length; i++)
			{
				if (expected[i] is Array && actual[i] is Array)
				{
					assertArraysEqual(expected[i], actual[i]);
				}
				else
				{
					Assert.assertEquals("Expected line:"+expected[i].StartPoint+","+expected[i].EndPoint+" but was line:"+actual[i].StartPoint+","+actual[i].EndPoint,
						expected[i], actual[i]);
				}
			}
		}
		
		protected function assertSamePoint(expected:Point, actual:Point):void
		{
			Assert.assertEquals("Expected x="+expected.x+" but was x="+actual.x+" for points expected="+expected+", actual="+actual,
				expected.x, actual.x);
			Assert.assertEquals("Expected y="+expected.y+" but was y="+actual.y+" for points expected="+expected+", actual="+actual,
				expected.y, actual.y);
		}
	}
}