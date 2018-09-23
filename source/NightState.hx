package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;

class NightState extends FlxState {
	// Initialization
	var morningMap:FlxOgmoLoader;
	var visualLayers:FlxTypedGroup<FlxTilemap>;
	var collisionLayers:FlxTypedGroup<FlxTilemap>;
	var playerList:FlxTypedGroup<Player>;
	var npcList:FlxTypedGroup<NPC>;
	
	// For Player actions
	var selectedPlayer:Player;
	
	override public function create():Void {
		// Load the "night" file from the Ogmo Editor
		/*morningMap = new FlxOgmoLoader(AssetPaths.morning__oel);
		
		// Initialize Layers
		visualLayers = new FlxTypedGroup<FlxTilemap>();
		collisionLayers = new FlxTypedGroup<FlxTilemap>();
		placeLayers("walls", true);
		placeLayers("floor", false);
		placeLayers("stuff1", false);
		placeLayers("stuff2", false);
		placeLayers("unwalkable", true);
		placeLayers("overlay", false);
		//Play music
		FlxG.sound.play(AssetPaths.jazz_3__ogg);
		
		// Initialize all entities
		playerList = new FlxTypedGroup<Player>();
		npcList = new FlxTypedGroup<NPC>();
		morningMap.loadEntities(placeEntities, "entities");
		
		// Select the player
		Select();
		
		// Add values to view
		add(visualLayers);
		add(playerList);
		add(npcList);*/
		
		// Extra
		
		super.create();
	}

	/*override public function update(elapsed:Float):Void {
		// For selecting players
		if (FlxG.mouse.justReleased) {
			selectPlayer();
		}
		
		// Update Collisions
		FlxG.collide(selectedPlayer, collisionLayers);
		FlxG.collide(selectedPlayer, npcList);
		FlxG.collide(selectedPlayer, playerList);
		FlxG.overlap(selectedPlayer.actionBox, npcList, playerActions);
		super.update(elapsed);
	}
	
	// Initialize Layers onto screen
	private function placeLayers(layerName:String, collision:Bool):Void {
		var tempLayer:FlxTilemap = morningMap.loadTilemap(AssetPaths.tileset__png, 32, 32, layerName);
		tempLayer.follow();
		if (collision) {
			collisionLayers.add(tempLayer);
		}
		visualLayers.add(tempLayer);
	}
	
	// Initialize Objects onto screen
	private function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player") {
			playerList.add(new Player(x, y, Std.parseInt(entityData.get("pType"))));
		} else if (entityName == "npc") {
			npcList.add(new NPC(x, y, Std.parseInt(entityData.get("nType"))));
		}
	}
	
	// Selects the first alive player
	private function Select(): Void {
		selectedPlayer = playerList.getFirstAlive();
		if (selectedPlayer != null) {
			selectedPlayer.setSelected(true, false);
			FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
		} else {
			FlxG.switchState(new MenuState());
		}
	}
	
	// Selects a player that is clicked
	private function selectPlayer():Void {
		var tempPosition:FlxPoint = FlxG.mouse.getWorldPosition();
		var tempPlayer:Player = selectedPlayer;
		for (player in playerList) {
			if (player.overlapsPoint(tempPosition) && player.alive) {
				tempPlayer = player;
			} else {
				player.setSelected(false, true);
			}
		}
		selectedPlayer = tempPlayer;
		selectedPlayer.setSelected(true, false);
		FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
	}
	
	// Performs an action
	private function playerActions(actionBox:FlxObject, npc:NPC):Void {
		if (FlxG.keys.justPressed.E) {
			// DO SOME ACTION
			selectedPlayer.setInactive();
			Select();
		}
	}*/
}