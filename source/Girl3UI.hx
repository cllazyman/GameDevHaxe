package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class Girl3UI extends DialogueTemplate {
	var random:FlxRandom;
	public var finishTalking:Bool = false;

	override public function new() {	
		Texts = ["How can I help you?", "You want to hear me singing? Here? It is so embarrassing…","No! Never! Here is not a place to dance!","!", "Yoroshiku onegaishimasu"];
		Names = ["Kawako","Kawako","Kawako","Kawako","Kawako"];
		
		super();
		finishTalking = false;
		normalDialogue = true;
	}
	
	override public function update(elapsed:Float):Void {
		// Morning
		if (textIndex >= Texts.length){
			finishTalking = true;
			toggleHUD(false);
		}
		super.update(elapsed);
	}
}