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
	var _textIndex = 0; // Count the index of text
	var _alpha:Float = 0;	// we will use this to fade in and out our combat hud
	var _textTransition:Array<String>;   // Contain all the texts
	
	
	var _choosingSound:FlxSound;
	public function new() 
	{
		super();
		_textIndex = 0;
		_textTransition = [];
		//Text
		_text = new FlxText();
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
	public function chooseTrasition(Index:Int):Void{
		_textIndex = 0;		//Initialize the index of text
		switch Index{
			case 1:{ 		//Beginning of the text
				_textTransition = ["On the next day","Sep 6. Morning"];
			}
		}
	}

	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
			{
				_choosingSound.play();
				_textIndex = _textIndex + 1;
				_text.text = _textTransition[_textIndex];
				if (_textIndex >=  _textTransition.length){ //Make HUD disappear
						toggleHUD(false);
				}	
			}
		super.update(elapsed);
	}
	// Turn on/off HUD
	public function toggleHUD(power:Bool):Void {
		if (power) {
			FlxTween.num(0, 1, .66, { onComplete: function(_) {
				active = true;
				_text.text = _textTransition[0];
			}}, function(Alpha:Float) {
				forEach(function(spr:FlxSprite) {
					spr.alpha = Alpha;
				});
			});
		} else {
			active = false;
			FlxTween.num(1, 0, .66, function(Alpha:Float) {
				forEach(function(spr:FlxSprite) {
					spr.alpha = Alpha;
				});
			});
		}
	}
}