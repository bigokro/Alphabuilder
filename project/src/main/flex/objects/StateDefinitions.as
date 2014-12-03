package objects 
{
	import flash.utils.*;
	import flash.geom.*;
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	public class StateDefinitions
	{
		protected static var instance:StateDefinitions = null;
		public static var Sounds:Array = new Array();
		
		public var States:Array = new Array();
		public var Parts:Array = new Array();
		protected var canvas:Canvas = null;
		
		static public function get Instance():StateDefinitions
		{
			if ( instance == null )
				instance = new StateDefinitions();
			return instance;
		}
		
		public function StateDefinitions()
		{
			
		}

		// Sounds
		
		[Embed(source="../../media/states/sounds/explosion.mp3")]
		public static var ExplosionSound:Class;
		Sounds["explosion"] = new ExplosionSound() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/A.mp3")]
		public static var StateSoundA:Class;
		Sounds[StateIdentifiers.A] = new StateSoundA() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/B.mp3")]
		public static var StateSoundB:Class;
		Sounds[StateIdentifiers.B] = new StateSoundB() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/C.mp3")]
		public static var StateSoundC:Class;
		Sounds[StateIdentifiers.C] = new StateSoundC() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/D.mp3")]
		public static var StateSoundD:Class;
		Sounds[StateIdentifiers.D] = new StateSoundD() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/E.mp3")]
		public static var StateSoundE:Class;
		Sounds[StateIdentifiers.E] = new StateSoundE() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/F.mp3")]
		public static var StateSoundF:Class;
		Sounds[StateIdentifiers.F] = new StateSoundF() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/G.mp3")]
		public static var StateSoundG:Class;
		Sounds[StateIdentifiers.G] = new StateSoundG() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/H.mp3")]
		public static var StateSoundH:Class;
		Sounds[StateIdentifiers.H] = new StateSoundH() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/I.mp3")]
		public static var StateSoundI:Class;
		Sounds[StateIdentifiers.I] = new StateSoundI() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/L.mp3")]
		public static var StateSoundL:Class;
		Sounds[StateIdentifiers.L] = new StateSoundL() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/O.mp3")]
		public static var StateSoundO:Class;
		Sounds[StateIdentifiers.O] = new StateSoundO() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/Q.mp3")]
		public static var StateSoundQ:Class;
		Sounds[StateIdentifiers.Q] = new StateSoundQ() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/S.mp3")]
		public static var StateSoundS:Class;
		Sounds[StateIdentifiers.S] = new StateSoundS() as SoundAsset;	
		
		[Embed(source="../../media/states/sounds/W.mp3")]
		public static var StateSoundW:Class;
		Sounds[StateIdentifiers.W] = new StateSoundW() as SoundAsset;	
		
		
		public function startup(canvas:Canvas):void
		{
			this.canvas = canvas;
			
			States[StateIdentifiers.BLANK] = new State(StateIdentifiers.BLANK, false, null);
			States[StateIdentifiers.RIGHTPAREN] = new State(StateIdentifiers.RIGHTPAREN, false, null);
			States[StateIdentifiers.DASH] = new State(StateIdentifiers.DASH, false, null);
			States[StateIdentifiers.LEFTBRACKET] = new State(StateIdentifiers.LEFTBRACKET, false, null);
			States[StateIdentifiers.A] = new State(StateIdentifiers.A, true, Sounds[StateIdentifiers.A]);
			States[StateIdentifiers.ALEFT] = new State(StateIdentifiers.ALEFT, false, null);
			States[StateIdentifiers.ARIGHT] = new State(StateIdentifiers.ARIGHT, false, null);
			States[StateIdentifiers.B] = new State(StateIdentifiers.B, true, Sounds[StateIdentifiers.B]);
			States[StateIdentifiers.BBOTTOM] = new State(StateIdentifiers.BBOTTOM, false, null);
			States[StateIdentifiers.BRIGHT] = new State(StateIdentifiers.BRIGHT, false, null);
			States[StateIdentifiers.BACKSLASH] = new State(StateIdentifiers.BACKSLASH, false, null);
			States[StateIdentifiers.BACKSLASHBACKSLASH] = new State(StateIdentifiers.BACKSLASHBACKSLASH, false, null);
			States[StateIdentifiers.C] = new State(StateIdentifiers.C, true, Sounds[StateIdentifiers.C]);
			States[StateIdentifiers.D] = new State(StateIdentifiers.D, true, Sounds[StateIdentifiers.D]);
			States[StateIdentifiers.E] = new State(StateIdentifiers.E, true, Sounds[StateIdentifiers.E]);
			States[StateIdentifiers.ERIGHT] = new State(StateIdentifiers.ERIGHT, false, null);
			States[StateIdentifiers.F] = new State(StateIdentifiers.F, true, Sounds[StateIdentifiers.F]);
			States[StateIdentifiers.FINVERTED] = new State(StateIdentifiers.FINVERTED, false, null);
			States[StateIdentifiers.G] = new State(StateIdentifiers.G, true, Sounds[StateIdentifiers.G]);
			States[StateIdentifiers.H] = new State(StateIdentifiers.H, true, Sounds[StateIdentifiers.H]);
			States[StateIdentifiers.HLEFT] = new State(StateIdentifiers.HLEFT, false, null);
			States[StateIdentifiers.HRIGHT] = new State(StateIdentifiers.HRIGHT, false, null);
			States[StateIdentifiers.I] = new State(StateIdentifiers.I, true, Sounds[StateIdentifiers.I]);
			States[StateIdentifiers.II] = new State(StateIdentifiers.II, false, null);
			States[StateIdentifiers.ISLASH] = new State(StateIdentifiers.ISLASH, false, null);
			States[StateIdentifiers.J] = new State(StateIdentifiers.J, true, null);
			States[StateIdentifiers.K] = new State(StateIdentifiers.K, true, null);
			States[StateIdentifiers.KBOTTOM] = new State(StateIdentifiers.KBOTTOM, false, null);
			States[StateIdentifiers.KRIGHT] = new State(StateIdentifiers.KRIGHT, false, null);
			States[StateIdentifiers.KTOP] = new State(StateIdentifiers.KTOP, false, null);
			States[StateIdentifiers.L] = new State(StateIdentifiers.L, true, Sounds[StateIdentifiers.L]);
			States[StateIdentifiers.LAMBDA] = new State(StateIdentifiers.LAMBDA, false, null);
			States[StateIdentifiers.LINVERTED] = new State(StateIdentifiers.LINVERTED, false, null);
			States[StateIdentifiers.M] = new State(StateIdentifiers.M, true, null);
			States[StateIdentifiers.MLEFT2] = new State(StateIdentifiers.MLEFT2, false, null);
			States[StateIdentifiers.MRIGHT] = new State(StateIdentifiers.MRIGHT, false, null);
			States[StateIdentifiers.IMRIGHT] = new State(StateIdentifiers.IMRIGHT, false, null);
			States[StateIdentifiers.MRIGHT2] = new State(StateIdentifiers.MRIGHT2, false, null);
			States[StateIdentifiers.N] = new State(StateIdentifiers.N, true, null);
			States[StateIdentifiers.NLEFT] = new State(StateIdentifiers.NLEFT, false, null);
			States[StateIdentifiers.NRIGHT] = new State(StateIdentifiers.NRIGHT, false, null);
			States[StateIdentifiers.O] = new State(StateIdentifiers.O, true, Sounds[StateIdentifiers.O]);
			States[StateIdentifiers.P] = new State(StateIdentifiers.P, true, null);
			States[StateIdentifiers.Q] = new State(StateIdentifiers.Q, true, Sounds[StateIdentifiers.Q]);
			States[StateIdentifiers.QBOTTOM] = new State(StateIdentifiers.QBOTTOM, false, null);
			States[StateIdentifiers.QLEFT] = new State(StateIdentifiers.QLEFT, false, null);
			States[StateIdentifiers.QRIGHT] = new State(StateIdentifiers.QRIGHT, false, null);
			States[StateIdentifiers.QTOP] = new State(StateIdentifiers.QTOP, false, null);
			States[StateIdentifiers.R] = new State(StateIdentifiers.R, true, null);
			States[StateIdentifiers.RRIGHT] = new State(StateIdentifiers.RRIGHT, false, null);
			States[StateIdentifiers.S] = new State(StateIdentifiers.S, true, Sounds[StateIdentifiers.S]);
			States[StateIdentifiers.SLASH] = new State(StateIdentifiers.SLASH, false, null);
			States[StateIdentifiers.SLASHSLASH] = new State(StateIdentifiers.SLASHSLASH, false, null);
			States[StateIdentifiers.T] = new State(StateIdentifiers.T, true, null);
			States[StateIdentifiers.U] = new State(StateIdentifiers.U, true, null);
			States[StateIdentifiers.UINVERTED] = new State(StateIdentifiers.UINVERTED, false, null);
			States[StateIdentifiers.V] = new State(StateIdentifiers.V, true, null);
			States[StateIdentifiers.BACKSLASHV] = new State(StateIdentifiers.BACKSLASHV, false, null);
			States[StateIdentifiers.VSLASH] = new State(StateIdentifiers.VSLASH, false, null);
			States[StateIdentifiers.W] = new State(StateIdentifiers.W, true, Sounds[StateIdentifiers.W]);
			States[StateIdentifiers.WLEFT2] = new State(StateIdentifiers.WLEFT2, false, null);
			States[StateIdentifiers.WRIGHT2] = new State(StateIdentifiers.WRIGHT2, false, null);
			States[StateIdentifiers.X] = new State(StateIdentifiers.X, true, null);
			States[StateIdentifiers.Y] = new State(StateIdentifiers.Y, true, null);
			States[StateIdentifiers.YLEFT] = new State(StateIdentifiers.YLEFT, false, null);
			States[StateIdentifiers.YRIGHT] = new State(StateIdentifiers.YRIGHT, false, null);
			States[StateIdentifiers.Z] = new State(StateIdentifiers.Z, true, null);
			States[StateIdentifiers.ZBARS] = new State(StateIdentifiers.ZBARS, false, null);
			States[StateIdentifiers.ZBOTTOM] = new State(StateIdentifiers.ZBOTTOM, false, null);
			States[StateIdentifiers.ZTOP] = new State(StateIdentifiers.ZTOP, false, null);
			
			for each (var state:State in States)
			{
				state.startup(this.canvas);
			}
											
			// Definition for parts
			definePart(PieceIdentifiers.BACKSLASH, new Point(50, 50), [new Line([new Point(33, 25), new Point(67, 75), null])], States[StateIdentifiers.BLANK], States[StateIdentifiers.BACKSLASH]);
			definePart(PieceIdentifiers.C, new Point(50, 50), [
					new Line([new Point(75, 33), new Point(40, 33), new Point(58, 20)]),
					new Line([new Point(40, 33), new Point(40, 67), new Point(22, 50)]),
					new Line([new Point(40, 67), new Point(75, 67), new Point(58, 80)])
				], States[StateIdentifiers.BLANK], States[StateIdentifiers.C]);
			/*
			definePart(PieceIdentifiers.CARET, new Point(50, 50), [
					new Line([new Point(25, 50), new Point(50, 25), new Point(25, 25)]),
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)])
				], States[StateIdentifiers.BLANK], States[StateIdentifiers.UINVERTED]);
			*/
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(25, 50), new Point(75, 50), null])], States[StateIdentifiers.BLANK], States[StateIdentifiers.DASH]);
			definePart(PieceIdentifiers.I, new Point(50, 50), [new Line([new Point(50, 25), new Point(50, 75), null])], States[StateIdentifiers.BLANK], States[StateIdentifiers.I]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(50, 50), [
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)]),
					new Line([new Point(75, 50), new Point(50, 75), new Point(75, 75)])
				], States[StateIdentifiers.BLANK], States[StateIdentifiers.RIGHTPAREN]);
			definePart(PieceIdentifiers.SLASH, new Point(50, 50), [new Line([new Point(33, 75), new Point(67, 25), null])], States[StateIdentifiers.BLANK], States[StateIdentifiers.SLASH]);
			definePart(PieceIdentifiers.U, new Point(50, 50), [
					new Line([new Point(25, 25), new Point(50, 75), new Point(25, 75)]),
					new Line([new Point(50, 75), new Point(75, 25), new Point(75, 75)])
				], States[StateIdentifiers.BLANK], States[StateIdentifiers.U]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(41, 37), [new Line([new Point(33, 25), new Point(50, 50), null])], States[StateIdentifiers.I], States[StateIdentifiers.YLEFT]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(40, 50), [new Line([new Point(33, 25), new Point(67, 75), null])], States[StateIdentifiers.I], States[StateIdentifiers.NRIGHT]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(60, 50), [new Line([new Point(33, 25), new Point(67, 75), null])], States[StateIdentifiers.I], States[StateIdentifiers.NLEFT]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(53, 62), [new Line([new Point(40, 50), new Point(67, 75), null])], States[StateIdentifiers.I], States[StateIdentifiers.KBOTTOM]);
			definePart(PieceIdentifiers.DASH, new Point(40, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.I], States[StateIdentifiers.HRIGHT]);
			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(25, 25), new Point(75, 25), null])], States[StateIdentifiers.I], States[StateIdentifiers.T]);
			definePart(PieceIdentifiers.DASH, new Point(60, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.I], States[StateIdentifiers.LINVERTED]);
			definePart(PieceIdentifiers.DASH, new Point(60, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.I], States[StateIdentifiers.HLEFT]);
			definePart(PieceIdentifiers.DASH, new Point(60, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.I], States[StateIdentifiers.L]);
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.I], States[StateIdentifiers.II], "-A");
			definePart(PieceIdentifiers.I, new Point(67, 50), [new Line([new Point(67, 25), new Point(67, 75), null])], States[StateIdentifiers.I], States[StateIdentifiers.II], "-B");
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(60, 37), [
					new Line([new Point(40, 25), new Point(75, 38), new Point(75, 25)]),
					new Line([new Point(75, 38), new Point(40, 50), new Point(75, 50)])
				], States[StateIdentifiers.I], States[StateIdentifiers.P]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(60, 50), [
					new Line([new Point(40, 25), new Point(75, 50), new Point(75, 25)]),
					new Line([new Point(75, 50), new Point(40, 75), new Point(75, 75)])
				], States[StateIdentifiers.I], States[StateIdentifiers.D]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(60, 63), [
					new Line([new Point(40, 50), new Point(75, 62), new Point(75, 50)]),
					new Line([new Point(75, 62), new Point(40, 75), new Point(75, 75)])
				], States[StateIdentifiers.I], States[StateIdentifiers.BBOTTOM]);
			definePart(PieceIdentifiers.SLASH, new Point(40, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.I], States[StateIdentifiers.MRIGHT]);
			definePart(PieceIdentifiers.SLASH, new Point(59, 38), [new Line([new Point(50, 50), new Point(67, 25), null])], States[StateIdentifiers.I], States[StateIdentifiers.YRIGHT]);
			definePart(PieceIdentifiers.SLASH, new Point(53, 38), [new Line([new Point(40, 50), new Point(67, 25), null])], States[StateIdentifiers.I], States[StateIdentifiers.KTOP]);
			definePart(PieceIdentifiers.SLASH, new Point(60, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.I], States[StateIdentifiers.ISLASH]);
			definePart(PieceIdentifiers.U, new Point(50, 65), [
					new Line([new Point(33, 58), new Point(50, 75), new Point(33, 75)]),
					new Line([new Point(50, 75), new Point(67, 58), new Point(67, 75)])
				], States[StateIdentifiers.I], States[StateIdentifiers.J]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(63, 50), [new Line([new Point(50, 25), new Point(75, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.ARIGHT]);
			definePart(PieceIdentifiers.C, new Point(57, 50), [
					new Line([new Point(75, 33), new Point(40, 33), new Point(58, 20)]),
					new Line([new Point(40, 33), new Point(40, 67), new Point(22, 50)]),
					new Line([new Point(40, 67), new Point(75, 67), new Point(58, 80)]),
					new Line([new Point(75, 67), new Point(75, 55), null])
				], States[StateIdentifiers.DASH], States[StateIdentifiers.G]);
			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.ZBARS], "-A");
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.ZBARS], "-B");
			definePart(PieceIdentifiers.I, new Point(33, 40), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.L]);
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.HLEFT]);
			definePart(PieceIdentifiers.I, new Point(33, 60), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.LINVERTED]);
			definePart(PieceIdentifiers.I, new Point(50, 50), [new Line([new Point(50, 25), new Point(50, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.T]);
			definePart(PieceIdentifiers.I, new Point(67, 50), [new Line([new Point(67, 25), new Point(67, 75), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.HRIGHT]);
			definePart(PieceIdentifiers.SLASH, new Point(37, 50), [new Line([new Point(25, 75), new Point(50, 25), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.ALEFT]);
			definePart(PieceIdentifiers.SLASH, new Point(50, 40), [new Line([new Point(33, 75), new Point(67, 25), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.ZBOTTOM]);
			definePart(PieceIdentifiers.SLASH, new Point(50, 60), [new Line([new Point(33, 75), new Point(67, 25), null])], States[StateIdentifiers.DASH], States[StateIdentifiers.ZTOP]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(59, 63), [new Line([new Point(50, 50), new Point(67, 75), null])], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.RRIGHT]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(61, 65), [new Line([new Point(55, 55), new Point(67, 75), null])], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.QRIGHT]);
			definePart(PieceIdentifiers.C, new Point(50, 39), [
					new Line([new Point(67, 36), new Point(45, 29), new Point(56, 28)]),
					new Line([new Point(45, 29), new Point(33, 41), new Point(31, 31)]),
					new Line([new Point(33, 41), new Point(50, 50), new Point(34, 47)])
				], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.S]);
			definePart(PieceIdentifiers.C, new Point(37, 50), [
					new Line([new Point(50, 25), new Point(25, 50), new Point(25, 25)]),
					new Line([new Point(25, 50), new Point(50, 75), new Point(25, 75)])
				], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.O]);
			definePart(PieceIdentifiers.I, new Point(40, 37), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.BBOTTOM]);
			definePart(PieceIdentifiers.I, new Point(40, 50), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.D]);
			definePart(PieceIdentifiers.I, new Point(40, 63), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.P]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(50, 37), [
					new Line([new Point(33, 25), new Point(67, 38), new Point(67, 25)]),
					new Line([new Point(67, 38), new Point(33, 50), new Point(67, 50)])
				], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.BRIGHT], "-A");
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(50, 63), [
					new Line([new Point(33, 50), new Point(67, 62), new Point(67, 50)]),
					new Line([new Point(67, 62), new Point(33, 75), new Point(67, 75)])
				], States[StateIdentifiers.RIGHTPAREN], States[StateIdentifiers.BRIGHT], "-B");

			definePart(PieceIdentifiers.RIGHTPAREN, new Point(63, 50), [
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)]),
					new Line([new Point(75, 50), new Point(50, 75), new Point(75, 75)])
				], States[StateIdentifiers.C], States[StateIdentifiers.O]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(50, 61), [
					new Line([new Point(50, 50), new Point(67, 59), new Point(66, 53)]),
					new Line([new Point(67, 59), new Point(55, 71), new Point(69, 69)]),
					new Line([new Point(55, 71), new Point(33, 64), new Point(44, 72)])
				], States[StateIdentifiers.C], States[StateIdentifiers.S]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(20, 50), [new Line([new Point(10, 25), new Point(30, 75), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.BACKSLASHBACKSLASH], "-A");
			definePart(PieceIdentifiers.BACKSLASH, new Point(60, 50), [new Line([new Point(50, 25), new Point(70, 75), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.BACKSLASHBACKSLASH], "-B");
			definePart(PieceIdentifiers.C, new Point(37, 50), [
					new Line([new Point(50, 25), new Point(25, 50), new Point(25, 25)]),
					new Line([new Point(25, 50), new Point(50, 75), new Point(25, 75)])
				], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.QLEFT]);
			/*
			definePart(PieceIdentifiers.CARET, new Point(50, 25), [
					new Line([new Point(25, 50), new Point(50, 25), new Point(25, 25)]),
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)])
				], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.QTOP]);
			*/
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(38, 50), new Point(62, 50), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.ARIGHT]);
			definePart(PieceIdentifiers.I, new Point(40, 55), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.KBOTTOM]);
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.NLEFT]);
			definePart(PieceIdentifiers.I, new Point(67, 50), [new Line([new Point(67, 25), new Point(67, 75), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.NRIGHT]);
			definePart(PieceIdentifiers.I, new Point(50, 63), [new Line([new Point(50, 50), new Point(50, 75), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.YLEFT]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(50, 37), [
					new Line([new Point(33, 25), new Point(67, 38), new Point(67, 25)]),
					new Line([new Point(67, 38), new Point(33, 50), new Point(67, 50)])
				], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.RRIGHT]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(63, 50), [
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)]),
					new Line([new Point(75, 50), new Point(50, 75), new Point(75, 75)])
				], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.QRIGHT]);
			definePart(PieceIdentifiers.SLASH, new Point(40, 50), [new Line([new Point(30, 75), new Point(50, 25), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.LAMBDA]);
			definePart(PieceIdentifiers.SLASH, new Point(53, 37), [new Line([new Point(40, 50), new Point(67, 25), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.KRIGHT]);
			definePart(PieceIdentifiers.SLASH, new Point(50, 50), [new Line([new Point(33, 75), new Point(67, 25), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.X]);
			definePart(PieceIdentifiers.SLASH, new Point(60, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.V]);
			/*
			definePart(PieceIdentifiers.U, new Point(50, 75), [
					new Line([new Point(25, 50), new Point(50, 75), new Point(25, 75)]),
					new Line([new Point(50, 75), new Point(75, 50), new Point(75, 75)])
				], States[StateIdentifiers.BACKSLASH], States[StateIdentifiers.QBOTTOM]);
			*/
	
			definePart(PieceIdentifiers.SLASH, new Point(40, 50), [new Line([new Point(30, 75), new Point(50, 25), null])], States[StateIdentifiers.BACKSLASHBACKSLASH], States[StateIdentifiers.WLEFT2]);
			definePart(PieceIdentifiers.SLASH, new Point(80, 50), [new Line([new Point(70, 75), new Point(90, 25), null])], States[StateIdentifiers.BACKSLASHBACKSLASH], States[StateIdentifiers.BACKSLASHV]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(40, 50), [new Line([new Point(30, 25), new Point(50, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.V]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(50, 50), [new Line([new Point(33, 25), new Point(67, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.X]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(53, 63), [new Line([new Point(40, 50), new Point(67, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.KRIGHT]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(60, 50), [new Line([new Point(50, 25), new Point(70, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.LAMBDA]);
			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.ZTOP]);
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(38, 50), new Point(62, 50), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.ALEFT]);
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.ZBOTTOM]);
			definePart(PieceIdentifiers.I, new Point(30, 50), [new Line([new Point(30, 25), new Point(30, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.ISLASH]);
			definePart(PieceIdentifiers.I, new Point(40, 55), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.KTOP]);
			definePart(PieceIdentifiers.I, new Point(50, 63), [new Line([new Point(50, 50), new Point(50, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.YRIGHT]);
			definePart(PieceIdentifiers.I, new Point(70, 50), [new Line([new Point(70, 25), new Point(70, 75), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.MRIGHT]);
			definePart(PieceIdentifiers.SLASH, new Point(40, 50), [new Line([new Point(30, 75), new Point(50, 25), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.SLASHSLASH], "-A");
			definePart(PieceIdentifiers.SLASH, new Point(80, 50), [new Line([new Point(70, 75), new Point(90, 25), null])], States[StateIdentifiers.SLASH], States[StateIdentifiers.SLASHSLASH], "-B");

			definePart(PieceIdentifiers.BACKSLASH, new Point(41, 50), [new Line([new Point(30, 25), new Point(50, 75), null])], States[StateIdentifiers.ISLASH], States[StateIdentifiers.MLEFT2]);
			definePart(PieceIdentifiers.I, new Point(70, 50), [new Line([new Point(70, 25), new Point(70, 75), null])], States[StateIdentifiers.ISLASH], States[StateIdentifiers.IMRIGHT]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(20, 50), [new Line([new Point(10, 25), new Point(30, 75), null])], States[StateIdentifiers.SLASHSLASH], States[StateIdentifiers.VSLASH]);
			definePart(PieceIdentifiers.BACKSLASH, new Point(60, 50), [new Line([new Point(50, 25), new Point(70, 75), null])], States[StateIdentifiers.SLASHSLASH], States[StateIdentifiers.WRIGHT2]);

			definePart(PieceIdentifiers.SLASH, new Point(40, 50), [new Line([new Point(30, 75), new Point(50, 25), null])], States[StateIdentifiers.BACKSLASHV], States[StateIdentifiers.W]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(60, 50), [new Line([new Point(50, 25), new Point(70, 75), null])], States[StateIdentifiers.VSLASH], States[StateIdentifiers.W]);
			
			//definePart(PieceIdentifiers.BACKSLASH, new Point(75, 75), [new Line([new Point(55, 55), new Point(67, 75), null])], States[StateIdentifiers.U], States[StateIdentifiers.QBOTTOM]);

			/*
			definePart(PieceIdentifiers.CARET, new Point(50, 20), [
					new Line([new Point(25, 50), new Point(50, 25), new Point(25, 25)]),
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)])
				], States[StateIdentifiers.U], States[StateIdentifiers.O]);
			*/
			definePart(PieceIdentifiers.I, new Point(67, 44), [new Line([new Point(67, 25), new Point(67, 60), null])], States[StateIdentifiers.U], States[StateIdentifiers.J]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(61, 65), [new Line([new Point(55, 55), new Point(67, 75), null])], States[StateIdentifiers.C], States[StateIdentifiers.QLEFT]);
			definePart(PieceIdentifiers.DASH, new Point(63, 55), [new Line([new Point(50, 55), new Point(75, 55), null])], States[StateIdentifiers.C], States[StateIdentifiers.G]);

			//definePart(PieceIdentifiers.BACKSLASH, new Point(75, 75), [new Line([new Point(55, 55), new Point(67, 75), null])], States[StateIdentifiers.UINVERTED], States[StateIdentifiers.QTOP]);
			/*
			definePart(PieceIdentifiers.U, new Point(50, 80), [
					new Line([new Point(25, 50), new Point(50, 75), new Point(25, 75)]),
					new Line([new Point(50, 75), new Point(75, 50), new Point(75, 75)])
			], States[StateIdentifiers.UINVERTED], States[StateIdentifiers.O]);
			*/
			definePart(PieceIdentifiers.BACKSLASH, new Point(63, 50), [new Line([new Point(50, 25), new Point(75, 75), null])], States[StateIdentifiers.ALEFT], States[StateIdentifiers.A]);
			
			definePart(PieceIdentifiers.SLASH, new Point(37, 50), [new Line([new Point(25, 75), new Point(50, 25), null])], States[StateIdentifiers.ARIGHT], States[StateIdentifiers.A]);

			definePart(PieceIdentifiers.RIGHTPAREN, new Point(60, 37), [
					new Line([new Point(40, 25), new Point(75, 38), new Point(75, 25)]),
					new Line([new Point(75, 38), new Point(40, 50), new Point(75, 50)])
				], States[StateIdentifiers.BBOTTOM], States[StateIdentifiers.B]);
			
			definePart(PieceIdentifiers.I, new Point(40, 50), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.BRIGHT], States[StateIdentifiers.B]);
			
			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.HLEFT], States[StateIdentifiers.F]);
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.HLEFT], States[StateIdentifiers.FINVERTED]);
			definePart(PieceIdentifiers.I, new Point(67, 50), [new Line([new Point(67, 25), new Point(67, 75), null])], States[StateIdentifiers.HLEFT], States[StateIdentifiers.H]);
			
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.HRIGHT], States[StateIdentifiers.H]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(50, 50), [new Line([new Point(33, 25), new Point(67, 75), null])], States[StateIdentifiers.II], States[StateIdentifiers.N]);
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.II], States[StateIdentifiers.H]);
			definePart(PieceIdentifiers.SLASH, new Point(60, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.II], States[StateIdentifiers.IMRIGHT]);

			definePart(PieceIdentifiers.RIGHTPAREN, new Point(53, 37), [
					new Line([new Point(33, 25), new Point(67, 38), new Point(67, 25)]),
					new Line([new Point(67, 38), new Point(33, 50), new Point(67, 50)])
				], States[StateIdentifiers.KBOTTOM], States[StateIdentifiers.R]);
			definePart(PieceIdentifiers.SLASH, new Point(53, 37), [new Line([new Point(40, 50), new Point(67, 25), null])], States[StateIdentifiers.KBOTTOM], States[StateIdentifiers.K]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(53, 63), [new Line([new Point(40, 50), new Point(67, 75), null])], States[StateIdentifiers.KTOP], States[StateIdentifiers.K]);

			definePart(PieceIdentifiers.I, new Point(40, 50), [new Line([new Point(40, 25), new Point(40, 75), null])], States[StateIdentifiers.KRIGHT], States[StateIdentifiers.K]);

			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.L], States[StateIdentifiers.LEFTBRACKET]);
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.L], States[StateIdentifiers.FINVERTED]);

			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.FINVERTED], States[StateIdentifiers.E]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(20, 50), [new Line([new Point(10, 25), new Point(30, 75), null])], States[StateIdentifiers.LAMBDA], States[StateIdentifiers.WLEFT2]);
			
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(38, 50), new Point(62, 50), null])], States[StateIdentifiers.LAMBDA], States[StateIdentifiers.A]);
			definePart(PieceIdentifiers.SLASH, new Point(80, 50), [new Line([new Point(70, 75), new Point(90, 25), null])], States[StateIdentifiers.LAMBDA], States[StateIdentifiers.WRIGHT2]);
			
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.LEFTBRACKET], States[StateIdentifiers.E]);

			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.LINVERTED], States[StateIdentifiers.F]);
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.LINVERTED], States[StateIdentifiers.LEFTBRACKET]);
			
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.F], States[StateIdentifiers.E]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(40, 50), [new Line([new Point(30, 25), new Point(50, 75), null])], States[StateIdentifiers.MRIGHT], States[StateIdentifiers.MRIGHT2]);
			definePart(PieceIdentifiers.I, new Point(30, 50), [new Line([new Point(30, 25), new Point(30, 75), null])], States[StateIdentifiers.MRIGHT], States[StateIdentifiers.IMRIGHT]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(41, 50), [new Line([new Point(30, 25), new Point(50, 75), null])], States[StateIdentifiers.IMRIGHT], States[StateIdentifiers.M]);

			definePart(PieceIdentifiers.I, new Point(30, 50), [new Line([new Point(30, 25), new Point(30, 75), null])], States[StateIdentifiers.MRIGHT2], States[StateIdentifiers.M]);
			
			definePart(PieceIdentifiers.I, new Point(70, 50), [new Line([new Point(70, 25), new Point(70, 75), null])], States[StateIdentifiers.MLEFT2], States[StateIdentifiers.M]);
			
			definePart(PieceIdentifiers.SLASH, new Point(60, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.N], States[StateIdentifiers.M]);
			
			definePart(PieceIdentifiers.I, new Point(67, 50), [new Line([new Point(67, 25), new Point(67, 75), null])], States[StateIdentifiers.NLEFT], States[StateIdentifiers.N]);
			definePart(PieceIdentifiers.SLASH, new Point(60, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.NLEFT], States[StateIdentifiers.MLEFT2]);
			
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.NRIGHT], States[StateIdentifiers.N]);
			definePart(PieceIdentifiers.SLASH, new Point(60, 50), [new Line([new Point(50, 75), new Point(70, 25), null])], States[StateIdentifiers.NRIGHT], States[StateIdentifiers.MRIGHT2]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(59, 63), [new Line([new Point(50, 50), new Point(67, 75), null])], States[StateIdentifiers.P], States[StateIdentifiers.R]);
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(60, 63), [
					new Line([new Point(40, 50), new Point(75, 62), new Point(75, 50)]),
					new Line([new Point(75, 62), new Point(40, 75), new Point(75, 75)])
				], States[StateIdentifiers.P], States[StateIdentifiers.B]);

			definePart(PieceIdentifiers.BACKSLASH, new Point(61, 65), [new Line([new Point(55, 55), new Point(67, 75), null])], States[StateIdentifiers.O], States[StateIdentifiers.Q]);
			
			/*
			definePart(PieceIdentifiers.CARET, new Point(50, 20), [
					new Line([new Point(25, 50), new Point(50, 25), new Point(25, 25)]),
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)])
				], States[StateIdentifiers.QBOTTOM], States[StateIdentifiers.Q]);
			*/
			definePart(PieceIdentifiers.RIGHTPAREN, new Point(63, 50), [
					new Line([new Point(50, 25), new Point(75, 50), new Point(75, 25)]),
					new Line([new Point(75, 50), new Point(50, 75), new Point(75, 75)])
				], States[StateIdentifiers.QLEFT], States[StateIdentifiers.Q]);
			
			definePart(PieceIdentifiers.C, new Point(37, 50), [
					new Line([new Point(50, 25), new Point(25, 50), new Point(25, 25)]),
					new Line([new Point(25, 50), new Point(50, 75), new Point(25, 75)])
				], States[StateIdentifiers.QRIGHT], States[StateIdentifiers.Q]);
			
			/*
			definePart(PieceIdentifiers.U, new Point(50, 80), [
					new Line([new Point(25, 50), new Point(50, 75), new Point(25, 75)]),
					new Line([new Point(50, 75), new Point(75, 50), new Point(75, 75)])
				], States[StateIdentifiers.QTOP], States[StateIdentifiers.Q]);
			*/
			
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.RRIGHT], States[StateIdentifiers.R]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(20, 50), [new Line([new Point(10, 25), new Point(30, 75), null])], States[StateIdentifiers.V], States[StateIdentifiers.BACKSLASHV], "-A");
			definePart(PieceIdentifiers.BACKSLASH, new Point(55, 50), [new Line([new Point(50, 25), new Point(70, 75), null])], States[StateIdentifiers.V], States[StateIdentifiers.BACKSLASHV], "-B");
			definePart(PieceIdentifiers.BACKSLASH, new Point(65, 50), [new Line([new Point(50, 25), new Point(70, 75), null])], States[StateIdentifiers.V], States[StateIdentifiers.WLEFT2]);
			definePart(PieceIdentifiers.I, new Point(30, 50), [new Line([new Point(30, 25), new Point(30, 75), null])], States[StateIdentifiers.V], States[StateIdentifiers.MLEFT2]);
			definePart(PieceIdentifiers.I, new Point(70, 50), [new Line([new Point(70, 25), new Point(70, 75), null])], States[StateIdentifiers.V], States[StateIdentifiers.MRIGHT2]);
			definePart(PieceIdentifiers.I, new Point(50, 63), [new Line([new Point(50, 50), new Point(50, 75), null])], States[StateIdentifiers.V], States[StateIdentifiers.Y]);
			definePart(PieceIdentifiers.SLASH, new Point(35, 50), [new Line([new Point(30, 75), new Point(50, 25), null])], States[StateIdentifiers.V], States[StateIdentifiers.WRIGHT2]);
			definePart(PieceIdentifiers.SLASH, new Point(45, 50), [new Line([new Point(30, 75), new Point(50, 25), null])], States[StateIdentifiers.V], States[StateIdentifiers.VSLASH], "-A");
			definePart(PieceIdentifiers.SLASH, new Point(80, 50), [new Line([new Point(70, 75), new Point(90, 25), null])], States[StateIdentifiers.V], States[StateIdentifiers.VSLASH], "-B");
			
			definePart(PieceIdentifiers.SLASH, new Point(80, 50), [new Line([new Point(70, 75), new Point(90, 25), null])], States[StateIdentifiers.WLEFT2], States[StateIdentifiers.W]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(20, 50), [new Line([new Point(10, 25), new Point(30, 75), null])], States[StateIdentifiers.WRIGHT2], States[StateIdentifiers.W]);
			
			definePart(PieceIdentifiers.SLASH, new Point(59, 37), [new Line([new Point(50, 50), new Point(67, 25), null])], States[StateIdentifiers.YLEFT], States[StateIdentifiers.Y]);
			
			definePart(PieceIdentifiers.BACKSLASH, new Point(41, 37), [new Line([new Point(33, 25), new Point(50, 50), null])], States[StateIdentifiers.YRIGHT], States[StateIdentifiers.Y]);

			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.ERIGHT], "-A");
			definePart(PieceIdentifiers.DASH, new Point(50, 50), [new Line([new Point(33, 50), new Point(67, 50), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.ERIGHT], "-B");
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.ERIGHT], "-C");
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.LEFTBRACKET]);
			definePart(PieceIdentifiers.I, new Point(33, 40), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.FINVERTED]);
			definePart(PieceIdentifiers.I, new Point(33, 60), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.F]);
			definePart(PieceIdentifiers.SLASH, new Point(50, 50), [new Line([new Point(33, 75), new Point(67, 25), null])], States[StateIdentifiers.ZBARS], States[StateIdentifiers.Z]);
			
			definePart(PieceIdentifiers.I, new Point(33, 50), [new Line([new Point(33, 25), new Point(33, 75), null])], States[StateIdentifiers.ERIGHT], States[StateIdentifiers.E]);
			
			definePart(PieceIdentifiers.DASH, new Point(50, 25), [new Line([new Point(33, 25), new Point(67, 25), null])], States[StateIdentifiers.ZBOTTOM], States[StateIdentifiers.Z]);
			
			definePart(PieceIdentifiers.DASH, new Point(50, 75), [new Line([new Point(33, 75), new Point(67, 75), null])], States[StateIdentifiers.ZTOP], States[StateIdentifiers.Z]);
			
			
			// link related parts together
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.KBOTTOM, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.NLEFT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.NRIGHT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.YLEFT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.ARIGHT, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.LAMBDA, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.KRIGHT, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.X, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.BACKSLASH, "", "-A", "-B");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.BACKSLASH, "", "-B", "-A");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.QLEFT, StateIdentifiers.C);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.RRIGHT, StateIdentifiers.RIGHTPAREN);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.BACKSLASH, StateIdentifiers.QRIGHT, StateIdentifiers.RIGHTPAREN);

			linkParts(StateIdentifiers.BLANK, StateIdentifiers.C, StateIdentifiers.G, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.C, StateIdentifiers.QLEFT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.C, StateIdentifiers.O, StateIdentifiers.RIGHTPAREN);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.C, StateIdentifiers.S, StateIdentifiers.RIGHTPAREN);

			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.L, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.HLEFT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.HRIGHT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.LINVERTED, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.T, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.DASH, "", "-A", "-B");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.DASH, "", "-B", "-A");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.ZBOTTOM, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.ALEFT, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.ZTOP, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.ARIGHT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.DASH, StateIdentifiers.G, StateIdentifiers.C);

			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.I, "", "-A", "-B");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.I, "", "-B", "-A");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.HLEFT, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.HRIGHT, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.T, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.LINVERTED, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.L, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.MRIGHT, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.YRIGHT, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.KTOP, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.ISLASH, StateIdentifiers.SLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.YLEFT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.NRIGHT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.NLEFT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.KBOTTOM, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.P, StateIdentifiers.RIGHTPAREN);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.D, StateIdentifiers.RIGHTPAREN);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.BBOTTOM, StateIdentifiers.RIGHTPAREN);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.I, StateIdentifiers.J, StateIdentifiers.U);

			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.P, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.D, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.BBOTTOM, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.RRIGHT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.QRIGHT, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.O, StateIdentifiers.C);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.S, StateIdentifiers.C);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.BRIGHT, StateIdentifiers.RIGHTPAREN, "", "-A", "-B");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.RIGHTPAREN, StateIdentifiers.BRIGHT, StateIdentifiers.RIGHTPAREN, "", "-B", "-A");

			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.ISLASH, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.KTOP, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.YRIGHT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.MRIGHT, StateIdentifiers.I);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.ZTOP, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.ZBOTTOM, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.ALEFT, StateIdentifiers.DASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.SLASHSLASH, StateIdentifiers.SLASH, "", "-A", "-B");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.SLASHSLASH, StateIdentifiers.SLASH, "", "-B", "-A");
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.LAMBDA, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.X, StateIdentifiers.BACKSLASH);
			linkParts(StateIdentifiers.BLANK, StateIdentifiers.SLASH, StateIdentifiers.KRIGHT, StateIdentifiers.BACKSLASH);

			linkParts(StateIdentifiers.BLANK, StateIdentifiers.U, StateIdentifiers.J, StateIdentifiers.I);
			
			linkParts(StateIdentifiers.I, StateIdentifiers.YLEFT, StateIdentifiers.Y, StateIdentifiers.YRIGHT);

			linkParts(StateIdentifiers.I, StateIdentifiers.NRIGHT, StateIdentifiers.N, StateIdentifiers.II);
			linkParts(StateIdentifiers.I, StateIdentifiers.NRIGHT, StateIdentifiers.MRIGHT2, StateIdentifiers.MRIGHT);

			linkParts(StateIdentifiers.I, StateIdentifiers.NLEFT, StateIdentifiers.N, StateIdentifiers.II);
			linkParts(StateIdentifiers.I, StateIdentifiers.NLEFT, StateIdentifiers.MLEFT2, StateIdentifiers.ISLASH);

			linkParts(StateIdentifiers.I, StateIdentifiers.KBOTTOM, StateIdentifiers.K, StateIdentifiers.KTOP);
			linkParts(StateIdentifiers.I, StateIdentifiers.KBOTTOM, StateIdentifiers.R, StateIdentifiers.P);

			linkParts(StateIdentifiers.I, StateIdentifiers.HRIGHT, StateIdentifiers.H, StateIdentifiers.II);

			linkParts(StateIdentifiers.I, StateIdentifiers.LINVERTED, StateIdentifiers.F, StateIdentifiers.HLEFT);
			linkParts(StateIdentifiers.I, StateIdentifiers.LINVERTED, StateIdentifiers.LEFTBRACKET, StateIdentifiers.L);

			linkParts(StateIdentifiers.I, StateIdentifiers.HLEFT, StateIdentifiers.H, StateIdentifiers.II);
			linkParts(StateIdentifiers.I, StateIdentifiers.HLEFT, StateIdentifiers.F, StateIdentifiers.LINVERTED);
			linkParts(StateIdentifiers.I, StateIdentifiers.HLEFT, StateIdentifiers.FINVERTED, StateIdentifiers.L);
			
			linkParts(StateIdentifiers.I, StateIdentifiers.L, StateIdentifiers.LEFTBRACKET, StateIdentifiers.LINVERTED);
			linkParts(StateIdentifiers.I, StateIdentifiers.L, StateIdentifiers.FINVERTED, StateIdentifiers.HLEFT);

			linkParts(StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.H, StateIdentifiers.HLEFT, "-B");
			linkParts(StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.H, StateIdentifiers.HRIGHT, "-A");
			linkParts(StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.IMRIGHT, StateIdentifiers.ISLASH, "-B");
			linkParts(StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.IMRIGHT, StateIdentifiers.MRIGHT, "-A");
			linkParts(StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.N, StateIdentifiers.NRIGHT, "-A");
			linkParts(StateIdentifiers.I, StateIdentifiers.II, StateIdentifiers.N, StateIdentifiers.NLEFT, "-B");

			linkParts(StateIdentifiers.I, StateIdentifiers.P, StateIdentifiers.R, StateIdentifiers.KBOTTOM);
			linkParts(StateIdentifiers.I, StateIdentifiers.P, StateIdentifiers.B, StateIdentifiers.BBOTTOM);
			
			linkParts(StateIdentifiers.I, StateIdentifiers.BBOTTOM, StateIdentifiers.B, StateIdentifiers.P);

			linkParts(StateIdentifiers.I, StateIdentifiers.MRIGHT, StateIdentifiers.IMRIGHT, StateIdentifiers.II);
			linkParts(StateIdentifiers.I, StateIdentifiers.MRIGHT, StateIdentifiers.MRIGHT2, StateIdentifiers.NRIGHT);

			linkParts(StateIdentifiers.I, StateIdentifiers.YRIGHT, StateIdentifiers.Y, StateIdentifiers.YLEFT);

			linkParts(StateIdentifiers.I, StateIdentifiers.KTOP, StateIdentifiers.K, StateIdentifiers.KBOTTOM);

			linkParts(StateIdentifiers.I, StateIdentifiers.ISLASH, StateIdentifiers.IMRIGHT, StateIdentifiers.II);
			linkParts(StateIdentifiers.I, StateIdentifiers.ISLASH, StateIdentifiers.MLEFT2, StateIdentifiers.NLEFT);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.ARIGHT, StateIdentifiers.A, StateIdentifiers.ALEFT);
			
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.Z, StateIdentifiers.ZTOP, "-B");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.Z, StateIdentifiers.ZBOTTOM, "-A");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.ZBARS, "-A", "-A", "-B");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.ZBARS, "-A", "-B", "-A");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.ZBARS, "-A", "-C", "-A");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.ZBARS, "-B", "-A", "-C");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.ZBARS, "-B", "-B", "-C");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.ZBARS, "-B", "-C", "-B");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.LEFTBRACKET, StateIdentifiers.L, "-A");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.LEFTBRACKET, StateIdentifiers.LINVERTED, "-B");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.F, StateIdentifiers.LINVERTED, "-B");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.F, StateIdentifiers.HLEFT, "-A");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.FINVERTED, StateIdentifiers.L, "-A");
			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBARS, StateIdentifiers.FINVERTED, StateIdentifiers.HLEFT, "-B");

			linkParts(StateIdentifiers.DASH, StateIdentifiers.L, StateIdentifiers.LEFTBRACKET, StateIdentifiers.ZBARS);
			linkParts(StateIdentifiers.DASH, StateIdentifiers.L, StateIdentifiers.FINVERTED, StateIdentifiers.ZBARS);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.HLEFT, StateIdentifiers.H, StateIdentifiers.HRIGHT);
			linkParts(StateIdentifiers.DASH, StateIdentifiers.HLEFT, StateIdentifiers.F, StateIdentifiers.ZBARS);
			linkParts(StateIdentifiers.DASH, StateIdentifiers.HLEFT, StateIdentifiers.FINVERTED, StateIdentifiers.ZBARS);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.LINVERTED, StateIdentifiers.F, StateIdentifiers.ZBARS);
			linkParts(StateIdentifiers.DASH, StateIdentifiers.LINVERTED, StateIdentifiers.LEFTBRACKET, StateIdentifiers.ZBARS);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.HRIGHT, StateIdentifiers.H, StateIdentifiers.HLEFT);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.ALEFT, StateIdentifiers.A, StateIdentifiers.ARIGHT);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZBOTTOM, StateIdentifiers.Z, StateIdentifiers.ZBARS);

			linkParts(StateIdentifiers.DASH, StateIdentifiers.ZTOP, StateIdentifiers.Z, StateIdentifiers.ZBARS);
			
			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.RRIGHT, StateIdentifiers.R, StateIdentifiers.P);

			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.QRIGHT, StateIdentifiers.Q, StateIdentifiers.O);

			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.O, StateIdentifiers.Q, StateIdentifiers.QRIGHT);

			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.BBOTTOM, StateIdentifiers.B, StateIdentifiers.BRIGHT);

			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.P, StateIdentifiers.R, StateIdentifiers.RRIGHT);
			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.P, StateIdentifiers.B, StateIdentifiers.BRIGHT);

			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.BRIGHT, StateIdentifiers.B, StateIdentifiers.BBOTTOM, "-A");
			linkParts(StateIdentifiers.RIGHTPAREN, StateIdentifiers.BRIGHT, StateIdentifiers.B, StateIdentifiers.P, "-B");
			
			linkParts(StateIdentifiers.C, StateIdentifiers.O, StateIdentifiers.Q, StateIdentifiers.QLEFT);
			
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.WLEFT2, StateIdentifiers.V, "-B");
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.WLEFT2, StateIdentifiers.LAMBDA, "-A");
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.BACKSLASHV, StateIdentifiers.V, "-A", "", "-A");
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.BACKSLASHV, StateIdentifiers.V, "-B", "", "-B");

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.QLEFT, StateIdentifiers.Q, StateIdentifiers.QRIGHT);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.ARIGHT, StateIdentifiers.A, StateIdentifiers.LAMBDA);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.KBOTTOM, StateIdentifiers.K, StateIdentifiers.KRIGHT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.KBOTTOM, StateIdentifiers.R, StateIdentifiers.RRIGHT);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.NLEFT, StateIdentifiers.N, StateIdentifiers.NRIGHT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.NLEFT, StateIdentifiers.MLEFT2, StateIdentifiers.V);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.NRIGHT, StateIdentifiers.N, StateIdentifiers.NLEFT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.NRIGHT, StateIdentifiers.MRIGHT2, StateIdentifiers.V);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.YLEFT, StateIdentifiers.Y, StateIdentifiers.V);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.RRIGHT, StateIdentifiers.R, StateIdentifiers.KBOTTOM);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.QRIGHT, StateIdentifiers.Q, StateIdentifiers.QLEFT);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.LAMBDA, StateIdentifiers.A, StateIdentifiers.ARIGHT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.LAMBDA, StateIdentifiers.WRIGHT2, StateIdentifiers.V);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.LAMBDA, StateIdentifiers.WLEFT2, StateIdentifiers.BACKSLASHBACKSLASH);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.KRIGHT, StateIdentifiers.K, StateIdentifiers.KBOTTOM);

			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.MLEFT2, StateIdentifiers.NLEFT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.Y, StateIdentifiers.YLEFT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.MRIGHT2, StateIdentifiers.NRIGHT);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.WRIGHT2, StateIdentifiers.LAMBDA);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.VSLASH, StateIdentifiers.V, "", "-A", "-B");
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.VSLASH, StateIdentifiers.V, "", "-B", "-A");
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.WLEFT2, StateIdentifiers.BACKSLASHBACKSLASH);
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.BACKSLASHV, StateIdentifiers.BACKSLASHBACKSLASH, "", "-A");
			linkParts(StateIdentifiers.BACKSLASH, StateIdentifiers.V, StateIdentifiers.BACKSLASHV, StateIdentifiers.BACKSLASHBACKSLASH, "", "-B");
	
			linkParts(StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.WLEFT2, StateIdentifiers.W, StateIdentifiers.BACKSLASHV);

			linkParts(StateIdentifiers.BACKSLASHBACKSLASH, StateIdentifiers.BACKSLASHV, StateIdentifiers.W, StateIdentifiers.WLEFT2);
			
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.MLEFT2, StateIdentifiers.ISLASH);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.Y, StateIdentifiers.YRIGHT);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.MRIGHT2, StateIdentifiers.MRIGHT);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.WRIGHT2, StateIdentifiers.SLASHSLASH);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.VSLASH, StateIdentifiers.SLASHSLASH, "", "-A");
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.VSLASH, StateIdentifiers.SLASHSLASH, "", "-B");
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.WLEFT2, StateIdentifiers.LAMBDA);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.BACKSLASHV, StateIdentifiers.V, "", "-A", "-B");
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.V, StateIdentifiers.BACKSLASHV, StateIdentifiers.V, "", "-B", "-A");

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.KRIGHT, StateIdentifiers.K, StateIdentifiers.KTOP);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.LAMBDA, StateIdentifiers.A, StateIdentifiers.ALEFT);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.LAMBDA, StateIdentifiers.WRIGHT2, StateIdentifiers.SLASHSLASH);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.LAMBDA, StateIdentifiers.WLEFT2, StateIdentifiers.V);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.ZTOP, StateIdentifiers.Z, StateIdentifiers.ZBOTTOM);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.ALEFT, StateIdentifiers.A, StateIdentifiers.LAMBDA);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.ZBOTTOM, StateIdentifiers.Z, StateIdentifiers.ZTOP);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.ISLASH, StateIdentifiers.IMRIGHT, StateIdentifiers.MRIGHT);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.ISLASH, StateIdentifiers.MLEFT2, StateIdentifiers.V);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.KTOP, StateIdentifiers.K, StateIdentifiers.KRIGHT);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.YRIGHT, StateIdentifiers.Y, StateIdentifiers.V);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.MRIGHT, StateIdentifiers.IMRIGHT, StateIdentifiers.ISLASH);
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.MRIGHT, StateIdentifiers.MRIGHT2, StateIdentifiers.V);

			linkParts(StateIdentifiers.SLASH, StateIdentifiers.SLASHSLASH, StateIdentifiers.VSLASH, StateIdentifiers.V, "-A", "", "-A");
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.SLASHSLASH, StateIdentifiers.VSLASH, StateIdentifiers.V, "-B", "", "-B");
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.SLASHSLASH, StateIdentifiers.WRIGHT2, StateIdentifiers.LAMBDA, "-B");
			linkParts(StateIdentifiers.SLASH, StateIdentifiers.SLASHSLASH, StateIdentifiers.WRIGHT2, StateIdentifiers.V, "-A");

			linkParts(StateIdentifiers.ISLASH, StateIdentifiers.MLEFT2, StateIdentifiers.M, StateIdentifiers.IMRIGHT);

			linkParts(StateIdentifiers.ISLASH, StateIdentifiers.IMRIGHT, StateIdentifiers.M, StateIdentifiers.MLEFT2);
			
			linkParts(StateIdentifiers.SLASHSLASH, StateIdentifiers.VSLASH, StateIdentifiers.W, StateIdentifiers.WRIGHT2);

			linkParts(StateIdentifiers.SLASHSLASH, StateIdentifiers.WRIGHT2, StateIdentifiers.W, StateIdentifiers.VSLASH);
			
			linkParts(StateIdentifiers.C, StateIdentifiers.QLEFT, StateIdentifiers.Q, StateIdentifiers.O);

			linkParts(StateIdentifiers.HLEFT, StateIdentifiers.F, StateIdentifiers.E, StateIdentifiers.FINVERTED);

			linkParts(StateIdentifiers.HLEFT, StateIdentifiers.FINVERTED, StateIdentifiers.E, StateIdentifiers.F);

			linkParts(StateIdentifiers.II, StateIdentifiers.N, StateIdentifiers.M, StateIdentifiers.IMRIGHT);

			linkParts(StateIdentifiers.II, StateIdentifiers.IMRIGHT, StateIdentifiers.M, StateIdentifiers.N);

			linkParts(StateIdentifiers.L, StateIdentifiers.LEFTBRACKET, StateIdentifiers.E, StateIdentifiers.FINVERTED);

			linkParts(StateIdentifiers.L, StateIdentifiers.FINVERTED, StateIdentifiers.E, StateIdentifiers.LEFTBRACKET);

			linkParts(StateIdentifiers.LAMBDA, StateIdentifiers.WLEFT2, StateIdentifiers.W, StateIdentifiers.WRIGHT2);
			
			linkParts(StateIdentifiers.LAMBDA, StateIdentifiers.WRIGHT2, StateIdentifiers.W, StateIdentifiers.WLEFT2);
			
			linkParts(StateIdentifiers.LINVERTED, StateIdentifiers.F, StateIdentifiers.E, StateIdentifiers.LEFTBRACKET);

			linkParts(StateIdentifiers.LINVERTED, StateIdentifiers.LEFTBRACKET, StateIdentifiers.E, StateIdentifiers.F);
			
			linkParts(StateIdentifiers.MRIGHT, StateIdentifiers.MRIGHT2, StateIdentifiers.M, StateIdentifiers.IMRIGHT);

			linkParts(StateIdentifiers.MRIGHT, StateIdentifiers.IMRIGHT, StateIdentifiers.M, StateIdentifiers.MRIGHT2);
			
			linkParts(StateIdentifiers.NLEFT, StateIdentifiers.N, StateIdentifiers.M, StateIdentifiers.MLEFT2);

			linkParts(StateIdentifiers.NLEFT, StateIdentifiers.MLEFT2, StateIdentifiers.M, StateIdentifiers.N);
			
			linkParts(StateIdentifiers.NRIGHT, StateIdentifiers.N, StateIdentifiers.M, StateIdentifiers.MRIGHT2);

			linkParts(StateIdentifiers.NRIGHT, StateIdentifiers.MRIGHT2, StateIdentifiers.M, StateIdentifiers.N);

			linkParts(StateIdentifiers.V, StateIdentifiers.BACKSLASHV, StateIdentifiers.W, StateIdentifiers.WRIGHT2, "-A");
			linkParts(StateIdentifiers.V, StateIdentifiers.BACKSLASHV, StateIdentifiers.W, StateIdentifiers.VSLASH, "-B");
			linkParts(StateIdentifiers.V, StateIdentifiers.WLEFT2, StateIdentifiers.W, StateIdentifiers.VSLASH);
			linkParts(StateIdentifiers.V, StateIdentifiers.MLEFT2, StateIdentifiers.M, StateIdentifiers.MRIGHT2);
			linkParts(StateIdentifiers.V, StateIdentifiers.MRIGHT2, StateIdentifiers.M, StateIdentifiers.MLEFT2);
			linkParts(StateIdentifiers.V, StateIdentifiers.WRIGHT2, StateIdentifiers.W, StateIdentifiers.BACKSLASHV);
			linkParts(StateIdentifiers.V, StateIdentifiers.VSLASH, StateIdentifiers.W, StateIdentifiers.BACKSLASHV, "-A");
			linkParts(StateIdentifiers.V, StateIdentifiers.VSLASH, StateIdentifiers.W, StateIdentifiers.WLEFT2, "-B");
			
			linkParts(StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.E, StateIdentifiers.F, "-C");
			linkParts(StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.E, StateIdentifiers.LEFTBRACKET, "-B");
			linkParts(StateIdentifiers.ZBARS, StateIdentifiers.ERIGHT, StateIdentifiers.E, StateIdentifiers.FINVERTED, "-A");
			linkParts(StateIdentifiers.ZBARS, StateIdentifiers.LEFTBRACKET, StateIdentifiers.E, StateIdentifiers.ERIGHT);
			linkParts(StateIdentifiers.ZBARS, StateIdentifiers.FINVERTED, StateIdentifiers.E, StateIdentifiers.ERIGHT);
			linkParts(StateIdentifiers.ZBARS, StateIdentifiers.F, StateIdentifiers.E, StateIdentifiers.ERIGHT);
		}
		
		protected function definePart(ptype:String, dropPoint:Point, lines:Array, fstate:State, tstate:State, uniqueID:String = ""):void
		{
			var name:String = (fstate == null ? "null" : fstate.stateName) + "->" + tstate.stateName + uniqueID;
			var part:Part = BuilderTool.Instance.newPart(name, ptype, dropPoint, lines, fstate, tstate);
			part.startup(this.canvas);
			Parts[name] = part;
		}
		
		protected function linkParts(preState:String, currentState:String, toState:String, toStateWithoutPart:String, 
			fromPartSuffix:String = "", transitionPartSuffix:String = "", toPartSuffix:String = ""):void
		{
			var fromPart:Part = Parts[preState + "->" + currentState + fromPartSuffix];
			var transitionPart:Part = Parts[currentState + "->" + toState + transitionPartSuffix];
			var toPart:Part = Parts[toStateWithoutPart + "->" + toState + toPartSuffix];
			fromPart.addToPart(transitionPart, toPart);
		}
	}
}