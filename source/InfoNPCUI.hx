package;
import flixel.FlxG;



/**
 * The beginning of the story
 * @author Tony
 */
class InfoNPCUI extends DialogueTemplate 
{
	public var _finishTalking:Bool = false;
	var _finishChecking:Bool = false;
	override public function new() 
	{
		_normalDialogue = false;
		_textContent = ["If you do have enough money(180000 G), I can save your brother"];
		_nameContent = ["Yamamoto"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		if (Storage.info == true){
			_textContent[0] = "I am sure your brother will be safe.";
		}
		super();
		
	}
	override public function update(elapsed:Float):Void 
	{
		_text.text = _textContent[0];
		if (FlxG.keys.anyJustReleased([SPACE, ENTER])){
			if (Storage.info == true || _textIndex > 1){
				Storage.pauseUI = false;
				toggleHUD(false);
			}
			else if (Storage.money > 18000){
				Storage.pauseUI = true;
				Storage.money -= 18000;
				Storage.info = true;
				_textContent[0] = "I am sure brother will be safe.";
				_textIndex += 1;
				
			}
			else{
				_textContent[0] = "You don't have enough money.";
				toggleHUD(false);
			}
		
			
		
		}
	}
}
	