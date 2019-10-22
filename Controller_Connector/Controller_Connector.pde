 /* 设置视频参考：https://www.youtube.com/watch?v=MUM8_4mWxng

  * 需要下载的库
  * Game Control Plus
  * G4P
  */

import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

ControlDevice contD;
ControlIO control;

void setup()
{
  size(500, 500); 
  control = ControlIO.getInstance(this);
  contD = control.getMatchedDevice("xbs1P");  // 读取存放在data文件夹里的设置文件
  // 该设置文件由Processing-File-Example-Contributed Libraries-Game Control Plus-Configurator生成和修改
  
  if(contD  == null)
  {
    println("Cannot find device");
    System.exit(-1);
  }
}

public void getUserInput()
{
  
}
