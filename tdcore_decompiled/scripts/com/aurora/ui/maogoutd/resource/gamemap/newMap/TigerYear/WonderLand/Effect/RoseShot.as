package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RoseShot extends a_4348
   {
      
      private static var ms_stRoseShotVector:Array = new Array();
      
      private var iHurtValue:int = 50;
      
      public function RoseShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_184;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stRoseShot:RoseShot = ms_stRoseShotVector.pop();
         if(null == stRoseShot)
         {
            stRoseShot = new RoseShot();
         }
         stRoseShot.rotationX = stRoseShot.rotationY = 0;
         return stRoseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_numXSpeed = numSpeed;
         switch(m_isSpecial)
         {
            case 1:
               m_numYSpeed = -1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               rotation = -90;
               break;
            case 2:
               m_numYSpeed = 0;
               m_numXSpeed = Math.abs(m_numXSpeed);
               rotation = 0;
               break;
            case 3:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               rotation = -270;
               break;
            case 4:
               m_numYSpeed = 0;
               m_numXSpeed = -Math.abs(m_numXSpeed);
               rotation = -180;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
            return;
         }
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
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         if(!m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(y <= 7 || y >= BattleFieldView.a_1014 + 18)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(x <= -10 || x >= BattleFieldView.a_1013)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType) && !m_isPenetrate)
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
         var base:a_3962 = stFieldGrid.getPositionDefense();
         if(base != null)
         {
            m_isHited = true;
            this.a_3502(stFieldGrid);
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stAttackFighter.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stOceanGoddessToolDefense && !stFieldGrid.m_stOceanGoddessToolDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stHoneyTrapBaseDefense && !stFieldGrid.m_stHoneyTrapBaseDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(this.iHurtValue);
         }
         else if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.a_3969(this.iHurtValue);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stRoseShotVector.indexOf(this))
         {
            ms_stRoseShotVector.push(this);
         }
         return true;
      }
   }
}

