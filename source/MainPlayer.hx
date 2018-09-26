package;

/**
 * The Main Character class
 * @author Christian
 */
class MainPlayer extends Player {
	public function new(X:Float, Y:Float, PType:Int) {
		super(X, Y, PType);
	}
	
	override public function update(elapsed:Float):Void {
		// Move if selected and alive
		/*if (!Storage.pauseUI) {
			if (selected && alive) {
				movement();
			}
		}*/
		super.update(elapsed);
	}
}