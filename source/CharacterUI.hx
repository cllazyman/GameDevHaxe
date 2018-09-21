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
     var _textDay:FlxText;
	 var _textTime:FlxText;
	 var _sprDivideTime:FlxSprite;
	 var _textPlayer:FlxText;
	 var _sprPlayer:FlxSprite;
	 var _textMoney:FlxText;
     public function new()
     {
         super();
         _sprBack = new FlxSprite(0, 0);
		 _sprBack.loadGraphic("assets/images/ui_stats.png");
		 
		 _textDay = new FlxText(_sprBack.x + 15, _sprBack.y + 20, 135, "Day 1");
		 _textDay.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		 _textTime = new FlxText(_sprBack.x + 85, _sprBack.y + 20, 80, "Morning");
		 _textTime.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		 _sprDivideTime = new FlxSprite(_sprBack.x, _sprBack.y + 45);
		 _sprDivideTime.loadGraphic("assets/images/ui_divide.png");
		 
		 _textPlayer = new FlxText(_sprBack.x + 15, _sprBack.y + 50, 80, "Shimotsuki");
		 _textPlayer.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		 _sprPlayer = new FlxSprite(_sprBack.x + 100, _sprBack.y + 50);
		 _sprPlayer.loadGraphic("assets/images/unknown.png");
		 
		 _textMoney = new FlxText(_sprBack.x + 15, _sprBack.y + 200, 80, "Money: 0");
		 _textMoney.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		
         add(_sprBack);
		 add(_textDay);
         add(_textTime);
         add(_sprDivideTime);
		 add(_textPlayer);
		 add(_sprPlayer);
		 add(_textMoney);
         forEach(function(spr:FlxSprite)
         {
             spr.scrollFactor.set(0,0);
         });
     }
	 //Change days
	 public function updateDay(Day:Int = 1):Void
     {
         _textDay.text = "Day "+Std.string(Day);
         
     }
	 //Change time. True is morining, False is night
	 public function updateTime(IsMorning:Bool = true):Void
	 {
		 if (IsMorning == true){
			 _textTime.text = "Morining";
		 }
		 else{
			 _textTime.text = "Night";
		 }
	 }
	 public function updatePlayerName(Name:String):Void
     {
         _textDay.text = Name;
         
     }
	public function updateMoney(Money:Int = 0):Void
     {
         _textMoney.text = "Money: "+Money;
         
     }
	 public function updatePlayerPicture(PlayerIndex:Int = 0):Void
     {
         if (PlayerIndex == 1){
			  _sprPlayer.loadGraphic("assets/images/ui_divide.png");
		 }
         
     }

 }