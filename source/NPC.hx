package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Christian
 */
class NPC extends FlxSprite {
	public var speed:Float = 200;
	public var ntype(default, null):Int;
	public var playerPos(default, null):FlxPoint;

	public function new(X:Float=0, Y:Float=0, NType:Int) {
		super(X, Y);
		ntype = NType;
		loadGraphic("assets/images/enemy-" + ntype + ".png", true, 16, 16);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("d", [0, 1, 0, 2], 6, false);
		animation.add("lr", [3, 4, 3, 5], 6, false);
		animation.add("u", [6, 7, 6, 8], 6, false);
		drag.x = drag.y = 1600;
		setSize(8, 14);
		offset.set(4, 2);
		playerPos = FlxPoint.get();
		
	}

	override public function draw():Void {
		if ((velocity.x != 0 || velocity.y != 0 ) && touching == FlxObject.NONE) {
			if (Math.abs(velocity.x) > Math.abs(velocity.y)) {
				if (velocity.x < 0)
					facing = FlxObject.LEFT;
				else
					facing = FlxObject.RIGHT;
            } else {
				if (velocity.y < 0)
					facing = FlxObject.UP;
				else
					facing = FlxObject.DOWN;
            }
			
			switch (facing) {
				case FlxObject.LEFT, FlxObject.RIGHT:
					animation.play("lr");
				case FlxObject.UP:
					animation.play("u");
				case FlxObject.DOWN:
					animation.play("d");
			}
		}
		super.draw();
	}
}