package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import lime.system.System;

class CreditState extends FlxState {
	var background:FlxSprite;
	var exitButton:FlxButtonPlus;
	var creditText:FlxText;
	
	override public function create():Void {
		// Play credits screen music
		FlxG.sound.play(AssetPaths.badEnding__ogg);
		//FlxG.sound.play(AssetPaths.goodEnding__ogg);
		
		// Background
		background = new FlxSprite(0, 0);
		background.loadGraphic(AssetPaths.title__png, true, 640, 360);
		background.animation.add("idle", [0, 1], 1, false);	
		
		//Credit Test
		creditText = new FlxText(0, 30, 600, "Programming\nChristian Lee\nQitong Wang\n\nArt\nFanghong Dong\n\nWriting\nJimmy Jin\n\nMusic\nJon Castro");
		creditText.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		creditText.screenCenter(FlxAxes.X);
		creditText.wordWrap = false;
		creditText.autoSize = false;
		//creditText.alignment = FlxTextAlign.CENTER;
		//creditText.borderColor = FlxColor.BLACK;
		//creditText.borderSize = 2;
		//creditText.borderQuality = 1;
		
		
		// Exit Button
		exitButton = new FlxButtonPlus(610, 10, function() {
				System.exit(0);
			}, "X", 19, 19);
		exitButton.updateActiveButtonColors([FlxColor.RED]);
		exitButton.updateInactiveButtonColors([FlxColor.BLACK]);
		
		// Add values to view
		add(background);
		add(creditText);
		add(exitButton);
		
		super.create();
	}
	
	// For animations
	override public function update(elapsed:Float):Void {
		background.animation.play("idle");
		super.update(elapsed);
	}
}