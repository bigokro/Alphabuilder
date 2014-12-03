package objects
{
	import flash.events.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.utils.*;
	
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	import utils.*;

	public class State
	{
	    public static const XPOSITION:Number = Piece.WIDTH;
		
		public var stateName:String = StateIdentifiers.BLANK;
		public var isLetter:Boolean = false;
		protected var sound:SoundAsset = null;
		
		// The parts that make up this state
		public var parts:Array = new Array();
		
		// Parts (drop points) that can be added to make a new state
		protected var newParts:Array = new Array();
		
		protected var canvas:Canvas;
		 
		public function State(stateName:String, isLetter:Boolean, sound:SoundAsset)
		{			
			this.stateName = stateName;
			this.isLetter = isLetter;
			this.sound = sound;
		}
		
		public function startup(canvas:Canvas):void
		{
			this.canvas = canvas;
		}

		public function partCanBeAdded(partType:String):Boolean
		{
			var sourceActive:Boolean = false;
			for each (var np:Part in newParts)
			{
				if (np.partType == partType)
				{
					sourceActive = true;
					break;
				}
			}
			return sourceActive;
		}
		
		// Called during initialization
		public function addPart(part:Part):void
		{
			parts.push(part);
		}
		
		// Called during initialization
		public function addNewPart(part:Part):void
		{
			newParts.push(part);
		}
		
		public function activate():void
		{
			for each (var part:Part in parts)
			{
				part.activateAsAdded();
			}
			if (sound != null)
			{
				sound.play();
			}
			else if (isLetter)
			{
				StateDefinitions.Sounds["explosion"].play();
			}
		}
		
		public function deactivate():void
		{
			for each (var npart:Part in newParts)
			{
				npart.deactivate();
			}
			for each (var part:Part in parts)
			{
				part.deactivate();
			}
		}
		
		public function selectPiece(piece:Piece):void
		{
			for each (var part:Part in newParts)
			{
				if (piece.partType == part.partType)
					part.activateDropPoint();
			}
		}
		
		public function releasePiece(piece:Piece):void
		{
			for each (var part:Part in newParts)
			{
				part.deactivate();
			}
			this.morphBack();
		}
		
		public function dropPart(piece:Piece):Boolean
		{
			var addPart:Boolean = false;
			for each (var part:Part in newParts)
			{
				if (part.receivePiece(piece))
				{
					addPart = true;
					break;
				}
			}
			return addPart;
		}
		
		public function partsForPiece(piece:Piece):Array
		{
			var parts:Array = new Array();
			for each (var part:Part in newParts)
			{
				if (piece.partType == part.partType)
					parts.push(part);
			}
			return parts;
		}
		
		public function findNearestDropPoint(piece:Piece, point:Point):Part
		{
			var minDistance:Number = 1000;
			var nearestPoint:Part = null;
			for each (var dropPoint:Part in partsForPiece(piece))
			{
				var relativePoint:Point = dropPoint.DropPoint;
				var distance:Number = Point.distance(point, 
														new Point(DrawingUtils.actualX(relativePoint.x, drawArea()), 
																	DrawingUtils.actualY(relativePoint.y, drawArea())));
				if (distance < minDistance)
				{
					minDistance = distance;
					nearestPoint = dropPoint;
				}
			}
			return nearestPoint;
		}

		public function pieceOverDropPoint(piece:Piece, point:Point):Boolean
		{
			for each (var dropPoint:Part in partsForPiece(piece))
			{
				if (dropPoint.pointOverDropPoint(point))
				{
					return true;
				}
			}
			return false;
		}

		public function morphTo(transitionPart:Part, toState:State):void
		{
			for each (var part:Part in parts)
			{
				part.morphWith(transitionPart);
			}
		}
		
		public function morphBack():void
		{
			for each (var part:Part in parts)
			{
				part.morphBack();
			}
		}
		
		public function drawSelf(target:UIComponent):void
		{
			for each (var part:Part in parts)
			{
				part.drawSelf(target);
			}
		}
		
		protected function widthOfState():int
		{
			return (this.canvas.width - State.XPOSITION);
		}

		protected function heightOfState():int
		{
			return this.canvas.height;
		}

		public function drawArea():Rectangle
		{
			return new Rectangle(State.XPOSITION, 0, widthOfState(), heightOfState());
		}
		
		public function matches(otherParts:Array, hardMatch:Boolean = false):Boolean
		{
			if (parts.length != otherParts.length) return false;
			
			// Sort parts by mid-point
			parts.sort(sortParts);
			otherParts.sort(sortParts);
			
			for (var i:int = 0; i < parts.length; i++)
			{
				if (parts[i].partType != otherParts[i].partType) return false;
				if (hardMatch)
				{
					if (i+1 < parts.length)
					{
						var positionParts:int = Piece.relativeLocation(parts[i], parts[i+1]);
						var positionOtherParts:int = Piece.relativeLocation(otherParts[i], otherParts[i+1]);
						if (positionParts != positionOtherParts) return false;
					}
				}
			}
			
			return true;
		}
		
		public function matchScore(otherParts:Array):int
		{
			var score:int = 0;
			if (parts.length == otherParts.length) score += 3;
			
			// Count types in each
			var thisTypes:Dictionary = new Dictionary();
			var otherTypes:Dictionary = new Dictionary();
			for each (var pieceType:String in PieceIdentifiers.FULL_IDENTIFIERS)
			{
				thisTypes[pieceType] = 0;
				otherTypes[pieceType] = 0;
			}
			for each (var thisp:Part in this.parts)
			{
				thisTypes[thisp.partType] += 1;
			}
			for each (var otherp:Part in otherParts)
			{
				otherTypes[otherp.partType] += 1;
			}
			for (var typeName:String in thisTypes)
			{
				if (thisTypes[typeName] == otherTypes[typeName] && thisTypes[typeName] != 0)
				{
					score += 1;
				}
				else if (thisTypes[typeName] != otherTypes[typeName])
				{
					// Check for close match
					// - Slash -> I <- Backslash -> Dash <- Slash
					// TODO: 
					// - Curve vs. two angles
					var thisTypeCount:int = -1;
					var otherTypeCount:int = 1;
					if (typeName == PieceIdentifiers.DASH)
					{
						thisTypeCount = thisTypes[PieceIdentifiers.DASH] + thisTypes[PieceIdentifiers.SLASH] + thisTypes[PieceIdentifiers.BACKSLASH];
						otherTypeCount = thisTypes[PieceIdentifiers.DASH] + thisTypes[PieceIdentifiers.SLASH] + thisTypes[PieceIdentifiers.BACKSLASH];
					}
					else if (typeName == PieceIdentifiers.I)
					{
						thisTypeCount = thisTypes[PieceIdentifiers.I] + thisTypes[PieceIdentifiers.SLASH] + thisTypes[PieceIdentifiers.BACKSLASH];
						otherTypeCount = thisTypes[PieceIdentifiers.I] + thisTypes[PieceIdentifiers.SLASH] + thisTypes[PieceIdentifiers.BACKSLASH];
					}
					else if (typeName == PieceIdentifiers.SLASH)
					{
						thisTypeCount = thisTypes[PieceIdentifiers.DASH] + thisTypes[PieceIdentifiers.SLASH] + thisTypes[PieceIdentifiers.I];
						otherTypeCount = thisTypes[PieceIdentifiers.DASH] + thisTypes[PieceIdentifiers.SLASH] + thisTypes[PieceIdentifiers.I];
					}
					else if (typeName == PieceIdentifiers.BACKSLASH)
					{
						thisTypeCount = thisTypes[PieceIdentifiers.DASH] + thisTypes[PieceIdentifiers.I] + thisTypes[PieceIdentifiers.BACKSLASH];
						otherTypeCount = thisTypes[PieceIdentifiers.DASH] + thisTypes[PieceIdentifiers.I] + thisTypes[PieceIdentifiers.BACKSLASH];
					}
					if (thisTypeCount != otherTypeCount)
					{
						score -= 1;
					}
				}
			}
			
			// Sort parts by mid-point
			parts.sort(sortParts);
			otherParts.sort(sortParts);
			for (var i:int = 0; (i < parts.length-1) && (i < otherParts.length-1); i++)
			{
				var thisPart:Part = parts[i];
				var otherPart:Part = otherParts[i];
				var thisNextPart:Part = parts[i+1];
				var otherNextPart:Part = otherParts[i+1];
				if (thisPart.partType == otherPart.partType)
				{
					score += 2;
				}
				else if (partTypeNearMatch(thisPart.partType, otherPart.partType))
				{
					score += 1;
				}
				else
				{
					// Meant to deal with problem of arbitrary orders:
					// - T (both align by x-axis)
					// - X (both "same")
					if (((parts[i].partType == otherParts[i+1].partType) && (parts[i+1].partType == otherParts[i].partType))
						|| (i > 0 && ((parts[i].partType == otherParts[i-1].partType) && (parts[i-1].partType == otherParts[i].partType))))
					{
						// Parts switched - score zero
						if (parts[i].partType == otherParts[i+1].partType)
						{
							otherPart = otherParts[i+1];
							otherNextPart = otherParts[i];
						}
						else if (parts[i+1].partType == otherParts[i].partType)
						{
							thisPart = parts[i+1];
							thisNextPart = parts[i];
						}
						else if (parts[i].partType == otherParts[i-1].partType)
						{
							otherPart = otherParts[i-1];
							otherNextPart = otherParts[i];
						}
						else if (parts[i-1].partType == otherParts[i].partType)
						{
							thisPart = parts[i-1];
							thisNextPart = parts[i];
						}
					}
					else
					{
						score -= 1;
					}
				}
				var lastIdx:int = Math.min(parts.length, otherParts.length)-1;
				var lastPart:Part = parts[lastIdx];
				var otherLastPart:Part = otherParts[lastIdx];
				if (lastPart.partType == otherLastPart.partType)
				{
					score += 2;
				}
				else if (partTypeNearMatch(lastPart.partType, otherLastPart.partType))
				{
					score += 1;
				}
				// Check piece positions
				var positionParts:int = Piece.relativeLocation(thisPart, thisNextPart);
				var positionOtherParts:int = Piece.relativeLocation(otherPart, otherNextPart);
				if (positionParts == positionOtherParts)
				{
					score += 2;
				}
				else if (positionParts == 0 || positionOtherParts == 0)
				{
					// Score 0
				}
				else if (((positionParts%8) == (positionOtherParts-1)) || ((positionOtherParts%8) == (positionParts-1)))
				{
					// Off by one (note that position 0, or same, is removed from equation)
					score += 1;
				}
				else
				{
					score -= 1;
				}
			}
			// Check connection points
			var partsConnections:Array = findConnections(parts);
			var otherPartsConnections:Array = findConnections(otherParts);
			if (partsConnections.length == otherPartsConnections.length)
			{
				score += 1;
			}
			for (var connection:String in partsConnections)
			{
				if (otherPartsConnections[connection])
				{
					score += 2;
				}
				else
				{
					// TODO: the case of out-of-order pieces, and different numbers of pieces
					score -= 1;
				}
			}
			
			return score;
		}
		
		protected function sortParts(partA:Part, partB:Part):Number
		{
			var midPointA:Point = partA.MidPoint;
			var midPointB:Point = partB.MidPoint;
			var partAScore:Number = (2*midPointA.x) + midPointA.y;
			var partBScore:Number = (2*midPointB.x) + midPointB.y;
			if (partAScore > partBScore) return 1;
			if (partAScore < partBScore) return -1;
			if (partA.partType > partB.partType) return 1;
			if (partA.partType < partB.partType) return -1;
			return 0;
		}

		protected function partTypeNearMatch(partTypeA:String, partTypeB:String):Boolean
		{
			if (partTypeA == partTypeB) return true;
			if (partTypeA == PieceIdentifiers.DASH || partTypeA == PieceIdentifiers.I)
			{
				if (partTypeB == PieceIdentifiers.SLASH || partTypeB == PieceIdentifiers.BACKSLASH)
				{
					return true;
				}
			}
			else if (partTypeA == PieceIdentifiers.SLASH || partTypeA == PieceIdentifiers.BACKSLASH)
			{
				if (partTypeB == PieceIdentifiers.DASH || partTypeB == PieceIdentifiers.I)
				{
					return true;
				}
			}
			return false;
		}
		
		protected function findConnections(parts:Array):Array
		{
			var connections:Array = new Array();
			for (var p:int = 0; p < parts.length-1; p++)
			{
				var p1:Part = parts[p];
				var p1Points:Object = { StartPoint:p1.StartPoint, MidPoint:p1.MidPoint, EndPoint:p1.EndPoint };
				for (var q:int = p+1; q < parts.length; q++)
				{
					var p2:Part = parts[q];
					var p2Points:Object = { StartPoint:p2.StartPoint, MidPoint:p2.MidPoint, EndPoint:p2.EndPoint };
					for (var pointType1:String in p1Points)
					{
						for (var pointType2:String in p2Points)
						{
							var p1Point:Point = p1[pointType1];
							var p2Point:Point = p2[pointType2];
							if (GeometryUtils.directionToPoint(p1Point, p2Point, 0.0, 10) == GeometryUtils.SAME)
							{
								connections[p + "." + pointType1 + "==" + q + "." + pointType2] = true;
							}
						}
					}
				}
			}
			return connections;
		}
		
		/*****************************
		 * UTILITY FUNCTIONS
		 *****************************/

		public static function matchState(parts:Array, difficult:Boolean = true, matchOnlyLetters:Boolean = true):State
		{
			var result:State = null;
			var maxScore:int = 0;
			var states:Array = StateDefinitions.Instance.States;
			for each (var state:State in states)
			{
				if (state.isLetter || !matchOnlyLetters)
				{
					var stateScore:int = state.matchScore(parts);
					if (stateScore > maxScore)
					{
						result = state;
						maxScore = stateScore;
					}
				}
			}
			return result;
		}
	}
	
}