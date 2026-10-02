package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class MouseWoodDuckRoundKnifeShot extends a_4348
   {
      
      private var m_isRoundKillingDefense:Boolean;
      
      public var m_numMouseMoveSpeed:Number;
      
      public var m_stParentMoveIntruder:a_4206;
      
      public function MouseWoodDuckRoundKnifeShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MouseWoodDuckRoundKnifeShot) as MouseWoodDuckRoundKnifeShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseWoodDuckRoundKnifeShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         this.m_isRoundKillingDefense = false;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(!this.m_isRoundKillingDefense && m_numXSpeed != this.m_numMouseMoveSpeed)
         {
            m_numXSpeed = this.m_numMouseMoveSpeed;
         }
         x += m_numXSpeed;
         var iXGridNo:int = a_1584.m_iXGridNo;
         var iYGridNo:int = a_1584.m_iYGridNo;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var stFieldGridClean:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGridClean)
         {
            this.a_3502(stFieldGridClean);
         }
         if(iCurrentTime - a_1447 >= 80 && (iCurrentTime - a_1447 - 80) % 500 == 0)
         {
            this.m_isRoundKillingDefense = true;
            m_numXSpeed = -8;
            a_1275 = 1;
         }
         if(x < 10)
         {
            m_numXSpeed = this.m_numMouseMoveSpeed;
            a_1275 = 0;
            this.m_isRoundKillingDefense = false;
            if(this.m_stParentMoveIntruder)
            {
               x = this.m_stParentMoveIntruder.x + 30;
            }
         }
         if(null == this.m_stParentMoveIntruder)
         {
            a_3940();
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
         }
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

