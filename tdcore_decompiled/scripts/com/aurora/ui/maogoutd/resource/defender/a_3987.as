package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class a_3987 extends a_3953
   {
      
      public function a_3987()
      {
         super();
         a_1319 = 3;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_3987) as a_3987;
      }
      
      override protected function getBindMovie() : Class
      {
         return a_3988;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 1000;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 600)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(a_1339 == 300)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_1307 = (a_1276[2] as FrameLabel).frame;
         }
         else if(a_1339 <= 0)
         {
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
   }
}

