package tests.objects
{
	import org.flexunit.Assert;
	import flash.geom.*;
	import mx.containers.*;
	import objects.*

	public class LineTest
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
			StateDefinitions.Instance.startup(new Canvas());
		}

		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		

		/*************************************
		 * toString
		 *************************************/
		
		[Test]
		public function testToStringNoCurve():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(200,200), null]);
			Assert.assertEquals("<Line: Start(x=100, y=100), End(x=200, y=200), Curve(null)>", line);
		}
		
		[Test]
		public function testToStringWithCurve():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(200,200), new Point(100,200)]);
			Assert.assertEquals("<Line: Start(x=100, y=100), End(x=200, y=200), Curve(x=100, y=200)>", "" + line);
		}

		/*************************************
		 * determineCenter
		 *************************************/
		
		[Test]
		public function testDetermineCenterI():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(100,200), null]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(100, 150), center);
		}
		
		[Test]
		public function testDetermineCenterDash():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(200,100), null]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(150, 100), center);
		}
		
		[Test]
		public function testDetermineCenterBackslash():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(200,200), null]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(150, 150), center);
		}
		
		[Test]
		public function testDetermineCenterC():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(100,200), new Point(0,150)]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(50, 150), center);
		}
		
		[Test]
		public function testDetermineCenterRightParen():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(100,200), new Point(200,150)]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(150, 150), center);
		}
		
		[Test]
		public function testDetermineCenterU():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(200,100), new Point(150,200)]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(150, 150), center);
		}
		
		[Test]
		public function testDetermineCenterCaret():void
		{
			var line:Line = new Line([new Point(100, 100), new Point(200,100), new Point(150,0)]);
			var center:Point = Line.determineCenter(line.Points);
			assertSamePoint(new Point(150, 50), center);
		}
		

		/*************************************
		 * MidPoint
		 *************************************/
		
		[Test]
		public function testMidPointOfficialDLine():void
		{
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var part:Part = state.parts[1];
			var line:Line = part.Lines[0];
			var center:Point = line.MidPoint;
			assertSamePoint(new Point(40, 50), center);
		}

		[Test]
		public function testMidPointOfficialDCurve():void
		{
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var part:Part = state.parts[0];
			var line:Line = part.Lines[0];
			var center:Point = line.MidPoint;
			assertSamePoint(new Point(40, 25), line.StartPoint);
			assertSamePoint(new Point(75, 50), line.EndPoint);
			assertSamePoint(new Point(75, 25), line.CurvePoint);
			assertSamePoint(new Point(66.25, 31.25), center);
			line = part.Lines[1];
			center = line.MidPoint;
			assertSamePoint(new Point(75, 50), line.StartPoint);
			assertSamePoint(new Point(40, 75), line.EndPoint);
			assertSamePoint(new Point(75, 75), line.CurvePoint);
			assertSamePoint(new Point(66.25, 68.75), center);
		}
				
		/*************************************
		 * Utility functions
		 *************************************/
		
		protected function assertSamePoint(expected:Point, actual:Point):void
		{
			Assert.assertEquals("Expected x="+expected.x+" but was x="+actual.x+" for points expected="+expected+", actual="+actual,
				expected.x, actual.x);
			Assert.assertEquals("Expected y="+expected.y+" but was y="+actual.y+" for points expected="+expected+", actual="+actual,
				expected.y, actual.y);
		}
		
	}
}