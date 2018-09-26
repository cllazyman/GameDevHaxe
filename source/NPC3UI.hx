package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC3UI extends DialogueTemplate {
	var dialogueChoose:Int;
	var random:FlxRandom;
	public var finishTalking:Bool = false;
	var finishChecking:Bool = false;

	override public function new() {	
		Texts = ["","The blossom today, the dust tomorrow. Nothing is everlasting.","Dance is the only memory I… Nothing…","Music is just sometimes too beautiful to describe our tough life","Never know the secret between these hardly recognized handwriting","You can only know how sweet being alive is, after the tea passes your throat.","Voice of young woman, such a relief."];
		Names = ["Nagumo"];
		
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
				Storage.npc3HasTalk.insert(0, dialogueChoose);
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
				Texts[0] = "(Smoking and looking at the floor)Thank you, goodbye.";
				Storage.npc3 -= 1;
			case 2:
				Storage.npc3 += 1;
				Texts[0] = "(Smoking and looking at the sky)\nGoodbye, and see you tomorrow.";
				if (Storage.limitedItemCounts[1] > 0){
					Storage.limitedItemCounts[1] -= 1;
					Storage.npc3 += 1;
				}
			case 3:
				Storage.npc3 += 1;
				Texts[0] = "(Smoking and looking at the sky)\nGoodbye, and see you tomorrow.";
				if (Storage.limitedItemCounts[0] > 0){
					Storage.limitedItemCounts[0] -= 1;
					Storage.npc3 += 1;
				}
		}
	}
}