class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  PVector magnet;
  int index;
  float d;
  float a;
  int age;
  boolean inside;
  boolean field;
  float prb;

  Particle(int i) {
    loc = new PVector(width/2, height/2);
    vel = PVector.random2D();
    vel.mult(random(velRange));
    acc = new PVector(mouseX-loc.x, mouseY-loc.y);
    acc.normalize();
    d = 10;
    age = 0;
    colorMode(HSB, 360, 100, 100, 100);
    index = i;
    inside = false;
    field = false;
  }

  void display() {
    noStroke();
    if (transparent) {
      a = random(100);
    } 
    else {
      a = 100;
    }
    if (field) {
      fill((frameCount + 180) % 360, 100, 100, a);
    } 
    else {
      fill(frameCount % 360, 100, 100, a);
    }
    ellipse(loc.x, loc.y, d, d);
  }

  void update() {
    if (frameCount > time) {
      prb = random(2 * dist(width/2, height/2, loc.x, loc.y) / dist(width/2, height/2, 0, 0));
      //prb = random(2);
    } 
    else {
      prb = 2;
    }
    age++;
    if (mouseMode) {
      magnet = new PVector(mouseX, mouseY);
    } 
    else {
      magnet = new PVector(s.loc.x, s.loc.y);
    }
    if (field) {
      acc = new PVector(0, 0);
      vel.normalize();
      if (inside) {
        if (random(15) < 1) {
          vel = PVector.random2D();
        }
      } 
      else {
        vel.mult(-1);
      }
      vel.mult(5);
    }
    else {
      acc = new PVector(magnet.x-loc.x, magnet.y-loc.y);
      acc.normalize();
      vel.add(acc);
    }
    loc.add(vel);
    inside = false;
    for (int i = 0; i < rf.length; i++) {
      if (rf[i].check(index)) {
        inside = true;
      }
    }
    if (!field && inside) {
      if (prb < 1) {
        field = true;
      }
      else {
        field = false;
      }
    }
  }
}

