package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;


class IntroState extends FlxState {
	var _introDialogue:IntroDialogue;
	var _transition:Transitions;
	var _transitionAct:Bool = false;

	override public function create():Void {
		FlxG.sound.play(AssetPaths.night__ogg);
		_introDialogue = new IntroDialogue();
		_transition = new Transitions();
		_introDialogue.chooseDialogue(1);
		_introDialogue.toggleHUD(true);
		add(_introDialogue);
		super.create();
	}
	
	override public function update(elapsed:Float):Void {
		if (_introDialogue.active == false){
			if (_transitionAct == false){
				_transition.chooseTrasition(1);
				_transition.toggleHUD(true);
				add(_transition);
				_transitionAct = true;
			}
			if (_transition.active == false){
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
				FlxG.switchState(new MorningState());
			});
			}
			
		}
		super.update(elapsed);
	}
}
