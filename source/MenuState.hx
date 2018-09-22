package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState {
	var _btnPlay:FlxButton;
	
	override public function create():Void {
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		_btnPlay.onDown.sound = FlxG.sound.load(AssetPaths.ButtonClickSFX__ogg);
		_btnPlay.onUp.sound = FlxG.sound.load(AssetPaths.ButtonClickSFX2__ogg);
		add(_btnPlay);
		super.create();
		FlxG.sound.play(AssetPaths.i_ahte_jaz__ogg);
		add(new FlxText(14, 14, 100, "Hello World!"));
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	function clickPlay():Void {
		FlxG.switchState(new MorningState());
	}
}