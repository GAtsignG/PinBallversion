// The Nature of Code
// Daniel Shiffman
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float time;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
    time = 255;
  }

  void addParticle() {
    float rate = random(1);
    if (rate < 0.5) { 
      particles.add(new Particle(origin));
    }
    else {
      particles.add(new Confetti(origin));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
    time -= 1;
  }
  
  void applyForce(PVector force){           
    for(Particle p: particles){
      p.applyForce(force);
    } 
  }
}
