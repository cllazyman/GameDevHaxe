package;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;


class CharacterUI extends FlxTypedGroup<FlxSprite> {
	var _sprBack:FlxSprite;
	var _textDay:FlxText;
	var _textTime:FlxText;
	var _sprDivideTime:FlxSprite;
	var _textPlayer:FlxText;
	var _sprPlayer:FlxSprite;
	var _textMoney:FlxText;
	var _textMoneyAmount:FlxText;
	var _sprDividePlayer:FlxSprite;

	var _textItem1:FlxText;
	var _textItem2:FlxText;
	var _textItem3:FlxText;
	var _textItem4:FlxText;
	var _textItem5:FlxText;
	var _textItem6:FlxText;
	var _textItem7:FlxText;
	var _textItem8:FlxText;
	var _textItem9:FlxText;
	var _textItem10:FlxText;
	var _textItem1Amount:FlxText;
	var _textItem2Amount:FlxText;
	var _textItem3Amount:FlxText;
	var _textItem4Amount:FlxText;
	var _textItem5Amount:FlxText;
	var _textItem6Amount:FlxText;
	var _textItem7Amount:FlxText;
	var _textItem8Amount:FlxText;
	var _textItem9Amount:FlxText;
	var _textItem10Amount:FlxText;
	
    public function new() {
		super();
		_sprBack = new FlxSprite(0, 0);
		_sprBack.loadGraphic(AssetPaths.ui_stats__png);
		add(_sprBack);

		_textDay = new FlxText(_sprBack.x + 15, _sprBack.y + 20, 135, "Day 1");
		_textDay.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textTime = new FlxText(_sprBack.x + 80, _sprBack.y + 20, 80, "Morning");
		_textTime.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_sprDivideTime = new FlxSprite(_sprBack.x, _sprBack.y + 45);
		_sprDivideTime.loadGraphic(AssetPaths.ui_divide__png);
		add(_textDay);
		add(_textTime);
		add(_sprDivideTime);

		_textPlayer = new FlxText(_sprBack.x + 15, _sprBack.y + 60, 80, "Shimotsuki");
		_textPlayer.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_sprPlayer = new FlxSprite(_sprBack.x + 100, _sprBack.y + 55);
		_sprPlayer.loadGraphic("assets/images/avaplayer0.png");
		_sprDividePlayer = new FlxSprite(_sprBack.x, _sprBack.y + 90);
		_sprDividePlayer.loadGraphic(AssetPaths.ui_divide__png);
		_textMoney = new FlxText(_sprBack.x + 15, _sprBack.y + 100, "Money:");
		_textMoney.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textMoneyAmount = new FlxText(_sprBack.x + 80, _sprBack.y + 100, "0");
		_textMoneyAmount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);		
		add(_textPlayer);
		add(_sprPlayer);
		add(_textMoney);
		add(_textMoneyAmount);
		add(_sprDividePlayer);

		_textItem1 = new FlxText(_sprBack.x + 15, _sprBack.y + 140, 80, "Item1:");
		_textItem1.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem1Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 140, 80, "0");
		_textItem1Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem1);
		add(_textItem1Amount);
		_textItem2 = new FlxText(_sprBack.x + 15, _sprBack.y + 160, 80, "Item2:");
		_textItem2.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem2Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 160, 80, "0");
		_textItem2Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem2);
		add(_textItem2Amount);
		_textItem3 = new FlxText(_sprBack.x + 15, _sprBack.y + 180, 80, "Item3:");
		_textItem3.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem3Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 180, 80, "0");
		_textItem3Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem3);
		add(_textItem3Amount);
		_textItem4 = new FlxText(_sprBack.x + 15, _sprBack.y + 200, 80, "Item4:");
		_textItem4.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem4Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 200, 80, "0");
		_textItem4Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem4);
		add(_textItem4Amount);
		_textItem5 = new FlxText(_sprBack.x + 15, _sprBack.y + 220, 80, "Item5:");
		_textItem5.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem5Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 220, 80, "0");
		_textItem5Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem5);
		add(_textItem5Amount);
		_textItem6 = new FlxText(_sprBack.x + 15, _sprBack.y + 240, 80, "Item6:");
		_textItem6.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem6Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 240, 80, "0");
		_textItem6Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem6);
		add(_textItem6Amount);
		_textItem7 = new FlxText(_sprBack.x + 15, _sprBack.y + 260, 80, "Item7:");
		_textItem7.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem7Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 260, 80, "0");
		_textItem7Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem7);
		add(_textItem7Amount);
		_textItem8 = new FlxText(_sprBack.x + 15, _sprBack.y + 280, 80, "Item8:");
		_textItem8.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem8Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 280, 80, "0");
		_textItem8Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem8);
		add(_textItem8Amount);
		_textItem9 = new FlxText(_sprBack.x + 15, _sprBack.y + 300, 80, "Item9:");
		_textItem9.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem9Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 300, 80, "0");
		_textItem9Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem9);
		add(_textItem9Amount);
		_textItem10 = new FlxText(_sprBack.x + 15, _sprBack.y + 320, 80, "Item10:");
		_textItem10.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		_textItem10Amount = new FlxText(_sprBack.x + 80, _sprBack.y + 320, 80, "0");
		_textItem10Amount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		add(_textItem10);
		add(_textItem10Amount);
		
		forEach(function(spr:FlxSprite) {
			spr.scrollFactor.set(0,0);
		});
	}

	//Change days
	public function updateDay(Day:Int = 1):Void {
		_textDay.text = "Day "+Std.string(Day);
	}
	
	//Change time. True is morining, False is night
	public function updateTime(IsMorning:Bool = true):Void {
		if (IsMorning == true) {
			_textTime.text = "Morining";
		} else {
			_textTime.text = "Night";
		}
	}

	public function updatePlayerName(Name:String):Void {
		_textDay.text = Name;
	}
	
	public function updateMoney(Money:Int = 0):Void {
		_textMoneyAmount.text = Std.string(Money);
	}
	
	public function updatePlayerPicture(PlayerIndex:Int = 0):Void {
		if (PlayerIndex == 1) {
			_sprPlayer.loadGraphic("assets/images/ui_divide.png");
		}
	}

}