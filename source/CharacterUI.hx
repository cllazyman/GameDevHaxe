 package;

 import flixel.FlxBasic;
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.group.FlxGroup.FlxTypedGroup;
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

     public function new()
     {
         super();
         _sprBack = new FlxSprite().makeGraphic(FlxG.width, 100, FlxColor.BLUE);
         _sprBack.drawRect(0, 190, FlxG.width, 100, FlxColor.WHITE);
         _txtHealth = new FlxText(160, 20, 0, "3 / 3", 38);
         _txtHealth.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
         _txtMoney = new FlxText(0, 20, 0, "0", 38);
         _txtMoney.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        
         add(_sprBack);
         add(_txtHealth);
         add(_txtMoney);
         forEach(function(spr:FlxSprite)
         {
             spr.scrollFactor.set(0, 0);
         });
     }


 }