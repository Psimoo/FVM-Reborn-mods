package com.aurora.ui.maogoutd.resource.defender.CattleYear.Hercules
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HerculesShot extends a_4348
   {
      
      private var hitMouseArray:Array = new Array();
      
      public function HerculesShot()
      {
         super();
         a_1587 = 1;
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(HerculesShot,HerculesShotMovie) as HerculesShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(HerculesShot,HerculesShot1Movie) as HerculesShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(HerculesShot,HerculesShot2Movie) as HerculesShot;
      }
      
      public static function GetFreeShot3() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(HerculesShot,HerculesShot3Movie) as HerculesShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_iFollowingShotSpaceState = 3;
         m_isShotHighSkySpace = true;
         while(this.hitMouseArray.length > 0)
         {
            this.hitMouseArray.pop();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y + 0.5 * stMoveIntruder.height - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         if(m_numXSpeed == 0 && m_numYSpeed == 0 && null == stMoveIntruder)
         {
            a_3940();
            return false;
         }
         y += m_numYSpeed;
         return true;
      }
      
      override protected function a_4351() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var HurtPower:int = 0;
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(y <= -80 || y >= BattleFieldView.a_1014)
         {
            m_bActive.Value = false;
            a_3940();
            return;
         }
         stBaseMoveIntruder = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stBaseMoveIntruder && hitTestObject(stBaseMoveIntruder) && this.hitMouseArray.indexOf(stBaseMoveIntruder) == -1)
         {
            if(m_isSpecial == 3)
            {
               HurtPower = GetFinalDamage();
               stBaseMoveIntruder.PowerfulBombReduceLifeRate(HurtPower / 900);
            }
            else
            {
               a_4352(stBaseMoveIntruder);
            }
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            if(m_isSpecial == 0 && stBaseMoveIntruder.iLifeValue > 0)
            {
               if(Math.random() * 100 <= 15)
               {
                  stBaseMoveIntruder.a_4208(b_182.a_435,40);
               }
            }
            else if((m_isSpecial == 1 || m_isSpecial == 2 || m_isSpecial == 3) && stBaseMoveIntruder.iLifeValue > 0)
            {
               if(Math.random() * 100 <= 30)
               {
                  stBaseMoveIntruder.a_4208(b_182.a_435,60);
               }
            }
         }
      }
   }
}

