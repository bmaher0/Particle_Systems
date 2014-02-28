ArrayList<Particle> p;
Spiral s;

//variables to play with
int max = 1000;
int oBurst = 500;
float velRange = 10;
float rate = 1;
boolean transparent = false;
boolean mouseMode = false;
boolean logs = true;
int time = 1500;

RectField[] rf = new RectField[33];

void setup() {
  size(displayWidth, displayHeight);
  PVector shift = new PVector(width/2 - 625, height/2 - 200);
  //letter one
  rf[0] = new RectField(shift.x, shift.y, 50, 400);
  rf[1] = new RectField(shift.x + 50, shift.y, 150, 50);
  rf[2] = new RectField(shift.x + 150, shift.y + 50, 50, 100);
  rf[3] = new RectField(shift.x + 50, shift.y + 150, 150, 50);

  //letter two
  rf[4] = new RectField(shift.x + 250, shift.y, 50, 400);
  rf[5] = new RectField(shift.x + 300, shift.y, 150, 50);
  rf[6] = new RectField(shift.x + 400, shift.y + 50, 50, 100);
  rf[7] = new RectField(shift.x + 300, shift.y + 150, 150, 50);

  //tail of letter two
  for (int i = 0; i < 5; i++) {
    rf[8 + i] = new RectField(shift.x + 300 + 25*i, shift.y + 200 + 25*i, 50, 50);
  }
  rf[12] = new RectField(shift.x + 400, shift.y + 300, 50, 100);

  //letter three
  rf[13] = new RectField(shift.x + 500, shift.y, 50, 400);
  rf[14] = new RectField(shift.x + 550, shift.y, 100, 50);
  rf[15] = new RectField(shift.x + 650, shift.y, 50, 400);
  rf[16] = new RectField(shift.x + 550, shift.y + 350, 100, 50);

  //letter four
  rf[17] = new RectField(shift.x + 750, shift.y, 50, 400);
  for (int i = 0; i < 8; i++) {
    if (i < 4) {
      rf[18 + i] = new RectField(shift.x + 775 + 25*i, shift.y + 25*i, 50, 50);
    } 
    else {
      rf[18 + i] = new RectField(shift.x + 775 + 25*i, shift.y + 175 - 25*i, 50, 50);
    }
  }
  rf[26] = new RectField(shift.x + 975, shift.y, 50, 400);

  //mark
  rf[27] = new RectField(shift.x + 1075, shift.y + 25, 50, 50);
  rf[28] = new RectField(shift.x + 1100, shift.y, 150, 50);
  rf[29] = new RectField(shift.x + 1225, shift.y + 25, 50, 150);
  rf[30] = new RectField(shift.x + 1150, shift.y + 150, 100, 50);
  rf[31] = new RectField(shift.x + 1150, shift.y + 200, 50, 100);
  rf[32] = new RectField(shift.x + 1150, shift.y + 325, 50, 50);


  background(0);

  p = new ArrayList<Particle>();
  s = new Spiral();
  for (int i = 0; i < max + 1; i++) {
    p.add(new Particle(p.size()));
  }
}

void draw() {
  if (frameCount - 100 == time) {
    max += oBurst;
  }
  if (logs) {
    rate = 1/log(frameCount+2) + sin(radians(float(frameCount)));
  }
  s.update();
  if (p.size() < max + 1) {
    for (int i = 0; i < oBurst/4; i++) {
      if (frameCount % 15 == 0) {
        p.add(new Particle(p.size()));
      }
    }
  }
//  for (int i = 0; i < rf.length; i++) {
//    rf[i].display();
//  }
  for (int i = p.size() - 1; i > 0; i--) {
    Particle a = p.get(i);
    a.display();
    a.update();
  }
}

void keyPressed() {
  if (key == 's') {
    save("pic.png");
  }
}

