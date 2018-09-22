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
	var nightMap:FlxOgmoLoader;
	var nightTiles:FlxTilemap;
	var playerList:FlxTypedGroup<Player>;
	var npcList:FlxTypedGroup<NPC>;
	
	// For Player actions
	var selectedPlayer:Player;
	
	override public function create():Void {
		// Load the "morning1" file from the Ogmo Editor
		// CHANGE TO NIGHT LEVEL
		nightMap = new FlxOgmoLoader(AssetPaths.tiles1__oel);
		
		// Initialize Tileset
		nightTiles = nightMap.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		nightTiles.follow();
		nightTiles.setTileProperties(1, FlxObject.NONE);
		nightTiles.setTileProperties(2, FlxObject.ANY);
		
		// Initialize all entities
		playerList = new FlxTypedGroup<Player>();
		npcList = new FlxTypedGroup<NPC>();
		nightMap.loadEntities(placeEntities, "entities");
		
		// Select the player
		Select();
		
		// Add values to view
		add(nightTiles);
		add(playerList);
		add(npcList);
		
		// Extra
		FlxG.camera.follow(selectedPlayer, TOPDOWN, 1);
		
		super.create();
	}

	override public function update(elapsed:Float):Void {
		if (FlxG.mouse.justReleased) {
			selectPlayer();
		}
		// Update Collisions
		FlxG.collide(selectedPlayer, nightTiles);
		FlxG.collide(selectedPlayer, npcList);
		FlxG.collide(selectedPlayer, playerList);
		FlxG.overlap(selectedPlayer.actionBox, npcList, playerActions);
		super.update(elapsed);
	}
	
	// Initialize Objects onto map
	private function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player") {
			playerList.add(new Player(x, y, Std.parseInt(entityData.get("pType"))));
		} else if (entityName == "npc") {
			npcList.add(new NPC(x + 4, y, Std.parseInt(entityData.get("nType"))));
		}
	}
	
	// Selects the first alive player
	private function Select(): Void {
		selectedPlayer = playerList.getFirstAlive();
		if (selectedPlayer != null) {
			selectedPlayer.setSelected(true, false);
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
	}
}