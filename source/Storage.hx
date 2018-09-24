package;

/**
 * Stores variables in between states
 * @author Christian
 */
class Storage {
	// The current day
	static public var Day:Int = 1;

	// The current time
	static public var time:Bool = true;
	
	// The current money
	static public var money:Int = 0;
	
	// The list of player names
	static public var playerNames:Array<String> = ["Shimotsuki", "Tsuruko", "Setsuko", "Kawako"];
	
	// The list of npc names
	static public var npcNames:Array<String> = ["shop", "intel", "brother", "mA", "mB", "mC"];
	
	// The list of limited items
	static public var limitedItemNames:Array<String> = ["Sake", "Tea", "Ink", "Arranged Flowers"];
	static public var limitedItemCounts:Array<Int> = [0, 0, 0, 0];
	//static public var Names:Map<String, Int> = ["Sake" => 0, "Tea" => 0, "Ink" => 0, "Arranged Flowers" => 0];
	
	// The list of unlimited items
	static public var unlimitedItems:Array<String> = ["German Pen", "Famous Katana", "Chinese Tea Pot", "Kimono", "Japanese", "Mythic Shamisen"];
	
	// A reference to the active playstate for global access
	static public var PS:PlayState;
}