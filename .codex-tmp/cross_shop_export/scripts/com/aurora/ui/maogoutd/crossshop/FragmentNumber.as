package com.aurora.ui.maogoutd.crossshop
{
   import flash.display.Sprite;
   
   public class FragmentNumber extends Sprite
   {
      
      public var m_vYellowNumber:Vector.<YellowNumber>;
      
      public function FragmentNumber()
      {
         super();
         this.m_vYellowNumber = new Vector.<YellowNumber>();
      }
      
      public function setNumber(iNum:int) : void
      {
         var i:int = 0;
         var mod:int = 0;
         var arrNums:Array = [];
         while(iNum)
         {
            mod = iNum % 10;
            arrNums.push(mod);
            iNum /= 10;
         }
         if(arrNums.length == 0)
         {
            arrNums.push(0);
         }
         var iLen:int = int(this.m_vYellowNumber.length);
         for(i = iLen; i < arrNums.length; i++)
         {
            this.m_vYellowNumber.push(new YellowNumber());
            addChild(this.m_vYellowNumber[i]);
         }
         for(i = 0; i < this.m_vYellowNumber.length; i++)
         {
            this.m_vYellowNumber[i].visible = false;
         }
         for(i = 0; i < arrNums.length; i++)
         {
            this.m_vYellowNumber[i].setnumber(arrNums[arrNums.length - i - 1]);
            this.m_vYellowNumber[i].x = i * 10;
            this.m_vYellowNumber[i].visible = true;
         }
      }
   }
}

