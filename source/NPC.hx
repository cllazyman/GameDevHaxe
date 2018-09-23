package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;

/**
 * ...
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
		loadGraphic("assets/images/player" + nType + ".png", true, 27, 33);
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
		super.update(elapsed);
		if (following) {
			follow();
		}
	}
	
	public function setFollow(tar:Player):Void {
		target = tar;
		immovable = false;
		following = true;
	}
	
	// Moves the npc to follow the target
	private function follow():Void {
		// NPC can be moved through
		var posx:Float = target.x;
		var posy:Float = target.y;
		var point:FlxPoint = new FlxPoint(posx, posy);	
		var xDiff:Float = Math.abs(x) - Math.abs(posx);
		var yDiff:Float = Math.abs(y) - Math.abs(posy);
		// Stop before touching the player
		if(Math.abs(xDiff) > target.width + 2 || Math.abs(yDiff) > target.height + 2){
			FlxVelocity.moveTowardsPoint(this, point, 200, 500);
			// Change directions based off velocity
			if (Math.abs(xDiff) > Math.abs(yDiff))
			{
				if (xDiff < 0)
				{
					facing = FlxObject.RIGHT;
				}
				else if (xDiff > 0)
				{
					facing = FlxObject.LEFT;
				}
			}
			else if (Math.abs(xDiff) < Math.abs(yDiff))
			{
				if (target.y > y)
				{
					facing = FlxObject.DOWN;
				}
				else 
				{
					facing = FlxObject.UP;
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
		/*// Get key inputs
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
		//collisionBox.setPosition(x, y+23);
		actionBox.setPosition(x, y);*/
	}
}