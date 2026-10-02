package com.aurora.ui.maogoutd.resource.defender.defenderSet
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class BaseAttackFighterSet extends a_3953 implements IDefenderSet
   {
      
      public static const FRAME_LABELID_MOD:int = 3;
      
      public static const FRAME_LABELID_WAIT:int = 0;
      
      public static const FRAME_LABELID_ATTACK:int = FRAME_LABELID_WAIT + 1;
      
      public static const FRAME_LABELID_CHANGE:int = FRAME_LABELID_MOD - 1;
      
      private var m_iAddHurtValue:EncrypIntEx;
      
      private var m_iShotValue:EncrypIntEx;
      
      private var m_iCurAddDefender:EncrypIntEx;
      
      private var m_iMaxAddDefender:EncrypIntEx;
      
      protected var m_iBaseFrameID:int;
      
      protected var m_iEachWaveShotNum:int;
      
      protected var m_isThreeDirectionShot:Boolean;
      
      public function BaseAttackFighterSet(iMaxAddDefender:uint)
      {
         super();
         this.m_iAddHurtValue = new EncrypIntEx();
         this.m_iShotValue = new EncrypIntEx();
         this.m_iCurAddDefender = new EncrypIntEx();
         this.m_iMaxAddDefender = new EncrypIntEx(iMaxAddDefender);
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.InitData();
         return true;
      }
      
      protected function InitData() : void
      {
         this.m_iEachWaveShotNum = 1;
         a_1321 = 0;
         this.m_iAddHurtValue.Value = 0;
         a_1307 = 1;
         a_1317 = 2;
         this.m_isThreeDirectionShot = false;
         this.m_iCurAddDefender.Value = 0;
         this.m_iBaseFrameID = 0;
         this.m_iShotValue.Value = 0;
         this.UpdateShotHurt();
         a_1309 = this.a_3966();
         a_1275 = -1;
         this.SetCurFrameLable(FRAME_LABELID_WAIT,true);
      }
      
      protected function IsLaunchShotTime(iCurrentTime:int) : Boolean
      {
         if(this.shotWaveNum <= 0 || iCurrentTime < m_iPlaceTimeIntervals + a_1308 || iCurrentTime < a_1321 + a_1309)
         {
            return false;
         }
         if(a_1313)
         {
            if(this.m_isThreeDirectionShot)
            {
               return Boolean(a_1334.m_stCurrentBattbleFieldView.GetFieldIntruderNumForThreeDirection(a_1334) > 0);
            }
         }
         return true;
      }
      
      protected function get HasCacheShot() : Boolean
      {
         return Boolean(a_1324.length > 0);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.IsLaunchShotTime(iCurrentTime))
         {
            this.InitAddShot(iCurrentTime);
         }
         else if(this.HasCacheShot && a_1323 < this.m_iEachWaveShotNum * this.shotWaveNum && iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323)
         {
            return this.StartLaunchShot();
         }
         return true;
      }
      
      protected function InitAddShot(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         if(a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0 || m_isFiveRowShot && a_1334.m_stCurrentBattbleFieldView.GetFieldRowIntruderNumForFiveRow(a_1334.m_iYGridNo) <= 0)
         {
            return false;
         }
         var iShotCnt:int = 0;
         if(a_1314)
         {
            this.m_iEachWaveShotNum = iShotCnt = 2;
         }
         else if(a_1316)
         {
            this.m_iEachWaveShotNum = 3;
            iShotCnt = 1 + (Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1) - Math.max(a_1334.m_iYGridNo - 1,0));
         }
         else if(m_isFiveRowShot)
         {
            this.m_iEachWaveShotNum = 5;
            iShotCnt = 1 + (Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1) - Math.max(a_1334.m_iYGridNo - 2,0));
         }
         else if(a_1318)
         {
            this.m_iEachWaveShotNum = iShotCnt = 3;
         }
         else if(a_1315)
         {
            this.m_iEachWaveShotNum = iShotCnt = 4;
         }
         else if(this.m_isThreeDirectionShot)
         {
            iShotCnt = 1 + (Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1) - Math.max(a_1334.m_iYGridNo - 1,0));
            this.m_iEachWaveShotNum = iShotCnt;
         }
         else
         {
            this.m_iEachWaveShotNum = iShotCnt = 1;
         }
         iShotCnt *= this.shotWaveNum;
         while(a_1324.length > 0)
         {
            stLastWaitShot = a_1324[a_1324.length - 1];
            stLastWaitShot.a_4350();
            --a_1324.length;
         }
         for(var i:int = 0; i < iShotCnt; i++)
         {
            if(!this.AddShot())
            {
               break;
            }
         }
         a_1323 = 0;
         a_1321 = iCurrentTime;
         a_1307 = a_1273;
         this.SetCurFrameLable(FRAME_LABELID_ATTACK,true);
         return true;
      }
      
      protected function AddShot() : Boolean
      {
         var stLastWaitShot:a_4348 = a_4388.getInstance().a_4389(a_1304);
         if(null == stLastWaitShot)
         {
            trace("ERROR：m_iShotTypeID = " + a_1304 + "类型的子弹为null！！！");
            return false;
         }
         a_1324.push(stLastWaitShot);
         return true;
      }
      
      protected function StartLaunchShot() : Boolean
      {
         var iYGridNo:int = 0;
         var iShotSequenceNum:int = a_1322;
         var fShotXpos:Number = x + this.a_3955();
         var fShotYpos:Number = y + a_3956();
         var stStartFieldGrid:a_3491 = a_1334;
         var bIsBothWayShot:Boolean = false;
         var fHotMultiplier:Number = 1;
         var iLaunchShotType:int = -1;
         var iShotPosType:int = a_1323 % this.m_iEachWaveShotNum;
         iShotSequenceNum += iShotPosType;
         if(a_1316 || m_isFiveRowShot)
         {
            iYGridNo = a_1334.m_iYGridNo;
            if(1 == iShotPosType && iYGridNo >= 1)
            {
               fShotYpos -= 5;
               iLaunchShotType = 2;
               iYGridNo--;
            }
            else if(2 == iShotPosType && iYGridNo < BattleFieldView.a_1012 - 1)
            {
               fShotYpos += 5;
               iLaunchShotType = 3;
               iYGridNo += 1;
            }
            else if(3 == iShotPosType && iYGridNo >= 2)
            {
               fShotYpos -= 5;
               iLaunchShotType = 7;
               iYGridNo -= 2;
            }
            else if(4 == iShotPosType && iYGridNo < BattleFieldView.a_1012 - 2)
            {
               fShotYpos += 5;
               iLaunchShotType = 8;
               iYGridNo += 2;
            }
            stStartFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,iYGridNo);
         }
         else if(a_1318)
         {
            if(iShotPosType > 0)
            {
               bIsBothWayShot = true;
               fShotXpos = width - fShotXpos;
            }
            iLaunchShotType = 0;
         }
         else if(this.m_isThreeDirectionShot)
         {
            iYGridNo = a_1334.m_iYGridNo;
            if(0 == iShotPosType)
            {
               fShotXpos += 10;
               iLaunchShotType = 0;
            }
            else if(1 == iShotPosType && iYGridNo >= 1)
            {
               fShotXpos -= 35;
               fShotYpos -= 30;
               iLaunchShotType = 5;
               iYGridNo--;
            }
            else if(iYGridNo < BattleFieldView.a_1012 - 1)
            {
               fShotXpos -= 38;
               fShotYpos += 15;
               iLaunchShotType = 6;
               iYGridNo += 1;
            }
            stStartFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,iYGridNo);
         }
         else
         {
            iLaunchShotType = 0;
         }
         ++a_1323;
         if(iLaunchShotType >= 0)
         {
            return this.LaunchShot(iShotSequenceNum,fShotXpos,fShotYpos,stStartFieldGrid,bIsBothWayShot,iLaunchShotType,fHotMultiplier);
         }
         return false;
      }
      
      protected function LaunchShot(iShotSequenceNum:int, fXPos:Number, fYPos:Number, stStartFieldGrid:a_3491, bIsBothWayShot:Boolean = false, iLaunchShotType:int = 0, fHotMultiplier:Number = 1) : Boolean
      {
         var stLastWaitShot:a_4348 = a_1324.pop();
         stLastWaitShot.iShotSequenceNum = iShotSequenceNum;
         stLastWaitShot.a_1797(0,a_1312,a_1311,fXPos,fYPos,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid,bIsBothWayShot,fHotMultiplier,iLaunchShotType);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
      
      protected function get shotWaveNum() : int
      {
         return this.m_iCurAddDefender.Value + 1;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         nextFrame();
         if(null != a_1278 || a_1273 == a_1274)
         {
            this.SetCurFrameLable(FRAME_LABELID_WAIT,true);
         }
         if(null != a_1336)
         {
            a_1336.a_3957(iCurrentTime);
         }
         if(m_stFrozenCardEffect)
         {
            m_stFrozenCardEffect.a_3957(iCurrentTime);
         }
         if(m_stShiHuaEffect)
         {
            m_stShiHuaEffect.a_3957(iCurrentTime);
         }
      }
      
      protected function SetCurFrameLable(iValue:int, bIsNeed:Boolean = false) : void
      {
         iValue += this.m_iBaseFrameID;
         if(bIsNeed || a_1275 != iValue)
         {
            a_1275 = iValue;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function IsUpgradeID(iUpgradeCardID:int) : Boolean
      {
         if((a_3512() ^ iUpgradeCardID) <= 15)
         {
            return true;
         }
         return Boolean((a_3512() & 0x0FFFF0) == (iUpgradeCardID & 0x0FFFF0));
      }
      
      public function AddDefender(iDefenderCardID:int, iDefenderValue:int) : Boolean
      {
         if(this.IsFull() || !this.IsUpgradeID(iDefenderCardID))
         {
            return false;
         }
         this.SetCurFrameLable(FRAME_LABELID_CHANGE,true);
         this.m_iCurAddDefender.Value += 1;
         BattleFieldView.a_1044.play();
         this.m_iBaseFrameID = this.m_iCurAddDefender.Value * 3;
         this.UpdateShotHurtValue(iDefenderValue);
         return true;
      }
      
      private function UpdateShotHurtValue(iDefenderValue:int) : Boolean
      {
         if(this.m_iShotValue.Value >= iDefenderValue)
         {
            return false;
         }
         this.m_iShotValue.Value = iDefenderValue;
         this.UpdateShotHurt();
         return true;
      }
      
      override public function AddShotHurtForEach(iAddHurtValue:int) : void
      {
         this.m_iAddHurtValue.Value += iAddHurtValue;
         this.UpdateShotHurt();
      }
      
      protected function UpdateShotHurt() : void
      {
         a_1311 = a_3965() + this.GetShotValue() + this.m_iAddHurtValue.Value;
      }
      
      override protected function a_3966() : int
      {
         return 50 - 2 * m_iSkillDegree;
      }
      
      protected function GetShotValue() : int
      {
         return this.m_iShotValue.Value;
      }
      
      public function IsFull() : Boolean
      {
         return Boolean(this.m_iCurAddDefender.Value >= this.m_iMaxAddDefender.Value);
      }
      
      override protected function a_3955() : Number
      {
         return a_1283 ? -0.8 * width : 0.8 * width;
      }
   }
}

