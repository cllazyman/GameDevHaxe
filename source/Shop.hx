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

class Shop extends FlxTypedGroup<FlxSprite>
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
	
	var _sprShop:FlxSprite;
	
	var _Item1:FlxText;
	var _Item2:FlxText;
	var _Item3:FlxText;
	var _Item4:FlxText;
	var _Item5:FlxText;
	var _Item6:FlxText;
	var _Item7:FlxText;
	var _Item8:FlxText;
	var _Item9:FlxText;
	var _Item10:FlxText;
	var _Item1Price:FlxText;
	var _Item2Price:FlxText;
	var _Item3Price:FlxText;
	var _Item4Price:FlxText;
	var _Item5Price:FlxText;
	var _Item6Price:FlxText;
	var _Item7Price:FlxText;
	var _Item8Price:FlxText;
	var _Item9Price:FlxText;
	var _Item10Price:FlxText;
	
	var _shopItem:Int = 0;
	
	public function new() 
	{
		FlxG.sound.play(AssetPaths.menu__ogg);
		_textContent = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister"];
		_nameContent = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
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
		
		_sprShop = new FlxSprite(280,20);
		_sprShop.loadGraphic("assets/images/ui_shop_revised.png");
		add(_sprShop);
		
		_Item1 = new FlxText(_sprShop.x + 15,_sprShop.y + 10, 80, "Osake:");
		_Item1.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item1Price = new FlxText(_sprShop.x + 90, _sprShop.y + 30, 80, "0G");
		_Item1Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item1);
		add(_Item1Price);
		_Item2 = new FlxText(_sprShop.x + 15, _sprShop.y + 55, 80, "Tea:");
		_Item2.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item2Price = new FlxText(_sprShop.x + 90, _sprShop.y + 75, 80, "0G");
		_Item2Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item2);
		add(_Item2Price);
		_Item3 = new FlxText(_sprShop.x + 15,_sprShop.y + 100, 80, "Ink:");
		_Item3.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item3Price = new FlxText(_sprShop.x + 90, _sprShop.y + 115, 80, "0G");
		_Item3Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item3);
		add(_Item3Price);
		_Item4 = new FlxText(_sprShop.x + 15, _sprShop.y + 145, 80, "Ikebana:");
		_Item4.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item4Price = new FlxText(_sprShop.x + 90, _sprShop.y + 160, 80, "0G");
		_Item4Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item4);
		add(_Item4Price);
		_Item5 = new FlxText(_sprShop.x + 15, _sprShop.y + 190, 145, "Item4:");
		_Item5.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item5Price = new FlxText(_sprShop.x + 90, _sprShop.y + 205, 160, "0G");
		_Item5Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item5);
		add(_Item5Price);
		_Item6 = new FlxText(_sprShop.x + 170,_sprShop.y + 10, 80, "Item1:");
		_Item6.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item6Price = new FlxText(_sprShop.x + 245, _sprShop.y + 30, 80, "0G");
		_Item6Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item6);
		add(_Item6Price);
		_Item7 = new FlxText(_sprShop.x + 170, _sprShop.y + 55, 80, "Item2:");
		_Item7.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item7Price = new FlxText(_sprShop.x + 245, _sprShop.y + 75, 80, "0G");
		_Item7Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item7);
		add(_Item7Price);
		_Item8 = new FlxText(_sprShop.x + 170,_sprShop.y + 100, 80, "Item3:");
		_Item8.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item8Price = new FlxText(_sprShop.x + 245, _sprShop.y + 115, 80, "0G");
		_Item8Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item8);
		add(_Item8Price);
		_Item9 = new FlxText(_sprShop.x + 170, _sprShop.y + 145, 80, "Item4:");
		_Item9.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item9Price = new FlxText(_sprShop.x + 245, _sprShop.y + 160, 80, "0G");
		_Item9Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item9);
		add(_Item9Price);
		_Item10 = new FlxText(_sprShop.x + 170, _sprShop.y + 190, 145, "Item4:");
		_Item10.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_Item10Price = new FlxText(_sprShop.x + 245, _sprShop.y + 205, 160, "0G");
		_Item10Price.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_Item10);
		add(_Item10Price);
	

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
				_textIndex = _textIndex + 1;
				_text.text = _textContent[_textIndex];
				_name.text = _nameContent[_textIndex];
			}
			
		if (FlxG.mouse.justReleased){	
				_text.text = Std.string(_shopItem) +"  " + Std.string(FlxG.mouse.x) +"   " + Std.string(FlxG.mouse.y);
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
	

}