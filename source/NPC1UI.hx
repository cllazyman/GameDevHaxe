package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC1UI extends DialogueTemplate 
{
	var _dialogueChoose:Int;
	var _random:FlxRandom;
	public var _finishTalking:Bool = false;
	override public function new() 
	{	
		_textContent = ["","These colorful branches are massagers of spring..","Dancing? Such vulgar art. It does not match my nobility.","The tone of stream is not what a true Japanese like to hear. Only the echo of the tide hitting the shore should be appreciated.","Let the brush carry the ink, as water falls and cloud flies.","My friends all say that they can see their fate through a cup, but I never did.","Why singers just don’t know how to speak in a normal way?"];
		_nameContent = ["NPC1"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		_random = new FlxRandom();
		_dialogueChoose = _random.int(1, 6, Storage.npc1HasTalk);
		_textContent[0] = _textContent[_dialogueChoose];
		super();
		_normalDialogue = false;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Storage.time == true){
			_text.text = _textContent[0];
			if (_textIndex >= 1){
				toggleHUD(false);
				Storage.npc1HasTalk.insert(0, _dialogueChoose);
				_finishTalking = true;
			}
		}
		else{
			switch Storage.playerIndex{
				case 1:
					Storage.npc1 += 1;
				case 2:
					Storage.npc1 += 1;
				case 3:
					Storage.npc1 += 1;
			}
			
		}
		
		super.update(elapsed);
	}

}