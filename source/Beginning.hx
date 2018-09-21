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

class Beginning extends FlxTypedGroup<FlxSprite>
{
	
	// ** These are the sprites that we will use to show the combat hud interface
	var _sprName:FlxSprite;	// Sprite of character's name
	var _sprText:FlxSprite;	// Spirte of the text
	var _text:FlxText;	// Text
	var _name:FlxText; //Name
	var _textIndex = 0; // Count the index of text
	var _alpha:Float = 0;	// we will use this to fade in and out our combat hud
	
	public function new() 
	{
		super();
		// first, create our background. Make a black square, then draw borders onto it in white. Add it to our group.
		_sprText = new FlxSprite(150,260);
		//_sprText.drawRect(_sprText.x + 5, _sprText.y + 5, 480, 90, FlxColor.BLACK);
		_sprText.loadGraphic("assets/images/ui_dialogue.png");
		_sprName = new FlxSprite(150, 225);
		_sprName.loadGraphic("assets/images/ui_name.png");
		add(_sprText);
		add(_sprName);
		
		_text = new FlxText(_sprText.x + 15, _sprText.y + 10, 470, "Dark and frigid night");
		_text.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(_text);
		_name = new FlxText(_sprName.x + 15, _sprName.y + 5, 100, "Nizaemon");
		_name.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(_name);
		
		// like we did in our HUD class, we need to set the scrollFactor on each of our children objects to 0,0. We also set alpha to 0 (so we can fade this in)
		forEach(function(spr:FlxSprite)
		{
			spr.scrollFactor.set();
		});
		

	}

	
	override public function update(elapsed:Float):Void 
	{	
			// check to see any keys are pressed and set the cooresponding flags.
			if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
			{
				_textIndex = _textIndex + 1;
				switch (_textIndex){
					case 1:{
						_text.text = "Silent wind hang red moon high";
					}
					case 2:{
						_text.text = "The misfortune die";
					}
					case 3:{
						_name.text = "Shimotsuki";
						_text.text = "Sorry, you must been waiting for a while.";
					}
					case 4:{
						_name.text = "Nizaemon";
						_text.text = "I just arrived, my sister";
					}	
					case 5:{
						_name.text = "Shimotsuki";
						_text.text = "So what bring you here";
					}
					case 6:{
						_name.text = "Nizaeomon";
						_text.text = "I just got another target and I am going to do what I have to";
					}
					case 7:{
						_name.text = "Shimotsuki";
						_text.text = "It is not what you have to. How many times you want me to worry about you.";
					}
					case 8:{
						_name.text = "Shimotsuki";
						_text.text = "Why dont you just quit";
					}
					case 9:{
						_name.text = "Nizaemon";
						_text.text = "Why DONT you just quit";
					}
					case 10:{
						_name.text = "Nizaemon";
						_text.text = "Why dont YOU just quit";
					}
					case 11:{
						_name.text = "Nizaemon";
						_text.text = "How can you simply let those disgusting man put their dirty hands on you!";
					}
					case 12:{
						_name.text = "Shimotsuki";
						_text.text = "At least I am not risking my life!";
					}
					case 13:{
						_name.text = "Nizaemon";
						_text.text = "No you are not, and I have never heard of a Yujo who is 25 and still alive!";
					}
					case 14:{
						_name.text = "Nizaemon";
						_text.text = "You are already 23 now my sister";
					}
					case 15:{
						_name.text = "Nizaemon";
						_text.text = "After this, we would have enough money to live anywhere else.";
					}
					case 16:{
						_name.text = "Shimotsuki";
						_text.text = "And the risk can make you killed anytime, right my brother?";
					}
					case 17:{
						_name.text = "Nizaemon";
						_text.text = "…";
					}
					case 18:{
						_name.text = "Nizaemon";
						_text.text = "I might not ever see you again";
					}
					case 19:{
						_name.text = "Nizaemon";
						_text.text = "So promise me, keep safe.";
					}
					case 20:{
						_name.text = "Shimotsuki";
						_text.text = "I wont promise you unless you come back alive, Yukinoshin.";
					}
					case 21:{
						_text.text = "That boy has died 15 years ago.";
					}
					case 22:{
						_text.text = "Sayonara, Tachibana Shimotsuki sama.";
					}
					case 23:{
						doneResultsIn(_sprText);
						doneResultsIn(_sprName);
					
				}
			}
			
			
		super.update(elapsed);
		}
	
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
}