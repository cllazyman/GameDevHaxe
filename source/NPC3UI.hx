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
	override public function new() 
	{	
		_textContent = ["","The blossom today, the dust tomorrow. Nothing is everlasting.","Dance is the only memory I… Nothing…","Music is just sometimes too beautiful to describe our tough life","Never know the secret between these hardly recognized handwriting","You can only know how sweet being alive is, after the tea passes your throat.","Voice of young woman, such a relief."];
		_nameContent = ["NPC3"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		_random = new FlxRandom();
		_dialogueChoose = _random.int(1, 6, Storage.npc3HasTalk);
		_textContent[0] = _textContent[_dialogueChoose];
		super();
		_normalDialogue = false;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Storage.time == true){
			_text.text =  _textContent[0];
			if (_textIndex >= 1){
				toggleHUD(false);
				Storage.npc3HasTalk.insert(0, _dialogueChoose);
				_finishTalking = true;
			}
		}
		else{
			switch Storage.playerIndex{
				case 1:
					Storage.npc3 += 1;
				case 2:
					Storage.npc3 += 1;
				case 3:
					Storage.npc3 += 1;
			}
			
		}
		super.update(elapsed);
		
	}

}