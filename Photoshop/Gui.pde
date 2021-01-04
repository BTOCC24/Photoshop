abstract class Gui {
  JFrame frame;
  JTextField text;
  JPanel panel;
  String input;
  boolean event=false; //complete event
  Gui()
  {
    //gui set
    frame= new JFrame();
    panel = new JPanel();
    text = new JTextField(20);
    event = false;
    frame.setSize(250, 350);
  }
  abstract void work();
  abstract void error();
}

class LoadGui extends Gui {
  JButton fullsize = new JButton("full size");
  JButton setsize = new JButton("set size");
  LoadGui() {

    fullsize.addActionListener(new fullsize_action());
    setsize.addActionListener(new setsize_action());

    panel.add(new JLabel(" "));
    panel.add(new JLabel(" input Filename with extenstion for load")); //이름입력
    panel.add(text);
    panel.add(fullsize);
    panel.add(setsize);

    frame.add(panel);
    frame.setSize(250, 250);
    frame.setVisible(false);
  }

  void work() {
    PImage paint = loadImage(gui.input);
    image(paint, pxpos, pypos, pwidth, pheight);
    mypaint.add(new Mypaint(paint, pxpos, pypos, pwidth, pheight));
  }

  void error() {
    print("\nyour input is :"+gui.input+". this filie can't be found. \nPlease re-enter correct filename with extention. \nex) mypaint.jpg");
  }

  class fullsize_action implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      input = text.getText();
      pxpos = 5;
      pypos = 95;
      pwidth = 1200;
      pheight = 800;
      frame.setVisible(false);
      event = true;
    }
  }

  class setsize_action implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      input = text.getText();
      pxpos = active_x1+5;
      pypos = active_y1+95;
      pwidth = (active_x2-active_x1);
      pheight = (active_y2-active_y1);

      frame.setVisible(false);
      event = true;
    }
  }
}

class SaveGui extends Gui {
  JButton fullsize = new JButton("full size");
  JButton setsize = new JButton("set size");

  SaveGui() {

    fullsize.addActionListener(new fullsize_action());
    setsize.addActionListener(new setsize_action());

    //panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.add(new JLabel(" "));
    panel.add(new JLabel(" input Filename with extenstion for save")); //이름입력
    panel.add(text);
    panel.add(fullsize);
    panel.add(setsize);

    frame.add(panel);
    frame.setSize(250, 250);
    frame.setVisible(false);
  }

  void work() {
    PImage paint = get(pxpos, pypos, pwidth, pheight);
    paint.save(input);
  }

  void error() {
  }

  class fullsize_action implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      input = text.getText();
      pxpos = 5;
      pypos = 95;
      pwidth = 1200;
      pheight = 800;
      frame.setVisible(false);
      event = true;
    }
  }

  class setsize_action implements ActionListener { //여기수정필요
    public void actionPerformed(ActionEvent e) {
      input = text.getText();
      pxpos = active_x1+5;
      pypos = active_y1+95;
      pwidth = (active_x2-active_x1);
      pheight = (active_y2-active_y1);
      frame.setVisible(false);
      event = true;
    }
  }
}



class RangeSetGui extends Gui {
  JButton applybutton = new JButton("Apply");
  JTextField x1 = new JTextField(4); 
  JTextField y1 = new JTextField(4); 
  JTextField x2 = new JTextField(4); 
  JTextField y2 = new JTextField(4); 
  int px1, py1, px2, py2;
  boolean able = false;
  RangeSetGui() {

    applybutton.addActionListener(new applyaction());
    x1.setText(active_x1+"");
    y1.setText(active_y1+"");
    x2.setText(active_x2+"");
    y2.setText(active_y2+"");

    panel.add(new JLabel("                                     "));
    panel.add(new JLabel(" set active boundary width(0~1200), height(0~800)"));
    panel.add(new JLabel(" "));
    panel.add(new JLabel("     Left Up position : "));
    panel.add(x1);
    panel.add(y1);
    panel.add(new JLabel("Right Down position : "));
    panel.add(x2);
    panel.add(y2);

    panel.add(applybutton);
    frame.add(panel);
    frame.setSize(300, 200);
    frame.setVisible(false);
  }

  void work() {
    if (px1<0 || px1>1200 ||px2<0||px2>1200||py1<0||py1>800||py2<0||py2>800||px1>=px2||py1>=py2)
    {
      able =false;
      print("re-enter your boundary\n");
      print("0 <= x <= 100, 0 <= y <= 800, can not be big LU than RD\n");
      x1.setText(active_x1+"");
      y1.setText(active_y1+"");
      x2.setText(active_x2+"");
      y2.setText(active_y2+"");

      return;
    } else {
      active_x1=px1;
      active_y1=py1;
      active_x2=px2;
      active_y2=py2;
    }
  }

  void error() {
  }

