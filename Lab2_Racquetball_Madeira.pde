int gap=0;
float circleX=random(width);
int circleY=0;
float xspeed;
float yspeed=3.5;
int score;
//paddle width
int rwidth=100;

void setup() {
  size(640, 360);
  frameRate(25);
  gap=height-30;
  circleX=width/2;
  xspeed=random(-1.5, 1.5);
}

//bring circle to top when game restarts
void reset() {
  circleX=random(width);
  circleY=0;
}


void draw() {
  stroke(0);
  //crazy rainbow ball
  if (mousePressed) {
    stroke(255);
  } else {
    background(50, 0);
  }
  rectMode(CENTER);

  //bouncing circle
  fill(random(255), random(255), random(255));
  circle(circleX, circleY, 20);
  circleX+=xspeed;
  circleY+=yspeed;

  //paddle
  if (mouseX<=(width-50)&&mouseX>=50) {
    rectMode(CENTER);
    fill(255);
    rect(mouseX, gap, rwidth, 20);
  }

  //paddle stays in screen
  if (mouseX<50) {
    rectMode(CENTER);
    fill(255);
    rect(50, gap, rwidth, 20);
  }
  if (mouseX>(width-50)) {
    rectMode(CENTER);
    fill(255);
    rect((width-50), gap, rwidth, 20);
  }

  //ball bounces when it hits paddle
  if (circleX<(mouseX+(rwidth/2))&&circleX>(mouseX-(rwidth/2))) {
    if (circleY>=(gap-10)) {
      yspeed=-(yspeed*1.2);
      score=score+1;
    }
  }

  //score shown
  textSize(40);
  text(score, (width-50), 60);

  //ball bounces when it hits top of screen
  if (circleY<=0) {
    yspeed=(abs(yspeed));
  }

  //ball bounces off left wall
  if (circleX<=0) {
    xspeed=-xspeed;
  }

  //ball bounces off right wall
  if (circleX>=width) {
    xspeed=-xspeed;
  }

  //game over
  if (circleY>=height) {
    background(0);
    textSize(32);
    textAlign(CENTER);
    text("Game Over Press Any Key to Start Over", (width/2), (height/2));
    if (keyPressed==true) {
      reset();
      score=0;
      yspeed=3.5;
    }
  }
}
