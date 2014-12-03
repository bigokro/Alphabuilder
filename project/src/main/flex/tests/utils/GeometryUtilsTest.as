package tests.utils
{
	import org.flexunit.Assert;
	import flash.geom.*;
	import objects.*
	import utils.*

	public class GeometryUtilsTest
	{
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
		 * directionToPoint
		 *************************************/

		[Test( description = "Test direction north" )]
		public function testdirectionToPointNorth():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 50);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.NORTH, direction);
		}

		[Test]
		public function testdirectionToPointNortheast():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(150, 50);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.NORTHEAST, direction);
		}

		[Test]
		public function testdirectionToPointEast():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(150, 100);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.EAST, direction);
		}

		[Test]
		public function testdirectionToPointSoutheast():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(150, 150);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.SOUTHEAST, direction);
		}

		[Test]
		public function testdirectionToPointSOUTH():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 150);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.SOUTH, direction);
		}

		[Test]
		public function testdirectionToPointSouthwest():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(50, 150);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.SOUTHWEST, direction);
		}

		[Test]
		public function testdirectionToPointWest():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(50, 100);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.WEST, direction);
		}

		[Test]
		public function testdirectionToPointNorthwest():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(50, 50);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.NORTHWEST, direction);
		}

		[Test]
		public function testdirectionToPointSame():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 100);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint);
			Assert.assertEquals(GeometryUtils.SAME, direction);
		}

		[Test]
		public function testdirectionToPointSameWithinRadialTolerance():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(105, 105);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0, 10);
			Assert.assertEquals(GeometryUtils.SAME, direction);
		}

		[Test]
		public function testdirectionToPointEastOutsideRadialTolerance():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(102, 100);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0, 1);
			Assert.assertEquals(GeometryUtils.EAST, direction);
		}

		[Test]
		public function testdirectionToPointEastWithinAngularTolerance():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(110, 101);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0.1);
			Assert.assertEquals(GeometryUtils.EAST, direction);
		}

		[Test]
		public function testdirectionToPointNortheastOutsideAngularTolerance():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(110, 98);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0.1);
			Assert.assertEquals(GeometryUtils.NORTHEAST, direction);
		}

		[Test]
		public function testdirectionToPointNorthWithinAngularTolerance():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(101, 90);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0.1);
			Assert.assertEquals(GeometryUtils.NORTH, direction);
		}

		[Test]
		public function testdirectionToPointNorthwesttOutsideAngularTolerance():void
		{
			var startPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(98, 90);
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0.1);
			Assert.assertEquals(GeometryUtils.NORTHWEST, direction);
		}

		[Test]
		public function testdirectionToPointRealPMidPoints():void
		{
			var verticalLine:Line = LineInterpreter.packLine(Line.pointsToLines([new Point(261, 145), new Point(263, 150), new Point(264, 157), new Point(265, 161), new Point(265, 166), new Point(265, 172), new Point(265, 178), new Point(265, 184), new Point(266, 198), new Point(265, 213), new Point(265, 221), new Point(265, 229), new Point(265, 238), new Point(266, 247), new Point(266, 257), new Point(267, 267), new Point(268, 278), new Point(270, 300), new Point(274, 323), new Point(278, 346), new Point(283, 366), new Point(286, 381), new Point(287, 386), new Point(288, 390), new Point(288, 391), new Point(288, 390), new Point(287, 387) ]));
			var curvedLine:Line = LineInterpreter.packLine(Line.pointsToLines([new Point(269, 145), new Point(278, 144), new Point(284, 144), new Point(292, 144), new Point(296, 144), new Point(305, 144), new Point(322, 144), new Point(328, 144), new Point(334, 145), new Point(341, 146), new Point(354, 148), new Point(367, 153), new Point(373, 156), new Point(385, 162), new Point(395, 170), new Point(403, 179), new Point(410, 188), new Point(413, 193), new Point(416, 203), new Point(417, 213), new Point(416, 222), new Point(414, 227), new Point(408, 236), new Point(400, 244), new Point(395, 247), new Point(389, 250), new Point(383, 253), new Point(368, 258), new Point(360, 260), new Point(351, 262), new Point(342, 263), new Point(325, 264), new Point(317, 265), new Point(302, 266), new Point(296, 266), new Point(291, 266), new Point(287, 266), new Point(285, 266), new Point(284, 266), new Point(284, 265) ]));
			var startPoint:Point = verticalLine.MidPoint;
			var endPoint:Point = curvedLine.MidPoint;
			var direction:int = GeometryUtils.directionToPoint(startPoint, endPoint, 0.2);
			Assert.assertEquals(GeometryUtils.NORTHEAST, direction);
		}
		
		
		/*************************************
		 * angleBetweenLines
		 *************************************/

		[Test]
		public function testAngleBetweenLinesFirstNull():void
		{
			var midPoint:Point = new Point(200, 100);
			var endPoint:Point = new Point(300, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								null, 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(0, angle);
		}

		[Test]
		public function testAngleBetweenLinesSecondNull():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								null);
			Assert.assertEquals(0, angle);
		}

		[Test]
		public function testAngleBetweenLinesStraight():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(200, 100);
			var endPoint:Point = new Point(300, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(0, angle);
		}

		[Test]
		public function testAngleBetweenLines45CClock():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(150, 50);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(-Math.PI/4, angle);
		}

		[Test]
		public function testAngleBetweenLines45Clock():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(150, 150);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(Math.PI/4, angle);
		}

		[Test]
		public function testAngleBetweenLines90CClock():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 50);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(-Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90Clock():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(100, 150);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines135CClock():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(50, 50);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(GeometryUtils.EAST, GeometryUtils.directionToPoint(startPoint, midPoint));
			Assert.assertEquals(GeometryUtils.NORTHWEST, GeometryUtils.directionToPoint(midPoint, endPoint));
			Assert.assertEquals(-Math.PI*3/4, angle);
		}

		[Test]
		public function testAngleBetweenLines135Clock():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(50, 150);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(GeometryUtils.EAST, GeometryUtils.directionToPoint(startPoint, midPoint));
			Assert.assertEquals(GeometryUtils.SOUTHWEST, GeometryUtils.directionToPoint(midPoint, endPoint));
			Assert.assertEquals(Math.PI*3/4, angle);
		}

		[Test]
		public function testAngleBetweenLines180():void
		{
			var startPoint:Point = new Point(0, 100);
			var midPoint:Point = new Point(100, 100);
			var endPoint:Point = new Point(50, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			Assert.assertEquals(GeometryUtils.EAST, GeometryUtils.directionToPoint(startPoint, midPoint));
			Assert.assertEquals(GeometryUtils.WEST, GeometryUtils.directionToPoint(midPoint, endPoint));
			Assert.assertEquals(Math.PI, angle);
		}

		[Test]
		public function testAngleBetweenLines90North():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 95);
			var endPoint:Point = new Point(100, 90);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90East():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(105, 95);
			var endPoint:Point = new Point(110, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90South():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(105, 105);
			var endPoint:Point = new Point(100, 110);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90West():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 105);
			var endPoint:Point = new Point(90, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90NorthCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(105, 95);
			var endPoint:Point = new Point(100, 90);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90EastCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(105, 105);
			var endPoint:Point = new Point(110, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90SouthCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 105);
			var endPoint:Point = new Point(100, 110);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLines90WestCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 95);
			var endPoint:Point = new Point(90, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-Math.PI/2, angle);
		}

		[Test]
		public function testAngleBetweenLinesNorthEast():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(105, 90);
			var endPoint:Point = new Point(115, 85);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(0.643, angle);
		}

		[Test]
		public function testAngleBetweenLinesSouthEast():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(110, 105);
			var endPoint:Point = new Point(115, 115);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(0.643, angle);
		}

		[Test]
		public function testAngleBetweenLinesSouthWest():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 110);
			var endPoint:Point = new Point(85, 115);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(0.643, angle);
		}

		[Test]
		public function testAngleBetweenLinesNorthWest():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(90, 95);
			var endPoint:Point = new Point(85, 85);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(0.643, angle);
		}

		[Test]
		public function testAngleBetweenLinesNorthEastCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(110, 95);
			var endPoint:Point = new Point(115, 85);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-0.644, angle);
		}

		[Test]
		public function testAngleBetweenLinesSouthEastCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(105, 110);
			var endPoint:Point = new Point(115, 115);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-0.644, angle);
		}

		[Test]
		public function testAngleBetweenLinesSouthWestCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(90, 105);
			var endPoint:Point = new Point(85, 115);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-0.644, angle);
		}

		[Test]
		public function testAngleBetweenLinesNorthWestCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 90);
			var endPoint:Point = new Point(85, 85);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-0.644, angle);
		}

		[Test]
		public function testAngleBetweenLines45West():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 100);
			var endPoint:Point = new Point(90, 95);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(Math.PI/4, angle);
		}

		[Test]
		public function testAngleBetweenLines45WestCClock():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 100);
			var endPoint:Point = new Point(90, 105);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(-Math.PI/4, angle);
		}

		[Test]
		public function testAngleBetweenLinesDueWest():void
		{
			var startPoint:Point = new Point(100, 100);
			var midPoint:Point = new Point(95, 100);
			var endPoint:Point = new Point(90, 100);
			var angle:Number = GeometryUtils.angleBetweenLines(
								new Line([startPoint, midPoint, null]), 
								new Line([midPoint, endPoint, null]));
			assertSameAngles(0, angle);
		}

		/*************************************
		 * radiansToDegrees
		 *************************************/

		[Test]
		public function testRadiansToDegrees0():void
		{
			var radians:Number = 0;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(0, degrees);
		}

		[Test]
		public function testRadiansToDegrees45():void
		{
			var radians:Number = Math.PI/4;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(45, degrees);
		}

		[Test]
		public function testRadiansToDegrees60():void
		{
			var radians:Number = Math.PI/3;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(60, degrees);
		}

		[Test]
		public function testRadiansToDegrees90():void
		{
			var radians:Number = Math.PI/2;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(90, degrees);
		}

		[Test]
		public function testRadiansToDegrees180():void
		{
			var radians:Number = Math.PI;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(180, degrees);
		}

		[Test]
		public function testRadiansToDegrees360():void
		{
			var radians:Number = Math.PI * 2;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(360, degrees);
		}

		[Test]
		public function testRadiansToDegreesMinus45():void
		{
			var radians:Number = -Math.PI/4;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(-45, degrees);
		}

		[Test]
		public function testRadiansToDegreesMinus60():void
		{
			var radians:Number = -Math.PI/3;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(-60, degrees);
		}

		[Test]
		public function testRadiansToDegreesMinus90():void
		{
			var radians:Number = -Math.PI/2;
			var degrees:Number = GeometryUtils.radiansToDegrees(radians);
			assertSameAngles(-90, degrees);
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
	}
}