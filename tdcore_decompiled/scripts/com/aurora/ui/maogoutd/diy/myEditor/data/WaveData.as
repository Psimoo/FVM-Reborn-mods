package com.aurora.ui.maogoutd.diy.myEditor.data
{
   public class WaveData
   {
      
      public var iDelay:int;
      
      public var iSize:int;
      
      public var szMapStep:Vector.<MapStepData>;
      
      public function WaveData()
      {
         super();
         this.szMapStep = new Vector.<MapStepData>();
      }
   }
}

