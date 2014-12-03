package objects
{
	import flash.display.*;
	import flash.geom.*;
	import flash.utils.*;
	import mx.core.*;
	
	public final class StatesResourceManager
	{
		public static var States:Array = new Array();
		
		[Embed(source="../media/states/state-blank.png")]
		public static var StateBlank:Class;
		public static var StateGraphicsBlank:GraphicsResource = new GraphicsResource(new StateBlank());
		States[StateIdentifiers.BLANK] = StateGraphicsBlank;
		
		[Embed(source="../media/states/state-).png")]
		public static var StateRightParen:Class;
		public static var StateGraphicsRightParen:GraphicsResource = new GraphicsResource(new StateRightParen());
		States[StateIdentifiers.RIGHTPAREN] = StateGraphicsRightParen;
		
		[Embed(source="../media/states/state--.png")]
		public static var StateDash:Class;
		public static var StateGraphicsDash:GraphicsResource = new GraphicsResource(new StateDash());
		States[StateIdentifiers.DASH] = StateGraphicsDash;
		
		[Embed(source="../media/states/state-[.png")]
		public static var StateLeftBracket:Class;
		public static var StateGraphicsLeftBracket:GraphicsResource = new GraphicsResource(new StateLeftBracket());
		States[StateIdentifiers.LEFTBRACKET] = StateGraphicsLeftBracket;
		
		[Embed(source="../media/states/state-A.png")]
		public static var StateA:Class;
		public static var StateGraphicsA:GraphicsResource = new GraphicsResource(new StateA());
		States[StateIdentifiers.A] = StateGraphicsA;
		
		[Embed(source="../media/states/state-A-left.png")]
		public static var StateALeft:Class;
		public static var StateGraphicsALeft:GraphicsResource = new GraphicsResource(new StateALeft());
		States[StateIdentifiers.ALEFT] = StateGraphicsALeft;
		
		[Embed(source="../media/states/state-A-right.png")]
		public static var StateARight:Class;
		public static var StateGraphicsARight:GraphicsResource = new GraphicsResource(new StateARight());
		States[StateIdentifiers.ARIGHT] = StateGraphicsARight;
		
		[Embed(source="../media/states/state-B.png")]
		public static var StateB:Class;
		public static var StateGraphicsB:GraphicsResource = new GraphicsResource(new StateB());
		States[StateIdentifiers.B] = StateGraphicsB;
		
		[Embed(source="../media/states/state-B-bottom.png")]
		public static var StateBBottom:Class;
		public static var StateGraphicsBBottom:GraphicsResource = new GraphicsResource(new StateBBottom());
		States[StateIdentifiers.BBOTTOM] = StateGraphicsBBottom;
		
		[Embed(source="../media/states/state-B-right.png")]
		public static var StateBRight:Class;
		public static var StateGraphicsBRight:GraphicsResource = new GraphicsResource(new StateBRight());
		States[StateIdentifiers.BRIGHT] = StateGraphicsBRight;
		
		[Embed(source="../media/states/state-bslash.png")]
		public static var StateBackSlash:Class;
		public static var StateGraphicsBackSlash:GraphicsResource = new GraphicsResource(new StateBackSlash());
		States[StateIdentifiers.BACKSLASH] = StateGraphicsBackSlash;
		
		[Embed(source="../media/states/state-bslash-bslash.png")]
		public static var StateBackSlashBackSlash:Class;
		public static var StateGraphicsBackSlashBackSlash:GraphicsResource = new GraphicsResource(new StateBackSlashBackSlash());
		States[StateIdentifiers.BACKSLASHBACKSLASH] = StateGraphicsBackSlashBackSlash;
		
		[Embed(source="../media/states/state-C.png")]
		public static var StateC:Class;
		public static var StateGraphicsC:GraphicsResource = new GraphicsResource(new StateC());
		States[StateIdentifiers.C] = StateGraphicsC;
		
		[Embed(source="../media/states/state-D.png")]
		public static var StateD:Class;
		public static var StateGraphicsD:GraphicsResource = new GraphicsResource(new StateD());
		States[StateIdentifiers.D] = StateGraphicsD;
		
		[Embed(source="../media/states/state-E.png")]
		public static var StateE:Class;
		public static var StateGraphicsE:GraphicsResource = new GraphicsResource(new StateE());
		States[StateIdentifiers.E] = StateGraphicsE;
		
		[Embed(source="../media/states/state-E-right.png")]
		public static var StateERight:Class;
		public static var StateGraphicsERight:GraphicsResource = new GraphicsResource(new StateERight());
		States[StateIdentifiers.ERIGHT] = StateGraphicsERight;
		
		[Embed(source="../media/states/state-F.png")]
		public static var StateF:Class;
		public static var StateGraphicsF:GraphicsResource = new GraphicsResource(new StateF());
		States[StateIdentifiers.F] = StateGraphicsF;
		
		[Embed(source="../media/states/state-F-inverted.png")]
		public static var StateFInverted:Class;
		public static var StateGraphicsFInverted:GraphicsResource = new GraphicsResource(new StateFInverted());
		States[StateIdentifiers.FINVERTED] = StateGraphicsFInverted;
		
		[Embed(source="../media/states/state-G.png")]
		public static var StateG:Class;
		public static var StateGraphicsG:GraphicsResource = new GraphicsResource(new StateG());
		States[StateIdentifiers.G] = StateGraphicsG;
		
		[Embed(source="../media/states/state-H.png")]
		public static var StateH:Class;
		public static var StateGraphicsH:GraphicsResource = new GraphicsResource(new StateH());
		States[StateIdentifiers.H] = StateGraphicsH;
		
		[Embed(source="../media/states/state-H-left.png")]
		public static var StateHLeft:Class;
		public static var StateGraphicsHLeft:GraphicsResource = new GraphicsResource(new StateHLeft());
		States[StateIdentifiers.HLEFT] = StateGraphicsHLeft;
		
		[Embed(source="../media/states/state-H-right.png")]
		public static var StateHRight:Class;
		public static var StateGraphicsHRight:GraphicsResource = new GraphicsResource(new StateHRight());
		States[StateIdentifiers.HRIGHT] = StateGraphicsHRight;
		
		[Embed(source="../media/states/state-I.png")]
		public static var StateI:Class;
		public static var StateGraphicsI:GraphicsResource = new GraphicsResource(new StateI());
		States[StateIdentifiers.I] = StateGraphicsI;
		
		[Embed(source="../media/states/state-II.png")]
		public static var StateII:Class;
		public static var StateGraphicsII:GraphicsResource = new GraphicsResource(new StateII());
		States[StateIdentifiers.II] = StateGraphicsII;
		
		[Embed(source="../media/states/state-I-slash.png")]
		public static var StateISlash:Class;
		public static var StateGraphicsISlash:GraphicsResource = new GraphicsResource(new StateISlash());
		States[StateIdentifiers.ISLASH] = StateGraphicsISlash;
		
		[Embed(source="../media/states/state-J.png")]
		public static var StateJ:Class;
		public static var StateGraphicsJ:GraphicsResource = new GraphicsResource(new StateJ());
		States[StateIdentifiers.J] = StateGraphicsJ;
		
		[Embed(source="../media/states/state-K.png")]
		public static var StateK:Class;
		public static var StateGraphicsK:GraphicsResource = new GraphicsResource(new StateK());
		States[StateIdentifiers.K] = StateGraphicsK;
		
		[Embed(source="../media/states/state-K-bottom.png")]
		public static var StateKBottom:Class;
		public static var StateGraphicsKBottom:GraphicsResource = new GraphicsResource(new StateKBottom());
		States[StateIdentifiers.KBOTTOM] = StateGraphicsKBottom;
		
		[Embed(source="../media/states/state-K-right.png")]
		public static var StateKRight:Class;
		public static var StateGraphicsKRight:GraphicsResource = new GraphicsResource(new StateKRight());
		States[StateIdentifiers.KRIGHT] = StateGraphicsKRight;
		
		[Embed(source="../media/states/state-K-top.png")]
		public static var StateKTop:Class;
		public static var StateGraphicsKTop:GraphicsResource = new GraphicsResource(new StateKTop());
		States[StateIdentifiers.KTOP] = StateGraphicsKTop;
		
		[Embed(source="../media/states/state-L.png")]
		public static var StateL:Class;
		public static var StateGraphicsL:GraphicsResource = new GraphicsResource(new StateL());
		States[StateIdentifiers.L] = StateGraphicsL;
		
		[Embed(source="../media/states/state-lambda.png")]
		public static var StateLambda:Class;
		public static var StateGraphicsLambda:GraphicsResource = new GraphicsResource(new StateLambda());
		States[StateIdentifiers.LAMBDA] = StateGraphicsLambda;
		
		[Embed(source="../media/states/state-L-inverted.png")]
		public static var StateLInverted:Class;
		public static var StateGraphicsLInverted:GraphicsResource = new GraphicsResource(new StateLInverted());
		States[StateIdentifiers.LINVERTED] = StateGraphicsLInverted;
		
		[Embed(source="../media/states/state-M.png")]
		public static var StateM:Class;
		public static var StateGraphicsM:GraphicsResource = new GraphicsResource(new StateM());
		States[StateIdentifiers.M] = StateGraphicsM;
		
		[Embed(source="../media/states/state-M-left2.png")]
		public static var StateMLeft2:Class;
		public static var StateGraphicsMLeft2:GraphicsResource = new GraphicsResource(new StateMLeft2());
		States[StateIdentifiers.MLEFT2] = StateGraphicsMLeft2;
		
		[Embed(source="../media/states/state-M-right.png")]
		public static var StateMRight:Class;
		public static var StateGraphicsMRight:GraphicsResource = new GraphicsResource(new StateMRight());
		States[StateIdentifiers.MRIGHT] = StateGraphicsMRight;
		
		[Embed(source="../media/states/state-I-M-right.png")]
		public static var StateIMRight:Class;
		public static var StateGraphicsIMRight:GraphicsResource = new GraphicsResource(new StateIMRight());
		States[StateIdentifiers.IMRIGHT] = StateGraphicsIMRight;
		
		[Embed(source="../media/states/state-M-right2.png")]
		public static var StateMRight2:Class;
		public static var StateGraphicsMRight2:GraphicsResource = new GraphicsResource(new StateMRight2());
		States[StateIdentifiers.MRIGHT2] = StateGraphicsMRight2;
		
		[Embed(source="../media/states/state-N.png")]
		public static var StateN:Class;
		public static var StateGraphicsN:GraphicsResource = new GraphicsResource(new StateN());
		States[StateIdentifiers.N] = StateGraphicsN;
		
		[Embed(source="../media/states/state-N-left.png")]
		public static var StateNLeft:Class;
		public static var StateGraphicsNLeft:GraphicsResource = new GraphicsResource(new StateNLeft());
		States[StateIdentifiers.NLEFT] = StateGraphicsNLeft;
		
		[Embed(source="../media/states/state-N-right.png")]
		public static var StateNRight:Class;
		public static var StateGraphicsNRight:GraphicsResource = new GraphicsResource(new StateNRight());
		States[StateIdentifiers.NRIGHT] = StateGraphicsNRight;
		
		[Embed(source="../media/states/state-O.png")]
		public static var StateO:Class;
		public static var StateGraphicsO:GraphicsResource = new GraphicsResource(new StateO());
		States[StateIdentifiers.O] = StateGraphicsO;
		
		[Embed(source="../media/states/state-P.png")]
		public static var StateP:Class;
		public static var StateGraphicsP:GraphicsResource = new GraphicsResource(new StateP());
		States[StateIdentifiers.P] = StateGraphicsP;
		
		[Embed(source="../media/states/state-Q.png")]
		public static var StateQ:Class;
		public static var StateGraphicsQ:GraphicsResource = new GraphicsResource(new StateQ());
		States[StateIdentifiers.Q] = StateGraphicsQ;
		
		[Embed(source="../media/states/state-Q-bottom.png")]
		public static var StateQBottom:Class;
		public static var StateGraphicsQBottom:GraphicsResource = new GraphicsResource(new StateQBottom());
		States[StateIdentifiers.QBOTTOM] = StateGraphicsQBottom;
		
		[Embed(source="../media/states/state-Q-right.png")]
		public static var StateQRight:Class;
		public static var StateGraphicsQRight:GraphicsResource = new GraphicsResource(new StateQRight());
		States[StateIdentifiers.QRIGHT] = StateGraphicsQRight;
		
		[Embed(source="../media/states/state-R.png")]
		public static var StateR:Class;
		public static var StateGraphicsR:GraphicsResource = new GraphicsResource(new StateR());
		States[StateIdentifiers.R] = StateGraphicsR;
		
		[Embed(source="../media/states/state-R-right.png")]
		public static var StateRRight:Class;
		public static var StateGraphicsRRight:GraphicsResource = new GraphicsResource(new StateRRight());
		States[StateIdentifiers.RRIGHT] = StateGraphicsRRight;
		
		[Embed(source="../media/states/state-S.png")]
		public static var StateS:Class;
		public static var StateGraphicsS:GraphicsResource = new GraphicsResource(new StateS());
		States[StateIdentifiers.S] = StateGraphicsS;
		
		[Embed(source="../media/states/state-slash.png")]
		public static var StateSlash:Class;
		public static var StateGraphicsSlash:GraphicsResource = new GraphicsResource(new StateSlash());
		States[StateIdentifiers.SLASH] = StateGraphicsSlash;
		
		[Embed(source="../media/states/state-slash-slash.png")]
		public static var StateSlashSlash:Class;
		public static var StateGraphicsSlashSlash:GraphicsResource = new GraphicsResource(new StateSlashSlash());
		States[StateIdentifiers.SLASHSLASH] = StateGraphicsSlashSlash;
		
		[Embed(source="../media/states/state-T.png")]
		public static var StateT:Class;
		public static var StateGraphicsT:GraphicsResource = new GraphicsResource(new StateT());
		States[StateIdentifiers.T] = StateGraphicsT;
		
		[Embed(source="../media/states/state-U.png")]
		public static var StateU:Class;
		public static var StateGraphicsU:GraphicsResource = new GraphicsResource(new StateU());
		States[StateIdentifiers.U] = StateGraphicsU;
		
		[Embed(source="../media/states/state-U-inverted.png")]
		public static var StateUInverted:Class;
		public static var StateGraphicsUInverted:GraphicsResource = new GraphicsResource(new StateUInverted());
		States[StateIdentifiers.UINVERTED] = StateGraphicsUInverted;
		
		[Embed(source="../media/states/state-V.png")]
		public static var StateV:Class;
		public static var StateGraphicsV:GraphicsResource = new GraphicsResource(new StateV());
		States[StateIdentifiers.V] = StateGraphicsV;
		
		[Embed(source="../media/states/state-bslash-V.png")]
		public static var StateBackSlashV:Class;
		public static var StateGraphicsBackSlashV:GraphicsResource = new GraphicsResource(new StateBackSlashV());
		States[StateIdentifiers.BACKSLASHV] = StateGraphicsBackSlashV;
		
		[Embed(source="../media/states/state-V-slash.png")]
		public static var StateVSlash:Class;
		public static var StateGraphicsVSlash:GraphicsResource = new GraphicsResource(new StateVSlash());
		States[StateIdentifiers.VSLASH] = StateGraphicsVSlash;
		
		[Embed(source="../media/states/state-W.png")]
		public static var StateW:Class;
		public static var StateGraphicsW:GraphicsResource = new GraphicsResource(new StateW());
		States[StateIdentifiers.W] = StateGraphicsW;
		
		[Embed(source="../media/states/state-W-left2.png")]
		public static var StateWLeft2:Class;
		public static var StateGraphicsWLeft2:GraphicsResource = new GraphicsResource(new StateWLeft2());
		States[StateIdentifiers.WLEFT2] = StateGraphicsWLeft2;
		
		[Embed(source="../media/states/state-W-right2.png")]
		public static var StateWRight2:Class;
		public static var StateGraphicsWRight2:GraphicsResource = new GraphicsResource(new StateWRight2());
		States[StateIdentifiers.WRIGHT2] = StateGraphicsWRight2;
		
		[Embed(source="../media/states/state-X.png")]
		public static var StateX:Class;
		public static var StateGraphicsX:GraphicsResource = new GraphicsResource(new StateX());
		States[StateIdentifiers.X] = StateGraphicsX;
		
		[Embed(source="../media/states/state-Y.png")]
		public static var StateY:Class;
		public static var StateGraphicsY:GraphicsResource = new GraphicsResource(new StateY());
		States[StateIdentifiers.Y] = StateGraphicsY;
		
		[Embed(source="../media/states/state-Y-left.png")]
		public static var StateYLeft:Class;
		public static var StateGraphicsYLeft:GraphicsResource = new GraphicsResource(new StateYLeft());
		States[StateIdentifiers.YLEFT] = StateGraphicsYLeft;
		
		[Embed(source="../media/states/state-Y-right.png")]
		public static var StateYRight:Class;
		public static var StateGraphicsYRight:GraphicsResource = new GraphicsResource(new StateYRight());
		States[StateIdentifiers.YRIGHT] = StateGraphicsYRight;
		
		[Embed(source="../media/states/state-Z.png")]
		public static var StateZ:Class;
		public static var StateGraphicsZ:GraphicsResource = new GraphicsResource(new StateZ());
		States[StateIdentifiers.Z] = StateGraphicsZ;
		
		[Embed(source="../media/states/state-Z-bars.png")]
		public static var StateZBars:Class;
		public static var StateGraphicsZBars:GraphicsResource = new GraphicsResource(new StateZBars());
		States[StateIdentifiers.ZBARS] = StateGraphicsZBars;
		
		[Embed(source="../media/states/state-Z-bottom.png")]
		public static var StateZBottom:Class;
		public static var StateGraphicsZBottom:GraphicsResource = new GraphicsResource(new StateZBottom());
		States[StateIdentifiers.ZBOTTOM] = StateGraphicsZBottom;
		
		[Embed(source="../media/states/state-Z-top.png")]
		public static var StateZTop:Class;
		public static var StateGraphicsZTop:GraphicsResource = new GraphicsResource(new StateZTop());
		States[StateIdentifiers.ZTOP] = StateGraphicsZTop;
		
		[Embed(source="../media/states/drop-point.gif")]
		public static var DropPoint:Class;
		public static var DropPointGraphics:GraphicsResource = new GraphicsResource(new DropPoint());
		
	}
}