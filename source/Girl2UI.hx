package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class Girl2UI extends DialogueTemplate {
	var random:FlxRandom;
	public var finishTalking:Bool = false;

	override public function new() {	
		Texts = ["…", "Tachibana sama…", "This is my work Tachibana sama…", "Don’t touch it! I mean… please don’t touch my shamisen", "Gomenasai…"];
		Names = ["Setsuko","Setsuko","Setsuko","Setsuko","Setsuko"];
		
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