package  {
	
	import flash.display.MovieClip;
	
	
	public class ScoreText extends MovieClip {
		
		var Score: Number;
		public function ScoreText() {
			// constructor code
			Score = 0;
			ScoreTextField.text=Score.toString();
		}
		function AddScore(S : Number)
		{
			Score += S;
			if(MarioMayhem.GameMode == 2)
			{
				if(Score % 100 == 0)
				{
					MarioMayhem.AddLife()
				}
			}
			ScoreTextField.text=Score.toString();
		}
	}
	
}
