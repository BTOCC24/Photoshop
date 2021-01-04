class Handle {
  float startpos=1250;
  float endpos=startpos+512;
  float y=0;
  color linecol = color(0, 0, 0), circlecol= color(0, 0, 0);
  float value;

  boolean click = false;
  float cxpos = (startpos+endpos)/2;
  Handle(int ypos, color c) {
    y=ypos;
    linecol=c;
    circlecol=c;
  }
  void display() {
  }
  void update() {
  }
}


class Tint1 extends Handle {
  Tint1(int ypos, color c) {
    super(ypos, c);
    cxpos=endpos;
    value=cxpos-startpos;
  }
  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);
      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 512, 0, 256);
      }
    } else {
      circlecol=linecol;
    }
  }
}



class Tint3 extends Handle {
  Tint3(int ypos, color c) {
    super(ypos, c);
    cxpos = endpos;
    value=cxpos-startpos;
  }
  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);
      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 255);
      }
    } else {
      circlecol=linecol;
    }
  }
}

class Brightness extends Handle {
  Brightness(int ypos, color c) {
    super(ypos, c);
    cxpos = (startpos+endpos)/2;
    value= map(cxpos - startpos, 0, 510, 0, 255);
  }

  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);

      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 255);
      }
    } else {
      circlecol=linecol;
    }
  }
}

class Addrgb extends Handle {
  Addrgb(int ypos, color c) {
    super(ypos, c);
    cxpos = startpos;
    value=map(cxpos - startpos, 0, 510, 0, 255);
  }
  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);
      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 255);
      }
    } else {
      circlecol=linecol;
    }
  }
}

class Alpha extends Handle {
  Alpha(int ypos, color c) {
    super(ypos, c);
    cxpos = startpos;
    value=map(cxpos - startpos, 0, 510, 0, 255);
  }
  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);
      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 255);
      }
    } else {
      circlecol=linecol;
    }
  }
}


class Hue extends Handle {
  Hue(int ypos, color c) {
    super(ypos, c);
    cxpos = (startpos+endpos)/2;
    value=map(cxpos - startpos, 0, 510, 0, 255);
  }
  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);
      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 255);
      }
    } else {
      circlecol=linecol;
    }
  }
}



class Saturation extends Handle {
  Saturation(int ypos, color c) {
    super(ypos, c);
    cxpos = (startpos+endpos)/2;
    value= map(cxpos - startpos, 0, 510, 0, 255);
  }

  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);

      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 255);
      }
    } else {
      circlecol=linecol;
    }
  }
}


class Highlight extends Handle {
  Highlight(int ypos, color c) {
    super(ypos, c);
    cxpos = (startpos+endpos)/2;
    value= cxpos - startpos;
  }

  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("128", (startpos+endpos)/2-3, y+15);
    text("255", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);

      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = cxpos - startpos;
      }
    } else {
      circlecol=linecol;
    }
  }
}

class Contrast extends Handle {
  Contrast(int ypos, color c) {
    super(ypos, c);
    cxpos = startpos;
    value= map(cxpos - startpos, 0, 510, 0, 255);
  }

  void display() {
    stroke(linecol);
    strokeWeight(2);
    textSize(12);
    fill(linecol);
    line(startpos, y, endpos, y);
    fill(circlecol);
    circle(cxpos, y-10, 10);
    fill(0);
    text("0", startpos-15, y+15);
    text("64", (startpos+endpos)/2-3, y+15);
    text("128", endpos-10, y+15);
  }

  void update() {
    fill(200);
    noStroke();
    if (mousePressed && dist(mouseX, mouseY, cxpos, y-10) <= 15) {
      rect(startpos-10, y-20, endpos-startpos+20, 18);
      circlecol = color(#ffcc33);

      if (mouseX>=startpos && mouseX<=endpos) {
        cxpos=mouseX;
        value = map(cxpos - startpos, 0, 510, 0, 128);
      }
    } else {
      circlecol=linecol;
    }
  }
}
