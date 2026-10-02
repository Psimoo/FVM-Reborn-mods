package com.aurora.ui.maogoutd.resource.defender.CattleYear.BubbleGum
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.utils.Timer;
   
   public class BubbleEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public function BubbleEffect()
      {
         super();
      }
      
      public static function a_3926() : BubbleEffect
      {
         return PoolManager.getInstance().CheckOutOne(BubbleEffect,BubbleEffectMovie) as BubbleEffect;
      }
      
      public static function GetFreeInstance1() : BubbleEffect
      {
         return PoolManager.getInstance().CheckOutOne(BubbleEffect,BubbleEffect1Movie) as BubbleEffect;
      }
      
      public static function GetFreeInstance2() : BubbleEffect
      {
         return PoolManager.getInstance().CheckOutOne(BubbleEffect,BubbleEffect2Movie) as BubbleEffect;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         a_1275 = 1;
         this.visible = true;
         this.m_iStartTime = 0;
         return true;
      }
      
      public function a_4003(iTimeNum:int) : void
      {
         if(this.m_iStartTime == 0)
         {
            this.m_iStartTime = iTimeNum;
         }
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
            if(null != a_1278 || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         this.m_iStartTime = 0;
         return true;
      }
   }
}

