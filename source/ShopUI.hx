package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * The beginning of the story
 * @author Tony
 */

class ShopUI extends FlxTypedGroup<FlxSprite> {
	// For UI stuff
	var nameStuff:Array<String> = ["Nizaemon", "Nizaemon", "Nizaemon", "Shimotsuki", "Nizaemon"];
	var textStuff:Array<String> = ["Dark and frigid night", "Silent wind hang red moon high", "The misfortune die", "Sorry, you must been waiting for a while.", "I just arrived, my sister"];
	
	// Background
	var name:FlxSprite;
	var text:FlxSprite;
	var shop:FlxSprite;
	
	// Text Content
	var textIndex = 0;
	var nameContent:FlxText;
	var textContent:FlxText;
	
	// Shop Content
	var Names:Array<String> = ["Sake", "Tea", "Ink", "Arranged Flowers", "Item4", "Item5", "Item6", "Item7", "Item8", "Item9"];
	var Prices:Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	var itemName:Map<String, FlxText> = new Map<String, FlxText>();
	var itemPrice:Map<String, FlxText> = new Map<String, FlxText>();
	
	var shopItem:Int = 0;
	
	public function new()  {
		super();
		// Add the shop backgrounds
		name = new FlxSprite(150, 220);
		name.loadGraphic(AssetPaths.ui_name__png);
		text = new FlxSprite(150, 260);
		text.loadGraphic(AssetPaths.ui_dialogue__png);
		shop = new FlxSprite(280,20);
		shop.loadGraphic(AssetPaths.ui_shop__png);
		add(name);
		add(text);
		add(shop);
		
		// Content section
		nameContent = new FlxText(name.x + 15, name.y + 5, 100, nameStuff[0]);
		nameContent.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(nameContent);
		textContent = new FlxText(text.x + 15, text.y + 10, 470, textStuff[0]);
		textContent.setFormat("assets/fonts/SHPinscher-Regular.otf", 20, FlxColor.WHITE);
		add(textContent);
				
		// Add items to shop
		var count:Int = 0;
		var offsetx:Int = 15;
		var offsety:Int = 10;
		for (i in 0...Names.length) {
			var tempItemName:FlxText = new FlxText(shop.x+offsetx, shop.y+offsety, 80, Names[i]+":");
			tempItemName.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			var tempItemPrice:FlxText = new FlxText(shop.x+offsetx+75, shop.y+offsety+15, 80, Std.string(Prices[i])+"G");
			tempItemPrice.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			itemName[Names[i]] = tempItemName;
			itemPrice[Names[i]] = tempItemPrice;
			add(tempItemName);
			add(tempItemPrice);
			offsety += 45;
			if (count == 4) {
				offsetx += 155;
				offsety = 10;
			}
			count++;
		}
		
		// like we did in our HUD class, we need to set the scrollFactor on each of our children objects to 0,0. We also set alpha to 0 (so we can fade this in)
		forEach(function(spr:FlxSprite) { spr.scrollFactor.set(); });
	}

	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
			{
				textIndex = textIndex + 1;
				nameContent.text = nameStuff[textIndex];
				textContent.text = textStuff[textIndex];
			}
			
		if (FlxG.mouse.justReleased){	
				textContent.text = Std.string(shopItem) +"  " + Std.string(FlxG.mouse.x) +"   " + Std.string(FlxG.mouse.y);
		}
			super.update(elapsed);
	}

	/**
	 * This function is triggered when our results text has finished fading in. If we're not defeated, we will fade out the entire hud after a short delay
	 */
	function doneResultsIn(_):Void {
		FlxTween.num(1, 0, .66, { ease: FlxEase.circOut, onComplete: finishFadeOut, startDelay: 1 }, updateAlpha);
	}
	/**
	 * After we fade our hud out, we set it to not be active or visible (no update and no draw)
	 */
	function finishFadeOut(_):Void {
		active = false;
		visible = false;
	}
	
	// This function is called by our Tween to fade in/out all the items in our hud.
	function updateAlpha(Alpha:Float):Void {
		forEach(function(spr:FlxSprite) { spr.alpha = Alpha; });
	}

	
	// Turn on/off HUD
	public function toggleHUD(power:Bool):Void {
		active = power;
		visible = power;
	}
}