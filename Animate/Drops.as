package  {
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.display.Stage;
	
	public class Drops extends MovieClip {
		
		var Faction : int;
		var Dropdelay : Timer;
		var drop : Boolean;
		var Speed : Number;
		var SpeedDifficulty : int;
		var Lak : Lakitu;
		var score : Number;
		var myStage : Stage;
		var dropCharacter : MovieClip;
		public function Drops(L:Lakitu , S : Stage , DC : MovieClip , f : int , DD : Number , SD : int) {
			// constructor code
			SpeedDifficulty = SD;
			Faction = f;
			Lak = L;
			myStage = S;
			dropCharacter = DC;
			this.addChild(dropCharacter);
			if(SpeedDifficulty == 1)
			{
				Speed = Math.random() * 4 + 1;
			}
			else
				if(SpeedDifficulty == 2)
				{
					Speed = Math.random() * 4 + 6;
				}
				else
				{
					Speed = Math.random() * 4 + 11;
				}
			Dropdelay = new Timer((DD - 250) , 1);
			drop = false;
			Dropdelay.start();
			Dropdelay.addEventListener(TimerEvent.TIMER_COMPLETE , Fall);
			this.addEventListener(Event.ENTER_FRAME , Loop);
		}
		
		function Fall(t:TimerEvent)
		{
			drop = true;
		}
		
		function Loop(e:Event)
		{
			if(drop)
			{
				this.y += Speed;
			}
			else
			{
				if(Lak.Orientation == 1)
				{
					this.x = Lak.x + this.width/2;
				}
				if(Lak.Orientation == -1)
				{
					this.x = Lak.x - this.width/2;
				}

				this.scaleX = Lak.Orientation;
				
			}
			
			if(this.y > myStage.stageHeight + this.height/2 )
			{
				if(myStage.contains(this))
				{
					if(MarioMayhem.GameMode == 2)
					{
						MarioMayhem.ControlLife();
					}
					myStage.removeChild(this);
					if(this.contains(dropCharacter))
					{
						this.removeChild(dropCharacter);
					}
					
				}
			
			}
		}
		
		function setScore(N: Number)
		{
			score = N;
		}
		
		function RemoveElements()
		{
			Dropdelay.removeEventListener(TimerEvent.TIMER_COMPLETE , Fall);
			this.removeEventListener(Event.ENTER_FRAME , Loop);
			if(this.contains(dropCharacter))
			{
				this.removeChild(dropCharacter);
			}
			
			Dropdelay.stop();
		}
	}
	
}
