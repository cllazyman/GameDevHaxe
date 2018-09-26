package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * The beginning of the story
 * @author Tony
 */

class DialogueTemplate extends FlxTypedGroup<FlxSprite> {
	// Background
	var name:FlxSprite;
	var text:FlxSprite;
	var shop:FlxSprite;
	
	// Text Content
	var textIndex = 0;
	var nameContent:FlxText;
	var textContent:FlxText;

	// Content
	var Names:Array<String>;
	var Texts:Array<String>;
	var itemName:Map<String, FlxText> = new Map<String, FlxText>();
	var itemPrice:Map<String, FlxText> = new Map<String, FlxText>();
	
	// Choices
	var choice1:FlxSprite;
	var choiceContent1:FlxText;
	var choice2:FlxSprite;
	var choiceContent2:FlxText;
	var choice3:FlxSprite;
	var choiceContent3:FlxText;

	var Choices1:Array<String>;
	var Choices2:Array<String>;
	var Choices3:Array<String>;
	
	// When making a choice, SPACE is banned
	var isMakingChoice:Bool = false;
	var normalDialogue:Bool = true;
	// Which choice the player chooses
	var choiceMake:Int = 0;

	var choosingSound:FlxSound;

	public function new() {
		super();
		// Add the shop backgrounds
		name = new FlxSprite(150, 220);
		name.loadGraphic(AssetPaths.ui_name__png);
		text = new FlxSprite(150, 260);
		text.loadGraphic(AssetPaths.ui_dialogue__png);
		add(name);
		add(text);
		
		// Content section
		nameContent = new FlxText(name.x + 15, name.y + 5, 100, Names[0]);
		nameContent.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		textContent = new FlxText(text.x + 15, text.y + 10, 460, Texts[0]);
		textContent.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(nameContent);
		add(textContent);
				
		// Choices section
		choice1 = new FlxSprite(280,80);
		choice1.loadGraphic(AssetPaths.ui_choice__png);
		choiceContent1 = new FlxText(choice1.x + 15, choice1.y + 8, 100, Choices1[0]);
		choiceContent1.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
	
		choice2 = new FlxSprite(280, 120);
		choice2.loadGraphic(AssetPaths.ui_choice__png);
		choiceContent2 = new FlxText(choice2.x + 15, choice2.y + 8, 100, Choices2[0]);
		choiceContent2.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		
		choice3 = new FlxSprite(280, 160);
		choice3.loadGraphic(AssetPaths.ui_choice__png);
		choiceContent3 = new FlxText(choice3.x + 15, choice3.y + 8, 100, Choices3[0]);
		choiceContent3.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		
		add(choice1);
		add(choice2);
		add(choice3);
		add(choiceContent1);
		add(choiceContent2);
		add(choiceContent3);
		
		active = false;
		
		choice1.visible = false;
		choiceContent1.visible = false;
		choice2.visible = false;
		choiceContent2.visible = false;
		choice3.visible = false;
		choiceContent3.visible = false;
		
		forEach(function(spr:FlxSprite) { spr.scrollFactor.set(); });
		
		// Load Sounds
		choosingSound = FlxG.sound.load(AssetPaths.ButtonClickSFX__ogg);
	}

	
	override public function update(elapsed:Float):Void {
		//When clicking SPACE or ENTER, show next text
		if (FlxG.keys.anyJustReleased([SPACE,ENTER])) {
				choosingSound.play();
				if (!isMakingChoice) {
					textIndex++;
					if (normalDialogue) {
						textContent.text = Texts[textIndex];
						nameContent.text = Names[textIndex];
					}
				}
			}
		//When making choice, show three choices
		if (isMakingChoice) {
			if (FlxG.mouse.justReleased) {
				choosingSound.play();
				if (FlxG.mouse.screenX >= 285 && FlxG.mouse.screenX <= 465) {
					if (FlxG.mouse.screenY >= 85 && FlxG.mouse.screenY <= 105) {
						choiceMake = 1;
					} else if (FlxG.mouse.screenY >= 125 && FlxG.mouse.screenY <= 145) {
						choiceMake = 2;
					} else if (FlxG.mouse.screenY >= 165 && FlxG.mouse.screenY <= 185) {
						choiceMake = 3;
					} else {
						choiceMake = 0;
					}
				}
			} else {
				choiceMake = 0;
			}
		}
	/**
		if (textContentIndex == 2){
				_isMakingChoice = true;
				setChoiceVisible(true);
				if (_choiceMake != 0 ){
					textContentIndex = 3;
					textContent.text = textContentContent[textContentIndex];
					nameContent.text = _nameContent[textContentIndex];
					setChoiceVisible(false);
					_choiceMake = 0;
					_isMakingChoice = false;
				}			
			}
			**/
		super.update(elapsed);
	}
	
	// Turn on/off HUD
	public function toggleHUD(power:Bool):Void {
		textIndex = 0;
		active = power;
		textContent.text = Texts[0];
		nameContent.text = Names[0];
	}
	
	// Set whether choices are visible
	public function setChoiceVisible(Visible:Bool):Void{
		choice1.visible = Visible;
		choiceContent1.visible = Visible;
		choice2.visible = Visible;
		choiceContent2.visible = Visible;
		choice3.visible = Visible;
		choiceContent3.visible = Visible;

	}
	
	function setNameVisible(Visible:Bool):Void{
		name.visible = Visible;
	}
}