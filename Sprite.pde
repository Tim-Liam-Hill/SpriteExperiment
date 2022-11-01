

/**
  We need to use a singleton. Why?
  Because Java has limitations on what it can provide w.r.t static img AND
  Processing's loadImage method is not static, so can't be used with static variables. 
  
  Singleton makes sense here, so why not? 
  Singleton doesnt make sense, itmeas that you will only ever be using the same Sprite Instance.
  Solution is to take the image out of the Sprite class and then pass it into the Sprite.
  The responsibility is on the Programmer to make sure that they are not creating duplicate Images unnecessarily 
*/


class Sprite {
  
 
  protected PImage img; 
  protected int rowIndex;
  protected int columnIndex;
  protected int numFrames;  //num frames in Sprite Sheet (total) -> isnt this just equal to spriteSheetNumColumns * spriteSheetNumRows?? 
  protected int spriteSheetNumColumns;
  protected int spriteSheetNumRows;
  protected int spriteSheetColumnLength;
  protected int spriteSheetRowLength;
  protected int spriteFrameRate; //Num times sprite changes per second (check this but I am fairly certain what this is) 
  private int internalFrameCounter; //increments every single frame so we can keep track of when we should be updating relative to the framerate
                                    //basically: even if FPS is set to 30, we still want this animation to stay at 6FPS
  
  private Sprite(PImage img, int numFrames, int spriteSheetNumColumns, int spriteSheetNumRows, int spriteSheetColumnLength, int spriteSheetRowLength, int spriteFrameRate){
        
        this.img = img;
        rowIndex = 0;
        columnIndex = 0;
        this.numFrames = numFrames;
        this.spriteSheetNumColumns = spriteSheetNumColumns;
        this.spriteSheetNumRows = spriteSheetNumRows;
        this.spriteSheetColumnLength = spriteSheetColumnLength;
        this.spriteSheetRowLength = spriteSheetRowLength;
        this.spriteFrameRate = spriteFrameRate;
        this.internalFrameCounter = 0;
  }
  
  /**
  *We will get the position to render the sprite from the game object that has the sprite
  */
  void render(int posX, int posY, int scaleFactor){ 
    int yOffset = rowIndex*spriteSheetRowLength;
    int xOffset = columnIndex*spriteSheetColumnLength;
    copy(img, xOffset, yOffset, spriteSheetRowLength, spriteSheetColumnLength, posX,posY, spriteSheetRowLength * scaleFactor, spriteSheetColumnLength * scaleFactor); 
    updateSpriteFrame();
  }
  
    void render(int posX, int posY){ //this assumes a scaleFactor of 1 
    int yOffset = rowIndex*spriteSheetRowLength;
    int xOffset = columnIndex*spriteSheetColumnLength;
    copy(img, xOffset, yOffset, spriteSheetRowLength, spriteSheetColumnLength, posX,posY, spriteSheetRowLength * 2, spriteSheetColumnLength * 2); // INCLUDE A SCALE FACTOR!!!
    updateSpriteFrame();
  }
  
  
  /**
  *
  */
  void updateSpriteFrame(){
    internalFrameCounter ++;
    if(internalFrameCounter == FRAME_RATE/spriteFrameRate){ // Do this so that the animation speed is consitent provided that the Frame_rate for the application is a multiple of the framerate for the sprite
      internalFrameCounter = 0;
      columnIndex ++;
      if(columnIndex == spriteSheetNumColumns){
        columnIndex = 0;
        rowIndex ++;
      }
      
      if(rowIndex == spriteSheetNumRows){
         rowIndex = 0; 
      }
    }
  }

  
  void resetSprite(){
    
  }
  
}


/*
class Sprite{
  
  private PImage img;
  private int rowIndex;
  private int columnIndex;
  private int numFrames;
  private int spriteSheetNumColumns;
  private int spriteSheetNumRows;
  private int spriteSheetColumnLength;
  private int spriteSheetRowLength;
  private int spriteFrameRate;
  private int internalFrameCounter; //increments every single frame so we can keep track of when we should be updating relative to the framerate
                                    //basically: even if FPS is set to 30, we still want this animation to stay at 6FPS
  
  Sprite(String imgPath, int numFrames, int spriteSheetNumColumns, int spriteSheetNumRows, 
      int spriteSheetColumnLength, int spriteSheetRowLength, int spriteFrameRate){
    
        img = loadImage(imgPath);
        rowIndex = 0;
        columnIndex = 0;
        this.numFrames = numFrames;
        this.spriteSheetNumColumns = spriteSheetNumColumns;
        this.spriteSheetNumRows = spriteSheetNumRows;
        this.spriteSheetColumnLength = spriteSheetColumnLength;
        this.spriteSheetRowLength = spriteSheetRowLength;
        this.spriteFrameRate = spriteFrameRate;
        this.internalFrameCounter = 0;
  }
  
  void render(int posX, int posY){ 
    int yOffset = rowIndex*spriteSheetRowLength;
    int xOffset = columnIndex*spriteSheetColumnLength;
    copy(img, xOffset, yOffset, spriteSheetRowLength, spriteSheetColumnLength, posX,posY, spriteSheetRowLength * 2, spriteSheetColumnLength * 2); // INCLUDE A SCALE FACTOR!!!
    updateSpriteFrame();
  }
  
   
  void updateSpriteFrame(){
    internalFrameCounter ++;
    if(internalFrameCounter == FRAME_RATE/spriteFrameRate){ // Do this so that the animation speed is consitent provided that the Frame_rate for the application is a multiple of the framerate for the sprite
      internalFrameCounter = 0;
      columnIndex ++;
      if(columnIndex == spriteSheetNumColumns){
        columnIndex = 0;
        rowIndex ++;
      }
      
      if(rowIndex == spriteSheetNumRows){
         rowIndex = 0; 
      }
    }
  }
  
  void resetSprite(){
    
  }
  
}
*/
