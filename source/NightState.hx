package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxSort;

class NightState extends FlxState {
	// Maps
	var nightMap:FlxOgmoLoader;

	// Layers
	var layers:FlxTypedGroup<FlxTilemap>;
	var collisionLayers:FlxTypedGroup<FlxTilemap>;
	
	// Entities
	var entities:FlxTypedGroup<FlxObject>;
	var collisionEntities:FlxTypedGroup<FlxObject>;
	var subPlayers:FlxTypedGroup<SubPlayers>;
	var npcs:FlxTypedGroup<NPC>;
	var mainPlayer:MainPlayer;
	
	// UI
	var characterUI:CharacterUI;
	var shopUI:ShopUI;

	// Actions
	var selectedPlayer:SubPlayers;
	
	override public function create():Void {
		// Update Storage values
		Storage.time = false;
		
		// Music
		FlxG.sound.play(AssetPaths.night__ogg);
		
		// Map
		nightMap = new FlxOgmoLoader(AssetPaths.night__oel);
		
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
		subPlayers = new FlxTypedGroup<SubPlayers>();
		npcs = new FlxTypedGroup<NPC>();
		nightMap.loadEntities(placeEntities, "entities");
		
		// UI
		characterUI = new CharacterUI();
		shopUI = new ShopUI();
		
		// Select the player
		Select();
		
		// Add values to view
		add(layers);
		add(entities);
		add(characterUI);
		add(shopUI);
		
		super.create();
	}

	override public function update(elapsed:Float):Void {
		if (!Storage.pauseUI) {
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
		}
		super.update(elapsed);
	}
	
	// Initialize layers
	private function placeLayers(layerName:String, collision:Bool):Void {
		var tempLayer:FlxTilemap = nightMap.loadTilemap(AssetPaths.tileset__png, 16, 16, layerName);
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
			var tempType:Int = Std.parseInt(entityData.get("pType"));
			var temp:Player = new Player(0,0,0);
			switch (tempType) {
				case 0:
					mainPlayer = new MainPlayer(x + 5, y, tempType);
					temp = mainPlayer;
				case 1, 2, 3:
					var subtemp:SubPlayers = new SubPlayers(x + 5, y, tempType);
					add(subtemp.actionBox);
					subPlayers.add(subtemp);
					temp = subtemp;
			}
			entities.add(temp);
			collisionEntities.add(temp);
		} else if (entityName == "npc") {
			var tempType:Int = Std.parseInt(entityData.get("nType"));
			var temp:NPC = new NPC(0,0,0);
			switch (tempType) {
				case 0:
					temp = new ShopNPC(x + 5, y, tempType);
				case 2:
					if (Storage.Day == 0 || Storage.Day == 7) {
						return;
					}
					temp = new BrotherNPC(x + 5, y, tempType);
				case 3, 4, 5:
					temp = new GuestNPC(x + 5, y, tempType);
			}
			entities.add(temp);
			collisionEntities.add(temp);
			npcs.add(temp);
		}
	}
	
	// Selects the first alive player and changes state once inactive
	private function Select(): Void {
		selectedPlayer = subPlayers.getFirstAlive();
		if (selectedPlayer != null) {
			selectedPlayer.isSelected(true);
			characterUI.updatePlayer(selectedPlayer.pType);
			FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
		} else {
			FlxG.switchState(new MorningState());
		}
	}
	
	// Selects a player that is clicked
	private function selectPlayer():Void {
		var tempPosition:FlxPoint = FlxG.mouse.getWorldPosition();
		var tempPlayer:SubPlayers = selectedPlayer;
		for (player in subPlayers) {
			if (player.overlapsPoint(tempPosition) && player.alive) {
				tempPlayer = player;
			} else {
				player.isSelected(false);
			}
		}
		selectedPlayer = tempPlayer;
		selectedPlayer.isSelected(true);
		characterUI.updatePlayer(selectedPlayer.pType);
		FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
	}
	
	// Performs an action
	private function playerActions(actionBox:FlxObject, npc:NPC):Void {
		if (FlxG.keys.justPressed.E) {
			switch (npc.nType) {
				case 0:
					shopUI.toggleHUD(true);
					npc.face(selectedPlayer);
				case 2:
					npc.face(selectedPlayer);
				case 3, 4, 5:
					if (selectedPlayer.pType != 0) {
						npc.setFollow(selectedPlayer);
						collisionEntities.remove(npc);
						selectedPlayer.setInactive();
						Select();
					}
			}
		}
	}
}