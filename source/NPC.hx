package;

import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Christian
 */
class NPC extends FlxSprite {
	// Initialize variables
	private var nType:Int;
	private var speed:Float = 200;

	public function new(X:Float = 0, Y:Float = 0, NType:Int) {
		//Set values
		super(X, Y);
		nType = NType;
		immovable = true;
		
		// Set graphics
		loadGraphic("assets/images/enemy-" + nType + ".png", true, 16, 16);
		setSize(8, 14);
		offset.set(4, 2);
		
		// Set movement
		drag.x = drag.y = 1600;
	}
	
	override public function update(elapsed:Float):Void {
		movement();
		super.update(elapsed);
	}
	
	private function movement():Void {
		/*// Set movement bools
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		
		// Get key inputs
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		
		// Cancel input if two opposite keys pressed
		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;
		
		// Calculate angle and velocity
		if (up || down || left || right) {
			var mA:Float = 0;
			if (up) {
				mA = -90;
				if (left) {
					mA -= 45;
				} else if (right) {
					mA += 45;
				}
				facing = FlxObject.UP;
			} else if (down) {
				mA = 90;
				if (left) {
					mA += 45;
				} else if (right) {
					mA -= 45;
				}
				facing = FlxObject.DOWN;
			} else if (left) {
				mA = 180;
				facing = FlxObject.LEFT;
			} else if (right) {
				mA = 0;
				facing = FlxObject.RIGHT;
			}

			// Determine the velocity based on angle and speed
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
			
		}
		actionBox.setPosition(x, y);*/
	}
}