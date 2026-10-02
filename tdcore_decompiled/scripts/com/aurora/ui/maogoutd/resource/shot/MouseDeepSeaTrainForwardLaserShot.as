package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   
   public class MouseDeepSeaTrainForwardLaserShot extends a_4348
   {
      
      private static var ms_stMouseDeepSeaTrainForwardLaserShotVector:Array = new Array();
      
      public function MouseDeepSeaTrainForwardLaserShot()
      {
         super();
         a_1279 = -width * 0;
         a_1573 = 1;
         a_1576 = false;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stMouseDeepSeaTrainForwardLaserShot:MouseDeepSeaTrainForwardLaserShot = ms_stMouseDeepSeaTrainForwardLaserShotVector.pop();
         if(null == stMouseDeepSeaTrainForwardLaserShot)
         {
            stMouseDeepSeaTrainForwardLaserShot = new MouseDeepSeaTrainForwardLaserShot();
         }
         BattleFieldView.a_1017.play();
         return stMouseDeepSeaTrainForwardLaserShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseDeepSeaTrainForwardLaserShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         m_isHited = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stMouseDeepSeaTrainForwardLaserShotVector.indexOf(this))
         {
            ms_stMouseDeepSeaTrainForwardLaserShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stFieldGridVector:Array = null;
         var iIndex:int = 0;
         super.a_4216(iCurrentTime);
         if(5 == a_1273)
         {
            stFieldGridVector = a_1583.stFieldGridsVector;
            for(iIndex = 0; iIndex <= a_1584.m_iXGridNo; iIndex++)
            {
               this.a_3502(stFieldGridVector[a_1584.m_iYGridNo][iIndex]);
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
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
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

