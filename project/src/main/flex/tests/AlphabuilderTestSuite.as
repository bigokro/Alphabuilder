package tests
{
	import tests.objects.*;
	import tests.utils.*;
	
    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class AlphabuilderTestSuite
    {
        //public var line:LineTest;
        public var line:LineTest;
        public var lineInterpreter:LineInterpreterTest;
        public var geometry:GeometryUtilsTest;
        public var state:StateTest;
        public var piece:PieceTest;
        public var part:PartTest;
    }
}