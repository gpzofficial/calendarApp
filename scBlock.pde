public class scBlock
{
  
  private String scName;
  private int scStart;
  private int scEnd;
  private String scType;
  
  private int scLayer;
  
  public scBlock(String scName, int scStart, int scEnd, String scType, int scLayer)
  {
    this.scName = scName;
    this.scStart = scStart;
    this.scEnd = scEnd;
    this.scType = scType;
    
    this.scLayer = scLayer;
  }
  
  public void composition()
  {
    fill(255, 126, 0);
    rect(33.6, 213 + 127 * scLayer, 382.8, 102.5, 13.7);
    
    fill(255, 228, 200);
    
    textFont(NSEB);
    textSize(22.7);
    textAlign(LEFT, TOP);
    text(scName, 52.4, 230.5 + 127 * scLayer);
    
    textFont(NSR);
    textSize(22.7);
    textAlign(LEFT, BOTTOM);
    text(scStart + " ~ " + scEnd, 51.3, 299.3 + 127 * scLayer);
    
    textFont(NSR);
    textSize(16.2);
    textAlign(RIGHT, BOTTOM);
    text(scType, 395.2, 299.3 + 127 * scLayer);
    
  }
  
  
  
}
