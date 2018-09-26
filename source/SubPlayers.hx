package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxPoint;

/**
 * The controllable Sub Character class
 * @author Christian
 */
class SubPlayers extends Player {
	// Selection
	private var selected:Bool = false;
	
	// Actions
	public var actionBox:FlxObject;
	
	
	public function new(X:Float, Y:Float, PType:Int) {
		super(X, Y, PType);
		alpha = 0.75;
		
		// Actions
		actionBox = new FlxObject(x-13, y-15, 47, 53);
	}
	
	override public function update(elapsed:Float):Void {
		// Move if selected and alive
		if (!Storage.pauseUI && selected && alive) {
			movement();
		}
		super.update(elapsed);
	}
	
	// Moves the player on keyboard input
	override private function movement():Void {
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
	override public function isSelected(select:Bool): Void {
		selected = select;
		immovable = !select;
		if (select) {
			alpha = 1;
		} else if (alive) {
			alpha = 0.75;
		}
	}
	
	// Set player to inactive
	override public function setInactive(): Void {
		selected = false;
		alive = false;
		alpha = 0.5;
		solid = false;
	}
}