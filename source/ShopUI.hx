package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import Storage;

/**
 * The beginning of the story
 * @author Tony
 */

class ShopUI extends FlxTypedGroup<FlxSprite> {
	// For UI stuff
	var nameStuff:Array<String> = ["Shopkeeper"];
	var textStuff:Array<String> = ["Welcome. How can I help you?\nPress SPACE to finish shopping."];
	
	// Background
	var name:FlxSprite;
	var text:FlxSprite;
	var shop:FlxSprite;
	
	// Text Content
	var textIndex = 0;
	var nameContent:FlxText;
	var textContent:FlxText;
	
	// Shop Content
	var Names:Array<String> = ["Sake", "Tea", "Ink", "Arranged Flowers", "German Pen", "Famous Katana", "Chinese Tea Pot", "Kimono", "Japanese Fan", "Mythic Shamisen"];
	var Prices:Array<Int> = [10000, 12000, 8000, 6000, 94000, 108000, 130000, 125000, 98000, 85000];
	var itemName:Map<String, FlxText> = new Map<String, FlxText>();
	var itemPrice:Map<String, FlxText> = new Map<String, FlxText>();
	
	var _shopItem:Int = 0;	
	
	//Sound
	private var _chooseSound:FlxSound;
	
	public function new()  {
		super();
		textIndex = 0;
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
			var tempItemName:FlxText = new FlxText(shop.x+offsetx, shop.y+offsety, 150, Names[i]+":");
			tempItemName.setFormat("assets/fonts/SHPinscher-Regular.otf", 15, FlxColor.WHITE);
			var tempItemPrice:FlxText = new FlxText(shop.x+offsetx+75, shop.y+offsety+15, 80, Std.string(Prices[i])+" G");
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
		// Load Sounds
		_chooseSound = FlxG.sound.load(AssetPaths.ButtonClickSFX__ogg);
		// like we did in our HUD class, we need to set the scrollFactor on each of our children objects to 0,0. We also set alpha to 0 (so we can fade this in)
		forEach(function(spr:FlxSprite) { spr.scrollFactor.set(); });
	}

	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.anyJustReleased([SPACE,ENTER]))
		{
			_chooseSound.play();
			nameContent.text = nameStuff[textIndex];
			textContent.text = textStuff[textIndex];
			textIndex = textIndex + 1;
			if (textIndex == 1){
				toggleHUD(false);
			}

		}			
		if (FlxG.mouse.justReleased){
			_chooseSound.play();
				if (FlxG.mouse.screenX >= 290 && FlxG.mouse.screenX<= 435 && FlxG.mouse.screenY>=25 && FlxG.mouse.screenY <= 60){
					buy(0);
				}
				else if (FlxG.mouse.screenX >= 290 && FlxG.mouse.screenX <= 435 && FlxG.mouse.screenY >= 70 && FlxG.mouse.screenY <= 105){
					buy(1);
				}
				else if (FlxG.mouse.screenX >= 290 && FlxG.mouse.screenX<= 435 && FlxG.mouse.screenY>=115 && FlxG.mouse.screenY<=150){
					buy(2);
				}
				else if (FlxG.mouse.screenX >= 290 && FlxG.mouse.screenX<= 435 && FlxG.mouse.screenY>=160 && FlxG.mouse.screenY<=195){
					buy(3);
				}
				else if (FlxG.mouse.screenX >= 290 && FlxG.mouse.screenX<= 435 && FlxG.mouse.screenY>=205 && FlxG.mouse.screenY<=240){
					buy(4);
				}
				else if (FlxG.mouse.screenX >= 450 && FlxG.mouse.screenX<= 590 && FlxG.mouse.screenY>=25 && FlxG.mouse.screenY<=60){
					buy(5);
				}
				else if (FlxG.mouse.screenX >= 450 && FlxG.mouse.screenX<= 590  && FlxG.mouse.screenY>=70 && FlxG.mouse.screenY<=105){
					buy(6);
				}
				else if (FlxG.mouse.screenX >= 450 && FlxG.mouse.screenX<= 590  && FlxG.mouse.screenY>=115 && FlxG.mouse.screenY<=150){
					buy(7);
				}
				else if (FlxG.mouse.screenX >= 450 && FlxG.mouse.screenX<= 590  && FlxG.mouse.screenY>=160 && FlxG.mouse.screenY<=195){
					buy(8);
				}
				else if (FlxG.mouse.screenX >= 450 && FlxG.mouse.screenX<= 590  && FlxG.mouse.screenY>=205 && FlxG.mouse.screenY<=240){
					buy(9);
				}				
			}	
				
				//textContent.text = Std.string(_shopItem) +"  " + Std.string(FlxG.mouse.x) +"   " + Std.string(FlxG.mouse.y);
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
		textIndex = 0;
		active = power;
		visible = power;
	}
	public function buy(shopItem:Int):Void{
		textContent.text = Std.string(_shopItem) +"  " + Std.string(FlxG.mouse.screenX) +"   " + Std.string(FlxG.mouse.screenY);
		if (shopItem >= 0 && shopItem <= 3){
			if (Storage.money >= Prices[shopItem]){
				Storage.limitedItemCounts[shopItem] += 1;
				Storage.money -= Prices[shopItem];
				textContent.text = "You buy "+Storage.limitedItemNames[shopItem]+" successfully!\nPress SPACE to finish shopping.";
			}
			else{
				textContent.text = "Sorry, you don't have enough money.\nPress SPACE to finish shopping.";
			}
				
		}
		else if (shopItem >= 4 && shopItem <= 9){
			if (Storage.unlimitedCounts[shopItem - 4] > 0){
				textContent.text = "This item is sold out.\nPress SPACE to finish shopping.";
			}
			else{
				if (Storage.money >= Prices[shopItem]){
					Storage.unlimitedCounts[shopItem-4] += 1;
					Storage.money -= Prices[shopItem];
					textContent.text = "You buy "+Storage.unlimitedItems[shopItem-4]+" successfully!\nPress SPACE to finish shopping.";
			}
				else{
					textContent.text = "Sorry, you don't have enough money.\nPress SPACE to finish shopping.";
				}	
			}
		
		} 
	}
	
}