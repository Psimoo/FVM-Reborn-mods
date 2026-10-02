package com.aurora.ui.maogoutd.resource.Intruder.Desert.ShaManWizard
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ShaManSheepShot extends a_4348
   {
      
      private var m_stLastFieldGrid:a_3491;
      
      private var waitTime:int = 0;
      
      public function ShaManSheepShot()
      {
         super();
         a_1279 = -60;
         a_1573 = 1;
         a_1574 = 0;
         a_1576 = false;
         a_1578 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(ShaManSheepShot) as ShaManSheepShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShaManSheepShotMovie;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.m_stLastFieldGrid = null;
         this.waitTime = 20;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4351();
         if(this.waitTime > 0)
         {
            --this.waitTime;
         }
         else
         {
            x += m_numXSpeed;
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         if(x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         var stFieldGridClean:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGridClean == null)
         {
            return;
         }
         if(Boolean(stFieldGridClean) && this.m_stLastFieldGrid != stFieldGridClean)
         {
            this.m_stLastFieldGrid = stFieldGridClean;
            this.a_3502(this.m_stLastFieldGrid);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         m_bActive.Value = false;
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(GetFinalDamage());
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage());
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
            }
         }
         if(a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(Boolean(baseMoveIntruder) && baseMoveIntruder.iLifeValue > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_435,40);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stLastFieldGrid = null;
         return true;
      }
   }
}

