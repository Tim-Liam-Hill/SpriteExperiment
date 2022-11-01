# SpriteExperiment
A spontaneous experiment I decided to do after work one day after thinking about how Sprite's work (also: Sumo Wrestlers)

<img align="center" src="Sumo.png" alt="Sumo.png" />

---

## NOTE 

This proect was written in Processing 3.5.3. I see that at the time of writing this Processing 4 has been released and I am not certain if this project will be 100% compatible with the latest version of processing since I have yet to test this. 

<p>
One Thursday night after work, I decided that I needed to program a custom Sprite Program. So, using [Piskel](https://www.piskelapp.com/) I created a SpriteSheet of a Sumo Wrestler and wrote this [Processing](https://processing.org/) script to see if I could derive a working class that could be used in a video game to create and render Sprites. My goal was to figure out how simple Sprite rendering could be acheived without having to consult any documentation/tutorials (hence the 'first principles' description). The reason behind choosing Processing was simple: its easy to use, I have some familiarity with it and I didn't want want to spend a huge amount of time on this project. 
</p>


I aimed to write this experiment in a Scrappy way but also in a sense that could be built on in future. For that reason the 'Sprite' class allows/forces the user to give parameters regarding the SpriteSheet's dimensions an avoid hardcoding where possible (eg: to allow for finer control of how often the Sprite updates, I allowed the user to specify `protected int spriteFrameRate; //Num times sprite changes per second` such that the spritesFrameRate could be set independently of the Game's Framerate). One imporvement I could have possibly made is by calculating the 'numFrames' variable from the 'spriteSheetNumColumns' and 'spriteSheetNumRows' variables (spriteSheetNumColumns * spriteSheetNumRows) but I never got around to implementing that change. 


<p>
One thing I really wanted to avoid was the technically correct but inefficient solution of having a class load in the same asset (SpriteSheet) for each instance of the class even if they use the Same SpriteSheet. My first initial plan was to have the Sprite class be an interface from which other classes inherited and specified a static final Spritesheet specific to that class (eg: SumSprite inherits Sprite and specifies its specific spritesheet). The problem I encountered was that the 'loadImage' function in processing isn't a static function, so that Idea had to be thrown out. I played around with the idea of using a Singleton, but later reaslized that there was a simpler solution that could be had.
</p>

<p>
In a sense, I decoupled the Image used from by the Sprite class from the Sprite class by forcing the programmer to pass the SpriteImage in as a variable to an Instance of the Sprite class. Thus the external Programmer is responsible for ensuring there are not duplicates of the same Image unnecessarily loaded in. I think there could still be better solutions to this, but for Processing this seems like a somewhat cool solution since only one class is needed for all 2D Sprites, and in a sense building on this could be fairly intuitive: eg, if you were programming a game, any entity in that game that would need a sprite creates its own Sprite instance that it owns and passes that Sprite an Image.
</p>

In future I think I'll be moving away from Processing since I think I have enough experience to learn other more flexible and extensible frameworks. Still, processing is pretty cool



