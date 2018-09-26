package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import Storage;


class IntroState extends FlxState {
	var _introDialogue:IntroDialogue;  //Dialogues. They have sprBack
	var _transition:Transitions;		//Transitions. They don't have sprBack
	
	var _transitionAct:Bool = false;	//Whether transition has acted

	override public function create():Void {
		Storage.Day += 1;
		FlxG.sound.play(AssetPaths.night__ogg);
		_introDialogue = new IntroDialogue();
		_transition = new Transitions();
		//_introDialogue.chooseDialogue(Storage.Day+1);
		//add(_introDialogue);
		//_introDialogue.toggleHUD(true);

		
				_introDialogue.chooseDialogue(Storage.Day);
				_introDialogue.toggleHUD(true);
				add(_introDialogue);
			

		super.create();
	}
	
	
	override public function update(elapsed:Float):Void {
		if (_introDialogue._finishDialoge==true){
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
				FlxG.switchState(new MorningState());
				});
				
			}
		
		
		
		super.update(elapsed);
	}
}
