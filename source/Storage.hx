package;

/**
 * Stores variables in between states
 * @author Christian
 */
class Storage {
	// The current day
	static public var Day:Int = 0;

	// The current time
	static public var time:Bool = true;
	
	// The current money
	static public var money:Int = 5366;
	
	// The list of player names
	static public var playerNames:Array<String> = ["Shimotsuki", "Tsuruko", "Setsuko", "Kawako"];
	static public var playerIndex:Int = 1; //Which character the player is controlling
	
	// The list of npc names
	static public var npcNames:Array<String> = ["Shopkeeper", "Yamamoto", "Brother", "Guest1", "Guest2", "Guest3"];
	
	// The list of limited items
	static public var limitedItemNames:Array<String> = ["Sake", "Tea", "Ink", "Arranged Flowers"];
	static public var limitedItemCounts:Array<Int> = [1,1, 1, 1];
	//static public var Names:Map<String, Int> = ["Sake" => 0, "Tea" => 0, "Ink" => 0, "Arranged Flowers" => 0];
	
	// The list of unlimited items
	static public var unlimitedItemNames:Array<String> = ["German Pen", "Famous Katana", "Chinese Tea Pot", "Kimono", "Japanese Fan", "Mythic Shamisen"];
	static public var unlimitedItemCounts:Array<Int> = [0, 0, 0, 0, 0, 0];
	
	// Stop all update actions when a UI is active
	static public var pauseUI:Bool = false;
		
	//The favorability of three NPC 1-10
	static public var npc1:Int = 5;
	static public var npc2:Int = 5;
	static public var npc3:Int = 5;
	//Dialogue NPC has talked
	static public var npc1HasTalk:Array<Int> = [];
	static public var npc2HasTalk:Array<Int> = [];
	static public var npc3HasTalk:Array<Int> = [];
	
	//Info
	static public var info:Bool = false;
	
}