  class applyaction implements ActionListener {
    public void actionPerformed(ActionEvent e) {


      px1=Integer.parseInt(x1.getText());
      py1=Integer.parseInt(y1.getText());
      px2=Integer.parseInt(x2.getText());
      py2=Integer.parseInt(y2.getText());

      frame.setVisible(false);
      event = true;
    }
  }
}


class ResetGui extends Gui {
  JButton button=new JButton("Confirm");
  boolean chk = false, chk1=false;
  ResetGui() {

    button.addActionListener(new action());

    panel.add(new JLabel("                                     "));
    panel.add(new JLabel(" Reset all effect and load pure image.\n input text \"ok\""));
    panel.add(new JLabel("and you want nothing then input \"reset\""));
    panel.add(new JLabel(" "));
    panel.add(text);
    panel.add(button);

    frame.add(panel);
    frame.setSize(400, 150);
    frame.setVisible(false);
  }

  void work() {
    if (chk == true || chk1 == true) {
      fill(255);
      noStroke();
      rect(5, 95, 1200, 800);
      if (chk==true) {
        for (int i=0; i<mypaint.size(); i++)
        {
          image(mypaint.get(i).img, mypaint.get(i).xpos, mypaint.get(i).ypos, mypaint.get(i).wid, mypaint.get(i).hei);
        }
      }
      chk = false;
      chk1=false;
    }
  }

  void error() {
  }

  class action implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      if (text.getText().equals("ok")) {
        chk=true;
      } else if (text.getText().equals("reset")) {
        chk1=true;
      }
      frame.setVisible(false);
      event = true;
    }
  }
}


class RotateGui extends Gui { //수정좀
  JButton button = new JButton("Rotate 90   ");

  RotateGui() {
    button.addActionListener(new action1());

    panel.add(new JLabel("                                     "));
    panel.add(new JLabel(" Rotate 90 degree clock_wise on Whole area"));
    panel.add(new JLabel("                                               "));
    panel.add(button);

    frame.add(panel);
    frame.setSize(350, 200);
    frame.setVisible(false);
  }

  void work() {      
    int x=0, y=0;
    PImage tmp = get(5, 95, 1200, 800);

    noStroke();
    fill(255);
    //rect(active_x1+5, active_y1+95, active_x2-active_x1, active_y2-active_y1);
    rect(5, 95, 1200, 800);

    //for (int j = 0; j<=active_y2-active_y1; j++) //rotate image  
    //{
    //  for (int i = 0; i<active_x2-active_x1; i++) {
    //    x = int(map(j, 0, active_y2-active_y1, 0, active_x2-active_x1));
    //    y = int(map(active_x2-i, 0, active_x2-active_x1, 0, active_y2-active_y1));
    //    set(i+active_x1+5, j+active_y1+95, tmp.get(x, y));
    //  }
    //}
    for (int j = 0; j<800; j++) //rotate image
    {
      for (int i = 0; i<1200; i++) {
        x = int(map(j, 0, 800, 0, 1200));
        y = int(map(1200-i, 0, 1200, 0, 800));
        set(i+5, j+95, tmp.get(x, y));
      }
    }
    //image(tmp,active_x1+5,active_y1+95);
  }


  void error() {
  }

  class action1 implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      frame.setVisible(false);
      event = true;
    }
  }
}

class ReverseGui extends Gui { //수정좀
  JButton UDbutton = new JButton("Reverse Up Down");
  JButton LRbutton = new JButton("Reverse Left Right");
  int choice = -1;
  ReverseGui() {
    UDbutton.addActionListener(new UDaction());
    LRbutton.addActionListener(new LRaction());

    panel.add(new JLabel("                                     "));
    panel.add(new JLabel(" Whole area will be reversed "));
    panel.add(new JLabel("                                               "));
    panel.add(UDbutton);
    panel.add(LRbutton);

    frame.add(panel);
    frame.setSize(250, 200);
    frame.setVisible(false);
  }

  void work() {      
    int x=0, y=0;
    PImage tmp = get(5, 95, 1200, 800);

    noStroke();
    fill(255);
    rect(5, 95, 1200, 800);

    if (choice ==1 ) {
      for (int i = 0; i<=1200; i++) //상하반반전
      {
        for (int j = 0; j<=800; j++) {
          set(i+5, j+95, tmp.get(i, 800-j));
        }
      }
      choice=-1;
    } else if (choice == 2)
    {    
      for (int i = 0; i<=1200; i++) //좌우반전
      {
        for (int j = 0; j<=800; j++) {
          set(i+5, j+95, tmp.get(1200-i, j));
        }
      }
      choice=-1;
    }

  }


  void error() {
  }

  class UDaction implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      frame.setVisible(false);
      event = true;
      choice=1;
    }
  }
  class LRaction implements ActionListener {
    public void actionPerformed(ActionEvent e) {
      frame.setVisible(false);
      event = true;
      choice=2;
    }
  }
}
