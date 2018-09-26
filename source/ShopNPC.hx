package;
import flixel.FlxObject;

/**
 * The Shopkeeper NPC
 * @author Christian
 */
class ShopNPC extends NPC {
	public function new(X:Float, Y:Float, NType:Int) {
		super(X, Y, NType);
		immovable = true;
	}
	
	// Makes the npc face the target
	override public function face(target:Player):Void {
		var dx:Float = target.x - x;
		var dy:Float = target.y - y;
		if (Math.abs(dx) > Math.abs(dy)) {
			if (dx < 0) {
				facing = FlxObject.LEFT;
			} else {
				facing = FlxObject.RIGHT;
			}
		} else {
			if (dy < 0) {
				facing = FlxObject.UP;
			} else {
				facing = FlxObject.DOWN;
			}
		}
	}
}