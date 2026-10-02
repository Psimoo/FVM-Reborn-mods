package com.aurora.ui.maogoutd.resource.shot.mechanicsBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class MechanicsBombShot extends a_4348
   {
      
      public function MechanicsBombShot()
      {
         super();
         a_1275 = 0;
         a_1587 = 1;
         a_1279 = -width * 0.5;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = PoolManager.getInstance().CheckOutOne(MechanicsBombShot) as MechanicsBombShot;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MechanicsBombShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.InitData();
         return true;
      }
      
      protected function InitData() : void
      {
         m_numXSpeed = -m_numXSpeed;
         gotoAndStop(1);
         m_isHited = false;
         a_1588 = true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 - 10)
            {
               this.a_3502(a_1584);
            }
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || null != a_1278)
            {
               m_isHited = true;
               a_1588 = false;
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               stFieldGrid.m_stAttackFighter.a_3969(a_1579);
            }
            else
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
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
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

