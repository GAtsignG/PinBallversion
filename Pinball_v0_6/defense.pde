float dx = 310;
float dy = 540;



//防守按键
void defenseKeyPressed()
{
    int keyIndex = -1;
    if(dx <= 340 && dx >= 280 && dy <= 790 && dy >= 290)
    {
        if(keyPressed)
        {
            if(key == 'w' || key == 'W')
            {
                dy = dy-5;
            }
            if(key == 's' || key == 'S')
            {
                dy = dy+5;
            }
            if(key == 'a' || key == 'A')
            {
                dx--;
            }
            if(key == 'd' || key == 'D')
            {
                dx++;
            }
        }
    }
    //出防守区域自动复位到边界
    else if(dx > 340)
    {
        dx = 340;
    }
    else if(dx < 280)
    {
        dx = 280;
    }
    else if(dy > 790)
    {
        dy = 790;
    }
    else if(dy < 290)
    {
        dy = 290;
    }
    
}
//防守球员图片及碰撞
void defensePlayer()
{
    image(defenseP1, dx-50, dy-50,100,100);
    image(defenseP2, 1528, 500, 100, 100);
    //球和防守球员碰撞功能
    //if(Mover.position.x <= dx+62)
    //{
    //    if((Mover.position.y >= dy-74)||(Mover.position.y <= dy + 74))
    //    {
    //        Mover.velocity = PVector(10,0);
    //    }
    //}
}
