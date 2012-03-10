package
{
	public class FlyerGame
	{
		public function FlyerGame()
		{
			
			////////////////////////////////////////////////////
			//STOP FLASH MOVIE ON FRAME 1.  ENTIRE GAME IS PLAYED ON FRAME 1
			////////////////////////////////////////////////////
			this.stop();
			
			
			//**************************************************
			//IMPORTS - CHOOSE WHICH BUILT IN CLASSES WILL HELP YOU
			//**************************************************
			import flash.events.KeyboardEvent;
			import flash.ui.Keyboard;
			import flash.events.Event;
			
			
			//**************************************************
			//EVENTS - REACT TO KEYS, MOUSE, AND OTHER THINGS
			//**************************************************
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardKeyDown)
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyboardKeyUp)
			
			
			
			//************************************************************
			//FUNCTIONS - REUSABLE GROUPS OF CODE
			//************************************************************
			
			////////////////////////////////////////////////////
			//OUTPUT A VICTORY MESSAGE AND 'STOP' THE GAME
			////////////////////////////////////////////////////
			function youWin() : void {
				
				//MESSAGE
				trace("You Won the Game!");
				
				//SET SCORE
				setScore (100);
				
				//PLAY SOUND
				playWinGameSound();
				
				//END GAME, STOP LISTENING TO EVENTS
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyboardKeyDown)
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyboardKeyUp)
				biplane_mc1.removeEventListener	(Event.ENTER_FRAME, moveRight);
				biplane_mc2.removeEventListener	(Event.ENTER_FRAME, moveRight);
				blimp_mc1.removeEventListener	(Event.ENTER_FRAME, moveLeft);
				blimp_mc2.removeEventListener	(Event.ENTER_FRAME, moveLeft);
				
				
			}
			////////////////////////////////////////////////////
			//OUTPUT A FAILURE MESSAGE AND 'STOP' THE GAME
			////////////////////////////////////////////////////
			function youLose() : void {
				
				//MESSAGE
				trace("You Lost the Game!");
				
				//SET SCORE
				setScore (-100);
				
				//PLAY SOUND
				playLoseGameSound();
				
				//END GAME
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyboardKeyDown)
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyboardKeyUp)
				biplane_mc1.removeEventListener	(Event.ENTER_FRAME, moveRight);
				biplane_mc2.removeEventListener	(Event.ENTER_FRAME, moveRight);
				blimp_mc1.removeEventListener	(Event.ENTER_FRAME, moveLeft);
				blimp_mc2.removeEventListener	(Event.ENTER_FRAME, moveLeft);
			}
			
			////////////////////////////////////////////////////
			//DISPLAY THE SCORE
			////////////////////////////////////////////////////
			function setScore (aScore_num: Number) : void {
				score_textfield.htmlText = "Score: " + aScore_num;
			}
			
			//INITIALLY START SCORE AT 0
			setScore (0);
			
			
			////////////////////////////////////////////////////
			//PLAY A SOUND
			////////////////////////////////////////////////////
			
			//SETUP (ONE TIME)
			var winGameSound:WinGameSound = new WinGameSound();
			var loseGameSound:LoseGameSound = new LoseGameSound();
			var moveFlyerSound:MoveFlyerSound = new MoveFlyerSound();
			
			//PLAY WHEN NEEDED
			function playWinGameSound () : void {
				winGameSound.play();
			}
			function playLoseGameSound () : void {
				loseGameSound.play();
			}
			function playMoveFlyerSound () : void {
				moveFlyerSound.play();
			}
			
			
			////////////////////////////////////////////////////
			//HANDLE ENEMY THAT MOVES RIGHT
			////////////////////////////////////////////////////
			function moveRight (event:Event) : void {
				
				//REFERENCE TO ENEMY
				var enemy_mc:MovieClip = event.target as MovieClip;
				
				//MOVE THE ENEMY FORWARD
				enemy_mc.x = enemy_mc.x + enemy_mc.speed;
				
				//RESET POSITION IF OFFSCREEN
				if (enemy_mc.x > 800) {
					enemy_mc.x = -100;
				}
				
				//COLLISION DETECTION 'DID ENEMY HIT FLYER?'
				if (enemy_mc.hitTestObject(flyer_mc)) {
					youLose();
				}
			};
			
			////////////////////////////////////////////////////
			//HANDLE ENEMY THAT MOVE LEFT
			////////////////////////////////////////////////////
			function moveLeft (event:Event) : void {	
				
				//REFERENCE TO ENEMY
				var enemy_mc:MovieClip = event.target as MovieClip;
				
				//MOVE THE ENEMY FORWARD
				enemy_mc.x = enemy_mc.x - enemy_mc.speed;
				
				//RESET POSITION IF OFFSCREEN
				if (enemy_mc.x < -100) {
					enemy_mc.x = 800;
				}
				
				//COLLISION DETECTION 'DID ENEMY HIT FLYER?'
				if (enemy_mc.hitTestObject(flyer_mc)) {
					youLose();
				}
			};
			
			////////////////////////////////////////////////////
			//SET UNIQUE SPEED FOR EACH ENEMY &
			//INSTRUCT ENEMY TO RUN ITS GAME LOOP EACH FRAME
			////////////////////////////////////////////////////
			
			biplane_mc1.speed = 15;
			biplane_mc1.addEventListener(Event.ENTER_FRAME, moveRight);
			
			biplane_mc2.speed = 13;
			biplane_mc2.addEventListener(Event.ENTER_FRAME, moveRight);
			
			blimp_mc1.speed = 8;
			blimp_mc1.addEventListener(Event.ENTER_FRAME, moveLeft);
			
			blimp_mc2.speed = 5;
			blimp_mc2.addEventListener(Event.ENTER_FRAME, moveLeft);

			
		}

		
		////////////////////////////////////////////////////
		//KEYBOARD KEY PRESSED
		////////////////////////////////////////////////////
		function onKeyboardKeyDown(event:KeyboardEvent) : void {
			
			//REACT TO 4 ARROW KEYS
			if (event.keyCode == Keyboard.UP) {
				flyer_mc.y = flyer_mc.y - 30;
				playMoveFlyerSound();
			} else if (event.keyCode == Keyboard.DOWN) {
				flyer_mc.y = flyer_mc.y + 30;
				playMoveFlyerSound();
			} else if (event.keyCode == Keyboard.LEFT) {
				flyer_mc.x = flyer_mc.x - 30;
				playMoveFlyerSound();
			} else if (event.keyCode == Keyboard.RIGHT) {
				flyer_mc.x = flyer_mc.x + 30;
				playMoveFlyerSound();
			}
			
			//WIN WHEN YOU REACH THE TOP OF SCREEN
			if (flyer_mc.y < 30) {
				youWin();
			}
			
			//ANIMATE A LITTLE
			flyer_mc.gotoAndStop(1);
			
		};
		////////////////////////////////////////////////////
		//KEYBOARD KEY RELEASED
		////////////////////////////////////////////////////
		function onKeyboardKeyUp (event:KeyboardEvent) : void {
			
			//ANIMATE A LITTLE
			flyer_mc.gotoAndStop(2);
		};
		
	}
}