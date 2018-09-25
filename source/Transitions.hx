package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * The beginning of the story
 * @author Tony
 */

class Transitions extends FlxTypedGroup<FlxSprite>
{
	
	// ** These are the sprites that we will use to show the combat hud interface
	var _text:FlxText;	// Text
	var _transitionIndex:Int;
	var _textIndex = 0; // Count the index of text
	var _alpha:Float = 0;	// we will use this to fade in and out our combat hud
	var _textTransition1:Array<String>;   // Contain all the texts
	
	
	var _choosingSound:FlxSound;
	public function new(index:Int) 
	{
		super();
		_textIndex = 0;
		_transitionIndex = index;
		_textTransition1 = ["Sep 6. Morining"];
		//Text
		_text = new FlxText();
		if (index == 1){
			_text.text = _textTransition1[0];
		}
		_text.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		_text.screenCenter();
		add(_text);
		
		
		forEach(function(spr:FlxSprite)
		{
			spr.scrollFactor.set();
		});
		
		// Load Sounds
		_choosingSound = FlxG.sound.load(AssetPaths.ButtonClickSFX__ogg);
	}

	
	override public function update(elapsed:Float):Void 
	{

		if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
			{
				_choosingSound.play();
				_textIndex = _textIndex + 1;
				if (_transitionIndex == 1){
					_text.text = _textTransition1[_textIndex];
					if (_textIndex >= _textTransition1.length ){
						visible = false;
						active = false;
					}
				}
				
			}
		super.update(elapsed);
	}
	
}