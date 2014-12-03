package utils
{

	public final class MathUtils
	{
		static public function randRange(start:Number, end:Number) : Number
		{
			return Math.floor(start +(Math.random() * (end - start)));
		}
		
		static public function randomInteger(start:int, end:int) : int
		{
			return Math.round(randRange(start, end));
		}

		static public function min(a:Number, b:Number) : Number
		{
			return a < b ? a : b;
		}

		static public function max(a:Number, b:Number) : Number
		{
			return a > b ? a : b;
		}

		static public function abs(value:Number) : Number
		{
			return value < 0 ? -value : value;
		}
		
	}
	
}