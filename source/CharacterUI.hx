 package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.group.FlxSpriteGroup;
 import flixel.text.FlxText;
 import flixel.util.FlxColor;
 using flixel.util.FlxSpriteUtil;

 class CharacterUI extends FlxTypedGroup<FlxSprite>
 {
     var _sprBack:FlxSprite;
     var _txtHealth:FlxText;
     var _txtMoney:FlxText;
     var _sprHealth:FlxSprite;
     var _sprMoney:FlxSprite;
	 var _w :Int;
	 var _h : Int;
	 var group:FlxSpriteGroup;

     public function new()
     {
         super();
		//group = new FlxSpriteGroup(0, 0);
		// group.origin.set(0, 0);
         _sprBack = new FlxSprite(0, 0).makeGraphic(155, FlxG.height, FlxColor.BLACK);
		 _sprBack.drawRect(150, 0, 5, FlxG.height, FlxColor.WHITE);
	
		// _sprBack.drawRect(10, 10, 130, 340, FlxColor.BLACK);
		// _txtHealth.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
         //_txtMoney = new FlxText(0, 20, 0, "0", 38);
         //_txtMoney.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        
         add(_sprBack);
         //add(_txtHealth);
         //add(_txtMoney);
         forEach(function(spr:FlxSprite)
         {
             spr.scrollFactor.set(0,0);
         });
     }


 }