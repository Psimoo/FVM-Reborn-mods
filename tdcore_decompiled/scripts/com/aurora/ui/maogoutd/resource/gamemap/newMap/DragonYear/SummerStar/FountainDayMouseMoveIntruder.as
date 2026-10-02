package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class FountainDayMouseMoveIntruder extends a_4206
   {
      
      public var FULL_HP:int = 20000;
      
      private var HURT_HP:int = this.FULL_HP * 0.4;
      
      private var DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      private var m_iShotTimes:int;
      
      private var m_BossSate:int = 0;
      
      public function FountainDayMouseMoveIntruder()
      {
         super();
         a_1279 = -30;
         a_1467 = 27;
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FountainDayMouseMoveIntruder) as FountainDayMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FountainDayMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1463 = true;
         this.m_iAppearedTime = 0;
         BoomIsReduceLife = true;
         this.HURT_HP = this.FULL_HP * 0.4;
         this.m_iShotTimes = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            this.ClearShield(m_stCurrentFieldGrid);
         }
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            a_1460 = true;
            this.addShield(m_stCurrentFieldGrid);
            this.m_BossSate = 0;
            this.m_iAppearedTime = iCurrentTime;
            a_1275 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 8)
            {
               this.m_iAppearedTime = iCurrentTime;
               this.m_BossSate = 1;
               this.ResetMovieStatus();
            }
            else if(a_1273 == 24 || a_1273 == 44)
            {
               this.addShot(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 28 || a_1273 == 48)
            {
               this.m_iAppearedTime = iCurrentTime;
               this.m_BossSate = 1;
               this.ResetMovieStatus();
            }
         }
         if(iCurrentTime - this.m_iAppearedTime != 0 && (iCurrentTime - this.m_iAppearedTime) % (2 * 20) == 0 && this.m_BossSate == 1)
         {
            this.m_BossSate = 2;
            if(a_1339 > this.HURT_HP)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else if(a_1339 > 0)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_BossSate == 1)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_BossSate == 1)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_434 == iEffectType)
         {
            a_4209(this.HURT_HP / 0.4 * 0.7);
         }
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 8;
         }
         if(stFieldGrid != null)
         {
            stFieldGrid.ClearFieldGridDefenseNoraml();
         }
         if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 8)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      private function addShot(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var tempX2:int = 0;
         var tempY2:int = 0;
         var stLastWaitShot:FountainShot = null;
         if(stFieldGrid == null)
         {
            return;
         }
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         if(stTargetFieldGrid != null)
         {
            stLastWaitShot = FountainShot.a_4344() as FountainShot;
            if(null == stLastWaitShot)
            {
               return;
            }
            tempX2 = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 23;
            tempY2 = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 4;
            stLastWaitShot.m_isSpecial = this.m_iShotTimes % 2 == 0 ? 0 : 1;
            stLastWaitShot.a_1797(0,10,50,tempX2,tempY2,stFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
            ++this.m_iShotTimes;
         }
      }
      
      override public function a_4212() : Boolean
      {
         a_4209(BOOM_INJURE_LIFE);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(BoomIsReduceLife)
         {
            a_4209(BOOM_INJURE_LIFE);
         }
         else
         {
            a_1339 = 0;
         }
         ShowBoomDieEffect();
         if(a_1339 <= 0)
         {
            this.a_3940();
         }
         return true;
      }
   }
}

