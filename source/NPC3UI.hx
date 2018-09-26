package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC3UI extends DialogueTemplate 
{
	var _dialogueChoose:Int;
	var _random:FlxRandom;
	public var _finishTalking:Bool = false;
	var _finishChecking:Bool = false;
	override public function new() 
	{	
		_textContent = ["","The blossom today, the dust tomorrow. Nothing is everlasting.","Dance is the only memory I… Nothing…","Music is just sometimes too beautiful to describe our tough life","Never know the secret between these hardly recognized handwriting","You can only know how sweet being alive is, after the tea passes your throat.","Voice of young woman, such a relief."];
		_nameContent = ["Nagumo"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		_random = new FlxRandom();
		_dialogueChoose = _random.int(1, 6, Storage.npc3HasTalk);
		_textContent[0] = _textContent[_dialogueChoose];
		super();
		_normalDialogue = false;
		_finishChecking = false;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Storage.time == true){ //Morning
			_text.text =  _textContent[0];
			if (_textIndex >= 1){
				toggleHUD(false);
				Storage.npc3HasTalk.insert(0, _dialogueChoose);
				_finishTalking = true;
			}
		}
		else{
			if (_finishChecking == false){
				checkFavorite();
				_finishChecking = true;
			}
			_text.text = _textContent[0];
			if (_textIndex >= 1){
				toggleHUD(false);
				_finishTalking = true;
			}
			
		}
		super.update(elapsed);
		
	}
	public function checkFavorite():Void{
		switch Storage.playerIndex{ //Night
				case 1:{
					_textContent[0] = "(Smoking and looking at the floor)Thank you, goodbye.";
					Storage.npc3 -= 1;
				}
				case 2:{
					Storage.npc3 += 1;
					_textContent[0] = "(Smoking and looking at the sky)\nGoodbye, and see you tomorrow.";
					if (Storage.limitedItemCounts[1] > 0){
						Storage.limitedItemCounts[1] -= 1;
						Storage.npc3 += 1;
					}
				}
				case 3:{
					Storage.npc3 += 1;
					_textContent[0] = "(Smoking and looking at the sky)\nGoodbye, and see you tomorrow.";
					if (Storage.limitedItemCounts[0] > 0){
						Storage.limitedItemCounts[0] -= 1;
						Storage.npc3 += 1;
					}
			}
	}

	}
}