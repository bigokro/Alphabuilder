package tests.objects
{
	import org.flexunit.Assert;
	import flash.geom.*;
	import mx.containers.*;
	import objects.*
	import utils.*

	public class PartTest
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
		 * MidPoint
		 *************************************/
		
		[Test]
		public function testMidPointOfficialDLine():void
		{
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var part:Part = state.parts[1];
			var midPoint:Point = part.MidPoint;
			assertSamePoint(new Point(40, 50), midPoint);
		}

		[Test]
		public function testMidPointOfficialDCurve():void
		{
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var part:Part = state.parts[0];
			var midPoint:Point = part.MidPoint;
			assertSamePoint(new Point(66.25, 50), midPoint);
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