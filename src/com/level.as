package com 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class level extends Entity 
	{
		private var tiles:Tilemap;
		private var grid:Grid;
		private var openness:Number = .2 //Value from 0 to 1
		public function level() 
		{
			tiles = new Tilemap(Assets.TILESHEET, Registry.dungeonWidth * Registry.tileWidth, Registry.dungeonHeight * Registry.tileHeight, Registry.tileWidth, Registry.tileHeight);
			grid = new Grid(Registry.dungeonWidth * Registry.tileWidth, Registry.dungeonHeight * Registry.tileHeight, Registry.tileWidth, Registry.tileHeight, 0, 0);
			mask = grid;
			type = "level";
			graphic = tiles;
			for (var i:uint; i < dungeonGen.rectangles.length; i++) {
				if (dungeonGen.rectangles[i].width <= Registry.dungeonWidth && dungeonGen.rectangles[i].height <= Registry.dungeonHeight && Math.random() > openness) {
					tiles.setRectOutline(dungeonGen.rectangles[i].left, dungeonGen.rectangles[i].top, dungeonGen.rectangles[i].width, dungeonGen.rectangles[i].height, 2);

						var doorTop:Point = new Point();
						doorTop.x = dungeonGen.rectangles[i].left + Math.round(Math.random()*dungeonGen.rectangles[i].width);
						doorTop.y = dungeonGen.rectangles[i].top;
						
						var doorBottom:Point = new Point();
						doorBottom.x = dungeonGen.rectangles[i].left + Math.round(Math.random()*dungeonGen.rectangles[i].width);
						doorBottom.y = dungeonGen.rectangles[i].top + dungeonGen.rectangles[i].height;
						
						var doorLeft:Point = new Point();
						doorLeft.x = dungeonGen.rectangles[i].left;
						doorLeft.y = dungeonGen.rectangles[i].top + Math.round(Math.random() * dungeonGen.rectangles[i].height);
						
						var doorRight:Point = new Point();
						doorRight.x = dungeonGen.rectangles[i].left + dungeonGen.rectangles[i].width;
						doorRight.y = dungeonGen.rectangles[i].top + Math.round(Math.random() * dungeonGen.rectangles[i].height);
						
						var isDoor:Boolean = false;
						while (isDoor == false) {
							
							if (tiles.getTile(doorTop.x, doorTop.y - 1) == 0 && tiles.getTile(doorTop.x, doorTop.y + 1) == 0) {
								tiles.setTile(doorTop.x, doorTop.y, 0);
								isDoor = true;
							}
							if (tiles.getTile(doorBottom.x, doorBottom.y - 1) == 0 && tiles.getTile(doorBottom.x, doorBottom.y + 1) == 0) {
								tiles.setTile(doorBottom.x, doorBottom.y, 0);
								isDoor = true;
							}
							if (tiles.getTile(doorLeft.x - 1, doorLeft.y) == 0 && tiles.getTile(doorLeft.x + 1, doorLeft.y) == 0) {
								tiles.setTile(doorLeft.x, doorLeft.y, 0);
								isDoor = true;
							}
							if (tiles.getTile(doorRight.x - 1, doorRight.y) == 0 && tiles.getTile(doorRight.x + 1, doorRight.y) == 0) {
								tiles.setTile(doorRight.x, doorRight.y, 0);
								isDoor = true;
							}
						}
					
					
				}
			}
			tiles.setRectOutline(0, 0, Registry.dungeonWidth - 1, Registry.dungeonHeight - 1, 2);
			for (var x:uint = 0; x < Registry.dungeonWidth; x++) {
				for (var y:uint = 0; y < Registry.dungeonHeight; y++) {
					
					if (tiles.getTile(x, y) != 0) {
						grid.setTile(x, y, true);
					}
				}
			}
		}
		
	}

}