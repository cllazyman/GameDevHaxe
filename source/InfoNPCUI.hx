package;
import flixel.FlxG;



/**
 * The beginning of the story
 * @author Tony
 */
class InfoNPCUI extends DialogueTemplate 
{
	public var finishTalking:Bool = false;
	var finishChecking:Bool = false;
	override public function new() {
		normalDialogue = false;
		Texts = ["If you do have enough money(150000 G), I can save your brother"];
		Names = ["Yamamoto"];
		if (Storage.info) {
			Texts[0] = "I am sure your brother will be safe";
		}
		super();
		
	}
	override public function update(elapsed:Float):Void {
		textContent.text = Texts[0];
		if (FlxG.keys.anyJustReleased([SPACE,ENTER])){
			if (Storage.info == true || textIndex >1){
				storage.pauseUI = false;
				toggleHUD(false);
			}
			else if (Storage.money > 18000){
				Storage.pauseUI = true;
				Storage.money -= 18000;
				Storage.info = true;
				Texts[0] = "I am sure brother will be safe";
				textIndex += 1;
			}
			else{
				Texts[0] = "You don't have enough money.";
				toggleHUD(false);
			}
		
			
		
		}
	}
}
	