package tests.objects
{
	import org.flexunit.Assert;
	import flash.geom.*;
	import mx.containers.*;
	import objects.*
	import utils.*
	import games.alphawriter.*

	public class StateTest
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
			AlphawriterStateDefinitions.Instance.startup(new Canvas());
		}

		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}

		/*************************************
		 * matchScore
		 *************************************/
		
		[Test]
		public function testMatchScoreRealBTwoStrokes2ToB():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(230, 200), new Point(235, 217), new Point(236, 223), new Point(237, 227), new Point(238, 230), new Point(238, 235), new Point(239, 239), new Point(240, 250), new Point(241, 256), new Point(242, 263), new Point(242, 271), new Point(243, 280), new Point(245, 300), new Point(247, 323), new Point(248, 335), new Point(249, 347), new Point(251, 361), new Point(252, 373), new Point(253, 385), new Point(254, 396), new Point(255, 406), new Point(256, 415), new Point(256, 422), new Point(257, 427), new Point(258, 429), new Point(259, 430), ]));
			allLines.push(Line.pointsToLines([new Point(234, 197), new Point(243, 196), new Point(254, 195), new Point(267, 195), new Point(275, 195), new Point(283, 195), new Point(292, 196), new Point(310, 200), new Point(328, 206), new Point(336, 209), new Point(344, 213), new Point(351, 218), new Point(356, 222), new Point(360, 227), new Point(364, 237), new Point(363, 242), new Point(361, 247), new Point(358, 252), new Point(354, 257), new Point(349, 262), new Point(336, 271), new Point(330, 275), new Point(324, 279), new Point(318, 282), new Point(306, 289), new Point(301, 291), new Point(296, 294), new Point(291, 296), new Point(286, 298), new Point(282, 300), new Point(279, 302), new Point(272, 305), new Point(270, 306), new Point(271, 305), new Point(275, 303), new Point(278, 302), new Point(286, 300), new Point(291, 299), new Point(302, 298), new Point(313, 298), new Point(320, 299), new Point(332, 302), new Point(353, 312), new Point(359, 316), new Point(370, 327), new Point(378, 341), new Point(380, 348), new Point(381, 363), new Point(380, 372), new Point(375, 387), new Point(370, 394), new Point(360, 407), new Point(354, 412), new Point(341, 420), new Point(333, 423), new Point(316, 425), new Point(286, 424), new Point(275, 421), new Point(254, 416), new Point(235, 409), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.B];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(28, score);
		}
		
		[Test]
		public function testMatchScoreRealBTwoStrokes2ToD():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(230, 200), new Point(235, 217), new Point(236, 223), new Point(237, 227), new Point(238, 230), new Point(238, 235), new Point(239, 239), new Point(240, 250), new Point(241, 256), new Point(242, 263), new Point(242, 271), new Point(243, 280), new Point(245, 300), new Point(247, 323), new Point(248, 335), new Point(249, 347), new Point(251, 361), new Point(252, 373), new Point(253, 385), new Point(254, 396), new Point(255, 406), new Point(256, 415), new Point(256, 422), new Point(257, 427), new Point(258, 429), new Point(259, 430), ]));
			allLines.push(Line.pointsToLines([new Point(234, 197), new Point(243, 196), new Point(254, 195), new Point(267, 195), new Point(275, 195), new Point(283, 195), new Point(292, 196), new Point(310, 200), new Point(328, 206), new Point(336, 209), new Point(344, 213), new Point(351, 218), new Point(356, 222), new Point(360, 227), new Point(364, 237), new Point(363, 242), new Point(361, 247), new Point(358, 252), new Point(354, 257), new Point(349, 262), new Point(336, 271), new Point(330, 275), new Point(324, 279), new Point(318, 282), new Point(306, 289), new Point(301, 291), new Point(296, 294), new Point(291, 296), new Point(286, 298), new Point(282, 300), new Point(279, 302), new Point(272, 305), new Point(270, 306), new Point(271, 305), new Point(275, 303), new Point(278, 302), new Point(286, 300), new Point(291, 299), new Point(302, 298), new Point(313, 298), new Point(320, 299), new Point(332, 302), new Point(353, 312), new Point(359, 316), new Point(370, 327), new Point(378, 341), new Point(380, 348), new Point(381, 363), new Point(380, 372), new Point(375, 387), new Point(370, 394), new Point(360, 407), new Point(354, 412), new Point(341, 420), new Point(333, 423), new Point(316, 425), new Point(286, 424), new Point(275, 421), new Point(254, 416), new Point(235, 409), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(7, score);
		}
		
		[Test]
		public function testMatchScoreRealGToE():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(378, 151), new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), new Point(338, 309) ]));
			allLines.push(Line.pointsToLines([new Point(447, 293), new Point(438, 293), new Point(429, 293), new Point(419, 293), new Point(414, 293), new Point(402, 292), new Point(396, 292), new Point(383, 291), new Point(376, 290), new Point(369, 289), new Point(361, 289), new Point(346, 287), new Point(337, 286), new Point(329, 286), new Point(321, 285), new Point(304, 283), new Point(280, 282), new Point(266, 282), new Point(254, 282), new Point(248, 283), new Point(243, 283), new Point(238, 284), new Point(233, 285), new Point(226, 286), new Point(221, 286), new Point(220, 286) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.E];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(-3, score);
		}
		
		[Test]
		public function testMatchScoreRealGToG():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(378, 151), new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), new Point(338, 309) ]));
			allLines.push(Line.pointsToLines([new Point(447, 293), new Point(438, 293), new Point(429, 293), new Point(419, 293), new Point(414, 293), new Point(402, 292), new Point(396, 292), new Point(383, 291), new Point(376, 290), new Point(369, 289), new Point(361, 289), new Point(346, 287), new Point(337, 286), new Point(329, 286), new Point(321, 285), new Point(304, 283), new Point(280, 282), new Point(266, 282), new Point(254, 282), new Point(248, 283), new Point(243, 283), new Point(238, 284), new Point(233, 285), new Point(226, 286), new Point(221, 286), new Point(220, 286) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.G];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(11, score);
		}
		
		[Test]
		public function testMatchScoreRealGToS():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(378, 151), new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), new Point(338, 309) ]));
			allLines.push(Line.pointsToLines([new Point(447, 293), new Point(438, 293), new Point(429, 293), new Point(419, 293), new Point(414, 293), new Point(402, 292), new Point(396, 292), new Point(383, 291), new Point(376, 290), new Point(369, 289), new Point(361, 289), new Point(346, 287), new Point(337, 286), new Point(329, 286), new Point(321, 285), new Point(304, 283), new Point(280, 282), new Point(266, 282), new Point(254, 282), new Point(248, 283), new Point(243, 283), new Point(238, 284), new Point(233, 285), new Point(226, 286), new Point(221, 286), new Point(220, 286) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.S];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(7, score);
		}
		
		[Test]
		public function testMatchScoreRealGToSEndLines():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(378, 151), new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), new Point(338, 309) ]));
			allLines.push(Line.pointsToLines([new Point(447, 293), new Point(438, 293), new Point(429, 293), new Point(419, 293), new Point(414, 293), new Point(402, 292), new Point(396, 292), new Point(383, 291), new Point(376, 290), new Point(369, 289), new Point(361, 289), new Point(346, 287), new Point(337, 286), new Point(329, 286), new Point(321, 285), new Point(304, 283), new Point(280, 282), new Point(266, 282), new Point(254, 282), new Point(248, 283), new Point(243, 283), new Point(238, 284), new Point(233, 285), new Point(226, 286), new Point(221, 286), new Point(220, 286) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.S+"-end-lines"];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(1, score);
		}
		
		[Test]
		public function testMatchScoreRealPToP():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(261, 145), new Point(263, 150), new Point(264, 157), new Point(265, 161), new Point(265, 166), new Point(265, 172), new Point(265, 178), new Point(265, 184), new Point(266, 198), new Point(265, 213), new Point(265, 221), new Point(265, 229), new Point(265, 238), new Point(266, 247), new Point(266, 257), new Point(267, 267), new Point(268, 278), new Point(270, 300), new Point(274, 323), new Point(278, 346), new Point(283, 366), new Point(286, 381), new Point(287, 386), new Point(288, 390), new Point(288, 391), new Point(288, 390), new Point(287, 387) ]));
			allLines.push(Line.pointsToLines([new Point(269, 145), new Point(278, 144), new Point(284, 144), new Point(292, 144), new Point(296, 144), new Point(305, 144), new Point(322, 144), new Point(328, 144), new Point(334, 145), new Point(341, 146), new Point(354, 148), new Point(367, 153), new Point(373, 156), new Point(385, 162), new Point(395, 170), new Point(403, 179), new Point(410, 188), new Point(413, 193), new Point(416, 203), new Point(417, 213), new Point(416, 222), new Point(414, 227), new Point(408, 236), new Point(400, 244), new Point(395, 247), new Point(389, 250), new Point(383, 253), new Point(368, 258), new Point(360, 260), new Point(351, 262), new Point(342, 263), new Point(325, 264), new Point(317, 265), new Point(302, 266), new Point(296, 266), new Point(291, 266), new Point(287, 266), new Point(285, 266), new Point(284, 266), new Point(284, 265) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.P];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(16, score);
		}
		
		[Test]
		public function testMatchScoreRealPToD():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(261, 145), new Point(263, 150), new Point(264, 157), new Point(265, 161), new Point(265, 166), new Point(265, 172), new Point(265, 178), new Point(265, 184), new Point(266, 198), new Point(265, 213), new Point(265, 221), new Point(265, 229), new Point(265, 238), new Point(266, 247), new Point(266, 257), new Point(267, 267), new Point(268, 278), new Point(270, 300), new Point(274, 323), new Point(278, 346), new Point(283, 366), new Point(286, 381), new Point(287, 386), new Point(288, 390), new Point(288, 391), new Point(288, 390), new Point(287, 387) ]));
			allLines.push(Line.pointsToLines([new Point(269, 145), new Point(278, 144), new Point(284, 144), new Point(292, 144), new Point(296, 144), new Point(305, 144), new Point(322, 144), new Point(328, 144), new Point(334, 145), new Point(341, 146), new Point(354, 148), new Point(367, 153), new Point(373, 156), new Point(385, 162), new Point(395, 170), new Point(403, 179), new Point(410, 188), new Point(413, 193), new Point(416, 203), new Point(417, 213), new Point(416, 222), new Point(414, 227), new Point(408, 236), new Point(400, 244), new Point(395, 247), new Point(389, 250), new Point(383, 253), new Point(368, 258), new Point(360, 260), new Point(351, 262), new Point(342, 263), new Point(325, 264), new Point(317, 265), new Point(302, 266), new Point(296, 266), new Point(291, 266), new Point(287, 266), new Point(285, 266), new Point(284, 266), new Point(284, 265) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.D];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(12, score);
		}

		[Test]
		public function testMatchScoreNTwoStrokesToN():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(245, 174), new Point(244, 175), new Point(247, 191), new Point(247, 196), new Point(249, 206), new Point(250, 213), new Point(251, 228), new Point(252, 236), new Point(252, 245), new Point(252, 254), new Point(252, 264), new Point(252, 274), new Point(252, 297), new Point(253, 320), new Point(253, 331), new Point(253, 342), new Point(253, 352), new Point(253, 362), new Point(253, 370), new Point(253, 378), new Point(253, 383), new Point(254, 387), new Point(254, 390), new Point(256, 391) ]));
			allLines.push(Line.pointsToLines([new Point(258, 198), new Point(263, 205), new Point(269, 214), new Point(278, 230), new Point(281, 236), new Point(284, 242), new Point(288, 249), new Point(296, 264), new Point(308, 289), new Point(317, 306), new Point(321, 313), new Point(325, 321), new Point(328, 327), new Point(332, 334), new Point(335, 339), new Point(341, 347), new Point(346, 352), new Point(350, 353), new Point(353, 350), new Point(355, 347), new Point(357, 338), new Point(359, 325), new Point(360, 309), new Point(360, 282), new Point(361, 261), new Point(361, 238), new Point(361, 227), new Point(360, 205), new Point(359, 186), new Point(359, 177), new Point(359, 169), new Point(359, 162), new Point(360, 151), new Point(362, 147) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.N];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(21, score);
		}
		
		[Test]
		public function testMatchScoreNTwoStrokesToK():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(245, 174), new Point(244, 175), new Point(247, 191), new Point(247, 196), new Point(249, 206), new Point(250, 213), new Point(251, 228), new Point(252, 236), new Point(252, 245), new Point(252, 254), new Point(252, 264), new Point(252, 274), new Point(252, 297), new Point(253, 320), new Point(253, 331), new Point(253, 342), new Point(253, 352), new Point(253, 362), new Point(253, 370), new Point(253, 378), new Point(253, 383), new Point(254, 387), new Point(254, 390), new Point(256, 391) ]));
			allLines.push(Line.pointsToLines([new Point(258, 198), new Point(263, 205), new Point(269, 214), new Point(278, 230), new Point(281, 236), new Point(284, 242), new Point(288, 249), new Point(296, 264), new Point(308, 289), new Point(317, 306), new Point(321, 313), new Point(325, 321), new Point(328, 327), new Point(332, 334), new Point(335, 339), new Point(341, 347), new Point(346, 352), new Point(350, 353), new Point(353, 350), new Point(355, 347), new Point(357, 338), new Point(359, 325), new Point(360, 309), new Point(360, 282), new Point(361, 261), new Point(361, 238), new Point(361, 227), new Point(360, 205), new Point(359, 186), new Point(359, 177), new Point(359, 169), new Point(359, 162), new Point(360, 151), new Point(362, 147) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.K];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(5, score);
		}
		
		[Test]
		public function testMatchScoreOToO():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(337, 154), new Point(325, 157), new Point(319, 158), new Point(314, 159), new Point(311, 160), new Point(305, 162), new Point(298, 164), new Point(294, 165), new Point(290, 167), new Point(287, 168), new Point(282, 171), new Point(278, 173), new Point(274, 176), new Point(270, 179), new Point(261, 186), new Point(257, 189), new Point(253, 193), new Point(245, 201), new Point(237, 210), new Point(229, 220), new Point(225, 225), new Point(222, 230), new Point(218, 236), new Point(215, 241), new Point(212, 247), new Point(209, 252), new Point(207, 259), new Point(204, 272), new Point(203, 278), new Point(203, 285), new Point(203, 292), new Point(204, 299), new Point(206, 306), new Point(208, 313), new Point(210, 320), new Point(217, 333), new Point(225, 346), new Point(235, 357), new Point(247, 367), new Point(253, 371), new Point(260, 374), new Point(266, 378), new Point(274, 380), new Point(281, 382), new Point(289, 384), new Point(296, 385), new Point(313, 385), new Point(322, 385), new Point(331, 385), new Point(339, 384), new Point(348, 382), new Point(357, 380), new Point(366, 377), new Point(374, 374), new Point(382, 370), new Point(389, 365), new Point(396, 360), new Point(402, 354), new Point(408, 347), new Point(419, 333), new Point(427, 318), new Point(430, 309), new Point(434, 292), new Point(435, 272), new Point(433, 252), new Point(431, 242), new Point(425, 222), new Point(416, 204), new Point(404, 187), new Point(397, 180), new Point(379, 169), new Point(358, 163), new Point(348, 161), new Point(338, 161) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.O];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(16, score);
		}
		
		[Test]
		public function testMatchScoreOToS():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(337, 154), new Point(325, 157), new Point(319, 158), new Point(314, 159), new Point(311, 160), new Point(305, 162), new Point(298, 164), new Point(294, 165), new Point(290, 167), new Point(287, 168), new Point(282, 171), new Point(278, 173), new Point(274, 176), new Point(270, 179), new Point(261, 186), new Point(257, 189), new Point(253, 193), new Point(245, 201), new Point(237, 210), new Point(229, 220), new Point(225, 225), new Point(222, 230), new Point(218, 236), new Point(215, 241), new Point(212, 247), new Point(209, 252), new Point(207, 259), new Point(204, 272), new Point(203, 278), new Point(203, 285), new Point(203, 292), new Point(204, 299), new Point(206, 306), new Point(208, 313), new Point(210, 320), new Point(217, 333), new Point(225, 346), new Point(235, 357), new Point(247, 367), new Point(253, 371), new Point(260, 374), new Point(266, 378), new Point(274, 380), new Point(281, 382), new Point(289, 384), new Point(296, 385), new Point(313, 385), new Point(322, 385), new Point(331, 385), new Point(339, 384), new Point(348, 382), new Point(357, 380), new Point(366, 377), new Point(374, 374), new Point(382, 370), new Point(389, 365), new Point(396, 360), new Point(402, 354), new Point(408, 347), new Point(419, 333), new Point(427, 318), new Point(430, 309), new Point(434, 292), new Point(435, 272), new Point(433, 252), new Point(431, 242), new Point(425, 222), new Point(416, 204), new Point(404, 187), new Point(397, 180), new Point(379, 169), new Point(358, 163), new Point(348, 161), new Point(338, 161) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.S];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(10, score);
		}
		
		[Test]
		public function testMatchScoreQToQ():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(330, 140), new Point(322, 138), new Point(315, 137), new Point(308, 137), new Point(300, 139), new Point(292, 141), new Point(283, 145), new Point(278, 147), new Point(273, 150), new Point(268, 154), new Point(263, 157), new Point(258, 161), new Point(253, 166), new Point(248, 170), new Point(239, 181), new Point(230, 193), new Point(226, 199), new Point(223, 206), new Point(219, 212), new Point(216, 219), new Point(213, 227), new Point(208, 242), new Point(204, 258), new Point(201, 274), new Point(201, 291), new Point(202, 299), new Point(206, 314), new Point(214, 328), new Point(224, 342), new Point(237, 353), new Point(245, 359), new Point(253, 364), new Point(261, 368), new Point(270, 372), new Point(279, 374), new Point(297, 378), new Point(307, 378), new Point(316, 377), new Point(326, 375), new Point(335, 373), new Point(344, 369), new Point(352, 364), new Point(360, 358), new Point(374, 345), new Point(379, 337), new Point(384, 329), new Point(388, 320), new Point(392, 311), new Point(394, 302), new Point(396, 292), new Point(398, 282), new Point(399, 272), new Point(399, 262), new Point(399, 252), new Point(398, 242), new Point(396, 233), new Point(391, 213), new Point(384, 195), new Point(379, 186), new Point(374, 178), new Point(368, 170), new Point(355, 156), new Point(340, 147), new Point(331, 144), new Point(314, 139), new Point(306, 139) ]));
			allLines.push(Line.pointsToLines([new Point(346, 306), new Point(351, 312), new Point(355, 316), new Point(357, 318), new Point(365, 325), new Point(376, 336), new Point(381, 340), new Point(391, 349), new Point(397, 354), new Point(410, 366), new Point(429, 382), new Point(438, 391), new Point(441, 394), new Point(442, 396) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.Q];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(7, score);
		}
		
		[Test]
		public function testMatchScoreQToR():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(330, 140), new Point(322, 138), new Point(315, 137), new Point(308, 137), new Point(300, 139), new Point(292, 141), new Point(283, 145), new Point(278, 147), new Point(273, 150), new Point(268, 154), new Point(263, 157), new Point(258, 161), new Point(253, 166), new Point(248, 170), new Point(239, 181), new Point(230, 193), new Point(226, 199), new Point(223, 206), new Point(219, 212), new Point(216, 219), new Point(213, 227), new Point(208, 242), new Point(204, 258), new Point(201, 274), new Point(201, 291), new Point(202, 299), new Point(206, 314), new Point(214, 328), new Point(224, 342), new Point(237, 353), new Point(245, 359), new Point(253, 364), new Point(261, 368), new Point(270, 372), new Point(279, 374), new Point(297, 378), new Point(307, 378), new Point(316, 377), new Point(326, 375), new Point(335, 373), new Point(344, 369), new Point(352, 364), new Point(360, 358), new Point(374, 345), new Point(379, 337), new Point(384, 329), new Point(388, 320), new Point(392, 311), new Point(394, 302), new Point(396, 292), new Point(398, 282), new Point(399, 272), new Point(399, 262), new Point(399, 252), new Point(398, 242), new Point(396, 233), new Point(391, 213), new Point(384, 195), new Point(379, 186), new Point(374, 178), new Point(368, 170), new Point(355, 156), new Point(340, 147), new Point(331, 144), new Point(314, 139), new Point(306, 139) ]));
			allLines.push(Line.pointsToLines([new Point(346, 306), new Point(351, 312), new Point(355, 316), new Point(357, 318), new Point(365, 325), new Point(376, 336), new Point(381, 340), new Point(391, 349), new Point(397, 354), new Point(410, 366), new Point(429, 382), new Point(438, 391), new Point(441, 394), new Point(442, 396) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.R];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(13, score);
		}
		
		[Test]
		public function testMatchScoreWOneStroke2ToW():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(203, 238), new Point(203, 246), new Point(205, 254), new Point(205, 258), new Point(206, 268), new Point(207, 273), new Point(208, 279), new Point(209, 285), new Point(210, 292), new Point(210, 299), new Point(211, 306), new Point(212, 313), new Point(214, 327), new Point(215, 342), new Point(217, 357), new Point(218, 364), new Point(218, 372), new Point(219, 380), new Point(220, 387), new Point(221, 395), new Point(222, 410), new Point(224, 424), new Point(225, 436), new Point(225, 442), new Point(226, 448), new Point(227, 453), new Point(227, 458), new Point(228, 462), new Point(230, 470), new Point(231, 475), new Point(232, 477), new Point(232, 479), new Point(233, 480), new Point(234, 481), new Point(234, 482), new Point(235, 482), new Point(236, 481), new Point(237, 480), new Point(239, 479), new Point(240, 477), new Point(242, 475), new Point(244, 472), new Point(246, 469), new Point(248, 465), new Point(253, 456), new Point(258, 446), new Point(261, 440), new Point(264, 435), new Point(267, 429), new Point(269, 423), new Point(272, 417), new Point(278, 405), new Point(283, 394), new Point(288, 383), new Point(291, 377), new Point(296, 367), new Point(301, 357), new Point(303, 353), new Point(304, 349), new Point(306, 345), new Point(308, 342), new Point(309, 339), new Point(312, 333), new Point(315, 330), new Point(316, 329), new Point(317, 329), new Point(318, 328), new Point(319, 328), new Point(320, 329), new Point(322, 332), new Point(324, 334), new Point(325, 337), new Point(326, 340), new Point(328, 344), new Point(329, 348), new Point(332, 358), new Point(334, 370), new Point(336, 376), new Point(339, 389), new Point(341, 402), new Point(343, 408), new Point(344, 415), new Point(346, 422), new Point(349, 435), new Point(352, 447), new Point(354, 453), new Point(357, 463), new Point(360, 472), new Point(362, 475), new Point(365, 481), new Point(367, 485), new Point(368, 486), new Point(370, 487), new Point(372, 486), new Point(374, 483), new Point(376, 480), new Point(378, 472), new Point(380, 467), new Point(383, 457), new Point(386, 444), new Point(388, 437), new Point(392, 422), new Point(395, 406), new Point(397, 398), new Point(400, 380), new Point(405, 351), new Point(408, 332), new Point(409, 323), new Point(411, 305), new Point(413, 278), new Point(413, 261), new Point(413, 253), new Point(413, 237), new Point(413, 223), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.W];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(14, score);
		}
		
		[Test]
		public function testMatchScoreWOneStroke2ToH():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(203, 238), new Point(203, 246), new Point(205, 254), new Point(205, 258), new Point(206, 268), new Point(207, 273), new Point(208, 279), new Point(209, 285), new Point(210, 292), new Point(210, 299), new Point(211, 306), new Point(212, 313), new Point(214, 327), new Point(215, 342), new Point(217, 357), new Point(218, 364), new Point(218, 372), new Point(219, 380), new Point(220, 387), new Point(221, 395), new Point(222, 410), new Point(224, 424), new Point(225, 436), new Point(225, 442), new Point(226, 448), new Point(227, 453), new Point(227, 458), new Point(228, 462), new Point(230, 470), new Point(231, 475), new Point(232, 477), new Point(232, 479), new Point(233, 480), new Point(234, 481), new Point(234, 482), new Point(235, 482), new Point(236, 481), new Point(237, 480), new Point(239, 479), new Point(240, 477), new Point(242, 475), new Point(244, 472), new Point(246, 469), new Point(248, 465), new Point(253, 456), new Point(258, 446), new Point(261, 440), new Point(264, 435), new Point(267, 429), new Point(269, 423), new Point(272, 417), new Point(278, 405), new Point(283, 394), new Point(288, 383), new Point(291, 377), new Point(296, 367), new Point(301, 357), new Point(303, 353), new Point(304, 349), new Point(306, 345), new Point(308, 342), new Point(309, 339), new Point(312, 333), new Point(315, 330), new Point(316, 329), new Point(317, 329), new Point(318, 328), new Point(319, 328), new Point(320, 329), new Point(322, 332), new Point(324, 334), new Point(325, 337), new Point(326, 340), new Point(328, 344), new Point(329, 348), new Point(332, 358), new Point(334, 370), new Point(336, 376), new Point(339, 389), new Point(341, 402), new Point(343, 408), new Point(344, 415), new Point(346, 422), new Point(349, 435), new Point(352, 447), new Point(354, 453), new Point(357, 463), new Point(360, 472), new Point(362, 475), new Point(365, 481), new Point(367, 485), new Point(368, 486), new Point(370, 487), new Point(372, 486), new Point(374, 483), new Point(376, 480), new Point(378, 472), new Point(380, 467), new Point(383, 457), new Point(386, 444), new Point(388, 437), new Point(392, 422), new Point(395, 406), new Point(397, 398), new Point(400, 380), new Point(405, 351), new Point(408, 332), new Point(409, 323), new Point(411, 305), new Point(413, 278), new Point(413, 261), new Point(413, 253), new Point(413, 237), new Point(413, 223), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.H];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(7, score);
		}
		
		[Test]
		public function testMatchScoreSToS():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.S];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(3, score);
		}
		
		[Test]
		public function testMatchScoreSToQ():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.Q];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(4, score);
		}
		
		[Test]
		public function testMatchScoreSToO():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.O];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(7, score);
		}
		
		
		[Test]
		public function testMatchScoreSToE():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.E];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(9, score);
		}
		
		[Test]
		public function testMatchScoreSToSEndLines():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = StateDefinitions.Instance.States[StateIdentifiers.S+"-end-lines"];
			var score:int = state.matchScore(parts);
			Assert.assertEquals(10, score);
		}

		/*************************************
		 * matchState
		 *************************************/
		
		[Test]
		public function testMatchStateASeparateLines():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(285, 138), new Point(284, 142), new Point(283, 146), new Point(283, 149), new Point(282, 158), new Point(281, 161), new Point(281, 165), new Point(280, 174), new Point(280, 179), new Point(279, 184), new Point(279, 189), new Point(278, 194), new Point(278, 199), new Point(277, 204), new Point(276, 210), new Point(275, 215), new Point(274, 220), new Point(272, 226), new Point(269, 238), new Point(267, 244), new Point(265, 250), new Point(262, 256), new Point(260, 262), new Point(258, 269), new Point(255, 276), new Point(253, 282), new Point(250, 289), new Point(248, 296), new Point(245, 303), new Point(242, 310), new Point(239, 317), new Point(236, 324), new Point(233, 331), new Point(230, 338), new Point(227, 345), new Point(224, 352), new Point(221, 359), new Point(219, 365), new Point(217, 371), new Point(214, 377), new Point(213, 382), new Point(211, 387), new Point(210, 392), new Point(209, 396), new Point(209, 400), new Point(209, 403), new Point(209, 406), new Point(210, 408), new Point(212, 410) ]));
			allLines.push(Line.pointsToLines([new Point(290, 125), new Point(294, 128), new Point(295, 130), new Point(299, 138), new Point(300, 141), new Point(301, 145), new Point(303, 149), new Point(304, 154), new Point(306, 159), new Point(308, 165), new Point(313, 178), new Point(316, 185), new Point(320, 192), new Point(323, 199), new Point(327, 207), new Point(331, 215), new Point(336, 224), new Point(340, 232), new Point(345, 241), new Point(350, 250), new Point(355, 259), new Point(360, 268), new Point(365, 278), new Point(370, 287), new Point(375, 295), new Point(380, 303), new Point(385, 311), new Point(390, 319), new Point(394, 326), new Point(398, 333), new Point(402, 339), new Point(405, 344), new Point(408, 349), new Point(414, 357), new Point(418, 362), new Point(420, 365), new Point(421, 366), new Point(422, 367), new Point(423, 368), new Point(424, 369), new Point(425, 369) ]));
			allLines.push(Line.pointsToLines([new Point(361, 280), new Point(360, 280), new Point(355, 281), new Point(344, 281), new Point(339, 281), new Point(328, 281), new Point(316, 281), new Point(309, 281), new Point(296, 283), new Point(282, 284), new Point(275, 285), new Point(268, 286), new Point(261, 288), new Point(254, 289), new Point(248, 291), new Point(242, 292), new Point(236, 294), new Point(231, 295), new Point(228, 296) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("A", state);
		}

		
		[Test]
		public function testMatchStateBTwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(204, 191), new Point(208, 190), new Point(210, 193), new Point(211, 196), new Point(212, 197), new Point(212, 199), new Point(213, 201), new Point(213, 204), new Point(214, 207), new Point(214, 210), new Point(214, 213), new Point(215, 217), new Point(215, 221), new Point(215, 226), new Point(215, 231), new Point(216, 236), new Point(216, 241), new Point(216, 247), new Point(216, 253), new Point(217, 260), new Point(217, 266), new Point(217, 273), new Point(217, 280), new Point(218, 287), new Point(218, 295), new Point(218, 302), new Point(219, 310), new Point(220, 317), new Point(220, 324), new Point(222, 332), new Point(223, 339), new Point(225, 345), new Point(226, 351), new Point(228, 357), new Point(230, 363), new Point(232, 368), new Point(234, 372), new Point(235, 376), new Point(237, 379), new Point(238, 382), new Point(240, 384), new Point(242, 386), new Point(246, 387) ]));
			allLines.push(Line.pointsToLines([new Point(202, 189), new Point(204, 187), new Point(207, 185), new Point(212, 182), new Point(214, 180), new Point(216, 179), new Point(219, 177), new Point(223, 176), new Point(226, 174), new Point(235, 171), new Point(244, 169), new Point(249, 168), new Point(254, 167), new Point(259, 166), new Point(264, 166), new Point(269, 166), new Point(274, 166), new Point(279, 166), new Point(285, 167), new Point(290, 168), new Point(295, 169), new Point(305, 172), new Point(314, 177), new Point(317, 181), new Point(321, 184), new Point(323, 188), new Point(325, 192), new Point(327, 196), new Point(328, 200), new Point(328, 205), new Point(327, 210), new Point(326, 215), new Point(324, 220), new Point(322, 224), new Point(319, 229), new Point(316, 234), new Point(313, 238), new Point(305, 247), new Point(297, 255), new Point(293, 259), new Point(288, 262), new Point(284, 266), new Point(280, 269), new Point(276, 272), new Point(269, 278), new Point(263, 283), new Point(260, 285), new Point(257, 286), new Point(254, 287), new Point(252, 288), new Point(250, 289), new Point(248, 290), new Point(247, 290), new Point(245, 290), new Point(243, 291), new Point(241, 291), new Point(240, 291), new Point(241, 291), new Point(242, 291), new Point(245, 291), new Point(246, 291), new Point(251, 291), new Point(257, 291), new Point(260, 291), new Point(267, 292), new Point(272, 292), new Point(276, 292), new Point(281, 293), new Point(292, 294), new Point(303, 298), new Point(308, 300), new Point(319, 305), new Point(324, 309), new Point(332, 316), new Point(338, 324), new Point(339, 329), new Point(340, 337), new Point(337, 346), new Point(334, 350), new Point(331, 354), new Point(327, 357), new Point(316, 365), new Point(310, 368), new Point(296, 376), new Point(282, 383), new Point(274, 387), new Point(258, 393), new Point(251, 395), new Point(237, 398), new Point(228, 398) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("B", state);
		}
		
		[Test]
		public function testMatchStateBTwoStrokes2():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(230, 200), new Point(235, 217), new Point(236, 223), new Point(237, 227), new Point(238, 230), new Point(238, 235), new Point(239, 239), new Point(240, 250), new Point(241, 256), new Point(242, 263), new Point(242, 271), new Point(243, 280), new Point(245, 300), new Point(247, 323), new Point(248, 335), new Point(249, 347), new Point(251, 361), new Point(252, 373), new Point(253, 385), new Point(254, 396), new Point(255, 406), new Point(256, 415), new Point(256, 422), new Point(257, 427), new Point(258, 429), new Point(259, 430), ]));
			allLines.push(Line.pointsToLines([new Point(234, 197), new Point(243, 196), new Point(254, 195), new Point(267, 195), new Point(275, 195), new Point(283, 195), new Point(292, 196), new Point(310, 200), new Point(328, 206), new Point(336, 209), new Point(344, 213), new Point(351, 218), new Point(356, 222), new Point(360, 227), new Point(364, 237), new Point(363, 242), new Point(361, 247), new Point(358, 252), new Point(354, 257), new Point(349, 262), new Point(336, 271), new Point(330, 275), new Point(324, 279), new Point(318, 282), new Point(306, 289), new Point(301, 291), new Point(296, 294), new Point(291, 296), new Point(286, 298), new Point(282, 300), new Point(279, 302), new Point(272, 305), new Point(270, 306), new Point(271, 305), new Point(275, 303), new Point(278, 302), new Point(286, 300), new Point(291, 299), new Point(302, 298), new Point(313, 298), new Point(320, 299), new Point(332, 302), new Point(353, 312), new Point(359, 316), new Point(370, 327), new Point(378, 341), new Point(380, 348), new Point(381, 363), new Point(380, 372), new Point(375, 387), new Point(370, 394), new Point(360, 407), new Point(354, 412), new Point(341, 420), new Point(333, 423), new Point(316, 425), new Point(286, 424), new Point(275, 421), new Point(254, 416), new Point(235, 409), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("B", state);
		}

		[Test]
		public function testMatchStateC():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(342, 187), new Point(328, 185), new Point(322, 185), new Point(315, 186), new Point(311, 187), new Point(308, 187), new Point(304, 188), new Point(300, 189), new Point(296, 191), new Point(292, 192), new Point(287, 194), new Point(283, 196), new Point(279, 198), new Point(274, 201), new Point(270, 203), new Point(265, 206), new Point(261, 210), new Point(257, 213), new Point(253, 217), new Point(248, 220), new Point(244, 224), new Point(240, 228), new Point(237, 233), new Point(234, 237), new Point(230, 241), new Point(228, 246), new Point(226, 250), new Point(224, 255), new Point(222, 260), new Point(221, 264), new Point(221, 269), new Point(220, 273), new Point(220, 278), new Point(220, 282), new Point(220, 286), new Point(221, 289), new Point(222, 293), new Point(224, 296), new Point(226, 300), new Point(228, 303), new Point(231, 306), new Point(234, 309), new Point(238, 312), new Point(242, 315), new Point(251, 321), new Point(256, 324), new Point(261, 327), new Point(266, 329), new Point(272, 331), new Point(278, 334), new Point(284, 336), new Point(290, 338), new Point(301, 341), new Point(307, 343), new Point(314, 344), new Point(320, 345), new Point(326, 345), new Point(332, 346), new Point(339, 346), new Point(345, 347), new Point(350, 347), new Point(356, 347), new Point(360, 346) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("C", state);
		}


		[Test]
		public function testMatchStateD():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(228, 130), new Point(230, 145), new Point(232, 152), new Point(234, 159), new Point(235, 163), new Point(235, 168), new Point(237, 173), new Point(237, 177), new Point(239, 187), new Point(239, 193), new Point(240, 199), new Point(240, 205), new Point(241, 211), new Point(241, 217), new Point(241, 223), new Point(241, 230), new Point(242, 237), new Point(242, 243), new Point(242, 250), new Point(243, 257), new Point(243, 265), new Point(244, 272), new Point(244, 279), new Point(245, 287), new Point(246, 294), new Point(247, 301), new Point(248, 309), new Point(249, 316), new Point(250, 323), new Point(251, 329), new Point(253, 336), new Point(254, 341), new Point(255, 346), new Point(256, 351), new Point(257, 355), new Point(258, 358), new Point(258, 359), new Point(259, 361) ]));
			allLines.push(Line.pointsToLines([new Point(243, 128), new Point(245, 129), new Point(250, 130), new Point(257, 132), new Point(264, 134), new Point(267, 135), new Point(271, 137), new Point(275, 138), new Point(284, 142), new Point(293, 147), new Point(303, 153), new Point(309, 157), new Point(315, 160), new Point(321, 164), new Point(326, 169), new Point(332, 173), new Point(338, 178), new Point(344, 183), new Point(350, 188), new Point(356, 194), new Point(366, 205), new Point(371, 211), new Point(376, 217), new Point(380, 224), new Point(386, 237), new Point(389, 245), new Point(391, 252), new Point(392, 260), new Point(392, 267), new Point(392, 275), new Point(391, 283), new Point(389, 291), new Point(383, 306), new Point(374, 320), new Point(361, 333), new Point(336, 348), new Point(326, 352), new Point(316, 355), new Point(295, 359), new Point(276, 360), new Point(262, 359) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("D", state);
		}

		[Test]
		public function testMatchStateETwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(379, 144), new Point(372, 146), new Point(367, 147), new Point(364, 148), new Point(360, 148), new Point(356, 149), new Point(352, 150), new Point(348, 150), new Point(343, 151), new Point(333, 152), new Point(328, 152), new Point(323, 153), new Point(318, 153), new Point(312, 153), new Point(306, 153), new Point(301, 153), new Point(296, 153), new Point(290, 153), new Point(285, 153), new Point(281, 152), new Point(276, 152), new Point(271, 152), new Point(267, 152), new Point(263, 152), new Point(260, 152), new Point(256, 152), new Point(253, 152), new Point(250, 151), new Point(247, 151), new Point(245, 151), new Point(242, 151), new Point(240, 151), new Point(238, 151), new Point(236, 150), new Point(234, 150), new Point(232, 150), new Point(230, 150), new Point(229, 150), new Point(228, 150), new Point(227, 151), new Point(226, 151), new Point(226, 152), new Point(226, 154), new Point(227, 155), new Point(227, 156), new Point(228, 158), new Point(230, 162), new Point(231, 164), new Point(232, 166), new Point(233, 169), new Point(234, 172), new Point(235, 175), new Point(236, 178), new Point(237, 182), new Point(237, 186), new Point(238, 190), new Point(239, 194), new Point(239, 198), new Point(239, 203), new Point(239, 208), new Point(239, 213), new Point(239, 218), new Point(239, 223), new Point(238, 229), new Point(237, 235), new Point(236, 247), new Point(235, 253), new Point(235, 259), new Point(234, 272), new Point(234, 278), new Point(235, 284), new Point(235, 291), new Point(236, 297), new Point(237, 304), new Point(239, 310), new Point(240, 316), new Point(241, 322), new Point(242, 328), new Point(243, 333), new Point(244, 338), new Point(245, 342), new Point(245, 347), new Point(246, 351), new Point(247, 357), new Point(247, 360), new Point(247, 363), new Point(248, 365), new Point(248, 367), new Point(248, 368), new Point(248, 370), new Point(248, 371), new Point(249, 373), new Point(249, 375), new Point(250, 375), new Point(250, 376), new Point(251, 376), new Point(252, 376), new Point(253, 376), new Point(255, 376), new Point(257, 376), new Point(262, 375), new Point(268, 374), new Point(274, 373), new Point(278, 372), new Point(282, 371), new Point(286, 369), new Point(290, 368), new Point(295, 366), new Point(299, 364), new Point(305, 362), new Point(316, 358), new Point(323, 355), new Point(329, 353), new Point(336, 351), new Point(343, 350), new Point(350, 348), new Point(356, 347), new Point(363, 347), new Point(376, 345), new Point(382, 345), new Point(388, 344) ]));
			allLines.push(Line.pointsToLines([new Point(341, 249), new Point(336, 251), new Point(333, 251), new Point(329, 252), new Point(325, 253), new Point(321, 253), new Point(313, 254), new Point(307, 255), new Point(297, 256), new Point(287, 257), new Point(281, 257), new Point(275, 258), new Point(270, 258), new Point(265, 259), new Point(260, 259), new Point(255, 260), new Point(248, 261), new Point(242, 263), new Point(241, 263) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("E", state);
		}

		[Test]
		public function testMatchStateETwoQuickStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(373, 195), new Point(350, 194), new Point(341, 192), new Point(337, 192), new Point(332, 190), new Point(321, 188), new Point(316, 187), new Point(311, 186), new Point(305, 185), new Point(300, 184), new Point(290, 182), new Point(285, 181), new Point(280, 181), new Point(275, 180), new Point(271, 180), new Point(267, 179), new Point(263, 179), new Point(259, 180), new Point(256, 180), new Point(253, 181), new Point(251, 182), new Point(249, 183), new Point(247, 185), new Point(246, 186), new Point(245, 188), new Point(244, 190), new Point(244, 192), new Point(244, 194), new Point(244, 197), new Point(244, 199), new Point(244, 202), new Point(244, 206), new Point(245, 209), new Point(246, 213), new Point(246, 217), new Point(247, 222), new Point(249, 232), new Point(249, 238), new Point(250, 244), new Point(251, 250), new Point(251, 257), new Point(252, 264), new Point(253, 271), new Point(253, 279), new Point(254, 288), new Point(254, 296), new Point(255, 314), new Point(256, 333), new Point(256, 342), new Point(257, 352), new Point(257, 361), new Point(257, 369), new Point(257, 377), new Point(258, 385), new Point(258, 392), new Point(260, 404), new Point(263, 413), new Point(265, 416), new Point(267, 419), new Point(269, 422), new Point(272, 424), new Point(275, 425), new Point(278, 426), new Point(282, 427), new Point(291, 428), new Point(295, 429), new Point(300, 429), new Point(306, 428), new Point(312, 428), new Point(318, 427), new Point(325, 426), new Point(332, 425), new Point(339, 424), new Point(347, 422), new Point(356, 421), new Point(364, 419), new Point(373, 418), ]));
			allLines.push(Line.pointsToLines([new Point(348, 314), new Point(338, 315), new Point(333, 315), new Point(323, 316), new Point(317, 317), new Point(305, 319), new Point(299, 320), new Point(293, 321), new Point(287, 322), new Point(275, 326), new Point(265, 329), new Point(260, 331), new Point(257, 333), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("E", state);
		}
		
		[Test]
		public function testMatchStateF():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(419, 166), new Point(402, 168), new Point(396, 169), new Point(393, 170), new Point(390, 171), new Point(386, 171), new Point(382, 172), new Point(374, 173), new Point(370, 174), new Point(365, 175), new Point(360, 176), new Point(355, 176), new Point(350, 177), new Point(345, 177), new Point(333, 178), new Point(327, 178), new Point(321, 178), new Point(315, 178), new Point(309, 178), new Point(303, 178), new Point(297, 178), new Point(291, 178), new Point(280, 177), new Point(274, 176), new Point(269, 176), new Point(264, 175), new Point(259, 174), new Point(254, 173), new Point(250, 173), new Point(246, 172), new Point(243, 171), new Point(240, 171), new Point(237, 170), new Point(235, 170), new Point(233, 170), new Point(232, 170), new Point(231, 170), new Point(231, 171), new Point(231, 172), new Point(231, 173), new Point(232, 174), new Point(233, 176), new Point(234, 177), new Point(235, 179), new Point(236, 181), new Point(237, 183), new Point(240, 187), new Point(242, 193), new Point(244, 199), new Point(245, 202), new Point(245, 206), new Point(246, 211), new Point(247, 216), new Point(247, 221), new Point(248, 227), new Point(248, 233), new Point(249, 247), new Point(249, 254), new Point(249, 262), new Point(249, 271), new Point(249, 280), new Point(249, 289), new Point(250, 298), new Point(250, 308), new Point(250, 328), new Point(251, 338), new Point(252, 347), new Point(253, 357), new Point(253, 366), new Point(254, 374), new Point(255, 382), new Point(256, 390), new Point(257, 402), new Point(257, 407), new Point(257, 411), new Point(257, 414), new Point(257, 415), new Point(258, 415) ]));
			allLines.push(Line.pointsToLines([new Point(403, 296), new Point(399, 298), new Point(397, 298), new Point(391, 299), new Point(388, 300), new Point(381, 301), new Point(374, 302), new Point(370, 302), new Point(365, 303), new Point(361, 303), new Point(351, 303), new Point(341, 303), new Point(335, 303), new Point(330, 304), new Point(324, 304), new Point(314, 304), new Point(303, 304), new Point(298, 304), new Point(293, 304), new Point(288, 304), new Point(283, 304), new Point(279, 304), new Point(270, 305), new Point(266, 305), new Point(263, 306), new Point(260, 306), new Point(254, 307), new Point(247, 308), new Point(244, 309), new Point(242, 309), new Point(241, 309), new Point(240, 309), new Point(240, 308), new Point(240, 307) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("F", state);
		}

		[Test]
		public function testMatchStateFTwoStrokesSlightTurnAtBottom():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(371, 175), new Point(355, 179), new Point(350, 180), new Point(347, 180), new Point(344, 180), new Point(341, 180), new Point(338, 181), new Point(335, 181), new Point(331, 181), new Point(328, 181), new Point(320, 181), new Point(316, 181), new Point(312, 181), new Point(308, 181), new Point(304, 181), new Point(300, 181), new Point(296, 180), new Point(292, 180), new Point(288, 180), new Point(284, 180), new Point(280, 179), new Point(276, 179), new Point(272, 179), new Point(268, 178), new Point(264, 178), new Point(256, 177), new Point(252, 177), new Point(248, 177), new Point(245, 176), new Point(242, 176), new Point(239, 176), new Point(236, 175), new Point(233, 175), new Point(231, 175), new Point(228, 175), new Point(226, 175), new Point(225, 175), new Point(223, 175), new Point(222, 175), new Point(221, 175), new Point(220, 175), new Point(220, 176), new Point(219, 177), new Point(219, 178), new Point(219, 180), new Point(219, 181), new Point(220, 183), new Point(220, 185), new Point(220, 187), new Point(220, 190), new Point(221, 193), new Point(221, 196), new Point(221, 199), new Point(221, 203), new Point(222, 208), new Point(222, 212), new Point(222, 223), new Point(222, 229), new Point(222, 235), new Point(222, 241), new Point(221, 248), new Point(221, 255), new Point(220, 263), new Point(220, 270), new Point(219, 278), new Point(219, 286), new Point(218, 294), new Point(217, 302), new Point(217, 309), new Point(217, 317), new Point(216, 324), new Point(216, 331), new Point(217, 337), new Point(219, 348), new Point(223, 358) ]));
			allLines.push(Line.pointsToLines([new Point(344, 259), new Point(337, 260), new Point(329, 260), new Point(325, 260), new Point(320, 260), new Point(314, 261), new Point(308, 261), new Point(302, 261), new Point(295, 261), new Point(288, 261), new Point(281, 261), new Point(273, 260), new Point(265, 260), new Point(258, 260), new Point(244, 260), new Point(238, 260), new Point(232, 260), new Point(228, 260), new Point(225, 260) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("F", state);
		}

		[Test]
		public function testMatchStateFTwoStrokesShortDashLine():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(365, 159), new Point(362, 159), new Point(353, 159), new Point(349, 159), new Point(340, 158), new Point(329, 157), new Point(324, 156), new Point(319, 156), new Point(314, 155), new Point(308, 154), new Point(302, 152), new Point(297, 151), new Point(292, 150), new Point(281, 148), new Point(275, 147), new Point(270, 146), new Point(265, 145), new Point(260, 145), new Point(255, 144), new Point(251, 144), new Point(246, 143), new Point(242, 143), new Point(238, 143), new Point(234, 143), new Point(231, 143), new Point(228, 144), new Point(225, 145), new Point(222, 146), new Point(220, 147), new Point(218, 149), new Point(216, 151), new Point(215, 154), new Point(215, 157), new Point(214, 160), new Point(214, 164), new Point(215, 168), new Point(215, 172), new Point(217, 177), new Point(218, 183), new Point(220, 188), new Point(222, 194), new Point(224, 201), new Point(226, 207), new Point(228, 214), new Point(229, 221), new Point(231, 228), new Point(232, 236), new Point(234, 244), new Point(234, 251), new Point(235, 259), new Point(236, 268), new Point(236, 276), new Point(236, 284), new Point(236, 292), new Point(236, 300), new Point(236, 308), new Point(236, 316), new Point(235, 323), new Point(234, 330), new Point(234, 337), new Point(234, 343), new Point(234, 349), ]));
			allLines.push(Line.pointsToLines([new Point(280, 254), new Point(278, 254), new Point(274, 253), new Point(271, 253), new Point(263, 252), new Point(256, 252), new Point(252, 252), new Point(246, 252), new Point(240, 252), new Point(238, 252), new Point(235, 252), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("F", state);
		}

		[Test]
		public function testMatchStateG():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(378, 151), new Point(374, 149), new Point(372, 148), new Point(369, 146), new Point(367, 145), new Point(364, 143), new Point(360, 142), new Point(357, 141), new Point(353, 139), new Point(349, 138), new Point(345, 136), new Point(340, 135), new Point(336, 134), new Point(326, 131), new Point(321, 130), new Point(316, 129), new Point(311, 129), new Point(306, 128), new Point(301, 128), new Point(296, 128), new Point(291, 128), new Point(287, 128), new Point(282, 129), new Point(277, 130), new Point(272, 131), new Point(267, 132), new Point(262, 133), new Point(257, 135), new Point(252, 137), new Point(247, 139), new Point(242, 142), new Point(237, 145), new Point(228, 151), new Point(223, 155), new Point(218, 159), new Point(213, 163), new Point(209, 167), new Point(204, 172), new Point(200, 176), new Point(196, 181), new Point(189, 191), new Point(185, 197), new Point(182, 202), new Point(180, 208), new Point(177, 213), new Point(174, 219), new Point(172, 225), new Point(170, 231), new Point(168, 237), new Point(166, 243), new Point(163, 254), new Point(161, 260), new Point(160, 267), new Point(158, 273), new Point(157, 279), new Point(156, 285), new Point(156, 291), new Point(155, 296), new Point(155, 308), new Point(155, 318), new Point(156, 328), new Point(157, 333), new Point(158, 337), new Point(160, 341), new Point(161, 346), new Point(163, 349), new Point(165, 353), new Point(168, 357), new Point(171, 360), new Point(173, 363), new Point(176, 366), new Point(180, 368), new Point(183, 371), new Point(187, 373), new Point(190, 376), new Point(199, 380), new Point(204, 382), new Point(208, 384), new Point(213, 386), new Point(218, 387), new Point(223, 389), new Point(228, 390), new Point(233, 391), new Point(243, 393), new Point(253, 394), new Point(258, 395), new Point(263, 396), new Point(267, 396), new Point(272, 397), new Point(277, 397), new Point(287, 397), new Point(297, 397), new Point(306, 397), new Point(315, 395), new Point(319, 394), new Point(323, 393), new Point(327, 392), new Point(334, 389), new Point(340, 386), new Point(346, 381), new Point(348, 379), new Point(351, 376), new Point(353, 373), new Point(356, 366), new Point(359, 359), new Point(360, 351), new Point(360, 348), new Point(360, 344), new Point(360, 340), new Point(359, 337), new Point(359, 334), new Point(358, 331), new Point(357, 328), new Point(357, 325), new Point(356, 323), new Point(355, 321), new Point(354, 319), new Point(353, 317), new Point(350, 314), new Point(347, 311), new Point(346, 309), new Point(343, 307), new Point(340, 305), new Point(337, 305), new Point(336, 306), new Point(337, 308), new Point(338, 309) ]));
			allLines.push(Line.pointsToLines([new Point(447, 293), new Point(438, 293), new Point(429, 293), new Point(419, 293), new Point(414, 293), new Point(402, 292), new Point(396, 292), new Point(383, 291), new Point(376, 290), new Point(369, 289), new Point(361, 289), new Point(346, 287), new Point(337, 286), new Point(329, 286), new Point(321, 285), new Point(304, 283), new Point(280, 282), new Point(266, 282), new Point(254, 282), new Point(248, 283), new Point(243, 283), new Point(238, 284), new Point(233, 285), new Point(226, 286), new Point(221, 286), new Point(220, 286) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("G", state);
		}

		[Test]
		public function testMatchStateH():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(229, 101), new Point(228, 111), new Point(228, 115), new Point(228, 117), new Point(229, 120), new Point(229, 127), new Point(229, 134), new Point(229, 138), new Point(229, 143), new Point(229, 152), new Point(229, 157), new Point(229, 163), new Point(229, 169), new Point(229, 175), new Point(229, 181), new Point(229, 187), new Point(229, 194), new Point(229, 208), new Point(229, 214), new Point(229, 221), new Point(230, 228), new Point(230, 235), new Point(231, 242), new Point(231, 249), new Point(232, 256), new Point(232, 264), new Point(233, 268), new Point(233, 278), new Point(234, 286), new Point(234, 294), new Point(234, 318), new Point(234, 325), new Point(234, 335), new Point(234, 339), new Point(233, 344), new Point(233, 348), new Point(232, 352), new Point(232, 356), new Point(231, 358), new Point(231, 361), new Point(231, 363), new Point(231, 364), new Point(231, 365) ]));
			allLines.push(Line.pointsToLines([new Point(372, 111), new Point(371, 114), new Point(370, 122), new Point(369, 126), new Point(367, 136), new Point(366, 141), new Point(365, 153), new Point(364, 167), new Point(364, 175), new Point(364, 182), new Point(364, 190), new Point(364, 198), new Point(364, 206), new Point(364, 223), new Point(364, 239), new Point(364, 256), new Point(364, 273), new Point(364, 289), new Point(364, 297), new Point(364, 305), new Point(364, 313), new Point(364, 320), new Point(364, 328), new Point(364, 335), new Point(364, 344), new Point(364, 352), new Point(364, 360), new Point(364, 367), new Point(364, 379), new Point(364, 388), new Point(365, 392), new Point(366, 393), new Point(366, 389), new Point(367, 384), new Point(367, 379) ]));
			allLines.push(Line.pointsToLines([new Point(364, 235), new Point(354, 236), new Point(348, 236), new Point(341, 236), new Point(338, 236), new Point(332, 236), new Point(329, 236), new Point(322, 236), new Point(319, 236), new Point(312, 236), new Point(300, 236), new Point(297, 236), new Point(289, 236), new Point(285, 236), new Point(281, 236), new Point(277, 236), new Point(273, 237), new Point(269, 237), new Point(262, 237), new Point(254, 237), new Point(251, 237), new Point(245, 237), new Point(241, 237), new Point(237, 238), new Point(236, 239), new Point(235, 240), new Point(235, 241) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("H", state);
		}

		[Test]
		public function testMatchStateI():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(298, 144), new Point(299, 149), new Point(299, 155), new Point(301, 162), new Point(302, 170), new Point(303, 175), new Point(304, 180), new Point(304, 186), new Point(305, 191), new Point(305, 197), new Point(305, 203), new Point(305, 209), new Point(306, 222), new Point(306, 228), new Point(306, 235), new Point(306, 241), new Point(305, 248), new Point(305, 255), new Point(305, 261), new Point(304, 268), new Point(304, 275), new Point(303, 283), new Point(303, 290), new Point(303, 298), new Point(303, 305), new Point(303, 312), new Point(303, 319), new Point(304, 326), new Point(304, 333), new Point(305, 339), new Point(306, 344), new Point(307, 352), new Point(308, 355), new Point(308, 358), new Point(309, 360), new Point(310, 361) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("I", state);
		}

		[Test]
		public function testMatchStateJ():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(414, 89), new Point(414, 111), new Point(416, 120), new Point(417, 125), new Point(418, 131), new Point(419, 138), new Point(420, 145), new Point(421, 152), new Point(421, 159), new Point(421, 167), new Point(421, 175), new Point(421, 182), new Point(421, 190), new Point(421, 198), new Point(421, 206), new Point(421, 214), new Point(421, 223), new Point(420, 231), new Point(420, 240), new Point(419, 257), new Point(418, 275), new Point(417, 283), new Point(416, 292), new Point(416, 300), new Point(415, 308), new Point(413, 316), new Point(412, 324), new Point(411, 332), new Point(409, 339), new Point(407, 346), new Point(403, 360), new Point(401, 366), new Point(398, 371), new Point(395, 376), new Point(391, 381), new Point(388, 385), new Point(384, 388), new Point(380, 391), new Point(376, 394), new Point(371, 396), new Point(367, 398), new Point(362, 400), new Point(357, 401), new Point(352, 401), new Point(347, 401), new Point(342, 400), new Point(336, 399), new Point(331, 397), new Point(326, 394), new Point(321, 390), new Point(316, 386), new Point(311, 380), new Point(306, 374), new Point(300, 366), new Point(291, 349), new Point(282, 330), new Point(275, 311), new Point(273, 303), new Point(271, 296) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("J", state);
		}

		[Test]
		public function testMatchStateJBigCurve():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(238, 302), new Point(236, 310), new Point(235, 315), new Point(235, 318), new Point(235, 321), new Point(235, 324), new Point(235, 328), new Point(236, 332), new Point(236, 336), new Point(237, 341), new Point(238, 346), new Point(239, 352), new Point(240, 357), new Point(242, 363), new Point(243, 369), new Point(244, 374), new Point(246, 380), new Point(248, 386), new Point(250, 391), new Point(252, 397), new Point(257, 406), new Point(263, 415), new Point(270, 423), new Point(273, 427), new Point(281, 433), new Point(284, 435), new Point(288, 438), new Point(296, 441), new Point(303, 442), new Point(311, 441), new Point(314, 440), new Point(318, 438), new Point(322, 435), new Point(326, 433), new Point(329, 429), new Point(333, 426), new Point(337, 422), new Point(341, 417), new Point(344, 412), new Point(348, 407), new Point(351, 402), new Point(355, 396), new Point(358, 390), new Point(362, 384), new Point(367, 371), new Point(370, 364), new Point(372, 358), new Point(375, 351), new Point(376, 344), new Point(378, 337), new Point(380, 329), new Point(381, 322), new Point(382, 314), new Point(383, 307), new Point(383, 299), new Point(383, 290), new Point(383, 282), new Point(383, 274), new Point(383, 265), new Point(381, 249), new Point(380, 242), new Point(379, 234), new Point(378, 228), new Point(375, 216), new Point(373, 206), new Point(371, 198), new Point(370, 195), new Point(369, 192), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("J", state);
		}

		[Test]
		public function testMatchStateJStartAtShortEnd():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(244, 250), new Point(243, 270), new Point(244, 277), new Point(245, 284), new Point(246, 292), new Point(247, 297), new Point(248, 301), new Point(249, 306), new Point(251, 311), new Point(252, 315), new Point(254, 321), new Point(256, 326), new Point(258, 331), new Point(261, 337), new Point(266, 347), new Point(269, 352), new Point(272, 357), new Point(275, 361), new Point(278, 365), new Point(281, 368), new Point(285, 371), new Point(289, 373), new Point(292, 374), new Point(296, 375), new Point(300, 375), new Point(305, 375), new Point(309, 374), new Point(314, 373), new Point(319, 371), new Point(324, 369), new Point(328, 367), new Point(333, 365), new Point(339, 362), new Point(344, 360), new Point(349, 357), new Point(353, 353), new Point(358, 350), new Point(362, 346), new Point(367, 341), new Point(371, 336), new Point(378, 325), new Point(385, 313), new Point(388, 307), new Point(391, 300), new Point(394, 292), new Point(396, 284), new Point(398, 276), new Point(400, 268), new Point(401, 259), new Point(402, 250), new Point(403, 240), new Point(403, 221), new Point(403, 211), new Point(402, 200), new Point(401, 190), new Point(400, 179), new Point(398, 169), new Point(397, 159), new Point(395, 149), new Point(393, 131), new Point(392, 124), new Point(391, 117), new Point(391, 111), new Point(391, 106), new Point(391, 102), new Point(391, 99), new Point(392, 97), new Point(393, 95), new Point(394, 94), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("J", state);
		}

		[Test]
		public function testMatchStateJStartAtShortEndTallAndNarrow():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(207, 269), new Point(206, 274), new Point(206, 280), new Point(206, 283), new Point(206, 290), new Point(207, 299), new Point(208, 303), new Point(208, 308), new Point(209, 313), new Point(210, 318), new Point(211, 323), new Point(212, 328), new Point(213, 334), new Point(216, 344), new Point(218, 349), new Point(220, 355), new Point(222, 360), new Point(224, 365), new Point(227, 370), new Point(229, 375), new Point(232, 380), new Point(237, 389), new Point(240, 392), new Point(243, 395), new Point(246, 397), new Point(249, 399), new Point(252, 400), new Point(255, 400), new Point(258, 400), new Point(261, 399), new Point(265, 396), new Point(268, 393), new Point(272, 389), new Point(276, 383), new Point(279, 377), new Point(287, 362), new Point(290, 353), new Point(294, 344), new Point(297, 334), new Point(300, 325), new Point(303, 314), new Point(306, 304), new Point(308, 293), new Point(310, 283), new Point(312, 272), new Point(313, 261), new Point(314, 249), new Point(315, 238), new Point(315, 226), new Point(315, 215), new Point(315, 203), new Point(314, 192), new Point(312, 170), new Point(311, 160), new Point(310, 151), new Point(309, 142), new Point(308, 134), new Point(308, 128), new Point(309, 120), new Point(310, 118), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("J", state);
		}

		[Test]
		public function testMatchStateKTwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(253, 115), new Point(253, 126), new Point(254, 134), new Point(254, 138), new Point(255, 148), new Point(255, 154), new Point(256, 160), new Point(256, 166), new Point(257, 179), new Point(258, 193), new Point(258, 207), new Point(259, 215), new Point(259, 222), new Point(259, 229), new Point(260, 236), new Point(260, 244), new Point(260, 252), new Point(260, 260), new Point(261, 268), new Point(261, 277), new Point(261, 286), new Point(262, 295), new Point(262, 305), new Point(263, 314), new Point(263, 324), new Point(264, 334), new Point(264, 344), new Point(264, 353), new Point(265, 362), new Point(265, 370), new Point(265, 378), new Point(266, 385), new Point(266, 391), new Point(266, 396), new Point(267, 401), new Point(267, 403), new Point(267, 405), new Point(267, 406) ]));
			allLines.push(Line.pointsToLines([new Point(422, 127), new Point(423, 127), new Point(410, 143), new Point(404, 151), new Point(401, 155), new Point(395, 162), new Point(391, 166), new Point(383, 173), new Point(379, 177), new Point(374, 181), new Point(369, 185), new Point(359, 194), new Point(347, 203), new Point(342, 207), new Point(330, 216), new Point(325, 220), new Point(320, 224), new Point(315, 228), new Point(310, 232), new Point(305, 235), new Point(297, 243), new Point(292, 246), new Point(289, 250), new Point(285, 253), new Point(281, 255), new Point(278, 258), new Point(275, 260), new Point(272, 261), new Point(270, 262), new Point(268, 263), new Point(266, 264), new Point(264, 265), new Point(263, 265), new Point(261, 265), new Point(261, 266), new Point(262, 266), new Point(265, 267), new Point(266, 268), new Point(271, 270), new Point(274, 271), new Point(278, 273), new Point(282, 275), new Point(286, 278), new Point(290, 280), new Point(301, 286), new Point(319, 294), new Point(334, 300), new Point(342, 304), new Point(351, 307), new Point(359, 311), new Point(376, 319), new Point(385, 323), new Point(401, 333), new Point(416, 344), new Point(423, 350), new Point(436, 360), new Point(442, 364) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("K", state);
		}

		[Test]
		public function testMatchStateLOneStrokeSlightCurveOnEnd():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(228, 132), new Point(227, 147), new Point(227, 154), new Point(227, 158), new Point(228, 163), new Point(228, 168), new Point(228, 179), new Point(228, 193), new Point(229, 207), new Point(229, 214), new Point(229, 222), new Point(230, 229), new Point(230, 237), new Point(230, 244), new Point(230, 251), new Point(230, 258), new Point(230, 272), new Point(229, 285), new Point(228, 300), new Point(228, 306), new Point(228, 313), new Point(227, 319), new Point(227, 325), new Point(227, 331), new Point(226, 336), new Point(226, 340), new Point(225, 347), new Point(225, 353), new Point(225, 356), new Point(225, 357), new Point(226, 359), new Point(226, 360), new Point(228, 362), new Point(229, 362), new Point(231, 363), new Point(235, 363), new Point(238, 363), new Point(240, 363), new Point(244, 363), new Point(248, 362), new Point(252, 361), new Point(257, 361), new Point(261, 360), new Point(267, 360), new Point(272, 359), new Point(278, 358), new Point(285, 358), new Point(291, 357), new Point(298, 356), new Point(305, 355), new Point(320, 353), new Point(336, 351), new Point(352, 350), new Point(360, 349), new Point(367, 349), new Point(374, 350), new Point(388, 352), new Point(399, 356), new Point(409, 361), new Point(413, 364) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("L", state);
		}

		[Test]
		public function testMatchStateLOneStrokeArchedBottom():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(191, 155), new Point(196, 313), new Point(194, 344), new Point(196, 358), new Point(202, 371), new Point(204, 373), new Point(206, 374), new Point(209, 375), new Point(211, 376), new Point(214, 376), new Point(217, 375), new Point(220, 374), new Point(224, 373), new Point(228, 372), new Point(233, 371), new Point(237, 370), new Point(242, 368), new Point(247, 367), new Point(252, 366), new Point(258, 365), new Point(263, 364), new Point(268, 364), new Point(274, 363), new Point(280, 363), new Point(285, 363), new Point(290, 363), new Point(295, 364), new Point(300, 364), new Point(304, 365), new Point(308, 365), new Point(312, 366), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("L", state);
		}

		[Test]
		public function testMatchStateMTwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(208, 192), new Point(208, 195), new Point(208, 201), new Point(208, 208), new Point(209, 218), new Point(209, 223), new Point(210, 230), new Point(211, 243), new Point(212, 251), new Point(212, 259), new Point(213, 267), new Point(213, 277), new Point(213, 286), new Point(214, 296), new Point(214, 306), new Point(214, 316), new Point(214, 327), new Point(214, 337), new Point(214, 348), new Point(214, 357), new Point(214, 367), new Point(214, 376), new Point(214, 391), new Point(214, 403), new Point(214, 408), new Point(215, 412), new Point(215, 416), new Point(215, 418) ]));
			allLines.push(Line.pointsToLines([new Point(205, 190), new Point(212, 204), new Point(213, 206), new Point(218, 215), new Point(220, 219), new Point(223, 222), new Point(225, 226), new Point(231, 235), new Point(235, 240), new Point(242, 250), new Point(245, 256), new Point(250, 262), new Point(254, 268), new Point(262, 281), new Point(273, 300), new Point(280, 310), new Point(285, 318), new Point(287, 321), new Point(290, 324), new Point(292, 326), new Point(295, 327), new Point(297, 327), new Point(299, 325), new Point(301, 324), new Point(303, 321), new Point(305, 318), new Point(309, 309), new Point(314, 299), new Point(317, 293), new Point(320, 287), new Point(322, 282), new Point(328, 270), new Point(330, 263), new Point(333, 257), new Point(336, 251), new Point(341, 240), new Point(347, 229), new Point(350, 224), new Point(356, 217), new Point(359, 213), new Point(361, 210), new Point(364, 208), new Point(369, 204), new Point(374, 202), new Point(377, 202), new Point(379, 204), new Point(380, 206), new Point(382, 211), new Point(383, 214), new Point(384, 222), new Point(385, 233), new Point(386, 238), new Point(388, 252), new Point(389, 259), new Point(391, 275), new Point(394, 291), new Point(396, 300), new Point(399, 318), new Point(401, 327), new Point(404, 346), new Point(408, 364), new Point(410, 381), new Point(412, 388), new Point(414, 401), new Point(415, 406), new Point(417, 414) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("M", state);
		}

		[Test]
		public function testMatchStateMCurvyOneStroke():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(259, 392), new Point(259, 386), new Point(259, 378), new Point(259, 374), new Point(259, 369), new Point(258, 364), new Point(257, 358), new Point(257, 352), new Point(256, 345), new Point(255, 338), new Point(254, 331), new Point(253, 323), new Point(251, 315), new Point(250, 307), new Point(249, 291), new Point(247, 274), new Point(246, 258), new Point(245, 250), new Point(245, 243), new Point(245, 236), new Point(245, 224), new Point(245, 218), new Point(246, 214), new Point(247, 206), new Point(249, 203), new Point(250, 201), new Point(251, 199), new Point(253, 198), new Point(255, 197), new Point(257, 197), new Point(260, 197), new Point(262, 197), new Point(265, 198), new Point(268, 199), new Point(271, 201), new Point(274, 204), new Point(277, 207), new Point(281, 211), new Point(288, 220), new Point(296, 231), new Point(299, 237), new Point(303, 244), new Point(306, 250), new Point(309, 256), new Point(312, 262), new Point(318, 274), new Point(324, 284), new Point(329, 293), new Point(331, 296), new Point(334, 299), new Point(336, 301), new Point(340, 304), new Point(343, 305), new Point(346, 303), new Point(348, 300), new Point(352, 294), new Point(357, 284), new Point(361, 273), new Point(363, 267), new Point(365, 260), new Point(367, 254), new Point(371, 242), new Point(375, 231), new Point(377, 226), new Point(379, 221), new Point(382, 216), new Point(386, 208), new Point(388, 204), new Point(390, 201), new Point(392, 198), new Point(394, 196), new Point(395, 194), new Point(398, 191), new Point(399, 190), new Point(401, 190), new Point(402, 190), new Point(405, 192), new Point(408, 197), new Point(409, 201), new Point(412, 210), new Point(415, 221), new Point(416, 229), new Point(417, 236), new Point(418, 245), new Point(421, 264), new Point(422, 275), new Point(423, 287), new Point(425, 299), new Point(426, 312), new Point(428, 326), new Point(433, 353), new Point(437, 380), new Point(440, 391), new Point(442, 401), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("M", state);
		}

		[Test]
		public function testMatchStateNTwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(245, 174), new Point(244, 175), new Point(247, 191), new Point(247, 196), new Point(249, 206), new Point(250, 213), new Point(251, 228), new Point(252, 236), new Point(252, 245), new Point(252, 254), new Point(252, 264), new Point(252, 274), new Point(252, 297), new Point(253, 320), new Point(253, 331), new Point(253, 342), new Point(253, 352), new Point(253, 362), new Point(253, 370), new Point(253, 378), new Point(253, 383), new Point(254, 387), new Point(254, 390), new Point(256, 391) ]));
			allLines.push(Line.pointsToLines([new Point(258, 198), new Point(263, 205), new Point(269, 214), new Point(278, 230), new Point(281, 236), new Point(284, 242), new Point(288, 249), new Point(296, 264), new Point(308, 289), new Point(317, 306), new Point(321, 313), new Point(325, 321), new Point(328, 327), new Point(332, 334), new Point(335, 339), new Point(341, 347), new Point(346, 352), new Point(350, 353), new Point(353, 350), new Point(355, 347), new Point(357, 338), new Point(359, 325), new Point(360, 309), new Point(360, 282), new Point(361, 261), new Point(361, 238), new Point(361, 227), new Point(360, 205), new Point(359, 186), new Point(359, 177), new Point(359, 169), new Point(359, 162), new Point(360, 151), new Point(362, 147) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("N", state);
		}

		[Test]
		public function testMatchStateO():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(337, 154), new Point(325, 157), new Point(319, 158), new Point(314, 159), new Point(311, 160), new Point(305, 162), new Point(298, 164), new Point(294, 165), new Point(290, 167), new Point(287, 168), new Point(282, 171), new Point(278, 173), new Point(274, 176), new Point(270, 179), new Point(261, 186), new Point(257, 189), new Point(253, 193), new Point(245, 201), new Point(237, 210), new Point(229, 220), new Point(225, 225), new Point(222, 230), new Point(218, 236), new Point(215, 241), new Point(212, 247), new Point(209, 252), new Point(207, 259), new Point(204, 272), new Point(203, 278), new Point(203, 285), new Point(203, 292), new Point(204, 299), new Point(206, 306), new Point(208, 313), new Point(210, 320), new Point(217, 333), new Point(225, 346), new Point(235, 357), new Point(247, 367), new Point(253, 371), new Point(260, 374), new Point(266, 378), new Point(274, 380), new Point(281, 382), new Point(289, 384), new Point(296, 385), new Point(313, 385), new Point(322, 385), new Point(331, 385), new Point(339, 384), new Point(348, 382), new Point(357, 380), new Point(366, 377), new Point(374, 374), new Point(382, 370), new Point(389, 365), new Point(396, 360), new Point(402, 354), new Point(408, 347), new Point(419, 333), new Point(427, 318), new Point(430, 309), new Point(434, 292), new Point(435, 272), new Point(433, 252), new Point(431, 242), new Point(425, 222), new Point(416, 204), new Point(404, 187), new Point(397, 180), new Point(379, 169), new Point(358, 163), new Point(348, 161), new Point(338, 161) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("O", state);
		}

		[Test]
		public function testMatchStateP():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(261, 145), new Point(263, 150), new Point(264, 157), new Point(265, 161), new Point(265, 166), new Point(265, 172), new Point(265, 178), new Point(265, 184), new Point(266, 198), new Point(265, 213), new Point(265, 221), new Point(265, 229), new Point(265, 238), new Point(266, 247), new Point(266, 257), new Point(267, 267), new Point(268, 278), new Point(270, 300), new Point(274, 323), new Point(278, 346), new Point(283, 366), new Point(286, 381), new Point(287, 386), new Point(288, 390), new Point(288, 391), new Point(288, 390), new Point(287, 387) ]));
			allLines.push(Line.pointsToLines([new Point(269, 145), new Point(278, 144), new Point(284, 144), new Point(292, 144), new Point(296, 144), new Point(305, 144), new Point(322, 144), new Point(328, 144), new Point(334, 145), new Point(341, 146), new Point(354, 148), new Point(367, 153), new Point(373, 156), new Point(385, 162), new Point(395, 170), new Point(403, 179), new Point(410, 188), new Point(413, 193), new Point(416, 203), new Point(417, 213), new Point(416, 222), new Point(414, 227), new Point(408, 236), new Point(400, 244), new Point(395, 247), new Point(389, 250), new Point(383, 253), new Point(368, 258), new Point(360, 260), new Point(351, 262), new Point(342, 263), new Point(325, 264), new Point(317, 265), new Point(302, 266), new Point(296, 266), new Point(291, 266), new Point(287, 266), new Point(285, 266), new Point(284, 266), new Point(284, 265) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("P", state);
		}

		[Test]
		public function testMatchStatePLongNarrowCurve():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(268, 202), new Point(268, 219), new Point(268, 226), new Point(268, 231), new Point(268, 236), new Point(269, 246), new Point(269, 251), new Point(270, 257), new Point(270, 264), new Point(271, 270), new Point(271, 277), new Point(272, 283), new Point(272, 290), new Point(273, 298), new Point(273, 305), new Point(274, 313), new Point(274, 320), new Point(275, 328), new Point(275, 336), new Point(276, 343), new Point(276, 350), new Point(276, 357), new Point(277, 364), new Point(277, 370), new Point(278, 376), new Point(278, 381), new Point(278, 389), new Point(279, 392), new Point(279, 397), new Point(280, 398), ]));
			allLines.push(Line.pointsToLines([new Point(278, 199), new Point(281, 198), new Point(286, 197), new Point(289, 196), new Point(292, 195), new Point(295, 195), new Point(303, 193), new Point(307, 193), new Point(312, 193), new Point(317, 193), new Point(328, 194), new Point(341, 196), new Point(355, 202), new Point(361, 206), new Point(368, 210), new Point(374, 215), new Point(385, 226), new Point(389, 231), new Point(393, 237), new Point(396, 242), new Point(397, 247), new Point(398, 252), new Point(398, 257), new Point(396, 261), new Point(389, 269), new Point(379, 274), new Point(373, 277), new Point(365, 279), new Point(358, 280), new Point(341, 282), new Point(332, 283), new Point(323, 283), new Point(315, 284), new Point(298, 284), new Point(290, 284), new Point(270, 285), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("P", state);
		}

		[Test]
		public function testMatchStateQ():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(330, 140), new Point(322, 138), new Point(315, 137), new Point(308, 137), new Point(300, 139), new Point(292, 141), new Point(283, 145), new Point(278, 147), new Point(273, 150), new Point(268, 154), new Point(263, 157), new Point(258, 161), new Point(253, 166), new Point(248, 170), new Point(239, 181), new Point(230, 193), new Point(226, 199), new Point(223, 206), new Point(219, 212), new Point(216, 219), new Point(213, 227), new Point(208, 242), new Point(204, 258), new Point(201, 274), new Point(201, 291), new Point(202, 299), new Point(206, 314), new Point(214, 328), new Point(224, 342), new Point(237, 353), new Point(245, 359), new Point(253, 364), new Point(261, 368), new Point(270, 372), new Point(279, 374), new Point(297, 378), new Point(307, 378), new Point(316, 377), new Point(326, 375), new Point(335, 373), new Point(344, 369), new Point(352, 364), new Point(360, 358), new Point(374, 345), new Point(379, 337), new Point(384, 329), new Point(388, 320), new Point(392, 311), new Point(394, 302), new Point(396, 292), new Point(398, 282), new Point(399, 272), new Point(399, 262), new Point(399, 252), new Point(398, 242), new Point(396, 233), new Point(391, 213), new Point(384, 195), new Point(379, 186), new Point(374, 178), new Point(368, 170), new Point(355, 156), new Point(340, 147), new Point(331, 144), new Point(314, 139), new Point(306, 139) ]));
			allLines.push(Line.pointsToLines([new Point(346, 306), new Point(351, 312), new Point(355, 316), new Point(357, 318), new Point(365, 325), new Point(376, 336), new Point(381, 340), new Point(391, 349), new Point(397, 354), new Point(410, 366), new Point(429, 382), new Point(438, 391), new Point(441, 394), new Point(442, 396) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("Q", state);
		}

		[Test]
		public function testMatchStateRTwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(234, 190), new Point(234, 192), new Point(235, 199), new Point(235, 204), new Point(236, 209), new Point(236, 215), new Point(237, 227), new Point(237, 234), new Point(238, 242), new Point(238, 256), new Point(239, 264), new Point(239, 272), new Point(240, 280), new Point(240, 288), new Point(240, 297), new Point(241, 306), new Point(242, 315), new Point(244, 334), new Point(245, 345), new Point(246, 356), new Point(248, 367), new Point(249, 378), new Point(251, 389), new Point(252, 400), new Point(254, 411), new Point(257, 428), new Point(258, 435), new Point(259, 439), new Point(259, 442), new Point(259, 440), new Point(259, 436) ]));
			allLines.push(Line.pointsToLines([new Point(224, 189), new Point(228, 182), new Point(231, 180), new Point(235, 179), new Point(237, 178), new Point(239, 177), new Point(241, 176), new Point(246, 175), new Point(257, 173), new Point(265, 172), new Point(270, 172), new Point(275, 172), new Point(281, 173), new Point(287, 174), new Point(293, 175), new Point(306, 179), new Point(312, 181), new Point(319, 184), new Point(325, 187), new Point(337, 194), new Point(347, 203), new Point(351, 207), new Point(358, 217), new Point(362, 227), new Point(363, 233), new Point(363, 244), new Point(362, 249), new Point(361, 255), new Point(359, 261), new Point(353, 272), new Point(345, 282), new Point(341, 287), new Point(330, 296), new Point(325, 300), new Point(319, 304), new Point(313, 307), new Point(301, 313), new Point(295, 316), new Point(285, 320), new Point(280, 321), new Point(275, 323), new Point(272, 324), new Point(265, 326), new Point(259, 328), new Point(257, 328), new Point(256, 329), new Point(256, 330), new Point(259, 333), new Point(263, 336), new Point(266, 338), new Point(273, 342), new Point(277, 344), new Point(286, 348), new Point(291, 350), new Point(303, 354), new Point(316, 359), new Point(323, 362), new Point(339, 369), new Point(347, 372), new Point(364, 380), new Point(373, 385), new Point(389, 394), new Point(412, 407), new Point(421, 412), new Point(425, 414), new Point(428, 413) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("R", state);
		}

		[Test]
		public function testMatchStateS():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(400, 150), new Point(393, 143), new Point(386, 137), new Point(378, 131), new Point(368, 125), new Point(362, 122), new Point(356, 119), new Point(350, 116), new Point(343, 114), new Point(336, 111), new Point(329, 109), new Point(322, 108), new Point(316, 107), new Point(309, 106), new Point(302, 105), new Point(295, 105), new Point(289, 105), new Point(282, 106), new Point(276, 107), new Point(265, 110), new Point(259, 113), new Point(255, 115), new Point(250, 118), new Point(246, 122), new Point(243, 125), new Point(240, 129), new Point(237, 133), new Point(233, 143), new Point(231, 152), new Point(230, 157), new Point(231, 162), new Point(232, 167), new Point(235, 177), new Point(241, 186), new Point(249, 194), new Point(259, 201), new Point(264, 204), new Point(276, 211), new Point(290, 217), new Point(305, 224), new Point(313, 228), new Point(322, 231), new Point(331, 235), new Point(349, 244), new Point(367, 252), new Point(375, 257), new Point(383, 262), new Point(391, 267), new Point(406, 277), new Point(419, 288), new Point(425, 293), new Point(430, 299), new Point(435, 304), new Point(441, 315), new Point(443, 320), new Point(445, 329), new Point(444, 338), new Point(438, 346), new Point(434, 350), new Point(422, 356), new Point(407, 361), new Point(397, 362), new Point(387, 364), new Point(376, 364), new Point(352, 365), new Point(340, 365), new Point(327, 364), new Point(315, 364), new Point(291, 362), new Point(270, 360), new Point(261, 360), new Point(249, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("S", state);
		}

		[Test]
		public function testMatchStateT():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(397, 144), new Point(383, 141), new Point(379, 140), new Point(377, 140), new Point(372, 140), new Point(369, 140), new Point(362, 139), new Point(358, 139), new Point(350, 139), new Point(340, 139), new Point(334, 138), new Point(323, 137), new Point(311, 136), new Point(305, 136), new Point(299, 135), new Point(292, 135), new Point(279, 134), new Point(264, 133), new Point(250, 132), new Point(227, 131), new Point(220, 131), new Point(213, 131), new Point(200, 131), new Point(188, 132), new Point(177, 132), new Point(173, 133), new Point(170, 133), new Point(167, 134), new Point(165, 134), new Point(163, 134), new Point(165, 135) ]));
			allLines.push(Line.pointsToLines([new Point(289, 146), new Point(288, 155), new Point(288, 160), new Point(288, 162), new Point(289, 168), new Point(289, 172), new Point(289, 175), new Point(290, 179), new Point(290, 188), new Point(291, 197), new Point(291, 203), new Point(291, 208), new Point(291, 214), new Point(291, 225), new Point(291, 237), new Point(291, 243), new Point(290, 254), new Point(290, 266), new Point(291, 276), new Point(292, 281), new Point(293, 291), new Point(295, 299), new Point(296, 302), new Point(298, 305), new Point(299, 308), new Point(301, 313), new Point(302, 314), new Point(303, 316), new Point(304, 317), new Point(305, 317) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("T", state);
		}

		[Test]
		public function testMatchStateTTopCenterToRight():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(282, 199), new Point(280, 212), new Point(280, 228), new Point(280, 238), new Point(280, 249), new Point(280, 257), new Point(281, 264), new Point(282, 272), new Point(282, 281), new Point(283, 290), new Point(284, 300), new Point(285, 310), new Point(286, 320), new Point(287, 329), new Point(287, 339), new Point(288, 348), new Point(289, 356), new Point(289, 363), new Point(290, 370), new Point(290, 375), new Point(290, 383), new Point(290, 385), new Point(291, 386), ]));
			allLines.push(Line.pointsToLines([new Point(402, 181), new Point(402, 182), new Point(387, 189), new Point(384, 190), new Point(373, 192), new Point(368, 193), new Point(358, 193), new Point(347, 193), new Point(341, 193), new Point(327, 193), new Point(313, 192), new Point(305, 192), new Point(298, 192), new Point(290, 191), new Point(283, 191), new Point(275, 191), new Point(259, 191), new Point(251, 190), new Point(242, 190), new Point(233, 190), new Point(224, 190), new Point(216, 191), new Point(200, 191), new Point(193, 192), new Point(188, 193), new Point(184, 193), new Point(183, 193), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("T", state);
		}

		[Test]
		public function testMatchStateU():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(210, 218), new Point(210, 225), new Point(210, 228), new Point(211, 237), new Point(211, 246), new Point(211, 251), new Point(211, 261), new Point(211, 272), new Point(211, 283), new Point(212, 294), new Point(212, 306), new Point(212, 312), new Point(212, 317), new Point(213, 323), new Point(214, 329), new Point(215, 335), new Point(217, 346), new Point(221, 358), new Point(223, 363), new Point(226, 369), new Point(228, 374), new Point(232, 379), new Point(235, 384), new Point(238, 389), new Point(242, 394), new Point(246, 399), new Point(250, 403), new Point(255, 407), new Point(259, 411), new Point(264, 415), new Point(268, 418), new Point(273, 421), new Point(284, 426), new Point(294, 430), new Point(304, 432), new Point(316, 433), new Point(332, 432), new Point(344, 429), new Point(356, 424), new Point(361, 421), new Point(366, 417), new Point(372, 412), new Point(382, 399), new Point(386, 392), new Point(390, 384), new Point(394, 376), new Point(397, 367), new Point(400, 359), new Point(404, 342), new Point(405, 333), new Point(407, 325), new Point(408, 317), new Point(408, 309), new Point(408, 301), new Point(408, 284), new Point(407, 275), new Point(404, 259), new Point(400, 244), new Point(398, 237), new Point(396, 231), new Point(393, 226), new Point(391, 218) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("U", state);
		}

		[Test]
		public function testMatchStateVOneStroke():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(185, 158), new Point(194, 178), new Point(199, 184), new Point(208, 197), new Point(211, 202), new Point(215, 207), new Point(219, 213), new Point(226, 225), new Point(230, 232), new Point(238, 246), new Point(246, 261), new Point(249, 269), new Point(253, 277), new Point(256, 286), new Point(260, 294), new Point(263, 302), new Point(266, 310), new Point(269, 317), new Point(272, 324), new Point(274, 330), new Point(276, 336), new Point(278, 340), new Point(280, 344), new Point(282, 350), new Point(283, 352), new Point(284, 353), new Point(285, 353), new Point(286, 353), new Point(287, 353), new Point(288, 351), new Point(289, 349), new Point(292, 343), new Point(294, 338), new Point(295, 333), new Point(297, 327), new Point(299, 321), new Point(301, 314), new Point(303, 306), new Point(305, 298), new Point(310, 280), new Point(313, 270), new Point(315, 260), new Point(318, 251), new Point(324, 233), new Point(329, 217), new Point(332, 210), new Point(339, 198), new Point(346, 187), new Point(350, 183), new Point(358, 176), new Point(366, 173), new Point(369, 172), new Point(373, 175), new Point(374, 177) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("V", state);
		}

		[Test]
		public function testMatchStateWOneStroke():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(140, 170), new Point(145, 181), new Point(149, 188), new Point(154, 198), new Point(160, 209), new Point(164, 215), new Point(171, 230), new Point(179, 247), new Point(187, 265), new Point(194, 283), new Point(197, 291), new Point(204, 306), new Point(209, 317), new Point(214, 324), new Point(219, 329), new Point(222, 328), new Point(226, 324), new Point(227, 321), new Point(231, 314), new Point(236, 304), new Point(240, 292), new Point(242, 285), new Point(244, 279), new Point(246, 272), new Point(251, 259), new Point(255, 246), new Point(258, 240), new Point(261, 234), new Point(263, 228), new Point(268, 216), new Point(270, 211), new Point(272, 206), new Point(274, 200), new Point(277, 191), new Point(279, 183), new Point(282, 176), new Point(284, 173), new Point(285, 173), new Point(286, 174), new Point(288, 177), new Point(289, 179), new Point(290, 182), new Point(291, 186), new Point(295, 195), new Point(300, 207), new Point(303, 214), new Point(310, 229), new Point(319, 246), new Point(323, 255), new Point(328, 264), new Point(334, 272), new Point(345, 288), new Point(350, 294), new Point(355, 301), new Point(360, 307), new Point(370, 315), new Point(382, 322), new Point(389, 322), new Point(392, 320), new Point(397, 313), new Point(401, 302), new Point(403, 294), new Point(406, 276), new Point(409, 257), new Point(410, 246), new Point(413, 226), new Point(414, 216), new Point(416, 198), new Point(418, 183), new Point(419, 177), new Point(420, 166), new Point(421, 163), new Point(423, 159), new Point(424, 159) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("W", state);
		}

		[Test]
		public function testMatchStateWOneStroke2():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(203, 238), new Point(203, 246), new Point(205, 254), new Point(205, 258), new Point(206, 268), new Point(207, 273), new Point(208, 279), new Point(209, 285), new Point(210, 292), new Point(210, 299), new Point(211, 306), new Point(212, 313), new Point(214, 327), new Point(215, 342), new Point(217, 357), new Point(218, 364), new Point(218, 372), new Point(219, 380), new Point(220, 387), new Point(221, 395), new Point(222, 410), new Point(224, 424), new Point(225, 436), new Point(225, 442), new Point(226, 448), new Point(227, 453), new Point(227, 458), new Point(228, 462), new Point(230, 470), new Point(231, 475), new Point(232, 477), new Point(232, 479), new Point(233, 480), new Point(234, 481), new Point(234, 482), new Point(235, 482), new Point(236, 481), new Point(237, 480), new Point(239, 479), new Point(240, 477), new Point(242, 475), new Point(244, 472), new Point(246, 469), new Point(248, 465), new Point(253, 456), new Point(258, 446), new Point(261, 440), new Point(264, 435), new Point(267, 429), new Point(269, 423), new Point(272, 417), new Point(278, 405), new Point(283, 394), new Point(288, 383), new Point(291, 377), new Point(296, 367), new Point(301, 357), new Point(303, 353), new Point(304, 349), new Point(306, 345), new Point(308, 342), new Point(309, 339), new Point(312, 333), new Point(315, 330), new Point(316, 329), new Point(317, 329), new Point(318, 328), new Point(319, 328), new Point(320, 329), new Point(322, 332), new Point(324, 334), new Point(325, 337), new Point(326, 340), new Point(328, 344), new Point(329, 348), new Point(332, 358), new Point(334, 370), new Point(336, 376), new Point(339, 389), new Point(341, 402), new Point(343, 408), new Point(344, 415), new Point(346, 422), new Point(349, 435), new Point(352, 447), new Point(354, 453), new Point(357, 463), new Point(360, 472), new Point(362, 475), new Point(365, 481), new Point(367, 485), new Point(368, 486), new Point(370, 487), new Point(372, 486), new Point(374, 483), new Point(376, 480), new Point(378, 472), new Point(380, 467), new Point(383, 457), new Point(386, 444), new Point(388, 437), new Point(392, 422), new Point(395, 406), new Point(397, 398), new Point(400, 380), new Point(405, 351), new Point(408, 332), new Point(409, 323), new Point(411, 305), new Point(413, 278), new Point(413, 261), new Point(413, 253), new Point(413, 237), new Point(413, 223), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("W", state);
		}

		[Test]
		public function testMatchStateWFirstCurved():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(227, 200), new Point(227, 209), new Point(228, 217), new Point(229, 222), new Point(230, 228), new Point(230, 235), new Point(231, 242), new Point(232, 249), new Point(234, 266), new Point(235, 275), new Point(235, 285), new Point(236, 294), new Point(236, 304), new Point(236, 315), new Point(237, 325), new Point(237, 336), new Point(238, 348), new Point(238, 359), new Point(240, 381), new Point(240, 392), new Point(241, 403), new Point(242, 413), new Point(242, 422), new Point(243, 430), new Point(243, 437), new Point(244, 443), new Point(244, 447), new Point(245, 451), new Point(245, 453), new Point(246, 455), new Point(246, 457), new Point(247, 457), new Point(248, 457), new Point(248, 456), new Point(250, 455), new Point(251, 453), new Point(253, 452), new Point(255, 449), new Point(257, 446), new Point(260, 442), new Point(263, 438), new Point(265, 434), new Point(268, 429), new Point(274, 417), new Point(277, 411), new Point(280, 405), new Point(283, 399), new Point(286, 392), new Point(289, 386), new Point(292, 379), new Point(295, 373), new Point(301, 362), new Point(306, 352), new Point(311, 345), new Point(313, 342), new Point(315, 340), new Point(318, 338), new Point(321, 337), new Point(325, 338), new Point(327, 340), new Point(331, 345), new Point(335, 353), new Point(337, 357), new Point(339, 363), new Point(341, 368), new Point(344, 373), new Point(346, 379), new Point(351, 391), new Point(354, 397), new Point(357, 403), new Point(360, 408), new Point(363, 414), new Point(365, 419), new Point(368, 424), new Point(370, 429), new Point(374, 436), new Point(376, 438), new Point(377, 440), new Point(379, 442), new Point(380, 443), new Point(381, 443), new Point(384, 440), new Point(388, 434), new Point(390, 429), new Point(395, 410), new Point(398, 392), new Point(401, 360), new Point(402, 348), new Point(404, 322), new Point(406, 295), new Point(407, 282), new Point(408, 255), new Point(409, 230), new Point(409, 218), new Point(409, 198), new Point(409, 183), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("W", state);
		}

		[Test]
		public function testMatchStateX():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(210, 138), new Point(217, 147), new Point(223, 155), new Point(231, 165), new Point(235, 170), new Point(251, 188), new Point(262, 202), new Point(268, 210), new Point(281, 226), new Point(296, 243), new Point(304, 253), new Point(320, 272), new Point(336, 292), new Point(350, 312), new Point(368, 339), new Point(377, 352), new Point(382, 362), new Point(383, 365), new Point(384, 366), new Point(383, 365) ]));
			allLines.push(Line.pointsToLines([new Point(373, 114), new Point(362, 130), new Point(360, 133), new Point(354, 139), new Point(352, 144), new Point(346, 153), new Point(339, 165), new Point(336, 171), new Point(328, 186), new Point(325, 194), new Point(317, 211), new Point(310, 229), new Point(307, 238), new Point(300, 257), new Point(292, 276), new Point(288, 287), new Point(279, 307), new Point(270, 327), new Point(265, 337), new Point(255, 356), new Point(250, 365), new Point(239, 382), new Point(230, 397), new Point(226, 403), new Point(221, 413) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("X", state);
		}

		[Test]
		public function testMatchStateX2():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(373, 194), new Point(371, 201), new Point(369, 206), new Point(366, 213), new Point(363, 220), new Point(358, 229), new Point(355, 234), new Point(352, 239), new Point(349, 245), new Point(346, 251), new Point(342, 258), new Point(335, 271), new Point(327, 286), new Point(323, 293), new Point(318, 300), new Point(313, 307), new Point(308, 314), new Point(303, 321), new Point(298, 328), new Point(294, 335), new Point(286, 350), new Point(282, 357), new Point(279, 364), new Point(276, 372), new Point(273, 379), new Point(270, 386), new Point(267, 393), new Point(264, 399), new Point(261, 405), new Point(257, 410), new Point(254, 415), new Point(251, 419), new Point(247, 423), new Point(244, 426), new Point(240, 429), new Point(233, 435), new Point(227, 439), ]));
			allLines.push(Line.pointsToLines([new Point(232, 207), new Point(237, 211), new Point(244, 218), new Point(249, 224), new Point(252, 227), new Point(258, 235), new Point(270, 251), new Point(280, 264), new Point(286, 271), new Point(292, 278), new Point(299, 286), new Point(314, 302), new Point(329, 319), new Point(337, 328), new Point(344, 336), new Point(352, 345), new Point(367, 361), new Point(374, 369), new Point(388, 384), new Point(401, 398), new Point(406, 403), new Point(411, 408), new Point(415, 412), new Point(418, 415), new Point(421, 417), new Point(422, 418), ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("X", state);
		}

		[Test]
		public function testMatchStateYTwoStrokes():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(193, 158), new Point(196, 160), new Point(201, 165), new Point(207, 170), new Point(210, 174), new Point(213, 177), new Point(217, 181), new Point(221, 185), new Point(225, 190), new Point(230, 194), new Point(234, 199), new Point(243, 210), new Point(248, 215), new Point(252, 221), new Point(256, 227), new Point(260, 233), new Point(265, 239), new Point(272, 250), new Point(278, 260), new Point(284, 269), new Point(286, 273), new Point(288, 276), new Point(290, 278), new Point(292, 282), new Point(295, 282), new Point(296, 279), new Point(298, 273), new Point(301, 264), new Point(303, 259), new Point(307, 246), new Point(312, 231), new Point(318, 216), new Point(321, 208), new Point(325, 200), new Point(328, 193), new Point(335, 178), new Point(342, 165), new Point(346, 159), new Point(353, 149), new Point(360, 143), new Point(363, 141), new Point(366, 141), new Point(368, 141) ]));
			allLines.push(Line.pointsToLines([new Point(295, 276), new Point(296, 278), new Point(296, 281), new Point(297, 283), new Point(298, 289), new Point(299, 296), new Point(300, 300), new Point(302, 309), new Point(302, 314), new Point(303, 319), new Point(304, 325), new Point(306, 341), new Point(306, 352), new Point(306, 357), new Point(306, 368), new Point(306, 379), new Point(306, 384), new Point(306, 393), new Point(306, 397), new Point(307, 405), new Point(307, 411), new Point(307, 414), new Point(308, 418), new Point(309, 420), new Point(310, 421) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("Y", state);
		}

		[Test]
		public function testMatchStateZ():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(210, 164), new Point(215, 164), new Point(221, 164), new Point(228, 164), new Point(231, 163), new Point(240, 163), new Point(254, 162), new Point(265, 161), new Point(271, 161), new Point(277, 161), new Point(283, 160), new Point(296, 160), new Point(303, 159), new Point(310, 159), new Point(317, 159), new Point(324, 158), new Point(332, 158), new Point(339, 158), new Point(347, 158), new Point(360, 157), new Point(373, 157), new Point(383, 156), new Point(387, 156), new Point(394, 156), new Point(398, 156), new Point(399, 156), new Point(399, 157), new Point(398, 158), new Point(395, 162), new Point(390, 167), new Point(386, 170), new Point(383, 174), new Point(378, 178), new Point(374, 183), new Point(368, 187), new Point(356, 198), new Point(342, 209), new Point(334, 215), new Point(326, 222), new Point(318, 228), new Point(301, 242), new Point(293, 249), new Point(284, 256), new Point(276, 263), new Point(269, 270), new Point(261, 277), new Point(247, 292), new Point(240, 299), new Point(228, 312), new Point(218, 324), new Point(210, 335), new Point(206, 339), new Point(201, 346), new Point(197, 352), new Point(195, 354), new Point(194, 355), new Point(193, 356), new Point(193, 358), new Point(194, 359), new Point(196, 359), new Point(202, 359), new Point(212, 360), new Point(217, 360), new Point(231, 360), new Point(246, 359), new Point(255, 359), new Point(264, 359), new Point(273, 358), new Point(293, 357), new Point(303, 356), new Point(325, 355), new Point(347, 354), new Point(379, 354), new Point(399, 356), new Point(408, 356), new Point(416, 357), new Point(424, 358), new Point(431, 358) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("Z", state);
		}

		[Test]
		public function testMatchStateZ2():void
		{
			var drawArea:Rectangle = new Rectangle(75, 0, 640, 605);
			var allLines:Array = new Array();
			allLines.push(Line.pointsToLines([new Point(221, 158), new Point(222, 158), new Point(242, 159), new Point(247, 159), new Point(257, 160), new Point(267, 160), new Point(272, 160), new Point(284, 161), new Point(291, 161), new Point(305, 161), new Point(320, 162), new Point(337, 162), new Point(354, 162), new Point(362, 162), new Point(370, 163), new Point(378, 163), new Point(386, 164), new Point(393, 164), new Point(399, 165), new Point(405, 165), new Point(411, 166), new Point(415, 167), new Point(419, 168), new Point(422, 169), new Point(424, 170), new Point(425, 172), new Point(424, 176), new Point(419, 182), new Point(416, 186), new Point(411, 190), new Point(406, 194), new Point(400, 198), new Point(393, 204), new Point(386, 209), new Point(378, 215), new Point(361, 228), new Point(352, 236), new Point(342, 243), new Point(333, 251), new Point(323, 259), new Point(313, 268), new Point(295, 285), new Point(286, 293), new Point(271, 309), new Point(258, 324), new Point(252, 331), new Point(247, 337), new Point(243, 342), new Point(239, 347), new Point(237, 351), new Point(234, 354), new Point(233, 357), new Point(232, 359), new Point(231, 361), new Point(236, 360), new Point(242, 358), new Point(247, 357), new Point(252, 355), new Point(258, 353), new Point(273, 348), new Point(281, 346), new Point(301, 342), new Point(323, 339), new Point(359, 337), new Point(385, 338), new Point(398, 338), new Point(410, 339), new Point(422, 341), new Point(445, 344), new Point(456, 346), new Point(474, 350), new Point(488, 355), new Point(493, 357) ]));
			var parts:Array = linesToParts(allLines, drawArea);
			var state:State = State.matchState(parts);
			assertMatchedState("Z", state);
		}

		
		/*************************************
		 * Utility methods
		 *************************************/

		protected function drawingsToLines(allLines:Array, drawArea:Rectangle):Array
		{
			var lines:Array = new Array();
			for each (var drawLines:Array in allLines)
			{
				lines = lines.concat(LineInterpreter.packLines(drawLines, drawArea));
			}
			return lines;
		}
		
		protected function linesToParts(allLines:Array, drawArea:Rectangle):Array
		{
			var lines:Array = drawingsToLines(allLines, drawArea);
			var parts:Array = new Array();
			for each (var line:Line in lines)
			{
				var percentLine:Line = DrawingUtils.percentLine(line, drawArea);

				if (line.isSignificant(drawArea))
				{
					var part:Part = Part.lineToPart(percentLine);
					parts.push(part);
				}
			}
			return parts;
		}
		
		protected function assertMatchedState(stateName:String, state:State):void
		{
			Assert.assertNotNull(state);
			Assert.assertTrue(state.isLetter);
			Assert.assertEquals(stateName, state.stateName);
		}
	}
}