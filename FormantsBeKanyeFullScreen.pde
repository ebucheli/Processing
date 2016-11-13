import processing.sound.*;

SawOsc s1,s2,s3;
BandPass b1,b2,b3;

PImage kanye;
PImage Bg;
void setup() {
    size(1280, 680);
    
    Bg = loadImage("HBG.png");
    image(Bg,0,0);
    
    kanye = loadImage("Silence.png");
    image(kanye,0,0);
    
    // Create the sine oscillator.
    s1 = new SawOsc(this);
    s2 = new SawOsc(this);
    s3 = new SawOsc(this);
    
    b1 = new BandPass(this);
    b2 = new BandPass(this);
    b3 = new BandPass(this);
    //Start the Sine Oscillator. There will be no sound in the beginning
    //unless the mouse enters the   
    s1.play();
    s2.play();
    s3.play();
   
    s1.amp(0.3); 
    s2.amp(0.1); 
    s3.amp(0.05); 
    
    b1.process(s1);
    b2.process(s2);
    b3.process(s3);
    

}

void draw() {
    
    image(Bg,0,0);
  
if(mouseX >= 0 && mouseX < 160){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP1.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP1.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP1.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP1.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP1.png");
      image(kanye,0,0);
    }
  }
  
  else if(mouseX >= 160 && mouseX < 320){
    if(mouseY > 0 && mouseY < 136){  
      kanye = loadImage("AP2.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP2.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP2.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP2.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP2.png");
      image(kanye,0,0);
    }
  }
  else if(mouseX >= 320 && mouseX < 480){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP3.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP3.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP3.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP3.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP3.png");
      image(kanye,0,0);
    }
  }
  else if(mouseX >= 480 && mouseX < 640){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP4.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP4.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP4.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP4.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP4.png");
      image(kanye,0,0);
    }
  }
  else if(mouseX >= 640 && mouseX < 800){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP5.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP5.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP5.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP5.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP5.png");
      image(kanye,0,0);
    }
  }
  else if(mouseX >= 800 && mouseX < 960){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP6.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP6.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP6.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP6.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP6.png");
      image(kanye,0,0);
    }
  }
  else if(mouseX >= 960 && mouseX < 1120){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP7.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP7.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP7.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP7.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP7.png");
      image(kanye,0,0);
    }
  }
  else if(mouseX >= 1120 && mouseX <= 1280){
    if(mouseY >= 0 && mouseY < 136){  
      kanye = loadImage("AP8.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 136 && mouseY < 272){  
      kanye = loadImage("EP8.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 272 && mouseY < 408){  
      kanye = loadImage("IP8.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 408 && mouseY < 544){  
      kanye = loadImage("OP8.png");
      image(kanye,0,0);
    }
    else if(mouseY >= 544 && mouseY <= 680){  
      kanye = loadImage("UP8.png");
      image(kanye,0,0);
    }
  }
  
    float fq = map(mouseX, 0, width, 80.0, 300.0);
    float q1 = 3.0;
    float q2 = 3.0;
    float q3 = 3.0;
    
    // Map mouseX from 20Hz to 1000Hz for frequency  
    s1.freq(fq);
    s2.freq(fq);
    s3.freq(fq);
  
    if(mouseY < 136 && mouseY > 0){
      
      b1.set(740,fq/q1);
      b2.set(1180,fq/q2);
      b3.set(2640,fq/q3);
    }
    else if(mouseY > 136 && mouseY < 272){
      
      b1.set(600,fq/q1);
      b2.set(2060,fq/q2);
      b3.set(2840,fq/q3);
    }
    
    else if(mouseY > 272 && mouseY < 408){
      
      b1.set(280,fq/q1);
      b2.set(2620,fq/q2);
      b3.set(3380,fq/q3);
    }
    
    else if(mouseY > 408 && mouseY < 544){
      
      b1.set(480,fq/q1);
      b2.set(760,fq/q2);
      b3.set(2620,fq/q3);
    }
    else if(mouseY > 544 && mouseY < 680){
      
      b1.set(320,fq/q1);
      b2.set(920,fq/q2);
      b3.set(2200,fq/q3);
    }

    println(mouseY); 
    println(fq);
    
}





