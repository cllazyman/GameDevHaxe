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

class DialogueTemplate extends FlxTypedGroup<FlxSprite>
{
	
	// ** These are the sprites that we will use to show the combat hud interface
	var _sprName:FlxSprite;	// Sprite of character's name
	var _sprText:FlxSprite;	// Spirte of the text
	var _text:FlxText;	// Text
	var _name:FlxText; //Name
	var _textIndex = 0; // Count the index of text
	var _alpha:Float = 0;	// we will use this to fade in and out our combat hud
	var _textContent:Array<String>;   // Contain all the texts
	var _nameContent:Array<String>;   //Contain all the names
	var _sprChoice1:FlxSprite;       //Choice 1
	var _textChoice1:FlxText;
	var _sprChoice2:FlxSprite;      //choice 2
	var _textChoice2:FlxText;
	var _sprChoice3:FlxSprite;     //Choice 3
	var _textChoice3:FlxText;
	var _textChoice1Content:Array<String>; //Contain all the texts of Choice 1
	var _textChoice2Content:Array<String>; //Contain all the texts of Choice 2
	var _textChoice3Content:Array<String>; //Contain all the texts of Choice 3
	
	var _isMakingChoice:Bool = false;  //When making a choice, SPACE is banned
	var _choiceMake:Int = 0;   //Which choice the player chooses
	
	var _choosingSound:FlxSound;
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
		
		//Text
		_text = new FlxText(_sprText.x + 15, _sprText.y + 10, 470, _textContent[0]);
		_text.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(_text);
		_name = new FlxText(_sprName.x + 15, _sprName.y + 5, 100, _nameContent[0]);
		_name.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(_name);
		
		//Choices
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
		
		//Initialize choices invisible
		_sprChoice1.visible = false;
		_textChoice1.visible = false;
		_sprChoice2.visible = false;
		_textChoice2.visible = false;
		_sprChoice3.visible = false;
		_textChoice3.visible = false;
		
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
				
				if (_isMakingChoice == false){
					_textIndex = _textIndex + 1;
					_text.text = _textContent[_textIndex];
					_name.text = _nameContent[_textIndex];
				}
			}
		if (_isMakingChoice == true){
			if (FlxG.mouse.justReleased){	
				_choosingSound.play();

				if (FlxG.mouse.screenX >= 285 && FlxG.mouse.screenX<=465){
					if (FlxG.mouse.screenY >= 85 && FlxG.mouse.screenY <= 105){
						_choiceMake = 1;
					}
					else if (FlxG.mouse.screenY >= 125 && FlxG.mouse.screenY <= 145){
						_choiceMake = 2;
					}
					else if (FlxG.mouse.screenY >= 165 && FlxG.mouse.screenY <= 185){
						_choiceMake = 3;
					}
					else{
						_choiceMake = 0;
					}
				}
			}
			else{
				_choiceMake = 0;
			}
		}
	/**
		if (_textIndex == 2){
				_isMakingChoice = true;
				setChoiceVisible(true);
				if (_choiceMake != 0 ){
					_textIndex = 3;
					_text.text = _textContent[_textIndex];
					_name.text = _nameContent[_textIndex];
					setChoiceVisible(false);
					_choiceMake = 0;
					_isMakingChoice = false;
				}			
			}
			**/
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