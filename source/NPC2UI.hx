package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC2UI extends DialogueTemplate 
{
	var dialogueChoose:Int;
	var random:FlxRandom;
	public var finishTalking:Bool = false;
	var finishChecking:Bool = false;
	override public function new() 
	{	
		textContent = ["","It is not flower that brings the victory.  .","The moon, the wind, the night a dancing young girl and a predator from the dark hides.","The strings can always bring me back to my hometown among the mountains.","What is this mess on this piece of paper.","Why people all like the bitter taste tree leaves?","The canary singing in a cage is never as pleasing as the eagle howling over the Fuji."];
		nameContent = ["Musashi"];
		textChoice1Content = [];
		textChoice2Content = [];
		textChoice3Content = [];
		random = new FlxRandom();
		dialogueChoose = random.int(1, 6, Storage.npc2HasTalk);
		textContent[0] = textContent[dialogueChoose];
		super();
		normalDialogue = false;
		finishChecking = false;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Storage.time == true){ //Morning
			text.text = textContent[0];
			if (textIndex >= 1){
				finishTalking = true;
				toggleHUD(false);
				Storage.npc2HasTalk.insert(0, dialogueChoose);

			}
		}
		else{
			if (finishChecking == false){
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
					Storage.npc2 += 1;
					textContent[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
					if (Storage.limitedItemCounts[1] > 0){
						Storage.limitedItemCounts[1] -= 1;
						Storage.npc2 += 1;
					}
				}
				case 2:{
					textContent[0] = "(leaving without saying anything)";
					Storage.npc2 -= 1;
				}
				case 3:{
					Storage.npc2 += 1;
					textContent[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
					if (Storage.limitedItemCounts[0] > 0){
						Storage.limitedItemCounts[0] -= 1;
						Storage.npc2 += 1;
					}
				}
			}
	}

}