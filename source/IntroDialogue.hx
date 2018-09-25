package;


/**
 * The beginning of the story
 * @author Tony
 */

class IntroDialogue extends DialogueTemplate 
{
	
	override public function new() 
	{	
		_textContent = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister", "So what bring you here", "I just got another target and i am going to do what i have to",
		"It is not what you have to. How many times you want me to worry about you.", "Why dont you just quit", "Why DONT you just quit", "Why dont YOU just quit", "How can you simply let those disgusting man put their dirty hands on you!",
		"At least I am not risking my life!", "No you are not, and I have never heard of a Yujo who is 25 and still alive!", "You are already 23 now my sister", "After this, we would have enough money to live anywhere else.",
		"And the risk can make you killed anytime, right my brother?", "…", "I might not ever see you again", "So promise me, keep safe.", "I wont promise you unless you come back alive, Yukinoshin.",
		"That boy has died 15 years ago.", "Sayonara, Tachibana Shimotsuki sama."];
		_nameContent = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon", "Shimotsuki", "Nizaemon", "Shimotsuki", "Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon",
		"Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Shimotsuki", "Shimotsuki"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		super();
		

	}
	override public function update(elapsed:Float):Void 
	{	
		// check to see any keys are pressed and set the cooresponding flags.
		if (_textIndex == _textContent.length-1){
			doneResultsIn(_sprText);
			doneResultsIn(_sprName);
		}	
		super.update(elapsed);
	}
		override public function setChoiceVisible(Visible:Bool):Void{

		super.setChoiceVisible(Visible);
	}
}