package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class Girl1UI extends DialogueTemplate {
	var random:FlxRandom;
	public var finishTalking:Bool = false;

	override public function new() {	
		Texts = ["Do you need anything?, Tachibana sama?", "Did I made a mistake?", "Do you want a cup of tea?", "Su…Sumimasen", "?"];
		Names = ["Tsuruko","Tsuruko","Tsuruko","Tsuruko","Tsuruko"];
		
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