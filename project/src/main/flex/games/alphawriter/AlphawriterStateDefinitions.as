package games.alphawriter
{
	import flash.geom.*;
	import flash.utils.*;
	
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	import objects.*;
	
	public class AlphawriterStateDefinitions extends StateDefinitions 
	{
		static public function get Instance():StateDefinitions
		{
			if ( instance == null )
				instance = new AlphawriterStateDefinitions();
			return instance;
		}
		
		public function AlphawriterStateDefinitions()
		{
		}
		
		override public function startup(canvas:Canvas):void
		{
			super.startup(canvas);
			
			var state:State = null;
			var uid:String = "";
			var stateType:String = "";
			var stateName:String = "";
			
			stateType = StateIdentifiers.S;
			uid = "-end-lines";
			stateName = stateType + uid;
			state = new State(stateType, true, Sounds[stateType]);
			StateDefinitions.Instance.States[stateName] = state;
			definePart(PieceIdentifiers.DASH, null, [new Line([new Point(60, 36), new Point(67, 36), null])], null, state, uid + "-A");
			definePart(PieceIdentifiers.C, new Point(50, 39), [
				new Line([new Point(60, 36), new Point(45, 29), new Point(56, 28)]),
				new Line([new Point(45, 29), new Point(33, 41), new Point(31, 31)]),
				new Line([new Point(33, 41), new Point(50, 50), new Point(34, 47)])
			], null, state, uid);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(50, 61), [
				new Line([new Point(50, 50), new Point(67, 59), new Point(66, 53)]),
				new Line([new Point(67, 59), new Point(55, 71), new Point(69, 69)]),
				new Line([new Point(55, 71), new Point(40, 64), new Point(44, 72)])
			], null, state, uid);
			definePart(PieceIdentifiers.DASH, null, [new Line([new Point(33, 64), new Point(40, 64), null])], null, state, uid + "-B");
			state.startup(this.canvas);
			
		}
	}
}