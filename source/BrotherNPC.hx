package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxPoint;

/**
 * The Brother NPC
 * @author Christian
 */
class BrotherNPC extends NPC {
	// Idle AI
	private var idleTimer:Float = 0;
	private var direction:Float = 0;

	public function new(X:Float, Y:Float, NType:Int) {
		super(X, Y, NType);
		
		// Set movement
		drag.x = drag.y = 1600;
	}
	
	override public function update(elapsed:Float):Void {
		if (!Storage.pauseUI) {
			idle();
		}
		super.update(elapsed);
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
	
	// Performs Idle action
	override private function idle():Void {
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