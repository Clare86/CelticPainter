//Celtic Painter
//A simple painter program that lets you change the colour and thickness
//of the draw line. I really like celtic symbols and knotwork so I have
//included some basic templates to inspire some celtic artwork from you.



/*
Mouse
click and drag: draw

keys
1-3: celtic templates; knot, pentagram, triquetra
b,r,p,g: change draw colour to black, red, purple or grey
left, right arrows: change circle size for drawing between 5 and 30
at 5px intervals

del,backspace: clear screen
s: save png

*/


//global variables

color fillColor = color(0);
int x = 60;
float i;
int radius = 10;
int pentagram_radius = 250;

//setup

void setup() {
  size(800,800);
  background(255);
}

//draw

void draw() {
  if(mousePressed) {
    noStroke();
    fill(fillColor);
    ellipse(mouseX,mouseY,radius,radius);
  }
} 

void celtic2() {
    for(float i = 0;i<2*PI;i+=PI/2.0) {
        pushMatrix();
        translate(width/2,height/2);
        rotate(i);
        stroke(2);
        line(0,-x,3*x,2*x);
        line(3*x,2*x,3*x,3*x);
        line(3*x,3*x,2*x,3*x);
        line(2*x,3*x,x,2*x);
    
    
        line(x,-2*x,(3+sqrt(2))*x,sqrt(2)*x);
        line((3+sqrt(2))*x,sqrt(2)*x,(3+sqrt(2))*x,(3+sqrt(2))*x);
        line((3+sqrt(2))*x,(3+sqrt(2))*x,sqrt(2)*x,(3+sqrt(2))*x);
        line(sqrt(2)*x,(3+sqrt(2))*x,0,3*x);
        popMatrix();
    }
}

void pentagram() {
    int r = pentagram_radius;
    noFill();
    stroke(2);
    pushMatrix();
    translate(width/2,height/2);
    
    ellipse(0,0,2*(r+40),2*(r+40));
    ellipse(0,0,2*r,2*r);
    
    rotate(-PI/2);
    
    for (int l = r;l>=r-120;l-=120) {
        float x1 = l;
        float y1 = 0;
        
        float x2 = l*cos(2*PI/5);
        float y2 = l*sin(2*PI/5);
        
        float x3 = l*cos(4*PI/5);
        float y3 = l*sin(4*PI/5);
        
        float x4 = l*cos(-4*PI/5);
        float y4 = l*sin(-4*PI/5);
        
        float x5 = l*cos(-2*PI/5);
        float y5 = l*sin(-2*PI/5);
        
        line(x1,y1,x3,y3);
        line(x2,y2,x4,y4);
        line(x3,y3,x5,y5);
        line(x4,y4,x1,y1);
        line(x5,y5,x2,y2);
    }
    
    popMatrix();
    
    
}

void triquetra() {
    int s = 453;
    
    noFill();
    stroke(2);
    for (float i = 0;i < 2*PI; i+=2*PI/3) {
        pushMatrix();
        translate(width/2,400);
        rotate(i+PI/2);
        arc(s-330,0,s,s,radians(88),radians(272));
        arc(s-330,0,s-80,s-80,radians(95),radians(265));
        popMatrix();
    }
};

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) setup();
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  if (key == '1') celtic2();
  if (key == '2') pentagram();
  if (key == '3') triquetra();
  
  if (keyCode == LEFT) {
    if ( radius > 5 ) {
      radius-=5;
    }
  } 
  
  if (keyCode == RIGHT) {
    if ( radius < 30 ) {
      radius+=5;
    }
  }
  
  switch(key) {
    case 'p' :
    case 'P' :
      fillColor = color(162, 0, 255);
      break;
    case 'r' :
    case 'R' :
      fillColor = color(255, 0, 0);
      break;
    case 'g' :
    case 'G' :
      fillColor = color(160);
      break;
    case 'b' :
    case 'B' :
      fillColor = color(0);
      break;
    case 'w' :
    case 'W' :
      fillColor = color(255);
      break;   
  }
  
}
