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
		FlxG.sound.play(AssetPaths.night__ogg);
		_introDialogue = new IntroDialogue();
		_transition = new Transitions();
		switch Storage.Day{
			case 0:{
				_introDialogue.chooseDialogue(1);
				add(_introDialogue);
				_introDialogue.toggleHUD(true);
			}
		}
		super.create();
	}
	
	override public function update(elapsed:Float):Void {
		switch Storage.Day{
			case 0:{ //Begininng of the story
				if (_introDialogue.active == false){
					if (_transitionAct == false){ //act transition
						_transitionAct = true;
						_transition.chooseTrasition(1);
						_transition.toggleHUD(true);
						add(_transition);
					}
					if (_transition.active == false){ //Move to next scene
						FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
						FlxG.switchState(new MorningState());
						});
						_transitionAct = false;
						Storage.Day += 1;
					}
				}
			}
				
		}
		
		super.update(elapsed);
	}
}
