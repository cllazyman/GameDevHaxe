package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * The beginning of the story
 * @author Tony
 */

class DialogueTemplate extends FlxTypedGroup<FlxSprite>
{
	
	// ** These are the sprites that we will use to show the combat hud interface
	var _sprName:FlxSprite;	// Sprite of character's name
	var _sprText:FlxSprite;	// Spirte of the text
	var _text:FlxText;	// Text
	var _name:FlxText; //Name
	var _textIndex = 0; // Count the index of text
	var _alpha:Float = 0;	// we will use this to fade in and out our combat hud
	var _textContent:Array<String>; 
	var _nameContent:Array<String>; 
	var _sprChoice1:FlxSprite;
	var _textChoice1:FlxText;
	var _sprChoice2:FlxSprite;
	var _textChoice2:FlxText;
	var _sprChoice3:FlxSprite;
	var _textChoice3:FlxText;
	var _textChoice1Content:Array<String>;
	var _textChoice2Content:Array<String>;
	var _textChoice3Content:Array<String>;
	
	var _isMakingChoice:Bool = false;
	var _choiceMake:Int = 0;
	var _afterMakingChoice:Bool = false;
	public function new() 
	{
		super();
		// first, create our background. Make a black square, then draw borders onto it in white. Add it to our group.
		_sprText = new FlxSprite(150,260);
		_sprText.loadGraphic("assets/images/ui_dialogue.png");
		_sprName = new FlxSprite(150, 220);
		_sprName.loadGraphic("assets/images/ui_name.png");
		add(_sprText);
		add(_sprName);
		
		_text = new FlxText(_sprText.x + 15, _sprText.y + 10, 470, _textContent[0]);
		_text.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(_text);
		_name = new FlxText(_sprName.x + 15, _sprName.y + 5, 100, _nameContent[0]);
		_name.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(_name);
		
		_sprChoice1 = new FlxSprite(280,80);
		_sprChoice1.loadGraphic("assets/images/ui_choice.png");
		_textChoice1 = new FlxText(_sprChoice1.x + 15, _sprChoice1.y + 8, 100, _textChoice1Content[0]);
		_textChoice1.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
	
		_sprChoice2 = new FlxSprite(280, 120);
		_sprChoice2.loadGraphic("assets/images/ui_choice.png");
		_textChoice2 = new FlxText(_sprChoice2.x + 15, _sprChoice2.y + 8, 100, _textChoice2Content[0]);
		_textChoice2.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		
		_sprChoice3 = new FlxSprite(280, 160);
		_sprChoice3.loadGraphic("assets/images/ui_choice.png");
		_textChoice3 = new FlxText(_sprChoice3.x + 15, _sprChoice3.y + 8, 100, _textChoice3Content[0]);
		_textChoice3.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		
		add(_sprChoice1);
		add(_sprChoice2);
		add(_sprChoice3);
		add(_textChoice1);
		add(_textChoice2);
		add(_textChoice3);
		_sprChoice1.visible = false;
		_textChoice1.visible = false;
		_sprChoice2.visible = false;
		_textChoice2.visible = false;
		_sprChoice3.visible = false;
		_textChoice3.visible = false;
		// like we did in our HUD class, we need to set the scrollFactor on each of our children objects to 0,0. We also set alpha to 0 (so we can fade this in)
		forEach(function(spr:FlxSprite)
		{
			spr.scrollFactor.set();
		});
	}

	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
			{
				if (_isMakingChoice == false){
					_textIndex = _textIndex + 1;
					_text.text = _textContent[_textIndex];
					_name.text = _nameContent[_textIndex];
				}
			}
			
		if (_isMakingChoice == true){
			if (FlxG.mouse.justReleased){	
				if (FlxG.mouse.x >= 615 && FlxG.mouse.y <= 795){
					if (FlxG.mouse.y >= 185 && FlxG.mouse.y <= 205){
						_choiceMake = 1;
					}
					else if (FlxG.mouse.y >= 230 && FlxG.mouse.y <= 245){
						_choiceMake = 2;
					}
					else if (FlxG.mouse.y >= 270 && FlxG.mouse.y <= 285){
						_choiceMake = 3;
					}
				}
			}
		}
		super.update(elapsed);

	}
	/**
	 * This function is triggered when our results text has finished fading in. If we're not defeated, we will fade out the entire hud after a short delay
	 */
	function doneResultsIn(_):Void
	{
		FlxTween.num(1, 0, .66, { ease: FlxEase.circOut, onComplete: finishFadeOut, startDelay: 1 }, updateAlpha);
	}
	/**
	 * After we fade our hud out, we set it to not be active or visible (no update and no draw)
	 */
	function finishFadeOut(_):Void
	{
		active = false;
		visible = false;
	}
	
	/**
	 * This function is called by our Tween to fade in/out all the items in our hud.
	 */
	function updateAlpha(Value:Float):Void
	{
		_alpha = Value;
		forEach(function(spr:FlxSprite)
		{
			spr.alpha = _alpha;
		});
	}
	
	function setChoiceVisible(Visible:Bool):Void{
		_sprChoice1.visible = Visible;
		_textChoice1.visible = Visible;
		_sprChoice2.visible = Visible;
		_textChoice2.visible = Visible;
		_sprChoice3.visible = Visible;
		_textChoice3.visible = Visible;
	
	 }
}