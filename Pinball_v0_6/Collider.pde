int ballsize = 24;
int barrierNum = 3;

class Barrier
{
  float x,y;
  float diameter;
  int id;
  Barrier[] others;
  Barrier(float xin,float yin, float din, int id, Barrier[] other)
  {
    x = xin;
    y = yin;
    diameter = din;
    id = id;
    others = other;
  }
  void display()
  {
    ellipse(x,y,diameter,diameter);
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
