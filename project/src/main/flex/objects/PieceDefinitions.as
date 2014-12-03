package objects
{
	import flash.utils.*;
	import flash.geom.*;
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	public class PieceDefinitions
	{
		protected static var instance:PieceDefinitions = null;
		
		public var Pieces:Array = new Array();
		protected var canvas:Canvas = null;
		
		static public function get Instance():PieceDefinitions
		{
			if ( instance == null )
				instance = new PieceDefinitions();
			return instance;
		}
		
		public function PieceDefinitions()
		{
			
		}
		
		public function startup(canvas:Canvas):void
		{
			this.canvas = canvas;
			
			var i:Number = 0;
			definePiece(canvas, PieceIdentifiers.I, ++i);
			definePiece(canvas, PieceIdentifiers.DASH, ++i);
			definePiece(canvas, PieceIdentifiers.SLASH, ++i);
			definePiece(canvas, PieceIdentifiers.BACKSLASH, ++i);
			definePiece(canvas, PieceIdentifiers.C, ++i);
			definePiece(canvas, PieceIdentifiers.RIGHTPAREN, ++i);
			definePiece(canvas, PieceIdentifiers.U, ++i);
		}
		
		public function startupFull(canvas:Canvas):void
		{
			startup(canvas);
			definePiece(canvas, PieceIdentifiers.CARET, Pieces.length);
			PieceIdentifiers.IDENTIFIERS = PieceIdentifiers.FULL_IDENTIFIERS;
		}
		
		protected function definePiece(canvas:Canvas, ptype:String, pos:Number):void
		{
		
			var piece:Piece = BuilderTool.Instance.newPiece(ptype);
			piece.startupOrderedPiece(canvas, pos);
			Pieces[ptype] = piece;
		}

	}
}