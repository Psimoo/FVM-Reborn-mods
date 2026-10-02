package com.aurora.ui.maogoutd.dailyrecharge
{
   public class DailyVO
   {
      
      public var id:int;
      
      public var startday:Number;
      
      public var endday:Number;
      
      public var childList:Vector.<GoodsListVO> = new Vector.<GoodsListVO>();
      
      public function DailyVO()
      {
         super();
      }
   }
}

