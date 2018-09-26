package;

import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Christian
 */
class Room extends FlxObject {
	// Differentiating players
	public var rType:Int;
	
	public function new(X:Float, Y:Float, RType:Int) {
		super(X, Y);
		rType = RType;
		setSize(128, 128);
	}
}