package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxSort;

class MorningState extends FlxState {
	// Maps
	var morningMap:FlxOgmoLoader;

	// Layers
	var layers:FlxTypedGroup<FlxTilemap>;
	var collisionLayers:FlxTypedGroup<FlxTilemap>;
	
	// Entities
	var entities:FlxTypedGroup<FlxObject>;
	var collisionEntities:FlxTypedGroup<FlxObject>;
	var players:FlxTypedGroup<Player>;
	var npcs:FlxTypedGroup<NPC>;
	//var playerNames:Array<String> = ["Shimotsuki", "Tsuruko", "Setsuko", "Kawako"];
	//var npcNames:Array<String> = ["shop", "intel", "brother", "mA", "mB", "mC"];
	
	// UI
	var characterUI:CharacterUI;
	var shopUI:ShopUI;
	var index:Int = 0;

	// Actions
	var selectedPlayer:Player;
	
	override public function create():Void {
		// Music
		FlxG.sound.play(AssetPaths.morning__ogg);

		// Map
		morningMap = new FlxOgmoLoader(AssetPaths.morning__oel);
		
		// Layers
		layers = new FlxTypedGroup<FlxTilemap>();
		collisionLayers = new FlxTypedGroup<FlxTilemap>();
		placeLayers("walls", true);
		placeLayers("floor", false);
		placeLayers("stuff1", false);
		placeLayers("stuff2", false);
		placeLayers("unwalkable", true);
		
		// Entities
		entities = new FlxTypedGroup<FlxObject>();
		collisionEntities = new FlxTypedGroup<FlxObject>();
		players = new FlxTypedGroup<Player>();
		npcs = new FlxTypedGroup<NPC>();
		morningMap.loadEntities(placeEntities, "entities");
		
		// UI
		characterUI = new CharacterUI();
		shopUI = new ShopUI();
		shopUI.toggleHUD(false);
		// Select the player
		Select();
		
		// Add values to view
		add(layers);
		add(entities);
		add(characterUI);
		add(shopUI);
		
		// Extra
		FlxG.watch.add(selectedPlayer, "touching");
		FlxG.watch.add(npcs.getFirstAlive(), "touching");
		FlxG.watch.add(npcs.getFirstAlive().velocity, "x");
		FlxG.watch.add(npcs.getFirstAlive().velocity, "y");
		
		super.create();
	}

	override public function update(elapsed:Float):Void {
		// Select players on mouse input
		if (FlxG.mouse.justReleased) {
			selectPlayer();
		}
		
		// Update Views for foreground/background
		entities.sort(FlxSort.byY);
		
		// Update Collisions
		FlxG.collide(selectedPlayer, collisionLayers);
		FlxG.collide(selectedPlayer, collisionEntities);
		FlxG.collide(npcs, collisionLayers);
		FlxG.overlap(selectedPlayer.actionBox, npcs, playerActions);

		super.update(elapsed);
	}
	
	// Initialize layers
	private function placeLayers(layerName:String, collision:Bool):Void {
		var tempLayer:FlxTilemap = morningMap.loadTilemap(AssetPaths.tileset__png, 32, 32, layerName);
		tempLayer.follow();
		if (collision) {
			collisionLayers.add(tempLayer);
		}
		layers.add(tempLayer);
	}
	
	// Initialize entities
	private function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player") {
			var temp:Player = new Player(x, y, Std.parseInt(entityData.get("pType")));
			entities.add(temp);
			collisionEntities.add(temp);
			players.add(temp);
			add(temp.actionBox);
		} else if (entityName == "npc") {
			var temp:NPC = new NPC(x+5, y, Std.parseInt(entityData.get("nType")));
			entities.add(temp);
			collisionEntities.add(temp);
			npcs.add(temp);
		}
	}
	
	// Selects the first alive player and changes state once inactive
	private function Select(): Void {
		selectedPlayer = players.getFirstAlive();
		if (selectedPlayer != null) {
			selectedPlayer.isSelected(true);
			FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
		} else {
			FlxG.switchState(new NightState());
		}
		
	}
	
	// Selects a player that is clicked
	private function selectPlayer():Void {
		var tempPosition:FlxPoint = FlxG.mouse.getWorldPosition();
		var tempPlayer:Player = selectedPlayer;
		for (player in players) {
			if (player.overlapsPoint(tempPosition) && player.alive) {
				tempPlayer = player;
			} else {
				player.isSelected(false);
			}
		}
		selectedPlayer = tempPlayer;
		index = selectedPlayer.isSelected(true);
		characterUI.updatePlayerName(index);
		characterUI.updatePlayerPicture(index);
		
		FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
	}
	
	// Performs an action
	private function playerActions(actionBox:FlxObject, npc:NPC):Void {
		if (FlxG.keys.justPressed.E) {
			switch (npc.nType) {
				case 0:
					shopUI.toggleHUD(true);
				//case 1:
				//case 2:
				case 3, 4, 5:
					npc.setFollow(selectedPlayer);
					collisionEntities.remove(npc);
			}
			// DO SOME ACTION
			//selectedPlayer.setInactive();
			//Select();
		}
	}
}