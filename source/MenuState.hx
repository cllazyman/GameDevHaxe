package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import lime.system.System;

class MenuState extends FlxState {
	var background:FlxSprite;
	var titleText:FlxText;
	var playButton:FlxButtonPlus;
	var exitButton:FlxButtonPlus;
	
	override public function create():Void {
		// Play title screen music
		FlxG.sound.play(AssetPaths.menu__ogg);
		
		// Background
		background = new FlxSprite(0, 0);
		background.loadGraphic(AssetPaths.title__png, true, 640, 360);
		background.animation.add("idle", [0, 1], 1, false);
		
		// Game title
		// "Red Snow Falling in Autumn Moon" OR "Akizuki Ni Furu No Akayuki"
		titleText = new FlxText(0, 58, 600, "Life and Death of the Inner Demon of the Blood Red Catacalysm of Darkness");
		titleText.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		titleText.screenCenter(FlxAxes.X);
		titleText.wordWrap = false;
		titleText.autoSize = false;
		titleText.alignment = FlxTextAlign.CENTER;
		
		// Play Button
		playButton = new FlxButtonPlus(0, 228, clickPlay, "Play", 132, 19);
		playButton.screenCenter(FlxAxes.X);
		playButton.updateActiveButtonColors([FlxColor.GREEN]);
		playButton.updateInactiveButtonColors([FlxColor.BLACK]);
		
		// Exit Button
		exitButton = new FlxButtonPlus(0, 295, clickClose, "Exit", 132, 19);
		exitButton.screenCenter(FlxAxes.X);
		exitButton.updateActiveButtonColors([FlxColor.RED]);
		exitButton.updateInactiveButtonColors([FlxColor.BLACK]);
		
		// Add values to view
		add(background);
		add(titleText);
		add(playButton);
		add(exitButton);
		
		super.create();
	}

	override public function update(elapsed:Float):Void {
		background.animation.play("idle");
		super.update(elapsed);
	}
	
	private function clickPlay():Void {
		FlxG.sound.play(AssetPaths.ButtonClickSFX__ogg);
		//FlxG.switchState(new MorningState());
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
			FlxG.switchState(new IntroState());
		});
	}
	
	private function clickClose():Void {
		FlxG.sound.play(AssetPaths.ButtonClickSFX__ogg);
		System.exit(0);
	}
}