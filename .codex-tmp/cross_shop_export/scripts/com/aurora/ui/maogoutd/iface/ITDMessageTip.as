package com.aurora.ui.maogoutd.iface
{
   import flash.display.DisplayObjectContainer;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public interface ITDMessageTip
   {
      
      function showTextTip(param1:DisplayObjectContainer, param2:String, param3:Rectangle, param4:Number = 0.2, param5:int = 50, param6:int = 3, param7:int = 0, param8:TextFormat = null) : void;
      
      function showImageTip(param1:DisplayObjectContainer, param2:String, param3:Rectangle, param4:Number = 0.2, param5:int = 50, param6:int = 3) : void;
   }
}

