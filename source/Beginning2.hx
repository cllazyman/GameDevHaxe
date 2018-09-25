package;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

/**
 * The beginning of the story
 * @author Tony
 */

class Beginning2 extends DialogueTemplate 
{
	
	// ** These are the sprites that we will use to show the combat hud interface
	

	
	override public function new() 
	{
		
		_textContent = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister"];
		_nameContent = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		_textChoice1Content = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		_textChoice2Content = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		_textChoice3Content = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
		super();
		

	}
	override public function update(elapsed:Float):Void 
	{	
			// check to see any keys are pressed and set the cooresponding flags.
			if (_textIndex == 0){
				_isMakingChoice = true;
				setChoiceVisible(true);
				if (_choiceMake != 0 ){
					_textIndex = 3;
					_text.text = _text.text = _choiceMake+"  " + FlxG.mouse.screenX +"  " + FlxG.mouse.screenY;
					_name.text = _nameContent[_textIndex];
					setChoiceVisible(false);
					_choiceMake = 0;
					_isMakingChoice = false;
				}			
			}
			if (_textIndex == 4){
				doneResultsIn(_sprText);
				doneResultsIn(_sprName);
			}	
			
			
			
			
			
			
		super.update(elapsed);
		
	
	}
	override public function setChoiceVisible(Visible:Bool):Void{

		super.setChoiceVisible(Visible);
	}
}