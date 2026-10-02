package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBLazy3AccumulatorMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 90000;
      
      protected static var a_1490:Array = new Array();
      
      private var m_stBOSS:WBLazyKing3BossMoveIntruder;
      
      private var m_stGrid:a_3491;
      
      public function WBLazy3AccumulatorMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLazy3AccumulatorMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLazy3AccumulatorMoveIntruder) as WBLazy3AccumulatorMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = -28;
         m_iYDisplayCenterPos = -60;
         a_1272 = 0;
         a_1463 = true;
         a_1464 = true;
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_3419();
         return true;
      }
      
      public function InitData(boss:WBLazyKing3BossMoveIntruder, grid:a_3491) : void
      {
         this.m_stBOSS = boss;
         this.m_stGrid = grid;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(this.m_stGrid != null && m_stCurrentFieldGrid != null && this.m_stBOSS != null)
         {
            if(this.m_stGrid.HasTag(353) && a_1339 > 0)
            {
               this.RealDie();
               this.m_stGrid = null;
            }
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stBOSS = null;
         this.m_stGrid = null;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1339 > 30000)
            {
               this.SetAnimation2(1);
            }
            else
            {
               this.SetAnimation2(2);
            }
         }
         else
         {
            this.SetAnimation2(3);
            if(this.m_stBOSS != null)
            {
               this.m_stBOSS.AddBatteryValue();
               this.WakeUpAll();
               this.m_stBOSS = null;
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      public function WakeUpAll() : void
      {
         var j:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         for(var i:int = iNoX - 2; i <= iNoX + 2; i++)
         {
            for(j = iNoY - 1; j <= iNoY + 1; j++)
            {
               this.WakeUpOne(i,j);
            }
         }
      }
      
      private function WakeUpOne(iNoX:int, iNoY:int) : void
      {
         var a_1334:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(a_1334 == null)
         {
            return;
         }
         if(a_1334.m_stAttackFighter)
         {
            a_1334.m_stAttackFighter.buffCom.RemoveBuff(30021);
         }
      }
      
      public function RealDie() : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         a_1339 = 0;
         this.ResetMovieStatus();
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazy3AccumulatorMoveIntruderMovie;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         a_1339 -= 30000;
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

