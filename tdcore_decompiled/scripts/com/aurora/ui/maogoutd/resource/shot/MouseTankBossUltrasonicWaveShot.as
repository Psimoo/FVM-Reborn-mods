package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class MouseTankBossUltrasonicWaveShot extends a_4348
   {
      
      private static var ms_stMouseTankBossUltrasonicWaveShotVector:Array = new Array();
      
      public var m_iDirection:int;
      
      public var m_iShotSequence:int;
      
      public function MouseTankBossUltrasonicWaveShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         var stMouseTankBossUltrasonicWaveShot:MouseTankBossUltrasonicWaveShot = ms_stMouseTankBossUltrasonicWaveShotVector.pop();
         if(null == stMouseTankBossUltrasonicWaveShot)
         {
            stMouseTankBossUltrasonicWaveShot = new MouseTankBossUltrasonicWaveShot();
         }
         BattleFieldView.a_1017.play();
         return stMouseTankBossUltrasonicWaveShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseTankBossUltrasonicWaveShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 2;
         gotoAndStop(1);
         this.m_iShotSequence = 0;
         if(0 == this.m_iDirection)
         {
            a_1275 = 1;
            a_1587 = 1;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else if(1 == this.m_iDirection)
         {
            a_1275 = 3;
            a_1587 = 3;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         else if(2 == this.m_iDirection)
         {
            a_1275 = 7;
            a_1587 = 7;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
         }
         else if(3 == this.m_iDirection)
         {
            a_1275 = 5;
            a_1587 = 5;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stMouseTankBossUltrasonicWaveShotVector.indexOf(this))
         {
            ms_stMouseTankBossUltrasonicWaveShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stUpFieldGridClean:a_3491 = null;
         var stLeftFieldGridClean:a_3491 = null;
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
         if(0 == this.m_iDirection)
         {
            x -= 10;
         }
         else if(1 == this.m_iDirection)
         {
            x += 10;
         }
         else if(2 == this.m_iDirection)
         {
            y -= 10;
         }
         else if(3 == this.m_iDirection)
         {
            y += 10;
         }
         var iXGridNo:int = a_1584.m_iXGridNo;
         var iYGridNo:int = a_1584.m_iYGridNo;
         if(0 == this.m_iDirection || 1 == this.m_iDirection)
         {
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
            }
            else
            {
               iXGridNo = int(x / a_3491.a_1080);
            }
         }
         else if(2 == this.m_iDirection || 3 == this.m_iDirection)
         {
            iYGridNo = int(y / a_3491.a_1081);
         }
         var stFieldGridClean:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGridClean)
         {
            this.a_3502(stFieldGridClean);
            if(0 == this.m_iDirection || 1 == this.m_iDirection)
            {
               stUpFieldGridClean = a_1583.a_3438(iXGridNo,stFieldGridClean.m_iYGridNo - 1);
               if(stUpFieldGridClean)
               {
                  this.a_3502(stUpFieldGridClean);
               }
            }
            else if(2 == this.m_iDirection || 3 == this.m_iDirection)
            {
               stLeftFieldGridClean = a_1583.a_3438(stFieldGridClean.m_iXGridNo - 1,iYGridNo);
               if(stLeftFieldGridClean)
               {
                  this.a_3502(stLeftFieldGridClean);
               }
            }
         }
         if(x < 0 || x > BattleFieldView.a_1013 + 50 || y < -50 || y > BattleFieldView.a_1014 + 50)
         {
            this.a_3940();
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
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

