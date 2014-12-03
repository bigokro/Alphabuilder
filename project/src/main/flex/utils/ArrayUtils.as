package utils
{

	public final class ArrayUtils
	{
		static public function getKeysForArray(array:Array) : Array
		{
			var keys:Array = new Array();
			for (var key:String in array)
			{
				keys.push(key);
			}
			return keys;
		}
		
	}
	
}