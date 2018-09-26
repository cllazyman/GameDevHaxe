package;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;


class CharacterUI extends FlxTypedGroup<FlxSprite> {
	// Background
	private var stats:FlxSprite;
	
	// Day section
	private var day:FlxText;
	private var time:FlxText;
	private var divider1:FlxSprite;
	
	// Player section
	private var namePlayer:FlxText;
	private var avaPlayer:FlxSprite;
	private var divider2:FlxSprite;
	
	// Money section
	private var money:FlxText;
	private var moneyCount:FlxText;
	
	// Inventory Content
	private var itemName:Map<String, FlxText> = new Map<String, FlxText>();
	private var itemCount:Map<String, FlxText> = new Map<String, FlxText>();
	
    public function new() {
		super();
		// Add the stats background
		stats = new FlxSprite(0, 0);
		stats.loadGraphic(AssetPaths.ui_stats__png);
		add(stats);

		// Add the day section of the UI
		day = new FlxText(stats.x + 15, stats.y + 20, 135, "Day "+Storage.Day);
		day.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		time = new FlxText(stats.x + 80, stats.y + 20, 80, (Storage.time ? "Morning" : "Night"));
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
		moneyCount = new FlxText(stats.x + 80, stats.y + 100, Std.string(Storage.money));
		moneyCount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);	
		add(money);
		add(moneyCount);
		
		// Add items to inventory
		var offsety:Int = 140;
		for (i in 0...Storage.limitedItemNames.length) {
			var tempItemName:FlxText = new FlxText(stats.x+15, stats.y+offsety, 150, Storage.limitedItemNames[i]);
			tempItemName.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			var tempItemCount:FlxText = new FlxText(stats.x+120, stats.y+offsety, 80, Std.string(Storage.limitedItemCounts[i]));
			tempItemCount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			itemName[Storage.limitedItemNames[i]] = tempItemName;
			itemCount[Storage.limitedItemNames[i]] = tempItemCount;
			add(tempItemName);
			add(tempItemCount);
			offsety += 20;
		}
		for (i in 0...Storage.unlimitedItemNames.length) {
			var tempItemName:FlxText = new FlxText(stats.x+15, stats.y+offsety, 150, Storage.unlimitedItemNames[i]);
			tempItemName.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			var tempItemCount:FlxText = new FlxText(stats.x+120, stats.y+offsety, 80, Std.string(Storage.unlimitedItemCounts[i]));
			tempItemCount.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			itemName[Storage.unlimitedItemNames[i]] = tempItemName;
			itemCount[Storage.unlimitedItemNames[i]] = tempItemCount;
			add(tempItemName);
			add(tempItemCount);
			offsety += 20;
		}

		forEach(function(spr:FlxSprite) { spr.scrollFactor.set(0,0); });
	}
	override public function update(elapsed:Float):Void {
		if (Storage.pauseUI) {
			for (i in 0...Storage.limitedItemNames.length) {
				itemCount[Storage.limitedItemNames[i]].text = Std.string(Storage.limitedItemCounts[i]);
			}
			for (i in 0...Storage.unlimitedItemCounts.length) {
				if (Storage.unlimitedItemCounts[i] == 0){
					itemCount[Storage.unlimitedItemNames[i]].text = "0";
				} else {
					itemCount[Storage.unlimitedItemNames[i]].text = "∞";
				}
			}
			moneyCount.text = Std.string(Storage.money) + " G";
		}
	}
	
	// Changes the player name and avatar by index
	public function updatePlayer(index:Int):Void {
		namePlayer.text = Storage.playerNames[index];
		Storage.playerIndex = index;
		avaPlayer.loadGraphic("assets/images/avaplayer"+index+".png");
	}
}