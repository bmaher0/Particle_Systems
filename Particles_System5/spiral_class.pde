class Spiral {
  float ang;
  float angRate;
  PVector loc;
  PVector origin;
  
  Spiral() {
    ang = 1;
    angRate = PI/50;
    origin = new PVector(width/2, height/2);
    loc = origin;
  }

  void update() {
    ang += angRate;
    loc.x = origin.x + rate * ang * cos(ang);
    loc.y = origin.y + rate * ang * sin(ang);
  }
}

