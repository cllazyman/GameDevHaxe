package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState {
	var _characterUI:CharacterUI;
	var _beginning2:Beginning2;
	var _shop:ShopUI;
	var _money:Int = 0;
	var _health:Int = 3;
	var _player:Player;
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var _mfloors:FlxTilemap;
	var _mstuff1:FlxTilemap;
	override public function create():Void {
		 _map = new FlxOgmoLoader(AssetPaths.Test_level__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tileset__png, 32, 32, "wall");
		_mWalls.follow();
		add(_mWalls);
		_mfloors = _map.loadTilemap(AssetPaths.tileset__png, 32, 32, "floor");
		_mfloors.follow();
		add(_mfloors);
		_mstuff1 = _map.loadTilemap(AssetPaths.tileset__png, 32, 32, "stuff-1");
		_mstuff1.follow();
		add(_mstuff1);

		_player = new Player(0,0,0);
		_map.loadEntities(placeEntities, "entity");
		add(_player);

		FlxG.camera.follow(_player, TOPDOWN, 1);
		//_characterUI = new CharacterUI();
		//add(_characterUI);
		_beginning2 = new Beginning2();
		add(_beginning2);
		//_shop = new ShopUI();
		//add(_shop);
		super.create();
	}
	 function placeEntities(entityName:String, entityData:Xml):Void
	{
     var x:Int = Std.parseInt(entityData.get("x"));
     var y:Int = Std.parseInt(entityData.get("y"));
     if (entityName == "player")
     {
         _player.x = x;
         _player.y = y;
     }
	}
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
