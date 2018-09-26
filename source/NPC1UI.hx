package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC1UI extends DialogueTemplate 
{
	var dialogueChoose:Int;
	var random:FlxRandom;
	public var finishTalking:Bool = false;
	var finishChecking:Bool = false;
	override public function new() {	
		Texts = ["","These colorful branches are massagers of spring..","Dancing? Such vulgar art. It does not match my nobility.","The tone of stream is not what a true Japanese like to hear. Only the echo of the tide hitting the shore should be appreciated.","Let the brush carry the ink, as water falls and cloud flies.","My friends all say that they can see their fate through a cup, but I never did.","Why singers just don’t know how to speak in a normal way?"];
		Names = ["Ugakima"];
		Choices1 = [];
		Choices2 = [];
		Choices3 = [];

		random = new FlxRandom();

		dialogueChoose = random.int(1, 6, Storage.npc1HasTalk);
		Texts[0] = Texts[dialogueChoose];
		super();
		normalDialogue = false;
		finishChecking = false;
	}
	override public function update(elapsed:Float):Void {
		if (Storage.time) { //Morning. 
			text.text = Texts[0];
			if (textIndex >= 1){
				toggleHUD(false);
				Storage.npc1HasTalk.insert(0, dialogueChoose);
				finishTalking = true;
			}
		} else {
			if (!finishChecking) {
				checkFavorite();
				finishChecking = true;
			}
			text.text = textContent[0];
			if (textIndex >= 1){
				toggleHUD(false);
				finishTalking = true;
			}
		}
		super.update(elapsed);
	}
	
	public function checkFavorite():Void{
		switch Storage.playerIndex{ //Night
				case 1:{	
					Storage.npc1 += 1;
					Texts[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
					if (Storage.limitedItemCounts[3] > 0){
						Storage.limitedItemCounts[3] -= 1;
						Storage.npc1 += 1;
					}
				}
				case 2:{
					Storage.npc1 += 1;
					Texts[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
					if (Storage.limitedItemCounts[2] > 0){
						Storage.limitedItemCounts[2] -= 1;
						Storage.npc1 += 1;
					}
				}	
				case 3:
					Texts[0] = "(leaving without saying anything)";
					Storage.npc1 -= 1;
			}
	}

}