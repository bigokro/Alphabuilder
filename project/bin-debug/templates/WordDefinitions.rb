print <<EOS
package objects
{
	import flash.utils.*;
	import flash.geom.*;
	import mx.collections.*;
	import mx.containers.*;
	import mx.core.*;
	
	// WARNING: This file is autogenerated by template
	// If you wish to modify this file, modify its template and then generate a new version
	public class WordDefinitions
	{
		protected static var instance:WordDefinitions = null;
		
		public var Words:Array = new Array();
		public var WordsByLetter:Array = new Array();
		protected var canvas:Canvas = null;
		
		static public function get Instance():WordDefinitions
		{
			if ( instance == null )
				instance = new WordDefinitions();
			return instance;
		}
		
		public function WordDefinitions()
		{
			
		}

		// Images
EOS

currentWord = ""
currentLetter = "a"
wordDefinitions = ""
Dir.foreach('../../media/words') do |file|
	next if file == '.' or file == '..'
	parts = file.split('_')
	word = parts[0].split('-').collect{ |w| w.capitalize }.join
	index = parts[1].split('.')[0]
	if word != currentWord
		print "		public static var #{word}Images:Array = new Array();\n"

		upperWord = parts[0].split('-').collect{ |w| w.upcase }.join('_')
		if currentLetter != word[0]
			wordDefinitions << "\n"
			wordDefinitions << "			WordsByLetter[\"#{upperWord[0].chr}\"] = new Array();\n"
			currentLetter = word[0]
		end
		wordDefinitions << "			Words[\"#{upperWord}\"] = new Word(\"#{upperWord}\", \"#{upperWord}\", #{word}Images);\n"
		wordDefinitions << "			Words[\"#{upperWord}\"].startup(canvas);\n"
		wordDefinitions << "			WordsByLetter[\"#{upperWord[0].chr}\"][WordsByLetter[\"#{upperWord[0].chr}\"].length] = Words[\"#{upperWord}\"];\n"

		currentWord = word
	end
	print "		[Embed(source=\"../../media/words/#{file}\")]\n"
	print "		public static var WordImage#{word}#{index}:Class;\n"
	print "		#{word}Images[#{word}Images.length] = new WordImage#{word}#{index}();\n\n"
	
end

print <<EOS
		public function startup(canvas:Canvas):void
		{
			this.canvas = canvas;
			
			#{wordDefinitions}
		}

	}
}
EOS