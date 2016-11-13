import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;

AudioContext ac;
ControlP5 cp5;


WavePlayer wp1;
WavePlayer LFO;
WavePlayer cutLFO;
Glide LFOrate,cLFOrate,pitch;
LPRezFilter filter1;

Knob lRate,lInt,fCut,fRes;
RadioButton r;

PImage bkgr;

float[] mtof = {
    0f, 8.661957f, 9.177024f, 9.722718f, 10.3f, 10.913383f, 11.562325f, 12.25f, 12.978271f, 13.75f, 14.567617f, 15.433853f, 16.351599f, 17.323914f, 18.354048f, 19.445436f, 20.601723f, 21.826765f, 23.124651f, 24.5f, 25.956543f, 27.5f, 29.135235f, 30.867706f, 32.703197f, 34.647827f, 36.708096f, 38.890873f, 41.203445f, 43.65353f, 46.249302f, 49.f, 51.913086f, 55.f, 58.27047f, 61.735413f, 65.406395f, 69.295654f, 73.416191f, 77.781746f, 82.406891f, 87.30706f, 92.498604f, 97.998856f, 103.826172f, 110.f, 116.540939f, 123.470825f, 130.81279f, 138.591309f, 146.832382f, 155.563492f, 164.813782f, 174.61412f, 184.997208f, 195.997711f, 207.652344f, 220.f, 233.081879f, 246.94165f, 261.62558f, 277.182617f, 293.664764f, 311.126984f, 329.627563f, 349.228241f, 369.994415f, 391.995422f, 415.304688f, 440.f, 466.163757f, 493.883301f, 523.25116f, 554.365234f, 587.329529f, 622.253967f, 659.255127f, 698.456482f, 739.988831f, 783.990845f, 830.609375f, 880.f, 932.327515f, 987.766602f, 1046.502319f, 1108.730469f, 1174.659058f, 1244.507935f, 1318.510254f, 1396.912964f, 1479.977661f, 1567.981689f, 1661.21875f, 1760.f, 1864.655029f, 1975.533203f, 2093.004639f, 2217.460938f, 2349.318115f, 2489.015869f, 2637.020508f, 2793.825928f, 2959.955322f, 3135.963379f, 3322.4375f, 3520.f, 3729.31f, 3951.066406f, 4186.009277f, 4434.921875f, 4698.63623f, 4978.031738f, 5274.041016f, 5587.651855f, 5919.910645f, 6271.926758f, 6644.875f, 7040.f, 7458.620117f, 7902.132812f, 8372.018555f, 8869.84375f, 9397.272461f, 9956.063477f, 10548.082031f, 11175.303711f, 11839.821289f, 12543.853516f, 13289.75f
  };

Gain g;

void setup(){
  
  
  size(400,300);
  
  bkgr = loadImage("LalotronDesign.png");
  image(bkgr,0,0);
  
  rect(40,200,320,75);
  line(56,200,56,275);
  line(88,200,88,275);
  line(120,200,120,275);
  line(152,200,152,275);
  line(184,200,184,275);
  line(216,200,216,275);
  line(248,200,248,275);
  line(280,200,280,275);
  line(312,200,312,275);
  line(344,200,344,275);
  
  fill(0);
  rect(48,200,16,50);
  rect(112,200,16,50);
  rect(144,200,16,50);
  rect(208,200,16,50);
  rect(240,200,16,50);
  rect(272,200,16,50);
  rect(336,200,16,50);

  
  ac = new AudioContext();
  cp5 = new ControlP5(this);
  
  lRate = cp5.addKnob("Rate")
             .setRange(0,25)
             .setValue(5)
             .setPosition(100,120)
             .setRadius(25)
             .setDragDirection(Knob.VERTICAL)
             .setColorForeground(color(255));
             ;
             
  lInt = cp5.addKnob("Int")
            .setRange(0,1)
            .setValue(0.5)
            .setPosition(160,120)
            .setRadius(25)
            .setDragDirection(Knob.VERTICAL)
            ;
  fCut = cp5.addKnob("cutoffFreq")
            .setRange(100,15000)
            .setValue(700)
            .setPosition(240,120)
            .setRadius(25)
            .setDragDirection(Knob.VERTICAL)
            ;   
  fRes = cp5.addKnob("peak")
            .setRange(0,1)
            .setValue(0.5)
            .setPosition(300,120)
            .setRadius(25)
            .setDragDirection(Knob.VERTICAL)
            ;       
  r = cp5.addRadioButton("LFO Target")
         .setPosition(240,80)
         .setSize(40,20)
         .setColorForeground(color(120))
         .setColorActive((color(255)))
         .setColorLabel(color(255))
         .setItemsPerRow(2)
         .setSpacingColumn(30)
         .addItem("pitch",1)
         .addItem("cutoff",2)
         ;
  
  LFOrate = new Glide(ac,10,30);
  LFO = new WavePlayer(ac,LFOrate,Buffer.SINE);
  
  cLFOrate = new Glide(ac,10,30);
  cutLFO = new WavePlayer(ac,cLFOrate,Buffer.SINE);
  
  pitch = new Glide(ac,60,50);
  

  
  
  Function frequencyModulation = new Function(LFO){
    public float calculate(){
      int sel;
      int MIDInote=60;
      if(r.getValue()==1){
        sel = 1;
      }
      else{
        sel=0;
      }
      if((((mouseX*23)/width)+55)<=64){
      MIDInote = ((mouseX*23)/width)+55;
      }
      if((((mouseX*23)/width)+55)>64){
      MIDInote = (((mouseX*23)/width)+55)-1;
      }
      
    return (x[0]*200.0*lInt.getValue()*sel)+ mtof[MIDInote];
    }
  };
  
  Function cutoffModulation = new Function(cutLFO){
    public float calculate(){
      int sel;
      if(r.getValue() ==2 ){
        sel = 1;
      }
      else{
        sel = 0;
      }
    return ((x[0]*5000.0)*lInt.getValue()*sel+fCut.getValue());
    }
  };
  
  wp1 = new WavePlayer(ac,frequencyModulation,Buffer.SQUARE);
  
  filter1 = new LPRezFilter(ac,cutoffModulation,0.5);
  
  filter1.addInput(wp1);
    
  g = new Gain(ac,1,0.5);
  
  g.addInput(filter1);
  
  ac.out.addInput(g);
  
}


