package;
import flixel.math.FlxRandom;


/**
 * The beginning of the story
 * @author Tony
 */
class InfoNPCUI extends DialogueTemplate 
{
	var _bought:Bool = false;
	public var _finishTalking:Bool = false;
	var _finishChecking:Bool = false;
	override public function new() 
	{
		_normalDialogue = false;
		_textContent = ["If you do have enough money(150000 G), I can save your brother"];
		_nameContent = ["Yamamoto"];
		_textChoice1Content = [];
		_textChoice2Content = [];
		_textChoice3Content = [];
		if (_bought == true){
			_textContent[0] = "I am sure your brother will be safe";
		}
		super();
		
	}
	override public function update(elapsed:Float):Void 
	{
		if (_textIndex >= 1){
			if (_bought == true){
				toggleHUD(false);
			}
		else{
			if (Storage.money > 150000){
				Storage.money -= 150000;
				Storage.info = true;
				_textContent[0] = "I am sure brother will be safe";
				toggleHUD(false);
			}
			else{
				_textContent[0] = "You don't have enough money.";
				toggleHUD(false);
			}
		}
			
		super.update(elapsed);
	}
}
	