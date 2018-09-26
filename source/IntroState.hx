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
		Storage.Day += 1;
		Storage.money += Std.int(3300 * (Math.pow(1.2, Storage.npc1) + Math.pow(1.2, Storage.npc2) + Math.pow(1.2, Storage.npc3)));
		FlxG.sound.play(AssetPaths.night__ogg);
		introDialogue = new IntroDialogue();
		transition = new Transitions();
		if (Storage.Day <= 5){
			introDialogue.chooseDialogue(Storage.Day);
			introDialogue.toggleHUD(true);
			add(introDialogue);
		} else {
			if (Storage.info) {
				//Good end means Day6
				introDialogue.chooseDialogue(Storage.Day);
				introDialogue.toggleHUD(true);
				add(introDialogue);
			} else {
				//Bad end means Day7
				Storage.Day += 1;
				introDialogue.chooseDialogue(Storage.Day);
				introDialogue.toggleHUD(true);
				add(introDialogue);
			}
		}
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void {
		if (introDialogue.finishDialoge) {
				if (Storage.Day <= 5) {
					FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
					FlxG.switchState(new MorningState());
					});
				} else {
					if (Storage.Day == 6) {
						FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
						FlxG.switchState(new GoodEndingState());
						});
					} else {
						FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
						FlxG.switchState(new BadEndingState());
						});
					}
				}
			}
		super.update(elapsed);
	}
}
