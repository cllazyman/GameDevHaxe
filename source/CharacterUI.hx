package;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;


class CharacterUI extends FlxTypedGroup<FlxSprite> {
	// For UI stuff
	var playerNames:Array<String> = ["Shimotsuki", "Tsuruko", "Setsuko", "Kawako"];
	var npcNames:Array<String> = ["shop", "intel", "brother", "mA", "mB", "mC"];
	
	// Background
	var stats:FlxSprite;
	
	// Day section
	var day:FlxText;
	var time:FlxText;
	var divider1:FlxSprite;
	
	// Player section
	var namePlayer:FlxText;
	var avaPlayer:FlxSprite;
	var divider2:FlxSprite;
	
	// Money section
	var money:FlxText;
	var moneyCount:FlxText;
	
	// Inventory Content
	var Names:Array<String> = ["Sake", "Tea", "Ink", "Arranged Flowers"];
	var Counts:Array<Int> = [0, 0, 0, 0];
	var itemName:Map<String, FlxText> = new Map<String, FlxText>();
	var itemCount:Map<String, FlxText> = new Map<String, FlxText>();
	
    public function new() {
		super();
		// Add the stats background
		stats = new FlxSprite(0, 0);
		stats.loadGraphic(AssetPaths.ui_stats__png);
		add(stats);

		// Add the day section of the UI
		day = new FlxText(stats.x + 15, stats.y + 20, 135, "Day 1");
		day.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		time = new FlxText(stats.x + 80, stats.y + 20, 80, "Morning");
		time.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		divider1 = new FlxSprite(stats.x, stats.y + 45);
		divider1.loadGraphic(AssetPaths.ui_divide__png);
		add(day);
		add(time);
		add(divider1);

		// Add the player section of the UI
		namePlayer = new FlxText(stats.x + 15, stats.y + 60, 80, "Shimotsuki");
		namePlayer.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		avaPlayer = new FlxSprite(stats.x + 100, stats.y + 55);
		avaPlayer.loadGraphic("assets/images/avaplayer0.png");
		divider2 = new FlxSprite(stats.x, stats.y + 90);
		divider2.loadGraphic(AssetPaths.ui_divide__png);	
		add(namePlayer);
		add(avaPlayer);
		add(divider2);
		
		// Add the money section of the UI
		money = new FlxText(stats.x + 15, stats.y + 100, "Money:");
		money.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		moneyCount = new FlxText(stats.x + 80, stats.y + 100, "0");
		moneyCount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);	
		add(money);
		add(moneyCount);
		
		// Add items to inventory
		var offsety:Int = 140;
		for (i in 0...Names.length) {
			var tempItemName:FlxText = new FlxText(stats.x+15, stats.y+offsety, 150, Names[i]);
			tempItemName.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			var tempItemCount:FlxText = new FlxText(stats.x+120, stats.y+offsety, 80, Std.string(Counts[i]));
			tempItemCount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			itemName[Names[i]] = tempItemName;
			itemCount[Names[i]] = tempItemCount;
			add(tempItemName);
			add(tempItemCount);
			offsety += 20;
		}
		
		forEach(function(spr:FlxSprite) { spr.scrollFactor.set(0,0); });
	}

	// Change days
	public function updateDay(Day:Int = 1):Void {
		day.text = "Day "+Std.string(Day);
	}
	
	// Change time. True is morining, False is night
	public function updateTime(IsMorning:Bool = true):Void {
		if (IsMorning) {
			time.text = "Morining";
		} else {
			time.text = "Night";
		}
	}
	
	public function updateMoney(Money:Int = 0):Void {
		moneyCount.text = Std.string(Money);
	}
	
	// Changes the player name by index
	public function updatePlayerName(index:Int):Void {
		namePlayer.text = playerNames[index];
	}
		
	// Changes the avatar picture by index
	public function updatePlayerPicture(index:Int):Void {
		avaPlayer.loadGraphic("assets/images/avaplayer"+index+".png");
	}

}