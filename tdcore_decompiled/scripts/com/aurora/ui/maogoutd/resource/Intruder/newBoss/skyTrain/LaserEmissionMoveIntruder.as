package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class LaserEmissionMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1800;
      
      private static const LASEREMISSION_WAIT_TIME:int = 9 * 5 + 8;
      
      private static const LASERE_ATTACK_WAIT_TIME:int = 3;
      
      private var m_bIsPalying:Boolean;
      
      private var m_bIsCanLaserEmission:Boolean;
      
      private var m_bIsUsingLaserEmission:Boolean;
      
      private var m_bIsStopLaserEmission:Boolean;
      
      private var m_iLaserEmissionWaitTime:int;
      
      private var m_iLaserAttackWaitTime:int;
      
      public function LaserEmissionMoveIntruder()
      {
         super();
         a_1272 = 0;
         a_1279 = -width * 0.5;
      }
      
      public static function a_3926() : LaserEmissionMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(LaserEmissionMoveIntruder) as LaserEmissionMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_bIsPalying = false;
         return true;
      }
      
      public function JustOnlyJudgeThisIsEmissionProperty() : void
      {
      }
      
      override public function get height() : Number
      {
         return 88;
      }
      
      public function set IsCanLaserEmission(bIsCanLaserEmission:Boolean) : void
      {
         this.m_bIsCanLaserEmission = bIsCanLaserEmission;
         if(this.m_bIsCanLaserEmission)
         {
            this.scaleY = 1;
            a_1467 = 0.75 * a_3491.a_1081;
         }
         else
         {
            this.scaleY = -1;
            a_1467 = this.height - (1 - 0.75) * a_3491.a_1081;
         }
      }
      
      override protected function getBindMovie() : Class
      {
         return LaserEmissionMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_bIsPalying = true;
         a_1463 = true;
         a_1481 = false;
         this.m_bIsUsingLaserEmission = false;
         this.m_bIsStopLaserEmission = false;
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         this.m_iLaserEmissionWaitTime = LASEREMISSION_WAIT_TIME;
         if(this.m_bIsCanLaserEmission)
         {
            this.m_iLaserEmissionWaitTime += 8;
         }
         this.m_iLaserAttackWaitTime = 0;
         return true;
      }
      
      private function GotoAndStopFrame(iFrame:uint) : void
      {
         if(iFrame != a_1275)
         {
            a_1275 = iFrame;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            a_3419();
         }
      }
      
      private function LifeIsZeroHandle() : void
      {
         if(this.m_bIsCanLaserEmission && this.m_bIsUsingLaserEmission)
         {
            this.GotoAndStopFrame(3);
         }
         else
         {
            this.GotoAndStopFrame(4);
         }
         this.m_bIsPalying = true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return false;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(0 < a_1339)
         {
            if(this.m_bIsUsingLaserEmission)
            {
               if(this.m_bIsCanLaserEmission)
               {
                  this.GotoAndStopFrame(2);
               }
               else
               {
                  this.GotoAndStopFrame(1);
               }
            }
            else
            {
               this.GotoAndStopFrame(1);
            }
         }
         else
         {
            this.LifeIsZeroHandle();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if((this.m_bIsStopLaserEmission || !this.m_bIsUsingLaserEmission) && iRduceLifeValue != 0)
         {
            super.a_3969(iRduceLifeValue);
            return this.ResetMovieStatus();
         }
         return false;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(!this.m_bIsPalying)
         {
            return;
         }
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            if(a_1339 <= 0)
            {
               this.a_3940();
            }
            else if(this.m_bIsUsingLaserEmission)
            {
               this.m_bIsStopLaserEmission = true;
               this.a_3969(a_1339);
            }
            else
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(this.m_bIsUsingLaserEmission)
         {
            if(this.m_iLaserAttackWaitTime > 0)
            {
               --this.m_iLaserAttackWaitTime;
               if(0 == this.m_iLaserAttackWaitTime)
               {
                  this.UseLaserEmission();
               }
            }
         }
         else if(this.m_iLaserEmissionWaitTime > 0)
         {
            --this.m_iLaserEmissionWaitTime;
            if(0 == this.m_iLaserEmissionWaitTime && iLifeValue > 0)
            {
               this.CheckStartLaserEmission();
            }
         }
         return true;
      }
      
      private function CheckStartLaserEmission() : void
      {
         var iStartXGridNo:int = 0;
         var iStartYGridNo:int = 0;
         var iAddNo:int = 0;
         var bIsCanLaserEmission:Boolean = false;
         var iMaxYGridNo:int = 0;
         var yi:int = 0;
         var stFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(null != m_stCurrentFieldGrid)
         {
            iStartXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            iStartYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            if(this.m_bIsCanLaserEmission)
            {
               iAddNo = 1;
            }
            else
            {
               iAddNo = -1;
            }
            bIsCanLaserEmission = false;
            iMaxYGridNo = BattleFieldView.a_1012;
            yi = iStartYGridNo + iAddNo;
            while(!bIsCanLaserEmission && yi >= 0 && yi < iMaxYGridNo)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iStartXGridNo,yi);
               for each(stBaseMoveIntruder in stFieldGrid.a_1511)
               {
                  if(stBaseMoveIntruder.hasOwnProperty("JustOnlyJudgeThisIsEmissionProperty") && stBaseMoveIntruder.iLifeValue > 0)
                  {
                     bIsCanLaserEmission = true;
                     break;
                  }
               }
               yi += iAddNo;
            }
            if(bIsCanLaserEmission)
            {
               this.m_bIsUsingLaserEmission = true;
               this.m_iLaserAttackWaitTime = LASERE_ATTACK_WAIT_TIME;
               this.ResetMovieStatus();
            }
            else
            {
               this.a_3969(a_1339);
            }
         }
         else
         {
            this.a_3969(a_1339);
         }
      }
      
      private function UseLaserEmission() : void
      {
         var stFieldGrid:a_3491 = null;
         if(!this.m_bIsCanLaserEmission)
         {
            return;
         }
         var iStartXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iStartYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         var iMaxYGridNo:int = BattleFieldView.a_1012;
         for(var yi:int = iStartYGridNo; yi < iMaxYGridNo - 1; yi++)
         {
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iStartXGridNo,yi);
            this.a_3502(stFieldGrid);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

