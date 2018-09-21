package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;


/**
 * ...
 * @author Christian
 */
class Player extends FlxSprite {
	public var speed:Float = 200;

	public function new(?X:Float=0, ?Y:Float=0) {
		super(X, Y);
		loadGraphic(AssetPaths.player__png, true, 16, 16);
		setSize(8, 14);
		offset.set(4, 2);
		//animation.add("lr", [3, 4, 3, 5], 6, false);
		//animation.add("u", [6, 7, 6, 8], 6, false);
		//animation.add("d", [0, 1, 0, 2], 6, false);
		
		// Set movement
		drag.x = drag.y = 1600;
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		
		// Set actions
		actionBox = new FlxObject(x, y, 12, 18);
	}
	
	override public function update(elapsed:Float):Void {
		if (selected && alive) {
			movement();
		}
		super.update(elapsed);
	}
	
	// Moves the player on keyboard input
	private function movement():Void {
		// Set movement bools
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		
		if (_up || _down || _left || _right) {
			var mA:Float = 0; // our temporary angle
			if (_up) { // the player is pressing UP
				mA = -90; // set our angle to -90 (12 o'clock)
				if (_left)
					mA -= 45; // if the player is also pressing LEFT, subtract 45 degrees from our angle - we're moving up and left
				else if (_right)
					mA += 45; // similarly, if the player is pressing RIGHT, add 45 degrees (up and right)
				facing = FlxObject.UP; // the sprite should be facing UP
			} else if (_down) { // the player is pressing DOWN
				mA = 90; // set our angle to 90 (6 o'clock)
				if (_left)
					mA += 45; // add 45 degrees if the player is also pressing LEFT
				else if (_right)
					mA -= 45; // or subtract 45 if they are pressing RIGHT
				facing = FlxObject.DOWN; // the sprite is facing DOWN
			} else if (_left) { // if the player is not pressing UP or DOWN, but they are pressing LEFT
				mA = 180; // set our angle to 180 (9 o'clock)
				facing = FlxObject.LEFT; // the sprite should be facing LEFT
			} else if (_right) { // the player is not pressing UP, DOWN, or LEFT, and they ARE pressing RIGHT
				mA = 0; // set our angle to 0 (3 o'clock)
				facing = FlxObject.RIGHT; // set the sprite's facing to RIGHT
			}
			// determine our velocity based on angle and speed
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);

			if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) {
				// if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
				switch (facing) {
					case FlxObject.LEFT, FlxObject.RIGHT:
						animation.play("lr");
					case FlxObject.UP:
						animation.play("u");
					case FlxObject.DOWN:
						animation.play("d");
				}
			}
		}
	}
	
	// Set player to values when selected
	public function setSelected(select:Bool, immov:Bool): Void {
		selected = select;
		immovable = immov;
	}
	
	// Set player to values when inactive
	public function setInactive(): Void {
		selected = false;
		alive = false;
		immovable = true;
	}
}