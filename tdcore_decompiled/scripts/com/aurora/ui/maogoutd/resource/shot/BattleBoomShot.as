package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class BattleBoomShot extends a_4348
   {
      
      private static var ms_stBattleBoomShotVector:Array = new Array();
      
      private var a_1590:Number;
      
      private var a_1602:Boolean = false;
      
      public var m_iAttackRandom:int;
      
      public var a_1598:a_3491;
      
      private var m_numYDeltaSpeed:Number;
      
      private var m_numDistance:Number;
      
      private var m_numXPos:Number;
      
      private var m_numYPos:Number;
      
      public function BattleBoomShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.enm_BattleBoomShot;
         a_1573 = 1;
         a_1576 = true;
         this.m_numYDeltaSpeed = 0;
         this.m_numDistance = 0;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stBattleBoomShot:BattleBoomShot = ms_stBattleBoomShotVector.pop();
         if(null == stBattleBoomShot)
         {
            stBattleBoomShot = new BattleBoomShot();
         }
         BattleFieldView.a_1017.play();
         return stBattleBoomShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BattleBoomShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.a_1602 = false;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1447 = 0;
         this.a_1590 = x;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         this.m_numDistance = 450 - Math.abs(x % a_3491.a_1080 - a_3491.a_1080 * 0.5) + a_3491.a_1080 * (BattleFieldView.a_1011 - 1 - this.a_1598.m_iXGridNo - a_1584.m_iXGridNo);
         var stFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(this.a_1598.m_iXGridNo + 1,this.a_1598.m_iYGridNo);
         if(Boolean(null != stFieldGrid) && Boolean(stFieldGrid.m_stAttackFighter) && stFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
         {
            a_1581 = Math.abs(int((this.m_numDistance - a_3491.a_1080) / m_numXSpeed));
            this.a_1602 = true;
         }
         else
         {
            a_1581 = Math.abs(int(this.m_numDistance / m_numXSpeed));
         }
         m_numYSpeed = 6 * a_3491.a_1081 / a_1581;
         this.m_numYDeltaSpeed = a_3491.a_1081 * (this.a_1598.m_iYGridNo - a_1584.m_iYGridNo) / a_1581;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(a_1583) && Boolean(this.a_1598))
         {
            a_1583.m_stOpponentBattleFieldInstance.a_3461(this.a_1598.m_iXGridNo,this.a_1598.m_iYGridNo);
         }
         super.a_3940();
         if(-1 == ms_stBattleBoomShotVector.indexOf(this))
         {
            ms_stBattleBoomShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stGlobalPoint:* = undefined;
         var stBattleForFourPoint:Point = null;
         var numYMove:Number = NaN;
         if(null == this.a_1598)
         {
         }
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
            stGlobalPoint = parent.localToGlobal(new Point(x,y));
            stBattleForFourPoint = parent.parent.globalToLocal(stGlobalPoint);
            x = stBattleForFourPoint.x;
            y = stBattleForFourPoint.y;
            parent.parent.addChild(this);
            this.a_1590 = x;
            this.m_numXPos = x;
            this.m_numYPos = y;
         }
         this.a_4373();
         this.m_numXPos += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            this.m_numYPos += numYMove + this.m_numYDeltaSpeed;
         }
         x = this.m_numXPos;
         y = this.m_numYPos;
      }
      
      private function a_4373() : void
      {
         var stBaseDefense:a_3962 = null;
         var iTargetXGridNo:int = BattleFieldView.a_1011 - a_1584.m_iXGridNo - 1;
         var iYGridNo:int = m_iYGridNo;
         if(Math.abs(x - this.a_1590) > this.m_numDistance + a_3491.a_1080 * 2)
         {
            trace("Release BattleBoomShot");
            this.a_3940();
            return;
         }
         var stLargeProtectorFieldGrid:a_3491 = a_1583.m_stOpponentBattleFieldInstance.a_3438(this.a_1598.m_iXGridNo + 1,this.a_1598.m_iYGridNo);
         var stFieldGrid:a_3491 = this.a_1598;
         if(Math.abs(x - this.a_1590) >= this.m_numDistance - a_3491.a_1080 * 2)
         {
            if(Boolean(this.a_1602) && Boolean(stLargeProtectorFieldGrid.m_stAttackFighter) && stLargeProtectorFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               stBaseDefense = stLargeProtectorFieldGrid.m_stAttackFighter;
            }
            else if(stFieldGrid.a_3492())
            {
               if(null != stFieldGrid.m_stAttackFighter)
               {
                  stBaseDefense = stFieldGrid.m_stAttackFighter;
                  if(0 == stFieldGrid.m_stAttackFighter.iBattleFighterType && (stFieldGrid.m_stAttackFighter.iLifeValue <= 10 || stFieldGrid.m_stAttackFighter.iLifeValue <= a_1579))
                  {
                     stBaseDefense = null;
                  }
               }
               else if(null != stFieldGrid.m_stBoomDefense)
               {
                  stBaseDefense = stFieldGrid.m_stBoomDefense;
               }
               else if(null != stFieldGrid.m_stFlowerDefense)
               {
                  stBaseDefense = stFieldGrid.m_stFlowerDefense;
               }
               else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
               {
                  stBaseDefense = stFieldGrid.m_stBaseAuxiliaryFighter;
               }
               else if(null != stFieldGrid.m_stProtector)
               {
                  stBaseDefense = stFieldGrid.m_stProtector;
               }
               else if(null != stFieldGrid.m_stTrayDefense)
               {
                  stBaseDefense = stFieldGrid.m_stTrayDefense;
               }
            }
            if(Boolean(stBaseDefense) && hitTestObject(stBaseDefense))
            {
               this.a_4374(stBaseDefense);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return;
            }
         }
      }
      
      private function a_4374(stBaseDefense:a_3962) : Boolean
      {
         stBaseDefense.m_isHurtByOpponent = true;
         stBaseDefense.m_iDieType = 3;
         stBaseDefense.a_3969(a_1579);
         stBaseDefense.m_iDieType = 0;
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1015.play();
         }
         return true;
      }
   }
}

