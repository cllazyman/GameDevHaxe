package;


/**
 * The beginning of the story
 * @author Tony
 */
class IntroDialogue extends DialogueTemplate 
{
	private var dialogueIndex:Int;
	public var finishDialogue:Bool = false;

	override public function new() {
		Texts = [];
		Names = [];
		Choices1 = [];
		Choices2 = [];
		Choices3 = [];
		super();
	}

	public function chooseDialogue(Option:Int):Void{
		textIndex = 0;
		dialogueIndex = Option;
		switch dialogueIndex {
			case 1: {
				//Beginning
				_textContent = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Shimotsuki comes inside the room, walks to Nizaemon.","Sorry, you must been waiting for a while.", "I just arrived, my sister.", "What brings you here?", "I was given another name and I am going to do what I have to.","It is not what you have to. How many times you want me to worry about you.", "Why dont you just quit?", "Why DONT you just quit?", "Why dont YOU just quit?", "What you have done has dishonored the entire family!",
				"You are the only family I have and that is the way you think of me?","No, but you are selling your soul.", "At least I am not risking my life！","No you are not, and I have never heard of a Yujo who is 25 and still alive!", "You are already 23 now my sister.", "After this, we would have enough money to live anywhere else.",
				"And the risk can make you killed anytime, right my brother?", "…", "I might not ever see you again.", "So promise me, keep safe.", "Nizaemon walks towards the door.","I wont promise you unless you come back alive, Yukinoshin.",
				"That boy has died 15 years ago.", "Sayonara, Tachibana Shimotsuki sama." ,"The Next Day","What is...", "I need some information.", "Oh, I didn't expect that.", "Do you ever heard of my brother?", "You have a brother?", "So you do know him.", "Who you think I am", "You know who he has been working for?", "A boss who doesn't like his minions to have family.", "Who is his next target?", "You.", "Is he a politician?",
				"You know, don't be so serious~","Is he a business man?","You think I would tell you?","So one of the old noble then?","Silent.","Okay I have to leave for other business,","A friendly advice, don't get involved.","But you told me anyway?","Because you reminded me of my sister...","Besides, I didn't tell you anything.","Which also means you don't have to pay.",
				"I owe you this time.", "If you do believe so."];
				_nameContent = ["Nizaemon", "Nizaemon", "Nizaemon", "","Shimotsuki", "Nizaemon", "Shimotsuki", "Nizaemon", "Shimotsuki", "Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon","Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon",
				"Shimotsuki", "Nizaemon", "Nizaemon", "Nizaemon", "","Shimotsuki", "Nizaemon", "Nizaemon","","Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Shimotsuki", "Yamamoto", "Yamamoto", "Yamamoto", "Shimotsuki", "Yamamoto", "Yamamoto", "Yamamoto", "Shimotsuki", "Yamamoto"];
			}
			case 2:{
				// 9.7
				//"next to Shimotsuki"
				_textContent = ["I…I have some very urgent information.", "We are in a big trouble!", "Please, calm down, both of you.", "Yamamoto San, you go first.", "It is not fair!",
				"It is true.", "If you think what you was about to say  is more important, please go ahead.", "…", "The Sato who made a contract with you earlier,", "has moved to Tokyo.", "That is what I was about to say!",
				"It seems I can read your mind Kawako.", "(About to cry)", "Please don’t do that sir.", "What… sorry.", "So this is the address of a shop you can buy everything you need from.", "How much you get from them",
				"Just two… Oh, nothing I mean.", "Guroguro…", "Is that one of the…", "It is true…"];
				Names = ["Yamamoto", "Kawako", "Shimotsuki", "Shimotsuki", "Kawako", "Setsuko", "Yamamoto", "Kawako", "Yamamoto", "Yamamoto", "Kawako", "Yamamoto", "Kawako", "Tsuruko", "Yamamoto", "Yamamoto", "Shimotsuki", "Yamamoto", "Tsuruko", "Kawako", "Setsuko"];
			}
			case 3:{
				//9.8
				_textContent = ["It is still very hot though."," Do not say a word."," Do not say which word?","Nothing...","It's true...","Kawako?","(Smiling)","Okay, I will tell the truth.","Tsuruko caught a cold."," Very serious one.","Is that true?","(Smiling at Setsuko.)","It is also true.","Please…","You are not going to work today Tsuruko,","But…","You have to learn to take care of yourself.","Okay…","Go and have some rest, it is an order.","Yes ma'am.","(Shimotsuki leaving the room)","('Because there is one day that I'm no longer with you.')"];
				_nameContent = ["Kawako","Tsuruko","Shimotsuki","Kawako","Setsuko","Shimotsuki","Shimotsuki","Kawako","Kawako","Kawako","Shimotsuki","Shimotsuki","Setsuko","Tsuruko","Shimotsuki","Tsuruko","Shimotsuki","Tsuruko","Shimotsuki","Tsuruko","","Shimotsuki"];
	
			}
			case 4:{
				//9.9
				_textContent = ["What is this?","This is the lock on the safe!","Why is it here?","What about the safe?","It is empty..","It is true.","So it was a thief, not a cat.","Kawako, don’t be so upset.","That was only a small amount.","So we didn’t lose much?","No. I keep most of them in a safer place."," It is true."];
				_nameContent = ["Kawako","Tsuruko","Kawako","Tsuruko","Kawako","Setsuko","Shimotsuki","Shimotsuki","Shimotsuki","Kawako","Shimotsuki","Setsuko"];
	
			}
			case 5 :{
				//9.11
				_textContent = ["Borrowed for two days, sorry, here is the money and the interests.","What is this?","The money appear in the safe again,","with this note."," So it is a thief that returns money?","it is true.","It is so strange.","Anyway the money is back.","…","Tachibana Sama?","Nothing.","(Is it you again… but thank you anyway.)","(You are truly a good man, Yamamoto...)"];
				_nameContent = ["Tsuruko","Shimotsuki","Tsuruko","Tsuruko","Kawako","Setsuko","Tsuruko","Kawako","Shimotsuki","Kawako","Shimotsuki","Shimotsuki","Shimotsuki"];

			}
			case 6:{
				// GE
				_textContent = ["Why is it usually white?", "The snow never stopped.", "But today it is red then?", "Because...", "Because the flake is red."];
				_nameContent = ["Kawako", "Shimotsuki", "Tsuruko", "Shimotsuki", "Nizaemon"];
				
			}
			case 7:{
				//be
				_textContent = ["Why it is white?", "The snow never stopped.", "But yesterday it was red then?", "Because...", "The flake is red only today..."];
				_nameContent=["Kawako","Shimotsuki","Tsuruko","Shimotsuki","Shimotsuki"];
			}
			
				
		}	
	}
	override public function update(elapsed:Float):Void 
	{
		switch (dialogueIndex) {
			case 1:
				switch(textIndex) {
					case 3:
						setNameVisible(false);
					case 4:
						setNameVisible(true);
					case 23:
						setNameVisible(false);
					case 24:
						setNameVisible(true);
					case 27:
						setNameVisible(false);
					case 28:
						setNameVisible(true);
				}
			case 4:{
				switch (textIndex){
					case 20:
						setNameVisible(false);
					case 21:
						setNameVisible(true);
				}
			}
		}
		
		// check to see any keys are pressed and set the cooresponding flags.
		if (textIndex == Texts.length){
			finishDialogue = true;
			toggleHUD(false);
		}	
		super.update(elapsed);
	}

}