package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

/**
 *  [shimotsuki, tsuruko, setsuko, kawako]
 * Sake, Tea, Ink, Arranged Flowers
 * German Pen,Famous Katana, Chinese Tea Pot, Kimono, Japanese Fan, Mythic Shamisen
 * @author Christian
 */
class Player extends FlxSprite {
	// Initialize variables
	private var pType:Int;
	public var actionBox:FlxObject;
	public var selected:Bool = false;
	public var limitedItems:Map<String, Int>;
	public var unlimitedItems = ["German Pen", "Famous Katana", "Chinese Tea Pot", "Kimono", "Japanese", "Mythic Shamisen"];

	public function new(X:Float, Y:Float, PType:Int) {
		//Set variables
		super(X, Y);
		pType = PType;
		immovable = true;
		alpha = 0.75;
		
		// Set graphics
		loadGraphic("assets/images/player" + pType + ".png", true, 27, 33);
		animation.add("d", [0, 1], 6, false);
		animation.add("l", [2, 3], 6, false);
		animation.add("r", [4, 5], 6, false);
		animation.add("u", [6, 7], 6, false);
		
		// Set movement
		drag.x = drag.y = 1600;
		
		// Set collisions and actions
		setSize(21, 23);
		offset.set(3, 5);
		actionBox = new FlxObject(x-13, y-15, 47, 53);
		
		limitedItems = ["Sake" => 0, "Tea" => 1, "Ink" => 2, "Arranged Flowers" => 3];
	}
	
	override public function update(elapsed:Float):Void {
		if (selected && alive) {
			movement();
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
	public function isSelected(select:Bool): Void {
		selected = select;
		immovable = !select;
		if (select) {
			alpha = 1;
		} else {
			alpha = 0.75;
		}
	}
	
	// Set player to values when inactive
	public function setInactive(): Void {
		selected = false;
		alive = false;
		alpha = 0.5;
		solid = false;
	}
}