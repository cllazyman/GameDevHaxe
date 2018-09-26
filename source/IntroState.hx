package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import Storage;


class IntroState extends FlxState {
	var introDialogue:IntroDialogue;  //Dialogues. They have sprBack
	var transition:Transitions;		//Transitions. They don't have sprBack
	
	var transitionAct:Bool = false;	//Whether transition has acted

	override public function create():Void {
		Storage.Day++;
		FlxG.sound.play(AssetPaths.night__ogg);
		introDialogue = new IntroDialogue();
		transition = new Transitions();
		introDialogue.chooseDialogue(Storage.Day);
		introDialogue.toggleHUD(true);
		introDialogue.setChoiceVisible(false);
		add(introDialogue);
		super.create();
	}
	
	override public function update(elapsed:Float):Void {
		if (introDialogue.finishDialogue) {
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
				FlxG.switchState(new MorningState());
			});
		}
		super.update(elapsed);
	}
}
