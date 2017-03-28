float noise_value;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  noise_value = 0;
}

void draw()
{
  background(0);
  translate(width / 2, 0, 0);
  
  float angle = frameCount % 360;
  float camera_x = 800 * cos(radians(angle));
  float camera_z = 800 * sin(radians(angle));   
  camera(camera_x, 0, camera_z, 
         0, -500, 0, 
         0, 1, 0);
  
  branch(400);
  
  noise_value += 0.025;
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  } 
  */
}

void branch(float len)
{
  stroke((frameCount + len) % 255, 255, 255);
  strokeWeight(1.5);
  line(0, 0, 0, 0, -len, 0);
  translate(0, -len, 0);
  
  len *= 0.66;

  if(len > 20)
  {
    float theta = radians(map(noise(noise_value), 0, 1, 10, 120));
    
    pushMatrix();
    rotateZ(theta);
    rotateY(theta);
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotateZ(theta);
    rotateY(-theta);
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotateZ(-theta);
    rotateY(theta);
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotateZ(-theta);
    rotateY(-theta);
    branch(len);
    popMatrix();
  }
}