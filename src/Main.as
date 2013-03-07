package 
{
	import com.gameWorld;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author RKDN
	 */
	[SWF(width = "800", height = "600")]
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			trace("FP started!");
			super(800, 600, 60, false);
			
			//FP.screen.scale = 2;
			
			//FP.console.enable();
			
			FP.world = new gameWorld;
		}
		
		override public function init():void 
		{
			trace("FP init!");
			super.init();
		}
		
		override public function update():void
		{
			super.update();
			
			// press ESCAPE to exit debug player
			if (Input.check(Key.ESCAPE)) {
				System.exit(1);
			}
		}
	}
}