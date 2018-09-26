package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC2UI extends DialogueTemplate {
	var dialogueChoose:Int;
	var random:FlxRandom;
	public var finishTalking:Bool = false;
	var finishChecking:Bool = false;

	override public function new() {
		Texts = ["","It is not flower that brings the victory.  .","The moon, the wind, the night a dancing young girl and a predator from the dark hides.","The strings can always bring me back to my hometown among the mountains.","What is this mess on this piece of paper.","Why people all like the bitter taste tree leaves?","The canary singing in a cage is never as pleasing as the eagle howling over the Fuji."];
		Names = ["Musashi"];
		Choices1 = [];
		Choices2 = [];
		Choices3 = [];
		
		random = new FlxRandom();
		
		if (Storage.time) {
    		dialogueChoose = random.int(1, 6, Storage.npc2HasTalk);
    		Texts[0] = Texts[dialogueChoose];
		}
		super();
		finishTalking = false;
		normalDialogue = false;
		finishChecking = false;
	}
	
	override public function update(elapsed:Float):Void {
		// Morning
		if (Storage.time) {
			textContent.text = Texts[0];
			if (textIndex >= 1){
				toggleHUD(false);
				Storage.npc2HasTalk.insert(0, dialogueChoose);
				finishTalking = true;
			}
		// Night
		} else {
			if (!finishChecking) {
				checkFavorite();
				finishChecking = true;
			}
			textContent.text = Texts[0];
			if (textIndex >= 1){
				toggleHUD(false);
				finishTalking = true;
			}
		}
		super.update(elapsed);
	}
	
	public function checkFavorite():Void {
		// Night
		switch Storage.playerIndex {
			case 1:
				Storage.npc2 += 1;
				Texts[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
				if (Storage.limitedItemCounts[1] > 0){
					Storage.limitedItemCounts[1] -= 1;
					Storage.npc2 += 1;
				}
			case 2:
				Texts[0] = "(leaving without saying anything)";
				Storage.npc2 -= 1;
			case 3:
				Storage.npc2 += 1;
				Texts[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
				if (Storage.limitedItemCounts[0] > 0){
					Storage.limitedItemCounts[0] -= 1;
					Storage.npc2 += 1;
				}
		}
	}

}