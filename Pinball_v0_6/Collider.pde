int ballsize = 24;
int barrierNum = 3;

class Barrier extends Ball
{
  float x,y;
  float diameter;
  int id;
  Barrier[] others;
  Barrier(float xin,float yin, float din, int id, Barrier[] other)
  {
    position = new PVector(xin, yin);
    velocity = new PVector(0, 0);
    velocity.mult(1.2);
    radius = din/2;
    m = radius*.1;

    diameter = din;
    id = id;
    others = other;
  }
  void display()
  {
    //image(pick, position.x-radius, position.y-radius, diameter, diameter);
  }
  
  void barrierReflect()
  {
    for (int i = 0; i< barrierNum; i++)
    {
     float xd = mover.position.x-x;//distance of ball and barrier
     float yd = mover.position.y-y;
     float disS = (xd*xd)+(yd*yd);
     float sqrR = (48+diameter)*(48+diameter)/4;
     if(disS<=sqrR)
     {      
       mover.velocity.x *=-1;
       mover.velocity.y *=-1;
     }
    }
  }



  /*boolean barrierReflect(PVector ballPosition)
  {
    for (int i = 0; i< barrierNum; i++)
    {
     float xd = ballPosition.x-x;//distance of ball and barrier
     float yd = ballPosition.y-y;
     float disS = (xd*xd)+(yd*yd);
     float sqrR = (48+diameter)*(48+diameter)/4;
     if(disS<=sqrR)
     {      
       return true;
     }
     
   }
   return false;
  }
  */
}