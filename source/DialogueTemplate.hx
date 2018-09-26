package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
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
	
	// When making a choice, SPACE is banned
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
		
		// Set to disabled
		forEach(function(spr:FlxSprite) {
			spr.visible = false;
		});
		active = false;
		
		forEach(function(spr:FlxSprite) { spr.scrollFactor.set(); });
		
		// Load Sounds
		choosingSound = FlxG.sound.load(AssetPaths.ButtonClickSFX__ogg);
	}

	
	override public function update(elapsed:Float):Void {
		//When clicking SPACE or ENTER, show next text
		if (FlxG.keys.anyJustReleased([SPACE,ENTER])) {
			choosingSound.play();
			textIndex++;
			if (normalDialogue) {
				textContent.text = Texts[textIndex];
				nameContent.text = Names[textIndex];
			}
		}
		super.update(elapsed);
	}
	
	// Turn on/off HUD
	public function toggleHUD(power:Bool):Void {
		Storage.pauseUI = power;
		textIndex = 0;
		active = power;
		textContent.text = Texts[0];
		nameContent.text = Names[0];
		forEach(function(spr:FlxSprite) {
			spr.visible = power;
		});
	}
	
	function setNameVisible(Visible:Bool):Void{
		name.visible = Visible;
	}
}