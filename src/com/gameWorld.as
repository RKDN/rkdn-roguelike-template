package com 
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author RKDN
	 */
	public class gameWorld extends World 
	{
		private var square:player = new player(100, 100);
		public static var dungeon:dungeonGen = null; //My dungeon Generator
		public function gameWorld() 
		{
			
		}
		
		override public function begin():void {
			
			dungeon = new dungeonGen; //My dungeon Generator
			add(new level);
			add(square);
			
			super.begin();
		}
		
	}

}