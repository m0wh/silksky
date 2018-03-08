float r, xn, yn, xm, ym;
int n = 10; // number of circles per line : more than 15 isn't recomended, 10 is a good number
int sun_size = 50, sun_color; // choose a diameter in pixels (my favorite value is 50)
boolean black_hole = false; //try "true"

void setup() {
  size(800, 600); // you can change the resolution as you want
  frameRate(60);
  pixelDensity(2); // for retina display users
}

void draw() {
  xm = mouseX; ym = mouseY;
  
  noStroke();
  colorMode(HSB,n*2+2,n*2+50,100);
  clear();
  if(black_hole){
    sun_color = 0;
  } else {
    sun_color = 100;
  }
  
  background(0,0,sun_color);
  
  for(int x = 0; x < n; x++){
    for(int y = 0; y < n; y++){
      
      fill(n+y,x+50,70,100/n);
      
      xn = (x+0.5)*width/n;
      yn = (y+0.5)*height/n;
      r = 2*sqrt((xm-xn)*(xm-xn) + (ym-yn)*(ym-yn));
      
      ellipse(xn,yn,r-sun_size,r-sun_size);
      
    }
  }
  
  fill(0,0,sun_color);
  ellipse(xm,ym,sun_size,sun_size);
}


void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("screenshots/screenshot###.jpg");
  }
}