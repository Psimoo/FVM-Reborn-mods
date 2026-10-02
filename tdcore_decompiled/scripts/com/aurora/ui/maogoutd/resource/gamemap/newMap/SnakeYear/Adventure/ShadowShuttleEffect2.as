package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class ShadowShuttleEffect2 extends a_4206
   {
      
      public function ShadowShuttleEffect2()
      {
         super();
      }
      
      public static function a_3926() : ShadowShuttleEffect2
      {
         return PoolManager.getInstance().CheckOutOne(ShadowShuttleEffect2) as ShadowShuttleEffect2;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShadowShuttleEffect2Movie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1465 = 1;
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 999999;
         a_1279 = -10;
         m_iYDisplayCenterPos = -75;
         a_1272 = 0;
         SetCannotSeeByFighter(true);
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         this.SetFrameIndex2(0,1);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetFrameIndex(9);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      public function IsBOSS(stMoveIntruder:a_4206) : Boolean
      {
         return stMoveIntruder.IsBossIntruder;
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetFrameIndex2(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
         a_3419();
      }
   }
}

