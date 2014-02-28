class RectField {
  PVector loc;
  PVector size;

  RectField(float locx, float locy, float sizex, float sizey) {
    loc = new PVector(locx, locy);
    size = new PVector(sizex, sizey);
  }

  void display() {
    fill(100);
    rect(loc.x, loc.y, size.x, size.y);
  }

  boolean check(float in) {
    Particle pa = p.get(int(in));
    if (pa.loc.x + pa.d/2 >= loc.x && pa.loc.x - pa.d/2 <= loc.x + size.x && pa.loc.y + pa.d/2 >= loc.y && pa.loc.y - pa.d/2 <= loc.y + size.y) {
      return true;
    } 
    else {
      return false;
    }
  }
}

