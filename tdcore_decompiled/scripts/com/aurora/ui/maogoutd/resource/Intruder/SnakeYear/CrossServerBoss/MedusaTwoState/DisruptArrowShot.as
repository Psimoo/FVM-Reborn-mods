package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerBoss.MedusaTwoState
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DisruptArrowShot extends a_4348
   {
      
      private static var ms_stDisruptArrowShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      private var lastFieldGrid:a_3491;
      
      private var iHurtPower1:int = 50;
      
      public function DisruptArrowShot()
      {
         super();
         a_1279 = -width * 0.2 - 24;
         a_1588 = true;
         scaleX = scaleY = 0.6;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stDisruptArrowShot:DisruptArrowShot = ms_stDisruptArrowShotVector.pop();
         if(null == stDisruptArrowShot)
         {
            stDisruptArrowShot = new DisruptArrowShot();
         }
         return stDisruptArrowShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DisruptArrowShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         if(numSpeed > 0)
         {
            a_1283 = true;
         }
         else
         {
            a_1283 = false;
         }
         a_1447 = 0;
         m_numYSpeed = 0;
         m_numXSpeed = numSpeed;
         this.lastFieldGrid = null;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.lastFieldGrid = null;
         if(-1 == ms_stDisruptArrowShotVector.indexOf(this))
         {
            ms_stDisruptArrowShotVector.push(this);
         }
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
         this.a_4373();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         iXGridNo = int(x / a_3491.a_1080);
         var xx:int = int(y / a_3491.a_1081);
         var iYGridNo:int = m_iYGridNo;
         if(x < 10 || x >= BattleFieldView.a_1013 || y + 30 > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid.a_3492())
         {
            m_isHited = true;
         }
         this.a_3502(stFieldGrid);
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid != this.lastFieldGrid)
         {
            this.lastFieldGrid = stFieldGrid;
            if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
            {
               stFieldGrid.m_stProtector.a_3969(this.iHurtPower1);
            }
            if(null != stFieldGrid.m_stAttackFighter && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
            {
               stFieldGrid.m_stAttackFighter.a_3969(this.iHurtPower1);
            }
            if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
            {
               stFieldGrid.m_stBoomDefense.a_3969(this.iHurtPower1);
            }
            if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
            {
               stFieldGrid.m_stFlowerDefense.a_3969(this.iHurtPower1);
            }
            if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(this.iHurtPower1);
            }
            stFieldGrid.DamageNewSlot(true,2,false,this.iHurtPower1,1);
            if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
            {
               stFieldGrid.m_stTrayDefense.a_3969(this.iHurtPower1);
            }
            return true;
         }
         return false;
      }
   }
}

