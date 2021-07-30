package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class PlayerController extends MovieClip {
		
		var MoveRight : Boolean;
		var MoveLeft : Boolean;
		var Speed : Number;
		var Velocity : Number;
		var Orientation : Number;
		var myLak : Lakitu;
		var myStage : Stage;
		var myScore : ScoreText;
		var myController : MovieClip;
		var doubleScore : Boolean;
		var doubleScoreTimer : Timer;
		var doubleScoreIcon : DoubleScore;
		var doubleSize: Boolean;
		var doubleSizeTimer : Timer;
		var doubleSizeIcon : DoubleSize;
		var addTime : Timer;
		var Faction : int;
		var SpeedDifficulty : int;
		
		public function PlayerController(s : Stage , L : Lakitu , SC : ScoreText , MC : MovieClip , f : int , SD : int) {
			// constructor code
			SpeedDifficulty = SD;
			Faction = f;
			myScore = SC;
			myStage = s;
			myLak = L;
			myStage.addChild(this);
			myController = MC;
			this.addChild(myController);
			doubleScore = false;
			doubleScoreTimer = new Timer(500 , 10);
			doubleScoreIcon = new DoubleScore();
			doubleScoreIcon.x = 23;
			doubleScoreIcon.y = 23;
			doubleSize = false;
			doubleSizeTimer = new Timer(500 , 10);
			doubleSizeIcon = new DoubleSize();
			doubleSizeIcon.x = 70;
			doubleSizeIcon.y = 23;
			this.addEventListener(Event.ENTER_FRAME , Loop);
			myStage.addEventListener(KeyboardEvent.KEY_DOWN , Move);
			myStage.addEventListener(KeyboardEvent.KEY_UP , StopMove);
			this.x = stage.stageWidth/2;
			this.y = 550
			MoveLeft = false;
			MoveRight = false;
			if(SpeedDifficulty == 1)
			{
				Speed = 5;
			}
			else
				if(SpeedDifficulty == 2)
				{
					Speed = 10;
				}
				else
				{
					Speed = 15;
				}
			
			Orientation = 1;
			Velocity = 0;
		}
		function Loop(e:Event)
		{
			if(this.x < 0 + this.width/2)
			{
				this.x = myStage.stageWidth - this.width/2;
			}
			if(this.x > myStage.stageWidth - this.width/2)
			{
				this.x = 0 + this.width/2;
			}
			if(MoveLeft)
			{
				Velocity = -Speed;
				
				if(doubleSize)
				{
					Orientation = -2;
					scaleX = Orientation;
				}
				else
				{
					Orientation = -1;
					scaleX = Orientation;
				}
				
			}
			else
				if(MoveRight)
				{
					Velocity = Speed;
					
					if(doubleSize)
					{
						Orientation = 2;
						scaleX = Orientation;
					}
					else
					{
						Orientation = 1;
						scaleX = Orientation;
					}
				}
				else
				{
					Velocity *= 0.9;
				}
				this.x += Velocity;
				
				for(var i : Number = 0 ; i< myLak.dropArray.length ; i++)
				{
					if(MarioMayhem.GameMode == 1)
					{
						if(hitTestObject(myLak.dropArray[i]))
						{
							if(myLak.dropArray[i].score > -11 )
							{
								if(doubleScore)
								{
									if(Faction == myLak.dropArray[i].Faction)
									{
										myLak.dropArray[i].score *= 2;
										myScore.AddScore(myLak.dropArray[i].score);
									}
									else
									{
										myLak.dropArray[i].score *= 2;
										myScore.AddScore(-(myLak.dropArray[i].score));
									}
								}
								else
								{
									if(Faction == myLak.dropArray[i].Faction)
									{
										myScore.AddScore(myLak.dropArray[i].score);
									}
									else
									{
										myScore.AddScore(-(myLak.dropArray[i].score));
									}
								}
								myStage.removeChild(myLak.dropArray[i]);
								myLak.dropArray.splice(i , 1);
							
							}
							else
								if(myLak.dropArray[i].score == -11)
								{
									if(doubleScore)
									{
										stage.removeChild(myLak.dropArray[i]);
										myLak.dropArray.splice(i , 1);
									}
									else
									{
										stage.removeChild(myLak.dropArray[i]);
										myLak.dropArray.splice(i , 1);
										doubleScore = true;
										doubleScoreTimer.reset();
										doubleScoreTimer.start();
										doubleScoreTimer.addEventListener(TimerEvent.TIMER_COMPLETE , endDoubleScore);
										doubleScoreTimer.addEventListener(TimerEvent.TIMER , doubleScoreFlashIcon);
									}
								
								}
								else
									if(myLak.dropArray[i].score == -12)
									{
										MarioMayhem.myGameTimer.repeatCount += 3;
										MarioMayhem.GameTime += 3;
										stage.removeChild(myLak.dropArray[i]);
										myLak.dropArray.splice(i , 1);
									}
									else
										if(myLak.dropArray[i].score == -13)
										{
											if(doubleSize)
											{
											stage.removeChild(myLak.dropArray[i]);
											myLak.dropArray.splice(i , 1);
											}
											else
											{
												this.scaleX = 2;
												this.scaleY = 2;
												stage.removeChild(myLak.dropArray[i]);
												myLak.dropArray.splice(i , 1);
												doubleSize = true;
												doubleSizeTimer.reset();
												doubleSizeTimer.start();
												doubleSizeTimer.addEventListener(TimerEvent.TIMER_COMPLETE , endDoubleSize);
												doubleSizeTimer.addEventListener(TimerEvent.TIMER , doubleSizeFlashIcon);
											}
										}
						
						}
					}
					else
						if(MarioMayhem.GameMode == 2)
						{
							if(hitTestObject(myLak.dropArray[i]))
							{
								myScore.AddScore(1);
								myStage.removeChild(myLak.dropArray[i]);
								myLak.dropArray.splice(i , 1);
							}
						}
					
				}
		}
		
		function doubleScoreFlashIcon(T:TimerEvent)
		{
			if(myStage.contains(doubleScoreIcon))
			{
				myStage.removeChild(doubleScoreIcon);
			}
			else
			{
				myStage.addChild(doubleScoreIcon);
			}
		}

		function endDoubleScore (T:TimerEvent)
		{
			doubleScore = false;
			if(myStage.contains(doubleScoreIcon))
			{
				myStage.removeChild(doubleScoreIcon);
			}
		}
		
		
		function doubleSizeFlashIcon(T:TimerEvent)
		{
			if(myStage.contains(doubleSizeIcon))
			{
				myStage.removeChild(doubleSizeIcon);
			}
			else
			{
				myStage.addChild(doubleSizeIcon);
			}
		}

		function endDoubleSize (T:TimerEvent)
		{
			doubleSize = false;
			this.scaleX = 1;
			this.scaleY = 1;
			if(myStage.contains(doubleSizeIcon))
			{
				myStage.removeChild(doubleSizeIcon);
			}
		}
		
		
		
		
		function Move(k:KeyboardEvent)
		{
			if(k.keyCode == Keyboard.LEFT)
			{
				MoveLeft = true;
			}
			if(k.keyCode == Keyboard.RIGHT)
			{
				MoveRight = true;
			}
		}
		function StopMove(k:KeyboardEvent)
		{
			if(k.keyCode == Keyboard.LEFT)
			{
				MoveLeft = false;
			}
			if(k.keyCode == Keyboard.RIGHT)
			{
				MoveRight = false;
			}			
		}
		
		function RemoveElement()
		{
			doubleScoreTimer.stop();
			doubleScoreTimer.removeEventListener(TimerEvent.TIMER_COMPLETE , endDoubleScore);
			doubleScoreTimer.removeEventListener(TimerEvent.TIMER , doubleScoreFlashIcon);
			doubleSizeTimer.stop();
			doubleSizeTimer.removeEventListener(TimerEvent.TIMER_COMPLETE , endDoubleSize);
			doubleSizeTimer.removeEventListener(TimerEvent.TIMER , doubleSizeFlashIcon);
			if(myStage.contains(doubleScoreIcon))
			{
				myStage.removeChild(doubleScoreIcon);
			}
			if(myStage.contains(doubleSizeIcon))
			{
				myStage.removeChild(doubleSizeIcon);
			}
			this.removeEventListener(Event.ENTER_FRAME , Loop);
			myStage.removeEventListener(KeyboardEvent.KEY_DOWN , Move);
			myStage.removeEventListener(KeyboardEvent.KEY_UP , StopMove);
		}
	}
	
}
