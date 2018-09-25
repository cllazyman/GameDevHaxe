package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class MenuState extends FlxState {
	var background:FlxSprite;
	var titleText:FlxText;
	var playButton:FlxButtonPlus;
	
	override public function create():Void {
		// Play title screen music
		FlxG.sound.play(AssetPaths.menu__ogg);
		
		// Background
		background = new FlxSprite(0, 0);
		background.loadGraphic(AssetPaths.title__png, true, 640, 360);
		background.animation.add("idle", [0, 1], 600, false);
		
		// Game title
		titleText = new FlxText(14, 14, 100, "Red Snow Falling in Autumn Moon: The Story");
		titleText.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
		
		// Play Button
		playButton = new FlxButtonPlus(0, 228, clickPlay, "Play", 132, 19);
		playButton.screenCenter(FlxAxes.X);
		//playButton.onDown.sound = FlxG.sound.load(AssetPaths.ButtonClickSFX__ogg);
		//playButton.onUp.sound = FlxG.sound.load(AssetPaths.ButtonClickSFX2__ogg);
		
		// Add values to view
		add(background);
		add(titleText);
		add(playButton);
		
		super.create();
	}

	override public function update(elapsed:Float):Void {
		//background.animation.play("idle");
		super.update(elapsed);
	}

	function clickPlay():Void {
		FlxG.switchState(new MorningState());
		/*
		FlxG.camera.fade(FlxColor.BLACK, 0.5, false, function() {
			FlxG.switchState(new MorningState());
		})
		*/
	}
}