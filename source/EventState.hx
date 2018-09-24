package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxSort;
/**
 * ...
 * @author Jon Castro
 */
class EventState extends FlxState {
{
	//Maps
	var eventMap:FlxOgmoLoader;
	
	//Layers
	var layers:FlxTypedGroup<FlxTilemap>;
	var collisionLayers:FlxTypedGroup<FlxTilemap>;
	
	// Entities
	var entities:FlxTypedGroup<FlxObject>;
	var collisionEntities:FlxTypedGroup<FlxObject>;
	var players:FlxTypedGroup<Player>;
	var npcs:FlxTypedGroup<NPC>;
	
	// UI
	var characterUI:CharacterUI;
	var shopUI:ShopUI;
	var index:Int = 0;

	// Actions
	var selectedPlayer:Player;
	
	override public function create():Void {
		// Update Storage values
		Storage.time = true;
		
		// Music
		FlxG.sound.play(AssetPaths.night__ogg);

		// Map
		eventMap = new FlxOgmoLoader(AssetPaths.event__oel);
		
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
		/*FlxG.watch.add(selectedPlayer, "touching");
		FlxG.watch.add(npcs.getFirstAlive(), "touching");
		FlxG.watch.add(npcs.getFirstAlive().velocity, "x");
		FlxG.watch.add(npcs.getFirstAlive().velocity, "y");*/
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void {
		
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