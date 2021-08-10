# Mario Mayhem
## Minimum Project Requirements
The aim of this project is to create a “Catch The Fruit” game where the player controls a basket trying to catch falling fruits.  
This document will be the Game Design Document for the project, make sure to follow it closely.  
- Keep the stage size 550 x 400.  
- Make sure to use PNG images for the game elements (Basket, fruits, background).  
- The game will start on a Menu screen including a “Start” button.  
- Clicking on the “Start” button will navigate to the next frame (use labels).  
- The Basket will be controlled by the mouse movement along the X axis on the lower part of the stage.  
- There will be 2 type of fruits, “Apple” and “Orange” both inheriting from a main class “Fruit”.  
- Fruits will be added to the stage at Y = -20 (off stage from the top) and a random X inside the width of the stage.  
- Each fruit will have a random speed and rotation.  
- 3 Timers will control the Game:
  - Timer 1: This timer controls the drop rate of Apples.
  - Timer 2: This timer controls the drop rate of Oranges.
  - Timer 3: This is the main game timer which controls the round, it’s a cooldown from 30 to 0 counting down and displayed on stage. When it reaches 0, the round will end by navigating to a new frame showing the final score.
- Make sure to add a powerup item.
- The powerup can either double your score for a period of time, slow things down, enlarge your basket or enable your basket to shoot.
- Using the hitTestObject function, test for the Basket capturing the fruits.
- Apples will score 10, Oranges 20.
- Once captured, remove the fruit from the stage and increment the score displayed on the stage.
- Remove the fruit if it goes past the bottom part of the stage.
