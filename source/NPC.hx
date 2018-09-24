package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxVelocity;

/**
 * [shop, intel, brother, mA, mB, mC]
 * @author Christian
 */
class NPC extends FlxSprite {
	// Initialize variables
	private var nType:Int;
	private var speed:Float = 200;
	public var target:Player;
	private var following:Bool = false;

	public function new(X:Float = 0, Y:Float = 0, NType:Int) {
		//Set values
		super(X, Y);
		nType = NType;
		immovable = true;
		
		// Set graphics
		loadGraphic("assets/images/npc" + nType + ".png", true, 27, 34);
		animation.add("d", [0, 1], 6, false);
		animation.add("l", [2, 3], 6, false);
		animation.add("r", [4, 5], 6, false);
		animation.add("u", [6, 7], 6, false);
		setSize(21, 23);
		offset.set(3, 5);
		
		// Set movement
		drag.x = drag.y = 1600;
	}
	
	override public function update(elapsed:Float):Void {
		if (following) {
			follow();
		}
		super.update(elapsed);
	}
	
	public function setFollow(tar:Player):Void {
		target = tar;
		immovable = false;
		following = true;
	}
	
	// Moves the npc to follow the target
	private function follow():Void {
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