package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;

/**
 * [shop, intel, brother, mA, mB, mC]
 * @author Christian
 */
class NPC extends FlxSprite {
	// Differentiating npcs
	public var nType:Int;
	
	// Follow AI
	private var following:Bool = false;
	private var target:Player;
	
	// Idle AI
	private var idleTimer:Float = 0;
	private var direction:Float = 0;

	public function new(X:Float, Y:Float, NType:Int) {
		//Set values
		super(X, Y);
		nType = NType;
		
		// Set graphics
		loadGraphic("assets/images/npc" + nType + ".png", true, 27, 34);
		animation.add("d", [0, 1], 6, false);
		animation.add("l", [2, 3], 6, false);
		animation.add("r", [4, 5], 6, false);
		animation.add("u", [6, 7], 6, false);
		setSize(21, 24);
		offset.set(3, 5);
		
		// Set movement
		drag.x = drag.y = 1600;
	}
	
	override public function update(elapsed:Float):Void {
		if (!Storage.pauseUI) {
			if (nType == 1 || nType == 2) {
				idle();
			}
			if (following) {
				follow();
			}
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
	
	// Performs Idle action
	private function idle():Void {
		if (idleTimer <= 0) {
			if (FlxG.random.bool(1)) {
				direction = -1;
				velocity.x = velocity.y = 0;
			} else {
				direction = FlxG.random.int(0, 8) * 45;
				velocity.set(200, 0);
				velocity.rotate(FlxPoint.weak(), direction);
			}
			idleTimer = FlxG.random.int(1, 4);            
		} else {
			idleTimer -= FlxG.elapsed;
		}
	}
}