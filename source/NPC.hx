package;

import flixel.FlxSprite;


/**
 * The Base NPC class
 * @author Christian
 */
class NPC extends FlxSprite {
	// Differentiating npcs
	public var following:Bool = false;
	public var nType:Int;
	
	public function new(X:Float, Y:Float, NType:Int) {
		//Set values
		super(X, Y);
		nType = NType;
		
		// Set graphics
		loadGraphic("assets/images/npc" + nType + ".png", true, 27, 34);
		setSize(21, 24);
		offset.set(3, 5);
	}
	
	// Makes the npc face the target
	public function face(target:Player):Void {}
	
	// Set the NPC to follow the target
	public function setFollow(tar:Player):Void {}
	
	// Stops the NPC from moving
	public function stop():Void {}
	
	// Moves the npc to follow the target
	private function follow():Void {}
	
	// Performs Idle action
	private function idle():Void {}
}