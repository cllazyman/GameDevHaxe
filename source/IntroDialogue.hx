package;


/**
 * The beginning of the story
 * @author Tony
 */

class IntroDialogue extends DialogueTemplate 
{
	
	override public function new() 
	{	
		
		_textContent = [];
		_nameContent = [];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		super();
		

	}
	public function chooseDialogue(Option:Int):Void{
		switch Option{
			case 1:{
				//Beginning
				_textContent = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister", "So what bring you here", "I just got another target and i am going to do what i have to",
				"It is not what you have to. How many times you want me to worry about you.", "Why dont you just quit", "Why DONT you just quit", "Why dont YOU just quit", "How can you simply let those disgusting man put their dirty hands on you!",
				"At least I am not risking my life!", "No you are not, and I have never heard of a Yujo who is 25 and still alive!", "You are already 23 now my sister", "After this, we would have enough money to live anywhere else.",
				"And the risk can make you killed anytime, right my brother?", "…", "I might not ever see you again", "So promise me, keep safe.", "I wont promise you unless you come back alive, Yukinoshin.",
				"That boy has died 15 years ago.", "Sayonara, Tachibana Shimotsuki sama."];
				_nameContent = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon", "Shimotsuki", "Nizaemon", "Shimotsuki", "Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon",
				"Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Shimotsuki", "Shimotsuki"];
			}
			case 2:{
				// 9.6
				_textContent = ["What is...", "I need some information.", "Oh, I didn't expect that.", "Do you ever heard of my brother?", "You have a brother?", "So you do know him.", "Who you think I am", "You know who he has been working for?", "A boss who doesn't like his minions to have family.", "Who is his next target?", "You.", "Is he a politician?",
				"You know, don't be so serious~","Is he a business man?","You think I would tell you?","So one of the old noble then?","Silent.","Okay I have to leave for other business,","A friendly advice, don't get involved.","But you told me anyway?","Because you reminded me of my sister...","Besides, I didn't tell you anything.","Which also means you don't have to pay.",
				"I owe you this time.", "If you do believe so."];
				_nameContent = ["Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Yamamoto", "Yamamoto", "Shimotsuki", "Yamamoto", "Yamamoto", "Yamamoto", "Shimotsuki", "Yamamoto"];
			}
			case 3:{
				// 9.7
				//"next to Shimotsuki"
				_textContent = ["I…I have some very urgent information", "We are in a big trouble!", "Please, calm down, both of you.", "Yamamoto San, you go first", "It is not fair!",
				"It is true", "If you think what you was about to say  is more important, please go ahead.", "…", "The Sato who made a contract with you earlier", "Has moved to Tokyo", "That is what I was about to say!",
				"It seems I can read your mind Kawako.", "(About to cry)", "Please don’t do that sir.", "What… sorry", "So this is the address of a shop you can buy everything you need from.", "How much you get from them",
				"Just two… Oh, nothing I mean.", "Guroguro…", "Is that one of the…", "It is true…"];
				_nameContent = ["Yamamoto", "Kawako", "Shimotsuki", "Shimotsuki", "Kawako", "Setsuko", "Yamamoto", "Kawako", "Yamamoto", "Yamamoto", "Kawako", "Yamamoto", "Kawako", "Tsuruko", "Yamamoto", "Yamamoto", "Shimotsuki", "Yamamoto", "Tsuruko", "Kawako", "Setsuko"];
			}
			case 4:{
				// 9.13
				_textContent = ["Why is it usually white?", "The snow never stopped", "But today it is red then", "Because...", "Because the flake is red"];
				_nameContent = ["Kawako", "Shimotsuki", "Tsuruko", "Shimotsuki", "Nizaemon"];
			}
				
		}
			
		
		
		
		
		
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
	
	
}