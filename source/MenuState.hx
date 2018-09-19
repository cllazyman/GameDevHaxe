package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class MenuState extends FlxState {
	var _btnPlay:FlxButton;
	
	override public function create():Void {
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		add(_btnPlay);
		super.create();
		FlxG.sound.play(AssetPaths.jazz2__ogg);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	function clickPlay():Void {
		FlxG.switchState(new PlayState());
	}
}