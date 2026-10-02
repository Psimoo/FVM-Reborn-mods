package com.aurora.ui.maogoutd.resource.Intruder.DesertMouse.ShamanMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.display.FrameLabel;
   
   public class ShamanMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1000;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private var m_iAppearedTime:int;
      
      private var m_isFlute:Boolean = true;
      
      public function ShamanMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ShamanMouseMoveIntruder) as ShamanMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShamanMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.m_iAppearedTime = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(!this.m_isFlute)
            {
               if(a_1475)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_isFlute)
            {
               if(a_1475)
               {
                  if(a_1275 != 7)
                  {
                     a_1275 = 7;
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 8)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid != null)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(!a_1460)
         {
            a_1465 = 0;
            a_1275 = 3;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_1460 = true;
            this.m_isFlute = true;
            this.m_iAppearedTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iAppearedTime == 80)
         {
            for each(stMoveIntruder in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
            {
               if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.parent) && stMoveIntruder.iLifeValue > 0)
               {
                  stMoveIntruder.a_3969(-200);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = stMoveIntruder.x;
                  stAddBloodEffect.y = stMoveIntruder.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
            }
            if(a_1339 > 5)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            this.m_isFlute = false;
         }
         if(iCurrentTime - this.m_iAppearedTime > 80)
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

