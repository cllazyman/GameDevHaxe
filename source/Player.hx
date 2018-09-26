package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

/**
 * The controllable character class
 * @author Christian
 */
class Player extends FlxSprite {
	// Differentiating players
	public var pType:Int;

	// Selection
	private var selected:Bool = false;
	
	// Actions
	public var actionBox:FlxObject;
	
	public function new(X:Float, Y:Float, PType:Int) {
		// Variables
		super(X, Y);
		pType = PType;
		immovable = true;
		alpha = 0.75;
		
		// Add graphics
		loadGraphic("assets/images/player" + pType + (Storage.time ? "" : "_night") + ".png", true, 27, 33);
		setSize(21, 23);
		offset.set(3, 5);
		
		// Add animations
		animation.add("d", [0, 1], 6, false);
		animation.add("l", [2, 3], 6, false);
		animation.add("r", [4, 5], 6, false);
		animation.add("u", [6, 7], 6, false);
		
		// Movement
		drag.x = drag.y = 1600;
		
		// Actions
		actionBox = new FlxObject(x-13, y-15, 47, 53);
	}
	
	override public function update(elapsed:Float):Void {
		// Move if selected and alive
		if (!Storage.pauseUI) {
			if (selected && alive) {
				movement();
			}
		}
		super.update(elapsed);
	}
	
	// Moves the player on keyboard input
	private function movement():Void {
		// Get key inputs
		var up:Bool = FlxG.keys.anyPressed([UP, W]);
		var down:Bool = FlxG.keys.anyPressed([DOWN, S]);
		var left:Bool = FlxG.keys.anyPressed([LEFT, A]);
		var right:Bool = FlxG.keys.anyPressed([RIGHT, D]);
		
		// Cancel input if two opposite keys pressed
		if (up && down) {
			up = down = false;
		}
		if (left && right) {
			left = right = false;
		}
		
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
				facing = FlxObject.RIGHT;
			}
			
			// Determine the velocity based on angle and speed
			velocity.set(200, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
			
			// Change the face
			if (velocity.x != 0 || velocity.y != 0) {
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
		// Update action box
		actionBox.setPosition(x-13, y-15);
	}
	
	// Set player to selected or not
	public function isSelected(select:Bool): Int {
		selected = select;
		immovable = !select;
		if (select) {
			alpha = 1;
		} else {
			alpha = 0.75;
		}
		return pType;
	}
	
	// Set player to inactive
	public function setInactive(): Void {
		selected = false;
		alive = false;
		alpha = 0.5;
		solid = false;
	}
}