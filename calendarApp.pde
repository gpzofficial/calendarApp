import processing.javafx.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import processing.sound.*;

Calendar time = Calendar.getInstance();

public int showMonth;
public int showDay;
public int showYear;

public float scrollValue;
public float scrollAcc;

public String showDateString;

public int offsetDay;

public SoundFile noti;

public PFont NSR;
public PFont NSEB;

public JSONObject mainSchedule;
public JSONArray todaySchedule;

public int scCount;

public ArrayList<scBlock> bls;

int windowWidth = 450;
int windowHeight = 800;



void settings()
{
  pixelDensity(2);
  
  size(windowWidth, windowHeight, FX2D);
  
}
 
void setup()
{
  frameRate(120);
  windowResizable(false);
  NSR = loadFont("1.vlw");
  NSEB = loadFont("3.vlw");
  noStroke();
  
  bls = new ArrayList<scBlock>();
  
  noti = new SoundFile(this, "noti.wav");
  
  showYear = time.get(Calendar.YEAR);
  showMonth = time.get(Calendar.MONTH) + 1;
  showDay = time.get(Calendar.DAY_OF_MONTH);
  
  showDateString = (showYear * 10000 + showMonth * 100 + showDay) + "";
  
  mainSchedule = loadJSONObject("data/list.json");
  
  todaySchedule = mainSchedule.getJSONArray(showDateString);
  
  scCount = todaySchedule.size();
  
  for(int i = 0; i < scCount; i++)
  {
    JSONObject schedule = todaySchedule.getJSONObject(i);
    
    println(schedule.getString("name") + " " + schedule.getInt("start") + " " + schedule.getInt("end"));
  }
  
  
}

void draw()
{
  background(255, 228, 200);
  
  
  
  
  pushMatrix();
  
  translate(0, scrollValue);
  for(int i = 0; i < scCount; i++)
  {
    JSONObject sc = todaySchedule.getJSONObject(i);
    
    scBlock bl = new scBlock(sc.getString("name"), sc.getInt("start"), sc.getInt("end"), sc.getString("type"), i);
    
    bl.composition();
    
  }
  popMatrix();
  
  
  
  
  
  fill(255, 212, 152, 230);
  rect(0, 0, 450, 120);
  
  
  fill(255, 126, 0);
  textFont(NSR);
  textSize(32.4);
  textAlign(LEFT, CENTER);
  text(showMonth + "/" + showDay + ", " + showYear, 33.7, 59);
  {
    String catPlans = scCount + " Plan";
    if(scCount >= 2)
    {
      catPlans = catPlans + "s";
    }
    textAlign(RIGHT, CENTER);
    textFont(NSEB);
    textSize(25.7);
    
    text(catPlans, 416.3, 59);
  }
}


void mouseWheel(MouseEvent event)
{
  scrollAcc = abs(event.getCount());
  scrollValue -= event.getCount() * (1 + scrollAcc / 3);
  
}
