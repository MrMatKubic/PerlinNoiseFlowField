class Particle {
 
  PVector loc, vel, acc;
  PVector prev;
  
  public Particle()
  {
    this.loc = new PVector(random(0, width), random(0, height));
    this.vel = new PVector();
    this.acc = new PVector();
    this.prev = new PVector();
  }
  
  public void update()
  {
    this.vel.limit(4);
    this.vel.add(this.acc);
    this.loc.add(this.vel);
    
    this.acc.set(0, 0);
  }
  
  public void updatePrevPos()
  {
    this.prev.x = this.loc.x;
    this.prev.y = this.loc.y;
  }
  
  public void follow(PVector[][] vectors)
  {
    int x = floor(this.loc.x / 40);
    int y = floor(this.loc.y / 40);
    if(x == 20) x = 19;
    if(y == 20) y = 19;
    this.applyForce(vectors[x][y]);
  }
  
  public void edges()
  {
    if(this.loc.x > width) this.loc.x = 0;
    if(this.loc.y > height) this.loc.y = 0;
    if(this.loc.x < 0) this.loc.x = width;
    if(this.loc.y < 0) this.loc.y = height;
    this.updatePrevPos();
  }
  
  public void show()
  {
    pushMatrix();
    stroke(0, 25);
    strokeWeight(1);
    
    line(this.loc.x, this.loc.y, this.prev.x - 2, this.prev.y - 2);
    this.updatePrevPos();
    
    popMatrix();
  }
  
  public void applyForce(PVector force) 
  {
    this.acc.add(force);
  }
  
}