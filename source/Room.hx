package;

import flixel.FlxObject;

/**
 * For room overlaps
 * @author Christian
 */
class Room extends FlxObject {
	
	public function new(X:Float, Y:Float) {
		super(X, Y);
		setSize(128, 128);
	}
}