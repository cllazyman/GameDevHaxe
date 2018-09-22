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
	// Initialize variables
	private var pType:Int;
	private var speed:Float = 200;
	public var actionBox:FlxObject;
	public var selected:Bool = false;

	public function new(X:Float, Y:Float, PType:Int) {
		//Set variables
		super(X, Y);
		pType = PType;
		immovable = true;
		
		// Set graphics
		loadGraphic(AssetPaths.mc__png, true, 27, 33);
		setSize(27, 10);
		offset.set(0, 23);
		
		animation.add("d", [0, 1], 6, false);
		animation.add("l", [2, 3], 6, false);
		animation.add("r", [4, 5], 6, false);
		animation.add("u", [6, 7], 6, false);
		
		// Set movement
		drag.x = drag.y = 1600;
		
		// Set actions
		actionBox = new FlxObject(x, y, 30, 40);
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
			
			// Change the face
			if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) {
				switch (facing) {
					case FlxObject.LEFT:
						animation.play("l");
					case FlxObject.RIGHT:
						animation.play("r");
					case FlxObject.UP:
						animation.play("u");
					case FlxObject.DOWN:
						animation.play("d");
				}
			}
		}
		actionBox.setPosition(x, y);
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