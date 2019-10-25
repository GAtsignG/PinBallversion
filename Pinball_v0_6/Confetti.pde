class Confetti extends Particle {
  float R = random(255);
  float G = random(255);
  float B = random(255);

  Confetti(PVector l) {
    super(l);
  }
  
  void display() {
    rectMode(CENTER);
    stroke(R, G, B, lifespan);
    fill(R,G,B,lifespan);
    strokeWeight(1);
    pushMatrix();
    translate(position.x,position.y);
    
    //rotation
    float theta = map(position.x,0,width,0,TWO_PI*2);
    rotate(theta);
    rect(0,0,12,12);
    popMatrix(); //release
  }
}
