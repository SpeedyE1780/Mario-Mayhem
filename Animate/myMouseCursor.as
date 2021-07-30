package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	
	public class myMouseCursor extends MovieClip {
		
		var myStage : Stage;
		
		public function myMouseCursor(S : Stage) {
			// constructor code
			myStage = S;
			this.x = myStage.stageWidth/2;
			this.y = myStage.stageHeight/2;
			this.addEventListener(Event.ENTER_FRAME , Loop);
			
		}
		
		function Loop(E:Event)
		{
			this.x = myStage.mouseX + 50;
			this.y = myStage.mouseY + 50;
		}
	}
	
}
