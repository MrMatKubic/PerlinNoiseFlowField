float scl = 40;
int rows, cols;
PVector[][] vectors;
ArrayList<Particle> particles;
float maxparticles = 200;
float zoff = 0;

void setup()
{
  size(800, 800);
  rows = floor(height / scl);
  cols = floor(width / scl);
  vectors = new PVector[cols][rows];
  particles = new ArrayList<Particle>();
  for(int i = 0; i < maxparticles; i++)
  {
    this.particles.add(new Particle());
  }
  background(255);
}

void draw()
{
  //background(255);
  stroke(0);
  strokeWeight(1);
  
  float xoff = 0;
  for(int y = 0; y < rows; y++)
  {
    float yoff = 0;
    for(int x = 0; x < cols; x++)
    {      
      PVector vector = PVector.fromAngle(noise(xoff, yoff, zoff) * TWO_PI * 5);
      vector.setMag(0.5);
      this.vectors[x][y] = vector;
      
     /* pushMatrix();
      translate(x * scl, y * scl);
      rotate(vector.heading());
      line(0, 0, scl, 0);
      popMatrix();*/
      
      yoff += 0.03;
    }
    xoff += 0.03;
  }
  zoff += 0.007;
  
  for(Particle p : particles)
  {
    p.follow(vectors);
    p.update();
    p.edges();
    p.show();
    
    int ix = floor(p.loc.x / scl);
    int iy = floor(p.loc.y / scl);    
  }
}