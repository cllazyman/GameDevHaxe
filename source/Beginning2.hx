package;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

/**
 * The beginning of the story
 * @author Tony
 */

class Beginning2 extends DialogueTemplate
{
	
	// ** These are the sprites that we will use to show the combat hud interface
	
	var _sprChoice1:FlxSprite;
	var _textChoice1:FlxText;
	var _sprChoice2:FlxSprite;
	var _textChoice2:FlxText;
	var _sprChoice3:FlxSprite;
	var _textChoice3:FlxSprite;
	
	override public function new() 
	{
		
		_textContent = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister"];
		_nameContent = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		super();
		

	}
	override public function update(elapsed:Float):Void 
	{	
			// check to see any keys are pressed and set the cooresponding flags.
			if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
			{
				_textIndex = _textIndex + 1;
				_text.text = _textContent[_textIndex];
				_name.text = _nameContent[_textIndex];
				if (_textIndex == 3){
					doneResultsIn(_sprText);
					doneResultsIn(_sprName);
				}
			}
			
			
		super.update(elapsed);
		
	
	}


}