package com.aurora.ui.maogoutd.resource.Intruder.newBoss.AISha
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class IceTornadoShot extends a_4348
   {
      
      private static var ms_stIceTornadoShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      private var tempSpeed:int;
      
      private var lastFieldGrid:a_3491;
      
      public function IceTornadoShot()
      {
         super();
         a_1279 = -width * 0.2 - 60;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stIceTornadoShot:IceTornadoShot = ms_stIceTornadoShotVector.pop();
         if(null == stIceTornadoShot)
         {
            stIceTornadoShot = new IceTornadoShot();
         }
         return stIceTornadoShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceTornadoShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         if(m_iYGridNo == 0)
         {
            m_numYSpeed = m_numXSpeed;
         }
         else if(m_iYGridNo == 6)
         {
            m_numYSpeed = -m_numXSpeed;
         }
         m_numXSpeed = 0;
         this.lastFieldGrid = null;
         this.tempSpeed = numSpeed;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.lastFieldGrid = null;
         if(-1 == ms_stIceTornadoShotVector.indexOf(this))
         {
            ms_stIceTornadoShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               a_1275 = 0;
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
         var iYGridNo:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         trace("m_iShotSequenceNum:" + a_1580);
         if(a_1580 >= 3)
         {
            iYGridNo = Math.ceil((y + 145) / a_3491.a_1081);
         }
         else
         {
            iYGridNo = int((y + 145) / a_3491.a_1081);
         }
         if(iYGridNo == 3)
         {
            switch(a_1580)
            {
               case 0:
                  m_numYSpeed = 0;
                  m_numXSpeed = -1 * Math.abs(this.tempSpeed);
                  break;
               case 1:
                  m_numXSpeed = -Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  m_numYSpeed = -1 * Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  break;
               case 2:
                  m_numXSpeed = -Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  m_numYSpeed = 1 * Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  break;
               case 3:
                  m_numYSpeed = 0;
                  m_numXSpeed = 1 * Math.abs(this.tempSpeed);
                  break;
               case 4:
                  m_numXSpeed = Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  m_numYSpeed = -1 * Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  break;
               case 5:
                  m_numXSpeed = Math.SQRT1_2 * Math.abs(this.tempSpeed);
                  m_numYSpeed = 1 * Math.SQRT1_2 * Math.abs(this.tempSpeed);
            }
         }
         trace("BattleFieldView.ms_iBattleFiledHeigth11:" + BattleFieldView.a_1014);
         if(x < 0 || x >= BattleFieldView.a_1013 - 55 || y + 180 > BattleFieldView.a_1014 || y + 145 < 0)
         {
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         this.a_3502(stFieldGrid);
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid != this.lastFieldGrid)
         {
            this.lastFieldGrid = stFieldGrid;
            if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
            {
               stFieldGrid.m_stProtector.m_iDieType = 1;
               stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            }
            if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            }
            if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
            {
               stFieldGrid.m_stBoomDefense.m_iDieType = 1;
               stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            }
            if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
            {
               stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
               stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            }
            if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            }
            stFieldGrid.DamageNewSlot(true,2,true,0,1);
            if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
            {
               stFieldGrid.m_stTrayDefense.m_iDieType = 1;
               stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            }
            return true;
         }
         return false;
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         var iHurtPower:int = 0;
         stBaseDefense.m_iDieType = 1;
         if(stBaseDefense is a_3924)
         {
            iHurtPower = stBaseDefense.iLifeValue - 10 > a_1579 ? a_1579 : int(stBaseDefense.iLifeValue - 10);
            stBaseDefense.a_3969(iHurtPower);
         }
         else
         {
            stBaseDefense.a_3969(a_1579);
         }
         stBaseDefense.m_iDieType = 0;
         stBaseDefense.a_3940();
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

