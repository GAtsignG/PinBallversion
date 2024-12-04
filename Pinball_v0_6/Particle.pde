class Particle {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float R = random(255);          
  float G = random(255);
  float B = random(255);
  float mass;
  
  Particle(){}
  
  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    position = l.get();
    lifespan = 125;
    mass = 1;
  }

  void applyForce(PVector force){
    acceleration.add(PVector.div(force, mass));
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    stroke(0,lifespan);
    strokeWeight(1);
    fill(125,lifespan);
    ellipse(position.x,position.y,6,6);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


