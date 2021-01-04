class Layout {
  Button loadbutton, savebutton, rangebutton, resetbutton, rotatebutton, reversebutton; //버튼 초기화
  Button tint1button, tint3button, huebutton, alphabutton, brightbutton, saturationbutton, contrastbutton, highlightbutton, addRGBbutton; 
  Button applybutton, cancelbutton;
  Button one,two,three,four;
  LoadGui loadgui = new LoadGui();
  SaveGui savegui = new SaveGui();
  RangeSetGui rangegui = new RangeSetGui();
  ResetGui resetgui = new ResetGui();
  RotateGui rotategui = new RotateGui();
  ReverseGui reversegui = new ReverseGui();

  //effect bar set
  Tint1 mytint1;
  Tint3[] mytint = new Tint3[3];
  Brightness mybright;
  Addrgb[] myrgb = new Addrgb[3];
  Alpha myalpha;
  Saturation mysaturation;
  Hue myhue;
  Highlight myhighlight;
  Contrast mycontrast;

  boolean colset;
  PImage beforeimg = get(5, 95, 1205, 895);
  Layout() { 
    colset = false;
    strokeWeight(10);
    stroke(0, 150, 150);
    fill(255);
    rect(0, 0, width, height); //전체테두리

    fill(200);
    rect(1210, 0, 585, height-5); // state 메뉴테두리

    line(0, 90, 1205, 90); //구역 나누기
    line(1210, 0, 1210, height);
    line(1210, 200, width, 200);
    line(1210, 400, width, 400);
    line(1210, 650, width, 650);
    
    fill(0);
    textSize(20);
    text("Animation (only full frame image avail)",1230,690);

    loadbutton = new Button(5, 5, "Load"); //버튼 할당
    savebutton = new Button(205, 5, "Save"); 
    rangebutton = new Button(405, 5, "Range"); 
    resetbutton = new Button(605, 5, "Reset"); 
    rotatebutton = new Button(805, 5, "Rotate"); 
    reversebutton = new Button(1005, 5, "Reverse"); 
    
    //effect bar init
    mytint1 = new Tint1(500, color(0, 0, 0));
    mytint[0]=new Tint3(450, color(255, 0, 0));
    mytint[1]=new Tint3(500, color(0, 255, 0));
    mytint[2]=new Tint3(550, color(0, 0, 255));
    mybright = new Brightness(500, color(0, 0, 0));
    myrgb[0]=new Addrgb(450, color(255, 0, 0));
    myrgb[1]=new Addrgb(500, color(0, 255, 0));
    myrgb[2]=new Addrgb(550, color(0, 0, 255));
    // myalpha = new Alpha(500, color(0, 0, 0));
    mysaturation = new Saturation(500, color(0, 0, 0));
    myhue = new Hue(500, color(0, 0, 0));
    myhighlight = new Highlight(500, color(0, 0, 0));
    mycontrast = new Contrast(500, color(0, 0, 0));

    //effect button set
    tint1button = new Button(1215, 205, "  Tint 1", 140, 95);
    tint3button = new Button(1215, 300, "  Tint 3", 140, 95);
    brightbutton = new Button(1355, 205, "  Bright", 140, 95);
    addRGBbutton = new Button(1355, 300, "AddRGB", 140, 95);
    huebutton = new Button(1495, 205, "   Hue", 140, 95);
    saturationbutton = new Button(1495, 300, "Saturation", 140, 95);
    contrastbutton = new Button(1638, 300, "Contrast", 150, 95);
    highlightbutton = new Button(1638, 205, "Highlight", 150, 95);

    applybutton = new Button(1215, 595, "              Apply", 290, 50);
    cancelbutton = new Button(1505, 595, "              Cancel", 285, 50);
    applybutton.rectColor=color(100, 200, 240);
    applybutton.rectHighlight=color(230, 200, 180);
    cancelbutton.rectColor=color(100, 200, 240);
    cancelbutton.rectHighlight=color(230, 200, 180);
        
    one = new Button(1215,740,"Option1",145,150);
    two = new Button(1360,740,"Option2",145,150);
    three = new Button(1505,740,"Option3",145,150);
    four = new Button(1650,740,"Option4",140,150);
    one.rectColor = color(170,255,160);
    two.rectColor = color(170,255,160);
    three.rectColor = color(170,255,160);
    four.rectColor = color(170,255,160);
    one.rectHighlight=color(120,160,255);
    two.rectHighlight=color(120,160,255);
    three.rectHighlight=color(120,160,255);
    four.rectHighlight=color(120,160,255);
      
    textSize(14);
    fill(0);
    text("              mouseX : ", 1230, 40);
    text("              mouseY : ", 1230, 70);
    text("Active_Range_LU : ", 1230, 100);
    text("Active_Range_RD : ", 1230, 130);
    text("     Load painting : ", 1230, 160);
    text("    Mouse RGB : ", 1530, 40);
    text("Running Time : ", 1530, 70);
    text("   Effect count : ", 1530, 100);
    text("     Student ID : ", 1530, 130);
    text("            Name : ", 1530, 160);
  }

  void show() {
    loadbutton.Set(); //버튼표시
    savebutton.Set();
    rangebutton.Set();
    resetbutton.Set();
    rotatebutton.Set();
    reversebutton.Set();

    //effect button
    tint1button.Set();
    tint3button.Set();
    huebutton.Set();
    //alphabutton.Set();
    brightbutton.Set();
    saturationbutton.Set();
    contrastbutton.Set();
    highlightbutton.Set();
    addRGBbutton.Set();
    applybutton.Set();
    cancelbutton.Set();
    
    one.Set();
    two.Set();
    three.Set();
    four.Set();
    
    state_update();
    colsetcheck();
    eventcheck();
  }

  void offeffectevent() {   
    tint1button.clickevent = false;
    tint3button.clickevent = false;
    //alphabutton.clickevent = false;
    brightbutton.clickevent = false;
    saturationbutton.clickevent = false;
    contrastbutton.clickevent = false;
    highlightbutton.clickevent = false;
    addRGBbutton.clickevent = false;
    cancelbutton.clickevent=false;
    applybutton.clickevent=false;
    huebutton.clickevent = false;

    mytint1 = new Tint1(500, color(0, 0, 0));
    mytint[0]=new Tint3(450, color(255, 0, 0));
    mytint[1]=new Tint3(500, color(0, 255, 0));
    mytint[2]=new Tint3(550, color(0, 0, 255));
    mybright = new Brightness(500, color(0, 0, 0));
    myrgb[0]=new Addrgb(450, color(255, 0, 0));
    myrgb[1]=new Addrgb(500, color(0, 255, 0));
    myrgb[2]=new Addrgb(550, color(0, 0, 255));
    myalpha = new Alpha(500, color(0, 0, 0));
    myhue = new Hue(500, color(0, 0, 0));
    mysaturation = new Saturation(500, color(0, 0, 0));
    myhighlight = new Highlight(500, color(0, 0, 0));
    mycontrast = new Contrast(500, color(0, 0, 0));
  }

  void colsetcheck() {
    fill(200);
    noStroke();
    rect(1220, 410, 570, 180);

    if (tint1button.clickevent) {
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }
      mytint1.update();
      mytint1.display();
      tint(mytint1.value);
      image(beforeimg, active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1);
    }  

    if (tint3button.clickevent) {
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }
      for (int i=0; i<3; i++) {
        mytint[i].update();
        mytint[i].display();
      }
      tint(mytint[0].value, mytint[1].value, mytint[2].value);
      image(beforeimg, active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1);
    }    

    if (brightbutton.clickevent) {
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }

      mybright.update();
      mybright.display();
      for (int j = active_y1; j < active_y2; j++) {
        for (int i = active_x1; i<active_x2; i++) {
          set(i+5, j+95, color(map(brightness(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, 1)*mybright.value));
        }
      }
    }  

    if (addRGBbutton.clickevent) {
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }
      for (int i=0; i<3; i++) {
        myrgb[i].update();
        myrgb[i].display();
      }

      for (int j = active_y1; j < active_y2; j++) {
        for (int i = active_x1; i<active_x2; i++) {
          set(i+5, j+95, color(red(beforeimg.get(i-active_x1, j-active_y1))+myrgb[0].value, green(beforeimg.get(i-active_x1, j-active_y1))+myrgb[1].value, blue(beforeimg.get(i-active_x1, j-active_y1))+myrgb[2].value));
        }
      }
    }   

    if (huebutton.clickevent) {
      colorMode(HSB);
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }

      myhue.update();
      myhue.display();
      for (int j = active_y1; j < active_y2; j++) {
        for (int i = active_x1; i<active_x2; i++) {
          set(i+5, j+95, color((1-map(hue(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, 1))*myhue.value, (1-map(hue(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, 1))*myhue.value, (1-map(hue(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, 1))*myhue.value));
        }
      }
      colorMode(RGB);
    }  
    //if (alphabutton.clickevent) {
    //  if (colset == false) {
    //    beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
    //    colset = true;
    //  }
    //  myalpha.update();
    //  myalpha.display();
    //  for (int j = active_y1; j < active_y2; j++) {
    //    for (int i = active_x1; i<active_x2; i++) {
    //      set(i+5, j+95, color(map(alpha(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, 1)*myalpha.value));
    //    }
    //  }
    //}  

    if (saturationbutton.clickevent) {
      colorMode(HSB);
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }
      mysaturation.update();
      mysaturation.display();

      for (int j = active_y1; j < active_y2; j++) {
        for (int i = active_x1; i<active_x2; i++) {
          set(i+5, j+95, color((1-map(saturation(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, 1))*mysaturation.value));
        }
      }
      colorMode(RGB);
    }  

    if (highlightbutton.clickevent) {
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }
      myhighlight.update();
      myhighlight.display();
      for (int j = active_y1; j < active_y2; j++) {
        for (int i = active_x1; i<active_x2; i++) {
          set(i+5, j+95, color(map(red(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, myhighlight.value), map(green(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, myhighlight.value), map(blue(beforeimg.get(i-active_x1, j-active_y1)), 0, 255, 0, myhighlight.value)));
        }
      }
    } 

    if (contrastbutton.clickevent) {
      float r, g, b;
      if (colset == false) {
        beforeimg = get(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1); //효과전 이미지 저장.
        colset = true;
      }
      mycontrast.update();
      mycontrast.display();
      for (int j = active_y1; j < active_y2; j++) {
        for (int i = active_x1; i<active_x2; i++) {
          r=red(beforeimg.get(i-active_x1, j-active_y1));
          g=green(beforeimg.get(i-active_x1, j-active_y1));
          b=blue(beforeimg.get(i-active_x1, j-active_y1));
          if (r<127) {
            r-=mycontrast.value;
          } else {
            r+=mycontrast.value;
          }          
          if (g<127) {
            g-=mycontrast.value;
          } else {
            g+=mycontrast.value;
          }          
          if (b<127) {
            b-=mycontrast.value;
          } else {
            b+=mycontrast.value;
          }
          set(i+5, j+95, color(r, g, b));
        }
      }
    } 

    if (applybutton.clickevent) {
      offeffectevent();
      noTint();
      beforeimg = get(5, 95, 1200, 800);
      mytint[0]=new Tint3(450, color(255, 0, 0));
      mytint[1]=new Tint3(500, color(0, 255, 0));
      mytint[2]=new Tint3(550, color(0, 0, 255));
      colset=false;
      cnt++;
      delay(1000);
    }
    if (cancelbutton.clickevent) { 
      offeffectevent();
      noTint();
      image(beforeimg, active_x1+5, active_y1+95);
      cancelbutton.clickevent=false;
      mytint[0]=new Tint3(450, color(255, 0, 0));
      mytint[1]=new Tint3(500, color(0, 255, 0));
      mytint[2]=new Tint3(550, color(0, 0, 255));
      colset=false;
    }
  }

  void eventcheck() {
    //loadbutton event.
    if (loadbutton.clickevent) { //loadbutton
      gui = loadgui;
      gui.text.setText("");
      gui.frame.setVisible(true); //gui 표시
      loadbutton.clickevent = false;
    }

    if (savebutton.clickevent) { //savebutton
      gui = savegui;
      gui.text.setText("");
      gui.frame.setVisible(true); //gui 표시
      savebutton.clickevent = false;
    }

    if (rangebutton.clickevent) { 
      gui = rangegui;
      //gui = new RangeSetGui();
      gui.text.setText("");
      gui.frame.setVisible(true); //gui 표시
      rangebutton.clickevent = false;
    }

    if (resetbutton.clickevent) {
      gui = resetgui;
      gui.text.setText("");
      gui.frame.setVisible(true); //gui 표시
      resetbutton.clickevent = false;
    }

    if (rotatebutton.clickevent) { 
      gui = rotategui;
      gui.frame.setVisible(true); //gui 표시
      rotatebutton.clickevent = false;
    }

    if (reversebutton.clickevent) { 
      gui = reversegui;
      gui.frame.setVisible(true); //gui 표시
      reversebutton.clickevent = false;
    }

    if (gui.frame.isVisible() == false && gui.event == true) { //gui가 닫히면.
      try {
        gui.work();
      }
      catch(Exception e) {
        gui.error();
      }
      gui.event=false;
    }
  }

  void state_update() {
    textSize(18);
    fill(200);
    noStroke();
    rect(1360, 20, 130, 160);
    rect(1650, 20, 130, 160);

    fill(0);
    if (mouseX>=5 &&mouseX<=1205&&mouseY>=95&&mouseY<=895) {
      uxpos = mouseX-5;
      uypos= mouseY-95;
    }

    text(uxpos, 1370, 40);
    text(uypos, 1370, 70);

    text("("+(active_x1)+","+(active_y1)+")", 1370, 100);
    text("("+(active_x2)+","+(active_y2)+")", 1370, 130);
    text(mypaint.size(), 1370, 160);
    text("("+(int)red(get(mouseX,mouseY))+","+(int)green(get(mouseX,mouseY))+","+(int)blue(get(mouseX,mouseY))+")",1650,42);
    int p = millis()/1000;
    text(p/60+" min "+p%60+" sec",1650,72);
    text(cnt,1650,102);
    text("20161407",1650,132);
    text("Park Dong Hun",1650,162);
  }
}

class Mypaint {
  PImage img;
  int xpos, ypos, wid, hei;
  Mypaint(PImage img, int xpos, int ypos, int wid, int hei) {
    this.img=img;
    this.xpos=xpos;
    this.ypos=ypos;
    this.wid=wid;
    this.hei=hei;
  }
}
