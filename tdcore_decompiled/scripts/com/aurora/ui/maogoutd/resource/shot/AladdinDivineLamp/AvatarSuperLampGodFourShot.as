package com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AvatarSuperLampGodFourShot extends a_4348
   {
      
      private static var ms_stAvatarSuperLampGodFourShotVector:Array = new Array();
      
      public var m_SpecialGemLevel:int;
      
      public var m_numSputteringRate:Number = 0;
      
      private var m_RoundTime:int = 0;
      
      private var m_OrgXGridNo:int;
      
      private var m_OrgYGridNo:int;
      
      private var m_numSpeed:int;
      
      private var m_iSuperContinueShotInterval:int = 16;
      
      private var m_isPVP:Boolean;
      
      public function AvatarSuperLampGodFourShot()
      {
         super();
         a_1279 = -62 + 15;
         m_iYDisplayCenterPos = -50.5 + 5;
         m_isChangeYGridNo = true;
         a_1573 = 1;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperLampGodFourShot:AvatarSuperLampGodFourShot = ms_stAvatarSuperLampGodFourShotVector.pop();
         if(null == stAvatarSuperLampGodFourShot)
         {
            stAvatarSuperLampGodFourShot = new AvatarSuperLampGodFourShot();
         }
         return stAvatarSuperLampGodFourShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperLampGodFourShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.m_numSpeed = Math.abs(numSpeed);
         this.m_iSuperContinueShotInterval = 0;
         if(this.m_SpecialGemLevel == 1)
         {
            this.m_OrgXGridNo = 8;
            this.m_OrgYGridNo = 0;
         }
         else if(this.m_SpecialGemLevel == 2)
         {
            this.m_OrgXGridNo = 8;
            this.m_OrgYGridNo = 0;
         }
         else if(this.m_SpecialGemLevel == 3)
         {
            if(m_iSuperShotType == 1)
            {
               this.m_OrgXGridNo = 8;
               this.m_OrgYGridNo = 6;
            }
            else if(m_iSuperShotType == 2)
            {
               this.m_OrgXGridNo = 4;
               this.m_OrgYGridNo = 6;
            }
         }
         else if(this.m_SpecialGemLevel == 4)
         {
            if(m_iSuperShotType == 1)
            {
               this.m_OrgXGridNo = 8;
               this.m_OrgYGridNo = 6;
            }
            else if(m_iSuperShotType == 2)
            {
               this.m_OrgXGridNo = 4;
               this.m_OrgYGridNo = 6;
            }
         }
         else if(this.m_SpecialGemLevel == 5)
         {
            if(m_iSuperShotType == 1)
            {
               this.m_OrgXGridNo = 0;
               this.m_OrgYGridNo = 0;
            }
            else if(m_iSuperShotType == 2)
            {
               this.m_OrgXGridNo = 4;
               this.m_OrgYGridNo = 0;
            }
            else if(m_iSuperShotType == 3)
            {
               this.m_OrgXGridNo = 8;
               this.m_OrgYGridNo = 0;
            }
         }
         else if(this.m_SpecialGemLevel == 6 || this.m_SpecialGemLevel == 7)
         {
            if(m_iSuperShotType == 1)
            {
               this.m_OrgXGridNo = 0;
               this.m_OrgYGridNo = 0;
            }
            else if(m_iSuperShotType == 2)
            {
               this.m_OrgXGridNo = 4;
               this.m_OrgYGridNo = 0;
            }
            else if(m_iSuperShotType == 3)
            {
               this.m_OrgXGridNo = 8;
               this.m_OrgYGridNo = 0;
            }
         }
         if(stCurrentBattleView.iIntruderMoveDirection > 0)
         {
            this.m_OrgXGridNo = BattleFieldView.a_1011 - 1 - this.m_OrgXGridNo;
         }
         this.m_isPVP = Boolean(BattleFieldView.a_1011 == 7);
         stStartFieldGrid = stCurrentBattleView.a_3438(this.m_OrgXGridNo,this.m_OrgYGridNo);
         if(!stStartFieldGrid)
         {
            this.m_OrgXGridNo = BattleFieldView.a_1011 - 1;
            stStartFieldGrid = stCurrentBattleView.a_3438(this.m_OrgXGridNo,this.m_OrgYGridNo);
         }
         iXpos = a_3491.a_1080 * (0.5 + this.m_OrgXGridNo);
         iYpos = a_3491.a_1081 * (0.5 + this.m_OrgYGridNo);
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.m_RoundTime = 0;
         if(stStartFieldGrid.m_iYGridNo == 0)
         {
            m_numYSpeed = this.m_numSpeed;
            rotation = 0;
         }
         else if(stStartFieldGrid.m_iYGridNo == 6)
         {
            m_numYSpeed = -this.m_numSpeed;
            rotation = 180;
         }
         m_isChangeYGridNo = true;
         m_isPenetrate = true;
         m_isShotHighSkySpace = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.m_iSuperContinueShotInterval > 0)
         {
            --this.m_iSuperContinueShotInterval;
            if(this.m_iSuperContinueShotInterval == 0)
            {
               this.visible = true;
            }
            return;
         }
         if(m_isHited && !m_isPenetrate)
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
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         if(rotation == 180)
         {
            iYGridNo = m_isChangeYGridNo ? int((y - 10) / a_3491.a_1081) : m_iYGridNo;
         }
         else
         {
            iYGridNo = m_isChangeYGridNo ? int((y - 0) / a_3491.a_1081) : m_iYGridNo;
         }
         if(y >= 7 * a_3491.a_1081)
         {
            if(this.m_SpecialGemLevel == 1 || this.m_SpecialGemLevel == 2)
            {
               if(iXGridNo == 8)
               {
                  x = a_3491.a_1080 * (0.5 + 5);
               }
               else if(iXGridNo == 2 || this.m_isPVP)
               {
                  this.a_3940();
                  return;
               }
            }
            else if(this.m_SpecialGemLevel == 3 || this.m_SpecialGemLevel == 4)
            {
               if(iXGridNo == 2 || iXGridNo == 6 || this.m_isPVP)
               {
                  this.a_3940();
                  return;
               }
            }
            else if(this.m_SpecialGemLevel == 5 || this.m_SpecialGemLevel == 7)
            {
               if(iXGridNo == 8 || iXGridNo == 4)
               {
                  x = a_3491.a_1080 * (0.5 + iXGridNo - 2);
               }
               else if(iXGridNo == 0 || this.m_isPVP)
               {
                  this.a_3940();
                  return;
               }
            }
            else if(this.m_SpecialGemLevel == 6)
            {
               if(iXGridNo == 8 || iXGridNo == 4)
               {
                  x = a_3491.a_1080 * (0.5 + iXGridNo - 2);
               }
               else if(iXGridNo == 0 && m_iShotGroupIndex == 0)
               {
                  x = a_3491.a_1080 * (0.5 + 2);
                  this.m_iSuperContinueShotInterval = 4 * 3;
                  this.visible = false;
               }
               else if(iXGridNo == 0 && m_iShotGroupIndex == 1)
               {
                  x = a_3491.a_1080 * (0.5 + 6);
                  this.m_iSuperContinueShotInterval = 4 * 2;
                  this.visible = false;
               }
               else if(iXGridNo == 0 || this.m_isPVP)
               {
                  this.a_3940();
                  return;
               }
            }
            m_numYSpeed = -this.m_numSpeed;
            rotation = 180;
            return;
         }
         if(y <= 0 * a_3491.a_1081)
         {
            if(this.m_SpecialGemLevel == 1 || this.m_SpecialGemLevel == 2)
            {
               if(iXGridNo == 5)
               {
                  x = a_3491.a_1080 * (0.5 + 2);
               }
            }
            else if(this.m_SpecialGemLevel == 3 || this.m_SpecialGemLevel == 4)
            {
               if(iXGridNo == 8 || iXGridNo == 4)
               {
                  x = a_3491.a_1080 * (0.5 + iXGridNo - 2);
               }
            }
            else if(this.m_SpecialGemLevel == 5 || this.m_SpecialGemLevel == 6 || this.m_SpecialGemLevel == 7)
            {
               if(iXGridNo == 2 || iXGridNo == 6 || this.m_isPVP)
               {
                  this.a_3940();
                  return;
               }
            }
            m_numYSpeed = this.m_numSpeed;
            rotation = 0;
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return;
               }
            }
         }
         if(a_1283)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo + 1,iYGridNo);
         }
         else
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return;
               }
            }
         }
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0 && hitTestObject(stMoveIntruder))
         {
            if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               m_HitMouseArray.push(stMoveIntruder);
               this.a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
            if(!m_isPenetrate)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               this.a_4352(stMoveIntruder);
               this.SputterHurt(stFieldGrid,stMoveIntruder);
               return true;
            }
         }
         return false;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(baseMoveIntruder.iLifeValue - GetFinalDamage() <= 0)
         {
            baseMoveIntruder.PowerfulBombReduceLifeRate(GetFinalDamage() / 900);
         }
         else
         {
            baseMoveIntruder.a_4209(GetFinalDamage());
         }
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         return true;
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var HurtPower:int = 0;
         if(stHitenFieldGrid == null || stHitenMouseIntruder == null)
         {
            return;
         }
         for(var i:int = stHitenFieldGrid.m_iXGridNo - 1; i <= stHitenFieldGrid.m_iXGridNo + 1; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - 1; j <= stHitenFieldGrid.m_iYGridNo + 1; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != stHitenMouseIntruder && stMouseIntruder.iLifeValue > 0)
                     {
                        HurtPower = int(a_1579 * this.m_numSputteringRate);
                        stMouseIntruder.PowerfulBombReduceLifeRate(HurtPower / 900);
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAvatarSuperLampGodFourShotVector.indexOf(this))
         {
            ms_stAvatarSuperLampGodFourShotVector.push(this);
         }
         return true;
      }
   }
}

