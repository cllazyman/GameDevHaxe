package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class NPC2UI extends DialogueTemplate 
{
	var _dialogueChoose:Int;
	var _random:FlxRandom;
	public var _finishTalking:Bool = false;
	override public function new() 
	{	
		_textContent = ["","It is not flower that brings the victory.  .","The moon, the wind, the night a dancing young girl and a predator from the dark hides.","The strings can always bring me back to my hometown among the mountains.","What is this mess on this piece of paper.","Why people all like the bitter taste tree leaves?","The canary singing in a cage is never as pleasing as the eagle howling over the Fuji."];
		_nameContent = ["NPC2"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		_random = new FlxRandom();
		_dialogueChoose = _random.int(1, 6, Storage.npc2HasTalk);
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
				Storage.npc2HasTalk.insert(0, _dialogueChoose);
				_finishTalking = true;
			}
		}
		else{
			switch Storage.playerIndex{
				case 1:
					Storage.npc2 += 1;
				case 2:
					Storage.npc2 += 1;
				case 3:
					Storage.npc2 += 1;
			}
			
		}
		
		super.update(elapsed);
	}

}