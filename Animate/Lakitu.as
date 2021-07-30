package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Stage;
	
	
	public class Lakitu extends MovieClip {
		
		var dropFaction : int;
		var Orientation : Number;
		var Speed : Number;
		var SpawnTimer : Timer;
		var drop : Drops;
		var SpawnDelay : Number;
		var dropArray : Array;
		var myStage : Stage;
		var dropScore : Array;
		var SpeedDifficulty : int;
		var DropSpeedDifficulty : int;
		var DropRateDifficulty : int;
		public function Lakitu(s : Stage , SD : int , DSD : int , DRD : int) {
			// constructor code
			DropRateDifficulty = DRD;
			DropSpeedDifficulty = DSD;
			SpeedDifficulty = SD;
			dropFaction = 0;
			myStage = s;
			Orientation = 1;
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
			dropArray = new Array();
			if(DropRateDifficulty == 1)
			{
				SpawnDelay = Math.random() * 1500 + 1500;
			}
			else
				if(DropRateDifficulty == 2)
				{
					SpawnDelay = Math.random() * 1000 + 500;
				}
				else
				{
					SpawnDelay = Math.random() * 200 + 300;
				}
			SpawnTimer = new Timer(SpawnDelay , 0);
			this.addEventListener(Event.ENTER_FRAME, Loop);
			SpawnTimer.start();
			SpawnTimer.addEventListener(TimerEvent.TIMER , SpawnEnemy);
			dropScore = new Array();
			for (var i : int = 0 ; i < 9 ; i++)
			{
				var Score : int = Math.random() * 9 + 1;
				dropScore[i] = Score;
			}
			}
		function Loop(e:Event)
		{
			if(this.x < 0 + this.width/2)
			{
				Orientation = 1;
				this.scaleX = Orientation;
				Speed *= -1;
				this.x = width/2;
			}
			if(this.x > myStage.stageWidth - this.width/2)
			{
				Orientation = -1;
				this.scaleX = Orientation;
				Speed *= -1;
				this.x = myStage.stageWidth - this.width/2;
			}
			this.x += Speed;
		}
		
		function SpawnEnemy(e:TimerEvent)
		{
			if(Speed < 0)
			{
				if(SpeedDifficulty == 1)
				{
					Speed = -(Math.random() * 4 + 1);
				}
				else
					if(SpeedDifficulty == 2)
					{
						Speed = -(Math.random() * 4 + 6);
					}
					else
					{
						Speed = -(Math.random() * 4 + 11);
					}
			}
			else
			{
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
			}
			if(DropRateDifficulty == 1)
			{
				SpawnDelay = Math.random() * 1500 + 1500;
			}
			else
				if(DropRateDifficulty == 2)
				{
					SpawnDelay = Math.random() * 1000 + 500;
				}
				else
				{
					SpawnDelay = Math.random() * 200 + 300;
				}
			SpawnTimer.delay = SpawnDelay;
			var RNG : Number;

			if(MarioMayhem.GameMode == 1)
			{
				RNG = Math.random() * 100;
				//RNG = 45;
				if(RNG <= 45)
				{
					RNG = Math.random() * 4;
					//RNG = 1;
					RNG = Math.round(RNG);
					if(RNG == 0)
					{
						var mario_drop : Mario = new Mario();
						dropFaction = 1;
						drop = new Drops(this , myStage , mario_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + mario_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - mario_drop.width/2;
						}
					}
					
					if(RNG == 1)
					{
						var luigi_drop : Luigi = new Luigi();
						dropFaction = 1;
						drop = new Drops(this , myStage , luigi_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + luigi_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - luigi_drop.width/2;
						}
					}
					
					if(RNG == 2)
					{
						var peach_drop : Peach = new Peach();
						dropFaction = 1;
						drop = new Drops(this , myStage , peach_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + peach_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - peach_drop.width/2;
						}
					}
					
					if(RNG == 3)
					{
						var daisy_drop : Daisy = new Daisy();
						dropFaction = 1;
						drop = new Drops(this , myStage , daisy_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + daisy_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - daisy_drop.width/2;
						}
					}
				}
				else
					if(RNG <= 90)
					{
						RNG = Math.random() * 4 + 4;
						RNG = Math.round(RNG);
						if(RNG == 4)
						{
							var ghost_drop : Ghost = new Ghost();
							dropFaction = Math.random() * 1 + 1;
							drop = new Drops(this , myStage , ghost_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + ghost_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - ghost_drop.width/2;
							}
						}
						
						if(RNG == 5)
						{
							var bomb1_drop : Bomb1 = new Bomb1();
							dropFaction = 2;
							drop = new Drops(this , myStage , bomb1_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + bomb1_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - bomb1_drop.width/2;
							}
						}
						
						if(RNG == 6)
						{
							var bomb2_drop : Bomb2 = new Bomb2();
							dropFaction = 2;
							drop = new Drops(this , myStage , bomb2_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + bomb2_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - bomb2_drop.width/2;
							}
						}
						
						if(RNG == 7)
						{
							var mushroom_drop : Mushroom = new Mushroom();
							dropFaction = 2;
							drop = new Drops(this , myStage , mushroom_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + mushroom_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - mushroom_drop.width/2;
							}
						}
						if(RNG == 8)
						{
							var bowser_drop : Bowser = new Bowser();
							dropFaction = 2;
							drop = new Drops(this , myStage , bowser_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + bowser_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - bowser_drop.width/2;
							}
						}
					}
					else
					{
						RNG = Math.random() * 3;
						RNG = Math.round(RNG);
						
						if(RNG == 0)
						{
							var doublescore_drop : DoubleScore = new DoubleScore();
							drop = new Drops(this , myStage , doublescore_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(-11);
							if(Orientation == 1)
							{
								drop.x = this.x + doublescore_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - doublescore_drop.width/2;
							}
						}
						
						if(RNG == 1)
						{
							var addtime_drop : AddTime = new AddTime();
							drop = new Drops(this , myStage , addtime_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(-12);
							if(Orientation == 1)
							{
								drop.x = this.x + addtime_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - addtime_drop.width/2;
							}
						}
						
						if(RNG == 2)
						{
							var doublesize_drop : DoubleSize = new DoubleSize();
							drop = new Drops(this , myStage , doublesize_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(-13);
							if(Orientation == 1)
							{
								drop.x = this.x + doublesize_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - doublesize_drop.width/2;
							}
						}
					}
			}
			else
				if(MarioMayhem.GameMode == 2)
				{
					RNG = Math.random() * 8;
					RNG = Math.round(RNG);
					if(RNG == 0)
					{
						var mario_drop : Mario = new Mario();
						dropFaction = 1;
						drop = new Drops(this , myStage , mario_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + mario_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - mario_drop.width/2;
						}
					}
					
					if(RNG == 1)
					{
						var luigi_drop : Luigi = new Luigi();
						dropFaction = 1;
						drop = new Drops(this , myStage , luigi_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + luigi_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - luigi_drop.width/2;
						}
					}
					
					if(RNG == 2)
					{
						var peach_drop : Peach = new Peach();
						dropFaction = 1;
						drop = new Drops(this , myStage , peach_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + peach_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - peach_drop.width/2;
						}
					}
					
					if(RNG == 3)
					{
						var daisy_drop : Daisy = new Daisy();
						dropFaction = 1;
						drop = new Drops(this , myStage , daisy_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
						dropArray.push(drop);
						myStage.addChild(drop);
						drop.setScore(dropScore[RNG]);
						if(Orientation == 1)
						{
							drop.x = this.x + daisy_drop.width/2;
						}
						if(Orientation == -1)
						{
							drop.x = this.x - daisy_drop.width/2;
						}
					}
					if(RNG == 4)
						{
							var ghost_drop : Ghost = new Ghost();
							dropFaction = Math.random() * 1 + 1;
							drop = new Drops(this , myStage , ghost_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + ghost_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - ghost_drop.width/2;
							}
						}
						
						if(RNG == 5)
						{
							var bomb1_drop : Bomb1 = new Bomb1();
							dropFaction = 2;
							drop = new Drops(this , myStage , bomb1_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + bomb1_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - bomb1_drop.width/2;
							}
						}
						
						if(RNG == 6)
						{
							var bomb2_drop : Bomb2 = new Bomb2();
							dropFaction = 2;
							drop = new Drops(this , myStage , bomb2_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + bomb2_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - bomb2_drop.width/2;
							}
						}
						
						if(RNG == 7)
						{
							var mushroom_drop : Mushroom = new Mushroom();
							dropFaction = 2;
							drop = new Drops(this , myStage , mushroom_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + mushroom_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - mushroom_drop.width/2;
							}
						}
						if(RNG == 8)
						{
							var bowser_drop : Bowser = new Bowser();
							dropFaction = 2;
							drop = new Drops(this , myStage , bowser_drop , dropFaction , SpawnDelay , DropSpeedDifficulty);
							dropArray.push(drop);
							myStage.addChild(drop);
							drop.setScore(dropScore[RNG]);
							if(Orientation == 1)
							{
								drop.x = this.x + bowser_drop.width/2;
							}
							if(Orientation == -1)
							{
								drop.x = this.x - bowser_drop.width/2;
							}
						}
				}
			
			
			drop.y = this.y;
		}
		
		function RemoveElement()
		{
			SpawnTimer.stop();
			this.removeEventListener(Event.ENTER_FRAME, Loop);
			SpawnTimer.removeEventListener(TimerEvent.TIMER , SpawnEnemy);
			for(var i : Number = 0 ; i < dropArray.length ; i++)
			{
				if(myStage.contains(dropArray[i]))
				{
					myStage.removeChild(dropArray[i]);
					dropArray[i].RemoveElements();
				}
				
			}
		}
	}
	
}
