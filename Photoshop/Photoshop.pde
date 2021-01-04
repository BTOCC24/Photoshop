import java.util.ArrayList;
import javax.swing.*; //이미지 불러올때 이미지 이름 받기 위함.
import java.awt.*;
import java.awt.event.*;

ArrayList<Mypaint> mypaint = new ArrayList<Mypaint>();
Gui gui = new LoadGui(); //gui 생성   
Layout mylayout;
int pxpos=0, pypos=0, pwidth=0, pheight=0, cnt=0;
int uxpos=0, uypos=0, active_x1=0, active_y1=0, active_x2=1200, active_y2=800;

void setup() {
  size(1800, 900);
  background(255);
  mylayout = new Layout();
}

void draw() {
  mylayout.show();
}
