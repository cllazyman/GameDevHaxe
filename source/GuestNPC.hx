package;
import flixel.FlxObject;
import flixel.math.FlxMath;
import flixel.math.FlxVelocity;

/**
 * The Guest NPCs
 * @author Christian
 */
class GuestNPC extends NPC {
	// Follow AI
	private var following:Bool = false;
	private var target:Player;
	
	public function new(X:Float, Y:Float, NType:Int) {
		super(X, Y, NType);
		// Set collisions
		immovable = true;
		
		// Set animations
		animation.add("d", [0, 1], 6, false);
		animation.add("l", [2, 3], 6, false);
		animation.add("r", [4, 5], 6, false);
		animation.add("u", [6, 7], 6, false);
		
		// Set movement
		drag.x = drag.y = 1600;
	}
	
	override public function update(elapsed:Float):Void {
		if (!Storage.pauseUI && following) {
			follow();
		}
		super.update(elapsed);
	}
	
	// Set the NPC to follow the target
	override public function setFollow(tar:Player):Void {
		target = tar;
		immovable = false;
		following = true;
	}
	
	// Moves the npc to follow the target
	override private function follow():Void {
		if (FlxMath.distanceBetween(this, target) > 25) {
			FlxVelocity.moveTowardsPoint(this, target.getMidpoint(), 200);
			// Change directions based off velocity
			if (Math.abs(velocity.x) > Math.abs(velocity.y)) {
				if (velocity.x < 0) {
					facing = FlxObject.LEFT;
				} else {
					facing = FlxObject.RIGHT;
				}
			} else {
				if (velocity.y < 0) {
					facing = FlxObject.UP;
				} else {
					facing = FlxObject.DOWN;
				}
			}
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
}