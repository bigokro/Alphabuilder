package tests.objects
{
	import org.flexunit.Assert;
	import flash.geom.*;
	import mx.containers.*;
	import objects.*
	import utils.*

	public class PieceTest
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
		 * relativeLocation
		 *************************************/
		
		[Test]
		public function testRelativeLocationRealP():void
		{
			var verticalLine:Line = LineInterpreter.packLine(Line.pointsToLines([new Point(261, 145), new Point(263, 150), new Point(264, 157), new Point(265, 161), new Point(265, 166), new Point(265, 172), new Point(265, 178), new Point(265, 184), new Point(266, 198), new Point(265, 213), new Point(265, 221), new Point(265, 229), new Point(265, 238), new Point(266, 247), new Point(266, 257), new Point(267, 267), new Point(268, 278), new Point(270, 300), new Point(274, 323), new Point(278, 346), new Point(283, 366), new Point(286, 381), new Point(287, 386), new Point(288, 390), new Point(288, 391), new Point(288, 390), new Point(287, 387) ]));
			var curvedLine:Line = LineInterpreter.packLine(Line.pointsToLines([new Point(269, 145), new Point(278, 144), new Point(284, 144), new Point(292, 144), new Point(296, 144), new Point(305, 144), new Point(322, 144), new Point(328, 144), new Point(334, 145), new Point(341, 146), new Point(354, 148), new Point(367, 153), new Point(373, 156), new Point(385, 162), new Point(395, 170), new Point(403, 179), new Point(410, 188), new Point(413, 193), new Point(416, 203), new Point(417, 213), new Point(416, 222), new Point(414, 227), new Point(408, 236), new Point(400, 244), new Point(395, 247), new Point(389, 250), new Point(383, 253), new Point(368, 258), new Point(360, 260), new Point(351, 262), new Point(342, 263), new Point(325, 264), new Point(317, 265), new Point(302, 266), new Point(296, 266), new Point(291, 266), new Point(287, 266), new Point(285, 266), new Point(284, 266), new Point(284, 265) ]));
			var location:int = Piece.relativeLocation(Part.lineToPart(verticalLine), Part.lineToPart(curvedLine));
			Assert.assertEquals(GeometryUtils.NORTHEAST, location);
		}
		
		[Test]
		public function testRelativeLocationOfficialP():void
		{
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.P];
			var location:int = Piece.relativeLocation(state.parts[1], state.parts[0]);
			Assert.assertEquals(GeometryUtils.NORTHEAST, location);
		}
		
		[Test]
		public function testRelativeLocationOfficialD():void
		{
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var location:int = Piece.relativeLocation(state.parts[1], state.parts[0]);
			Assert.assertEquals(GeometryUtils.EAST, location);
		}

	}
}