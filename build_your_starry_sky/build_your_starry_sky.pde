final int STAR_COUNT = 500;
final int STAR_SIZE = 5;

ArrayList stars;
import processing.serial.*;
Serial myPort;                             
int valr;     
int m, n, nn;
int today = 0;


void setup()
{
  fullScreen();
  background(0);
  myPort = new Serial(this, "com3", 9600);
  
  // Initialise stars
  stars = new ArrayList();
  for (int i = 1; i <= STAR_COUNT; i++) {
    stars.add(new Star());  
  }
}

void draw()
{
  background(0);
  textSize(50);
  text(hour()+":"+minute()+":"+second(), 0, 55);
  text("the number of your stars:"+m,0,110);
  valr = myPort.read();
  if (hour()<=7 && hour()>6 && minute()<45 && today < 1 && valr >= 49) {
    nn++;
    today = 2;
    m++;
  }
  if (hour()>= 23 ) {
    today=0;
  }
  
  // Display each star
  for (int i = 0; i <= nn - 1; i++) {
    Star curStar = (Star) stars.get(i);
    curStar.display();
  }
   println(valr+"+++"+today+"+++"+m+"+++"+nn);
}

class Star 
{
  int x, y, size;
  float flickerRate, light;
  boolean shining;
  
  Star()
  {
    create();
    light = random(10, 245);
  }
  
  void display()
  {
    // Stop shining when light
    // is beyond certain level
    if (light >= 245) {
      shining = false;
    }
    
    // Recreate star when below
    // a certain level of light
    if (light <= 10) {
      create();  
    }
    
    // Determine light level 
    // based on if star is shining or not
    if (shining) {
      light += flickerRate;
    } else if (!shining) {
      light -= flickerRate;  
    }
    
    // Draw star itself
    fill(light);
    rect(x, y, size, size);
  }
  
  void create() 
  {
    size = STAR_SIZE;
    flickerRate = random(2, 5);
    x = (int) (random(0, width - size));
    y = (int) (random(0, height - size));
    shining = true;
  }
}
