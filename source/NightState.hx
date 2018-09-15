package;

import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class NightState extends FlxState {
	var nightMap:FlxOgmoLoader;
	var nightTiles:FlxTilemap;
	
	override public function create():Void {
		// Load the "night" file from the Ogmo Editor
		/*
		nightMap = new FlxOgmoLoader(AssetPaths.[name]__oel);
		nightTiles = map.loadTilemap(AssetPaths.[name]__png, 32, 32, "[layername]");
		nightTiles.follow();*/
		// Set Tile1 to not collide and Tile2 to Collide
		/*
		nightTiles.setTileProperties(1, FlxObject.NONE);
		nightTiles.setTileProperties(2, FlxObject.ANY);
		add(nightTiles);*/
		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