void draw(){
  
  LFOrate.setValue(lRate.getValue());
  cLFOrate.setValue(lRate.getValue());
  //filter1.setFreq(fCut.getValue());
  filter1.setRes(fRes.getValue());
  //println(lRate.getValue());
  
  /*if((((mouseX*23)/width)+55)<=64){
  println(((mouseX*23)/width)+55);
  }
  if((((mouseX*23)/width)+55)>64){
  println((((mouseX*23)/width)+55)-1);
  }
  */
  
  
}

void mousePressed(){
  if(mouseX>40&&mouseX<360){
    if(mouseY>200&&mouseY<275){
  ac.start();
    }
  }
}
void mouseReleased(){
  ac.stop();
}

void keyPressed(){
  
  switch(key){
    case('1'):lRate.setValue(0);break;
    case('2'):lRate.setValue(2.5);break;
    case('3'):lRate.setValue(5);break;
    case('4'):lRate.setValue(7.5);break;
    case('5'):lRate.setValue(10);break;
    case('6'):lRate.setValue(12.5);break;
    case('7'):lRate.setValue(15);break;
    case('8'):lRate.setValue(17.5);break;
    case('9'):lRate.setValue(20);break;
    case('0'):lRate.setValue(22.5);break;
    case('-'):lRate.setValue(25);break;
    
    case('q'):lInt.setValue(0);break;
    case('w'):lInt.setValue(0.1);break;
    case('e'):lInt.setValue(0.2);break;
    case('r'):lInt.setValue(0.3);break;
    case('t'):lInt.setValue(0.4);break;
    case('y'):lInt.setValue(0.5);break;
    case('u'):lInt.setValue(0.6);break;
    case('i'):lInt.setValue(0.7);break;
    case('o'):lInt.setValue(0.8);break;
    case('p'):lInt.setValue(0.9);break;
    
    case('a'):fCut.setValue(100);break;
    case('s'):fCut.setValue(1755.56);break;
    case('d'):fCut.setValue(3411.12);break;
    case('f'):fCut.setValue(5066.68);break;
    case('g'):fCut.setValue(6722.24);break;
    case('h'):fCut.setValue(8377.8);break;
    case('j'):fCut.setValue(10033.4);break;
    case('k'):fCut.setValue(11688.9);break;
    case('l'):fCut.setValue(13344.5);break;
    case(';'):fCut.setValue(15000);break;
    
    case('z'):fRes.setValue(0);break;
    case('x'):fRes.setValue(0.1);break;
    case('c'):fRes.setValue(0.2);break;
    case('v'):fRes.setValue(0.3);break;
    case('b'):fRes.setValue(0.4);break;
    case('n'):fRes.setValue(0.5);break;
    case('m'):fRes.setValue(0.6);break;
    case(','):fRes.setValue(0.7);break;
    case('.'):fRes.setValue(0.8);break;
    case('/'):fRes.setValue(0.9);break;
    
    case('['):r.activate(0);break;
    case(']'):r.activate(1);break;
    case(' '):r.deactivateAll();break;
    
    
    

    
  }
}
