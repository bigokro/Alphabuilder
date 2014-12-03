package objects
{
	import flash.geom.*;

	public class PieceIdentifiers
	{
		public static const BACKSLASH:String = "BackSlash";
		public static const C:String = "C";
		public static const CARET:String = "Caret";
		public static const DASH:String = "Dash";
		public static const I:String = "I";
		public static const RIGHTPAREN:String = "RightParen";
		public static const SLASH:String = "Slash";
		public static const U:String = "U";
		
		public static var STANDARD_IDENTIFIERS:Array = new Array (
			BACKSLASH,
			C,
			//CARET,
			DASH,
			I,
			RIGHTPAREN,
			SLASH,
			U
		);
		
		public static var FULL_IDENTIFIERS:Array = new Array (
			BACKSLASH,
			C,
			CARET,
			DASH,
			I,
			RIGHTPAREN,
			SLASH,
			U
		);
		
		public static var IDENTIFIERS:Array = STANDARD_IDENTIFIERS;
		
		public static var SHAPES:Object = {
			I:[new Line([new Point(50, 20), new Point(50, 80), null])],
			Dash:[new Line([new Point(20, 50), new Point(80, 50), null])],
			Slash:[new Line([new Point(20, 80), new Point(80, 20), null])],
			BackSlash:[new Line([new Point(20, 20), new Point(80, 80), null])],
			C:[
					new Line([new Point(70, 20), new Point(30, 50), new Point(30, 20)]),
					new Line([new Point(30, 50), new Point(70, 80), new Point(30, 80)])
				],
			RightParen:[
					new Line([new Point(30, 20), new Point(70, 50), new Point(70, 20)]),
					new Line([new Point(70, 50), new Point(30, 80), new Point(70, 80)])
				],
			Caret:[
					new Line([new Point(20, 70), new Point(50, 30), new Point(20, 30)]),
					new Line([new Point(50, 30), new Point(80, 70), new Point(80, 30)])
				],
			U:[
					new Line([new Point(20, 30), new Point(50, 70), new Point(20, 70)]),
					new Line([new Point(50, 70), new Point(80, 30), new Point(80, 70)])
				]
		};
		
	}
}