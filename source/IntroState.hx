package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;


class IntroState extends FlxState {
	var _introDialogue:IntroDialogue;
	var _transition:Transitions;

	override public function create():Void {
		FlxG.sound.play(AssetPaths.night__ogg);
		_introDialogue = new IntroDialogue();
		_introDialogue.chooseDialogue(1);
		_transition = new Transitions(1);
		add(_introDialogue);
		super.create();
	}
	
	override public function update(elapsed:Float):Void {
		if (_introDialogue.visible == false){
			add(_transition);
			if (_transition.visible == false){
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
				FlxG.switchState(new MorningState());
			});
			}
			
		}
		super.update(elapsed);
	}
}
