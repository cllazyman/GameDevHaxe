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
	var _finishChecking:Bool = false;
	override public function new() 
	{	
		_textContent = ["","It is not flower that brings the victory.  .","The moon, the wind, the night a dancing young girl and a predator from the dark hides.","The strings can always bring me back to my hometown among the mountains.","What is this mess on this piece of paper.","Why people all like the bitter taste tree leaves?","The canary singing in a cage is never as pleasing as the eagle howling over the Fuji."];
		_nameContent = ["Musashi"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		_random = new FlxRandom();
		_dialogueChoose = _random.int(1, 6, Storage.npc2HasTalk);
		_textContent[0] = _textContent[_dialogueChoose];
		super();
		_finishTalking = false;
		_normalDialogue = false;
		_finishChecking = false;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Storage.time == true){ //Morning
			_text.text = _textContent[0];
			if (_textIndex >= 1){
				_finishTalking = true;
				toggleHUD(false);
				Storage.npc2HasTalk.insert(0, _dialogueChoose);

			}
		}
		else{/*
			if (_finishChecking == false){
				checkFavorite();
				_finishChecking = true;
			}*/
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
					Storage.npc2 += 1;
					_textContent[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
					if (Storage.limitedItemCounts[1] > 0){
						Storage.limitedItemCounts[1] -= 1;
						Storage.npc2 += 1;
					}
				}
				case 2:{
					_textContent[0] = "(leaving without saying anything)";
					Storage.npc2 -= 1;
				}
				case 3:{
					Storage.npc2 += 1;
					_textContent[0] = "(Singing)\n~I'll go back to my native home, when I get days off.~\n~But I don't have a nice dress or shoes to wear.~";
					if (Storage.limitedItemCounts[0] > 0){
						Storage.limitedItemCounts[0] -= 1;
						Storage.npc2 += 1;
					}
				}
			}
	}

}