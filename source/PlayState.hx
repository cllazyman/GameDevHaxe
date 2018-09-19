package;

import flixel.FlxState;

class PlayState extends FlxState {
	var _characterUI:CharacterUI;
	var _money:Int = 0;
	var _health:Int = 3;
	override public function create():Void {
		 _characterUI = new CharacterUI();
		add(_characterUI);
		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
