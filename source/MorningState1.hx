package;

import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;

class MorningState1 extends FlxState {
	var player:Player;
	var npcList:FlxTypedGroup<NPC>;
	var npcList:FlxTypedGroup<Warp>;
	var morningMap:FlxOgmoLoader;
	var morningTiles:FlxTilemap;
	
	override public function create():Void {
		// Load the "morning1" file from the Ogmo Editor
		morningMap = new FlxOgmoLoader(AssetPaths.morning1__oel);
		morningTiles = map.loadTilemap(AssetPaths.morning__png, 16, 16, "walls");
		morningTiles.follow();
		morningTiles.setTileProperties(1, FlxObject.NONE);
		morningTiles.setTileProperties(2, FlxObject.ANY);
		add(morningTiles);
		
		// Initialize player
		player = new Player();
		morningTiles.loadEntities(placeEntities, "entities");
		super.create();
	}

	override public function update(elapsed:Float):Void {
		FlxG.collide(player, morningTiles);
		super.update(elapsed);
	}
	
	function placeEntities(entityName:String, entityData:Xml):Void {
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player") {
			player.x = x;
			player.y = y;
		} else if (entityName == "npc") {
			npc.x = x;
			npc.y = y;
		} else if (entityName == "warp") {
			warp.x = x;
			warp.y = y;
		}
	}
	
}
