package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.DragonUpperBodyBossShot;
   import flash.display.FrameLabel;
   
   public class DragonBossUpperBodyFireShotIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      public var m_isFireEffect:Boolean;
      
      private var m_iSummonUpMoveIntruderSequence:int = 0;
      
      public function DragonBossUpperBodyFireShotIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DragonBossUpperBodyFireShotIntruder) as DragonBossUpperBodyFireShotIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonBossUpperBodyFireShotIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 9000;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1463 = true;
         this.m_isFireEffect = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 300)
         {
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0 && a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            a_3940();
         }
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var stDragonBossUpperBodyFireShotIntruder:DragonBossUpperBodyFireShotIntruder = null;
         var stDragonUpperBodyBossShot:DragonUpperBodyBossShot = null;
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            if(this.m_isFireEffect)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(!this.m_isFireEffect)
         {
            if(this.m_iStartTimeNum > 0 && iCurrentTime - this.m_iStartTimeNum == 40)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonBossUpperBodyFireShotIntruder = DragonBossUpperBodyFireShotIntruder.a_3926() as DragonBossUpperBodyFireShotIntruder;
                  stDragonBossUpperBodyFireShotIntruder.a_1797(0,-1);
                  stDragonBossUpperBodyFireShotIntruder.iGlobalMoveFighterID = this.a_4265();
                  stDragonBossUpperBodyFireShotIntruder.m_stMoveIntruderTypeID = 8388608;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stDragonBossUpperBodyFireShotIntruder,stTargetFieldGrid);
                  stDragonBossUpperBodyFireShotIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + (a_3491.a_1080 - stDragonBossUpperBodyFireShotIntruder.width);
                  stDragonBossUpperBodyFireShotIntruder.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stDragonBossUpperBodyFireShotIntruder.height);
                  stDragonBossUpperBodyFireShotIntruder.m_isFireEffect = true;
               }
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,100,x + a_3491.a_1080,y,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
            }
            if(this.m_iStartTimeNum > 0 && iCurrentTime - this.m_iStartTimeNum == 80)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,100,x - a_3491.a_1080,y,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 2,m_stCurrentFieldGrid.m_iYGridNo);
               if(stTargetFieldGrid)
               {
                  stDragonUpperBodyBossShot = DragonUpperBodyBossShot.a_4344() as DragonUpperBodyBossShot;
                  stDragonUpperBodyBossShot.a_1598 = stTargetFieldGrid;
                  stDragonUpperBodyBossShot.a_1797(0,0,100,x + a_3491.a_1080,y,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
                  parent.addChild(stDragonUpperBodyBossShot);
                  stDragonUpperBodyBossShot.m_isFireEffect = true;
               }
            }
            if(this.m_iStartTimeNum > 0 && iCurrentTime - this.m_iStartTimeNum > 120)
            {
               this.a_3969(iLifeValue);
            }
         }
         else if(iCurrentTime - this.m_iStartTimeNum == 80)
         {
            this.a_3969(iLifeValue);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_434 == iEffectType)
         {
            this.a_3969(iLifeValue);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

