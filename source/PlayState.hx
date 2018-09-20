package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState {
	var morningMap:FlxOgmoLoader;
	var morningTiles:FlxTilemap;
	var player:Player;
	var npcList:FlxTypedGroup<NPC>;
	var warpList:FlxTypedGroup<Warp>;
	
	override public function create():Void {
		// Load the "morning1" file from the Ogmo Editor
		morningMap = new FlxOgmoLoader(AssetPaths.morning1__oel);

		// Initialize Tileset
		morningTiles = morningMap.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		morningTiles.follow();
		morningTiles.setTileProperties(1, FlxObject.NONE);
		morningTiles.setTileProperties(2, FlxObject.ANY);
		add(morningTiles);
		
		// Initialize player
		player = new Player();
		
		// Initialize all entities
		morningMap.loadEntities(placeEntities, "entities");
		add(player);
		FlxG.camera.follow(player, TOPDOWN, 1);
		openSub();
		super.create();
		
	}

	public function openSub() {
		openSubState(new Aba());
	}
	
	override public function update(elapsed:Float):Void {
		FlxG.collide(player, morningTiles);
		super.update(elapsed);
	}
	
	// Initialize Objects onto map
	public function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player") {
			player.x = x;
			player.y = y;
		} else if (entityName == "npc") {
			npcList.add(new NPC(x, y, Std.parseInt(entityData.get("ntype"))));
		} else if (entityName == "warp") {
			warpList.add(new Warp(x, y, Std.parseInt(entityData.get("wtype"))));
		}
	}
}