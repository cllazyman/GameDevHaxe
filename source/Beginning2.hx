package;

/**
 * The beginning of the story
 * @author Tony
 */

class Beginning2 extends DialogueTemplate {
	
	// ** These are the sprites that we will use to show the combat hud interface
	
	override public function new() {
		Texts = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister"];
		Names = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		Choices1 = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		Choices2 = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		Choices3 = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		super();
		

	}
	override public function update(elapsed:Float):Void {
			// check to see any keys are pressed and set the cooresponding flags.
			if (textIndex == 0){
				isMakingChoice = true;
				setChoiceVisible(true);
				if (choiceMake != 0 ){
					textIndex = 3;
					textContent.text = textContent.text = choiceMake+"  " + FlxG.mouse.screenX +"  " + FlxG.mouse.screenY;
					nameContent.text = Names[textIndex];
					setChoiceVisible(false);
					choiceMake = 0;
					isMakingChoice = false;
				}			
			}
			if (textIndex == 4){
				//doneResultsIn(_sprText);
				//doneResultsIn(_sprName);
			}	
			
			
			
			
			
			
		super.update(elapsed);
		
	
	}
	override public function setChoiceVisible(Visible:Bool):Void{

		super.setChoiceVisible(Visible);
	}
}