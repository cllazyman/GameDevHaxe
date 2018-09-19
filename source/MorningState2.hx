package;

import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class MorningState2 extends FlxState {
	var morningMap:FlxOgmoLoader;
	var morningTiles:FlxTilemap;
	
	override public function create():Void {
		// Load the "morning" file from the Ogmo Editor
		/*
		morningMap = new FlxOgmoLoader(AssetPaths.[name]__oel);
		morningTiles = map.loadTilemap(AssetPaths.[name]__png, 32, 32, "[layername]");
		morningTiles.follow();*/
		// Set Tile1 to not collide and Tile2 to Collide
		/*
		morningTiles.setTileProperties(1, FlxObject.NONE);
		morningTiles.setTileProperties(2, FlxObject.ANY);
		add(morningTiles);*/
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
