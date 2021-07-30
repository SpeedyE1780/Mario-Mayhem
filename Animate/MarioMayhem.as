 package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import fl.motion.MotionEvent;
	import flash.ui.Mouse;
	import flash.display.Stage;
	import flash.ui.MouseCursor;
	
	public class MarioMayhem extends MovieClip {
		
		var MMC : myMouseCursor;
		var myTheme : Theme;
		var PlayerFaction : int;
		var myLakitu : Lakitu;
		var myScore : ScoreText;
		var myController : PlayerController;
		public static var myGameTimer : Timer;
		public static var GameTime : Number;
		var Controller : MovieClip;
		var LakSpeed : int;
		var DropSpeed : int;
		var ControllerSpeed : int;
		public static var GameMode : int;
		public static var Lifes : int;
		public static var setLife : int;
		var setGameTime : int;
		var Time_txt : TimeText;
		public static var LifeIcons : Array;
		public static var myStage : Stage;
		var DropRate : int;
		public function MarioMayhem() {
			// constructor code
			stop();
			Mouse.hide();
			MMC = new myMouseCursor(stage);
			stage.addChild(MMC);
			myTheme = new Theme();
			myTheme.play();
			myStage = stage;
			setGameTime = 30;
			StartArcade_btn.addEventListener(MouseEvent.CLICK , Arcade);
			Instruction_btn.addEventListener(MouseEvent.CLICK , gotoInstruction);
			Settings_btn.addEventListener(MouseEvent.CLICK , gotoSettings);
			StartClassic_btn.addEventListener(MouseEvent.CLICK , Classic);
			LakSpeed = 2;
			DropSpeed = 2;
			ControllerSpeed = 2;
			setLife = 3;
			DropRate = 2;
		}
		
		function Arcade(M:MouseEvent)
		{
			GameMode = 1;
			GameTime = setGameTime;
			myGameTimer = new Timer(1000 , GameTime);
			myGameTimer.addEventListener(TimerEvent.TIMER , TimeLeft);
			myGameTimer.addEventListener(TimerEvent.TIMER_COMPLETE , TimeDone);
			Time_txt = new TimeText();
			Time_txt.x = 550;
			Time_txt.y = 25;
			PlayerSelection();
		}
		
		function Classic(M:MouseEvent)
		{
			Lifes = setLife;
			GameMode = 2;
			LifeIcons = new Array();
			PlayerSelection();
		}
		function gotoSettings(M:MouseEvent)
		{
			gotoAndStop('Settings');
			LKSPD.text = 'Lakitu Speed: ' + LakSpeed.toString();
			CSSPD.text = 'Controller Speed: ' + ControllerSpeed.toString();
			DSPD.text = 'Drops Speed: ' + DropSpeed.toString();
			DR.text = 'Drop Rate: ' + DropRate.toString();
			TTxt.text = 'Time: ' + setGameTime.toString();
			LifeTxt.text = 'Life: ' + setLife.toString();
			MainMenu_btn.addEventListener(MouseEvent.CLICK , goMainMenu);
			Slow1_btn.addEventListener(MouseEvent.CLICK , LakituSlow);
			Slow2_btn.addEventListener(MouseEvent.CLICK , ControllerSlow);
			Slow3_btn.addEventListener(MouseEvent.CLICK , DropSlow);
			Slow4_btn.addEventListener(MouseEvent.CLICK , DropRateSlow);
			Meduim1_btn.addEventListener(MouseEvent.CLICK , LakituMeduim);
			Meduim2_btn.addEventListener(MouseEvent.CLICK , ControllerMeduim);
			Meduim3_btn.addEventListener(MouseEvent.CLICK , DropMeduim);
			Meduim4_btn.addEventListener(MouseEvent.CLICK , DropRateMeduim);
			Fast1_btn.addEventListener(MouseEvent.CLICK , LakituFast);
			Fast2_btn.addEventListener(MouseEvent.CLICK , ControllerFast);
			Fast3_btn.addEventListener(MouseEvent.CLICK , DropFast);
			Fast4_btn.addEventListener(MouseEvent.CLICK , DropRateFast);
			btn30.addEventListener(MouseEvent.CLICK , ShortTime);
			btn60.addEventListener(MouseEvent.CLICK , MeduimTime);
			btn90.addEventListener(MouseEvent.CLICK , LongTime);
			Button1.addEventListener(MouseEvent.CLICK , MinimumLife);
			Button3.addEventListener(MouseEvent.CLICK , MeduimLife);
			Button5.addEventListener(MouseEvent.CLICK , MaximumLife);
		}
		
		function MinimumLife(M:MouseEvent)
		{
			setLife = 1;
			LifeTxt.text = 'Life: ' + setLife.toString();
		}
		
		function MeduimLife(M:MouseEvent)
		{
			setLife = 3;
			LifeTxt.text = 'Life: ' + setLife.toString();
		}

		function MaximumLife(M:MouseEvent)
		{
			setLife = 5;
			LifeTxt.text = 'Life: ' + setLife.toString();
		}
		
		function LakituSlow(M:MouseEvent)
		{
			LakSpeed = 1;
			LKSPD.text = 'Lakitu Speed: ' + LakSpeed.toString();
		}
		
		function ControllerSlow(M:MouseEvent)
		{
			ControllerSpeed = 1;
			CSSPD.text = 'Controller Speed: ' + ControllerSpeed.toString();
		}
		
		function DropSlow(M:MouseEvent)
		{
			DropSpeed = 1;
			DSPD.text = 'Drops Speed: ' + DropSpeed.toString();
		}
		
		function DropRateSlow(M:MouseEvent)
		{
			DropRate = 1;
			DR.text = 'Drop Rate: ' + DropRate.toString();
		}
		
		function LakituMeduim(M:MouseEvent)
		{
			LakSpeed = 2;
			LKSPD.text = 'Lakitu Speed: ' + LakSpeed.toString();
		}
		
		function ControllerMeduim(M:MouseEvent)
		{
			ControllerSpeed = 2;
			CSSPD.text = 'Controller Speed: ' + ControllerSpeed.toString();
		}
		
		function DropMeduim(M:MouseEvent)
		{
			DropSpeed = 2;
			DSPD.text = 'Drops Speed: ' + DropSpeed.toString();
		}
		
		function DropRateMeduim(M:MouseEvent)
		{
			DropRate = 2;
			DR.text = 'Drop Rate: ' + DropRate.toString();
		}
		
		function LakituFast(M:MouseEvent)
		{
			LakSpeed = 3;
			LKSPD.text = 'Lakitu Speed: ' + LakSpeed.toString();
		}
		
		function ControllerFast(M:MouseEvent)
		{
			ControllerSpeed = 3;
			CSSPD.text = 'Controller Speed: ' + ControllerSpeed.toString();
		}
		
		function DropFast(M:MouseEvent)
		{
			DropSpeed = 3;
			DSPD.text = 'Drops Speed: ' + DropSpeed.toString();
		}
		
		function DropRateFast(M:MouseEvent)
		{
			DropRate = 3;
			DR.text = 'Drop Rate: ' + DropRate.toString();
		}
		
		function ShortTime(M:MouseEvent)
		{
			setGameTime = 30;
			TTxt.text = 'Time: ' + setGameTime.toString();
		}
		
		function MeduimTime(M:MouseEvent)
		{
			setGameTime = 60;
			TTxt.text = 'Time: ' + setGameTime.toString();
		}
		
		function LongTime(M:MouseEvent)
		{
			setGameTime = 90;
			TTxt.text = 'Time: ' + setGameTime.toString();
		}
		
		function gotoInstruction(M:MouseEvent)
		{
			gotoAndStop('Instructions');
			MainMenu_btn.addEventListener(MouseEvent.CLICK , goMainMenu);

		}
		
		function PlayerSelection()
		{
			gotoAndStop('PlayerSelection');
			Bomb1_btn.addEventListener(MouseEvent.CLICK , Bomb1Selected);
			Bomb2_btn.addEventListener(MouseEvent.CLICK , Bomb2Selected);
			Daisy_btn.addEventListener(MouseEvent.CLICK , DaisySelected);
			Ghost_btn.addEventListener(MouseEvent.CLICK , GhostSelected);
			Luigi_btn.addEventListener(MouseEvent.CLICK , LuigiSelected);
			Mario_btn.addEventListener(MouseEvent.CLICK , MarioSelected);
			Mushroom_btn.addEventListener(MouseEvent.CLICK , MushroomSelected);
			Peach_btn.addEventListener(MouseEvent.CLICK , PeachSelected);
			Bowser_btn.addEventListener(MouseEvent.CLICK , BowserSelected);
			
		}
		
		function Bomb1Selected(M:MouseEvent)
		{
			Controller = new Bomb1();
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Bomb1();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 2;
			StartGame();
		}
		
		function Bomb2Selected(M:MouseEvent)
		{
			Controller = new Bomb2();
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Bomb2();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 2;
			StartGame();
		}
		
		function DaisySelected(M:MouseEvent)
		{
			Controller = new Daisy();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Daisy();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 1;
			StartGame();
		}
		
		function GhostSelected(M:MouseEvent)
		{
			Controller = new Ghost();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Ghost();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = Math.random() * 1 + 1;
			StartGame();
		}
		
		function LuigiSelected(M:MouseEvent)
		{
			Controller = new Luigi();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Luigi();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 1;
			StartGame();
		}
		
		function MarioSelected(M:MouseEvent)
		{
			Controller = new Mario();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Mario();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 1;
			StartGame();
		}
		
		function PeachSelected(M:MouseEvent)
		{
			Controller = new Peach();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Peach();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 1;
			StartGame();
		}
		
		function MushroomSelected(M:MouseEvent)
		{
			Controller = new Mushroom();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Mushroom();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			
			PlayerFaction = 2;
			StartGame();
		}
		
		function BowserSelected(M:MouseEvent)
		{
			Controller = new Bowser();
			
			if(GameMode == 2)
			{
				for(var i : int = 0 ; i < Lifes ; i++)
				{
					var LI : MovieClip = new Bowser();
					LifeIcons.push(LI);
					LifeIcons[i].scaleX = 0.5;
					LifeIcons[i].scaleY = 0.5;
					LifeIcons[i].x = LifeIcons[i].width/2 + LifeIcons[i].width*i;
					LifeIcons[i].y = LifeIcons[i].height/2;
				}
			}
			PlayerFaction = 2;
			StartGame();
		}

		function StartGame()
		{
			stage.removeChild(MMC);
			gotoAndStop('Game');
			
			if(GameMode == 1)
			{
				myGameTimer.start();
				stage.addChild(Time_txt);
				Time_txt.TimeTextField.text = 'Time: ' + (GameTime - myGameTimer.currentCount).toString();
			}
			
			if(GameMode == 2)
			{
				this.addEventListener(Event.ENTER_FRAME , Loop);
				for(var i: int = 0 ; i < Lifes ; i++)
				{
					stage.addChild(LifeIcons[i]);
				}
			}
			
			myLakitu = new Lakitu(stage , LakSpeed , DropSpeed , DropRate);
			myScore = new ScoreText();
			myController = new PlayerController(stage , myLakitu , myScore , Controller , PlayerFaction , ControllerSpeed);
			stage.addChild(myLakitu);
			myLakitu.x = stage.stageWidth/2;
			myLakitu.y = 125;
			
			
			
			stage.addChild(myScore);
			myScore.x = 325;
			myScore.y = 25;
			
			stage.addChild(myController);
			myController.x = stage.stageWidth/2;
			myController.y = 550;
		}
		
		function TimeLeft(T:TimerEvent)
		{
			Time_txt.TimeTextField.text = 'Time: ' + (GameTime - myGameTimer.currentCount).toString();
		}
		
		function TimeDone(T:TimerEvent)
		{
			EndGame();
		}
		
		function EndGame()
		{
			gotoAndStop('GameOver');
			stage.addChild(MMC);
			myLakitu.RemoveElement();
			stage.removeChild(myLakitu);
			myController.RemoveElement();
			stage.removeChild(myController);
			MainMenu_btn.addEventListener(MouseEvent.CLICK , MainMenu);
		}
		
		function MainMenu(M:MouseEvent)
		{
			gotoAndStop('Menu');
			if(GameMode == 1)
			{
				stage.removeChild(Time_txt);
			}
			stage.removeChild(myScore);
			StartArcade_btn.addEventListener(MouseEvent.CLICK , Arcade);
			StartClassic_btn.addEventListener(MouseEvent.CLICK , Classic);
			Instruction_btn.addEventListener(MouseEvent.CLICK , gotoInstruction);
			Settings_btn.addEventListener(MouseEvent.CLICK , gotoSettings);
		}
		
		function goMainMenu(M:MouseEvent)
		{
			gotoAndStop('Menu');
			StartArcade_btn.addEventListener(MouseEvent.CLICK , Arcade);
			StartClassic_btn.addEventListener(MouseEvent.CLICK , Classic);
			Instruction_btn.addEventListener(MouseEvent.CLICK , gotoInstruction);
			Settings_btn.addEventListener(MouseEvent.CLICK , gotoSettings);
		}
		
		public static function ControlLife()
		{
			Lifes--;
			myStage.removeChild(LifeIcons[Lifes])
		}
		
		public static function AddLife()
		{
			if(Lifes < setLife)
			{
				myStage.addChild(LifeIcons[Lifes]);
				Lifes++
			}
		}
		
		function Loop(E:Event)
		{
			if(Lifes == 0)
			{
				this.removeEventListener(Event.ENTER_FRAME , Loop);
				EndGame();
			}
		}
	}
	
}
