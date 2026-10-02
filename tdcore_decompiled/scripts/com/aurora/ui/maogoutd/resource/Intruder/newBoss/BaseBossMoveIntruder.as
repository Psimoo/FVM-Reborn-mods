package com.aurora.ui.maogoutd.resource.Intruder.newBoss
{
   import a_4715.EncrypIntEx;
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.CharmBoomConfig;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AurShadow;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.WarningSign;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class BaseBossMoveIntruder extends a_4206 implements IBossMoveIntruder
   {
      
      protected static const STATE_NONE:uint = 0;
      
      protected static const STATE_DEAD:uint = 1;
      
      protected static const STATE_HIDE:uint = 2;
      
      protected static const STATE_APPEAR:uint = 3;
      
      protected static const STATE_WAITING:uint = 4;
      
      protected static const STATE_MOVE:uint = 5;
      
      protected var m_iSummonUpSequence:int = 0;
      
      protected var m_iMaxLife:EncrypIntEx;
      
      protected var m_iInjuredLife:int;
      
      protected var m_iDeadFrameID:int;
      
      protected var m_numHardRate:Number;
      
      protected var m_stRandomSeed:RandomSeed;
      
      protected var m_stBossBloodDataEvent:a_1778;
      
      protected var m_iBossState:int;
      
      protected var m_dictBossStateFrameID:Dictionary;
      
      protected var m_iRestTick:int;
      
      protected var m_vStateCache:Vector.<Array>;
      
      protected var m_iSkillNum:EncrypIntEx;
      
      protected var m_vSkillID:Vector.<int>;
      
      protected var m_vSkillFunction:Vector.<Function>;
      
      protected var m_fMoveSpeedX:Number;
      
      protected var m_fMoveSpeedY:Number;
      
      protected var m_fOrginSpeed:Number;
      
      protected var m_iStartShowGridNo:int = 3;
      
      protected var m_iLaunchNum:int;
      
      protected var m_iLaunchRunTick:int;
      
      protected var m_iLaunchDelayTick:int;
      
      protected var m_iLaunchIntervalTick:int;
      
      protected var m_iLastLaunchShotTick:int;
      
      protected var m_iFrameLabelStartIndex:int;
      
      protected var m_bIsNeedHighPrecision:Boolean;
      
      protected var m_bIsNoChangeCannotSee:Boolean;
      
      protected var m_bSkillIsOrder:Boolean;
      
      protected var m_iLastCalTime:int;
      
      private var m_bIsNeedShadow:Boolean;
      
      private var a_1100:Bitmap = new Bitmap();
      
      protected var m_iVerticalDirect:int;
      
      protected var m_iHorizontalDirect:int;
      
      public function BaseBossMoveIntruder()
      {
         super();
         this.IsNeedShadow = false;
         BoomIsReduceLife = true;
         this.m_fOrginSpeed = a_3491.a_1080 / 6;
         this.m_bSkillIsOrder = false;
         a_1481 = false;
         this.m_bIsNeedHighPrecision = false;
         this.m_iInjuredLife = 5000;
         this.m_iMaxLife = new EncrypIntEx(15000);
         this.numHardRate = 1;
         this.m_stRandomSeed = new RandomSeed();
         this.m_stBossBloodDataEvent = new a_1778("AurBossBloodProgress");
         this.m_iSkillNum = new EncrypIntEx();
         this.m_vSkillID = new Vector.<int>();
         this.m_vSkillFunction = new Vector.<Function>();
         this.m_vStateCache = new Vector.<Array>();
         this.InitBossStateFrameID();
         this.InitSkillFunction();
         this.m_iSkillNum.Value = this.m_vSkillFunction.length;
         a_1279 = -0.5 * this.width;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         stop();
         this.m_bSkillIsOrder = false;
         a_1463 = true;
         this.visible = false;
         this.m_bIsNoChangeCannotSee = false;
         this.iVerticalDirect = 1;
         this.iHorizontalDirect = 1;
         this.InitMoveSpeed();
         this.m_iLastCalTime = -1;
         return true;
      }
      
      protected function InitMoveSpeed() : void
      {
         a_1350 = this.m_fOrginSpeed;
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      protected function IsCalTick(iCurrentTime:int) : Boolean
      {
         return 0 == (iCurrentTime & 1) && this.m_iLastCalTime != iCurrentTime;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!this.IsCalTick(iCurrentTime))
         {
            return false;
         }
         this.m_iLastCalTime = iCurrentTime;
         ++this.m_iLaunchRunTick;
         if(!a_1460)
         {
            this.InitState();
            a_1460 = true;
         }
         if(this.m_iBossState != STATE_DEAD && a_1339 <= 0)
         {
            this.LifeIsZeroHandle(STATE_DEAD);
            return false;
         }
         if(this.m_iBossState == STATE_DEAD)
         {
            nextFrame();
            return false;
         }
         if(this.m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               this.MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(a_1278 != null)
            {
               this.GotoAndStopFrame(a_1275);
            }
            --this.m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      protected function IsMoving() : Boolean
      {
         return this.m_iBossState == STATE_MOVE;
      }
      
      protected function SwitchState(iCurrentTime:int) : Boolean
      {
         throw Error("BaseBossMoveIntruder::SwitchState 需要重载！！！");
      }
      
      public function get IsInjured() : int
      {
         var iIsInjured:int = 0;
         if(a_1339 < this.m_iInjuredLife * this.numHardRate)
         {
            iIsInjured = 1;
         }
         return iIsInjured;
      }
      
      protected function getBossFrameStateKey() : String
      {
         return this.m_iBossState + "_" + this.IsInjured;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(STATE_DEAD == this.m_iBossState || STATE_NONE == this.m_iBossState)
         {
            return false;
         }
         var strKey:String = this.getBossFrameStateKey();
         var iNextFrameID:int = int(this.m_dictBossStateFrameID[strKey]);
         if(null == this.m_dictBossStateFrameID[strKey] || 0 >= iNextFrameID)
         {
            throw Error("BaseBossMoveIntruder::ResetMovieStatus->Error strKey = " + strKey);
         }
         this.GotoAndStopFrame(iNextFrameID - 1,false);
         return true;
      }
      
      protected function InitSkillFunction() : void
      {
         throw Error("BaseBossMoveIntruder::InitSkillFunction 需要重载！！！");
      }
      
      protected function InitBossStateFrameID() : void
      {
         throw Error("BaseBossMoveIntruder::InitBossStateFrameID 需要重载！！！");
      }
      
      protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         throw Error("BaseBossMoveIntruder::CheckIsCanLaunchSkill 需要重载！！！");
      }
      
      protected function IsSkillState() : Boolean
      {
         throw Error("BaseBossMoveIntruder::IsSkillState 需要重载！！！");
      }
      
      protected function IsInBattle() : Boolean
      {
         var iXGridNo:int = this.getXGridNoByPosX();
         var iYGridNo:int = this.getYGridNoByPosY();
         return iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && iYGridNo >= 0 && iYGridNo < BattleFieldView.a_1012;
      }
      
      protected function IsCanLaunchShot(iCurrentTime:int) : Boolean
      {
         if(!this.IsSkillState() || !this.IsInBattle())
         {
            return false;
         }
         var bIsCanLaunch:Boolean = false;
         if(this.m_iLaunchNum > 0)
         {
            if(-1 == this.m_iLastLaunchShotTick)
            {
               bIsCanLaunch = Boolean(this.m_iLaunchRunTick == this.m_iLaunchDelayTick);
            }
            else
            {
               bIsCanLaunch = Boolean(this.m_iLaunchRunTick == this.m_iLastLaunchShotTick + this.m_iLaunchIntervalTick);
            }
            if(bIsCanLaunch)
            {
               --this.m_iLaunchNum;
               this.m_iLastLaunchShotTick = this.m_iLaunchRunTick;
            }
         }
         return bIsCanLaunch;
      }
      
      protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         var fPosX:Number = a_3491.a_1080 * iXGridNo;
         return fPosX + a_3491.a_1080 * 0.5;
      }
      
      protected function getXGridNoByPosX(fPosX:Number = -0.1234) : int
      {
         if(-0.1234 == fPosX)
         {
            fPosX = this.x;
         }
         fPosX += 10000 * a_3491.a_1080;
         var iXGridNo:int = fPosX / a_3491.a_1080;
         return iXGridNo - 10000;
      }
      
      protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         var fPosY:Number = a_3491.a_1081 * iYGridNo + (a_3491.a_1081 - this.height) + this.iYPosSkewing;
         return fPosY + a_3491.a_1081 * 0.5;
      }
      
      protected function getYGridNoByPosY(fPosY:Number = -0.1234) : int
      {
         if(-0.1234 == fPosY)
         {
            fPosY = this.y;
         }
         fPosY += 10000 * a_3491.a_1081;
         var iYGridNo:int = int(fPosY - this.iYPosSkewing - (a_3491.a_1081 - this.height)) / a_3491.a_1081;
         return iYGridNo - 10000;
      }
      
      override public function get iYPosSkewing() : int
      {
         var fPosY:Number = NaN;
         if(this.iVerticalDirect < 0)
         {
            fPosY = 2 * this.height - a_1467 - 2 * a_3491.a_1081;
         }
         else
         {
            fPosY = a_1467;
         }
         return Math.floor(fPosY);
      }
      
      protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         var iSkillNum:int = 0;
         var i:int = 0;
         this.iHorizontalDirect = 1;
         this.iVerticalDirect = 1;
         if(0 == this.m_vSkillID.length)
         {
            iSkillNum = this.m_iSkillNum.Value;
            for(i = 0; i < iSkillNum; i++)
            {
               this.m_vSkillID.push(i);
            }
            if(this.m_vSkillFunction.length < iSkillNum)
            {
               trace("+++++++++++m_vSkillFunction not init!!!");
            }
         }
         if(this.m_bSkillIsOrder)
         {
            iPos = 0;
         }
         else
         {
            iPos = int(this.m_stRandomSeed.nextInt(this.m_vSkillID.length));
         }
         var iSkillID:int = this.m_vSkillID[iPos];
         this.m_vSkillID.splice(iPos,1);
         this.m_vSkillFunction[iSkillID]();
      }
      
      protected function InitSkillCache() : void
      {
         this.m_vStateCache.length = 0;
         this.m_vStateCache.push([STATE_APPEAR,this.pressData(BattleFieldView.a_1011 - 1,this.m_iStartShowGridNo,8)]);
         this.HavingRestForAwhile(10);
      }
      
      protected function InitState() : void
      {
         this.setLifeValue();
         this.SetIsCannotSee(true);
         stop();
         this.m_vSkillID.length = 0;
         a_1465 = 0;
         this.m_iRestTick = 0;
         this.m_iBossState = STATE_NONE;
         this.SetRandomSeed();
         this.InitSkillCache();
         this.InitShadow();
      }
      
      protected function SetRandomSeed() : void
      {
         this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
      }
      
      protected function AddBaseEffectToGrid(stTargetFieldGrid:a_3491, stBaseEffect:a_4108, iLayerType:int = 20) : void
      {
         stBaseEffect.a_1797(a_1283);
         stBaseEffect.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stBaseEffect.width);
         stBaseEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stBaseEffect.height);
         stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseEffect,iLayerType,stTargetFieldGrid);
         stBaseEffect.play();
      }
      
      protected function AddWarningSignEffectToGrid(stTargetFieldGrid:a_3491, iContinueTick:int = -1, iDelay:int = 100) : void
      {
         var stWarningSign:WarningSign = null;
         stWarningSign = WarningSign.a_3926();
         stWarningSign.a_1797(a_1283,iContinueTick,iDelay);
         stWarningSign.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stWarningSign.width);
         stWarningSign.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stWarningSign.height);
         stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stWarningSign,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTargetFieldGrid);
         stWarningSign.play();
      }
      
      protected function AddOutMoveIntruder(stBaseMoveIntruder:a_4206, stStartFieldGrid:a_3491, iIntruderMoveDirection:int = -1, fOffsetX:Number = 0.25, bIsNeedInitialize:Boolean = false) : Boolean
      {
         if(null == stStartFieldGrid || null == stBaseMoveIntruder)
         {
            return false;
         }
         stBaseMoveIntruder.x = (stStartFieldGrid.m_iXGridNo + 0.5 + iIntruderMoveDirection * fOffsetX) * a_3491.a_1080;
         stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
         stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,bIsNeedInitialize);
         return true;
      }
      
      protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(bIsSetVisible)
         {
            this.visible = !bIsCannotSee;
         }
         if(this.m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      protected function ChangeState(iState:uint, iContinueTick:int, iCurrentTime:int) : void
      {
         this.m_iRestTick = iContinueTick;
         this.m_iLastLaunchShotTick = -1;
         this.m_iLaunchRunTick = 0;
         if(this.m_iBossState != iState)
         {
            this.m_iBossState = iState;
            this.ResetMovieStatus();
         }
      }
      
      protected function setLifeValue() : void
      {
         var iMapID:int = 0;
         if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
         {
            iMapID = int((root as Object).m_stGameData["iMapID"]);
            if((iMapID & 0xF0000000) != 1610612736)
            {
               a_1339 = this.m_iMaxLife.Value;
            }
         }
         this.numHardRate = 1;
      }
      
      protected function HavingRestForAwhile(iTickNum:int) : void
      {
         this.m_vStateCache.push([STATE_WAITING,iTickNum]);
      }
      
      protected function IsCanReduceLife() : Boolean
      {
         return STATE_HIDE != this.m_iBossState && a_1339 > 0;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if((this.IsCanReduceLife() || _damageParam.indexOf(50001) != -1 && a_1339 > 0) && iRduceLifeValue != 0 && a_1460)
         {
            super.a_3969(iRduceLifeValue);
            this.UpdateBossBloodProgress();
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.IsCanReduceLife() && iRduceLifeValue != 0 && a_1460)
         {
            super.a_4209(iRduceLifeValue);
            this.UpdateBossBloodProgress();
         }
         return true;
      }
      
      protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         if(!bIsNeed && a_1275 == iFrame)
         {
            return;
         }
         a_1275 = iFrame;
         this.m_iFrameLabelStartIndex = (a_1276[iFrame] as FrameLabel).frame;
         gotoAndStop(this.m_iFrameLabelStartIndex);
         a_3419();
      }
      
      protected function HiddenMySelf(iXGridNo:int, iYGridNo:int) : void
      {
         this.m_vStateCache.push([STATE_APPEAR,this.pressData(iXGridNo,iYGridNo,8)]);
         this.m_vStateCache.push([STATE_HIDE,2]);
      }
      
      protected function GetRandGridArray(iGridStartX:int, iGridEndX:int, iGridStartY:int, iGridEndY:int, iTotalNum:int, bAvatarIsCan:Boolean = false) : Vector.<a_3491>
      {
         var stFieldGrid:a_3491 = null;
         var bIsEffective:Boolean = false;
         var i:int = 0;
         var vRandGrid:Vector.<a_3491> = new Vector.<a_3491>();
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         while(iLoopCnt < 150 && iCnt < iTotalNum)
         {
            stFieldGrid = this.GetRandSingleGrid(iGridStartX,iGridEndX,iGridStartY,iGridEndY,bAvatarIsCan);
            if(null != stFieldGrid)
            {
               bIsEffective = true;
               i = 0;
               while(bIsEffective && i < vRandGrid.length)
               {
                  if(stFieldGrid.m_iXGridNo == vRandGrid[i].m_iXGridNo && stFieldGrid.m_iYGridNo == vRandGrid[i].m_iYGridNo)
                  {
                     bIsEffective = false;
                     break;
                  }
                  i++;
               }
               if(bIsEffective)
               {
                  iCnt++;
                  vRandGrid.push(stFieldGrid);
               }
            }
            iLoopCnt++;
         }
         return vRandGrid;
      }
      
      protected function GetRandSingleGrid(iGridStartX:int, iGridEndX:int, iGridStartY:int, iGridEndY:int, bAvatarIsCan:Boolean = false, iFieldGridType:int = 0) : a_3491
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iGridXLen:int = iGridEndX - iGridStartX + 1;
         var iGridYLen:int = iGridEndY - iGridStartY + 1;
         for(var iLoopCnt:int = 0; iLoopCnt < 50; iLoopCnt++)
         {
            iXGridNo = iGridStartX + this.m_stRandomSeed.nextInt(iGridXLen);
            iYGridNo = iGridStartY + this.m_stRandomSeed.nextInt(iGridYLen);
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stFieldGrid && (-1 == iFieldGridType || iFieldGridType == stFieldGrid.m_iFieldGridType) && (bAvatarIsCan || !(stFieldGrid.m_stAttackFighter is a_3924)))
            {
               return stFieldGrid;
            }
         }
         return null;
      }
      
      protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = this.getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = this.getPosYByYGridNo(iYGridNo) + iYOffset;
         this.SetIsCannotSee(!this.ChangeToFieldGrid(stNextFieldGrid));
         this.visible = true;
      }
      
      protected function setMoveToPosition(fPosX:Number, fPosY:Number, fMoveSpeed:Number = -0.1234) : int
      {
         if(-0.1234 == fMoveSpeed)
         {
            fMoveSpeed = Math.abs(a_1350);
         }
         var fDistanceX:Number = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var fDistance:Number = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
         var iMoveTick:int = fDistance / Math.abs(fMoveSpeed);
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         return iMoveTick;
      }
      
      protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         this.SetShadowPos();
         return true;
      }
      
      protected function MoveMySelf() : void
      {
         if(this.m_bIsNeedHighPrecision)
         {
            this.x = Math.round(10000 * this.x + 10000 * this.m_fMoveSpeedX) * 0.0001;
            this.y = Math.round(10000 * this.y + 10000 * this.m_fMoveSpeedY) * 0.0001;
         }
         else
         {
            this.x += this.m_fMoveSpeedX;
            this.y += this.m_fMoveSpeedY;
         }
         var iXGridNo:int = this.getXGridNoByPosX();
         var iYGridNo:int = this.getYGridNoByPosY();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = this.ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(!bIsCanChangeToFieldGrid,false);
      }
      
      protected function ClearState() : void
      {
         this.m_bIsNoChangeCannotSee = false;
         this.SetIsCannotSee(false);
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.m_fMoveSpeedX = this.m_fMoveSpeedY = 0;
      }
      
      protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         this.ClearState();
         this.m_iBossState = iDeadState;
         this.GotoAndStopFrame(this.m_dictBossStateFrameID[STATE_DEAD] - 1);
         play();
      }
      
      protected function UpdateBossBloodProgress() : void
      {
         if(Boolean(root) && a_1460)
         {
            this.m_stBossBloodDataEvent.dataObject = a_1339 / (this.numHardRate * 15000);
            root.dispatchEvent(this.m_stBossBloodDataEvent);
         }
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function ShowBoomDieEffect() : void
      {
         trace("Boss无法变成灰烬");
      }
      
      override public function CharmSkill(Charmlevel:int = 1) : Boolean
      {
         return true;
      }
      
      override public function ApplyCharmConfig(cfg:CharmBoomConfig) : Boolean
      {
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         this.a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function pressData(iXGridNo:int, iYGridNo:int, bit:int = 8) : int
      {
         return iXGridNo << bit | iYGridNo;
      }
      
      protected function a_4265() : int
      {
         return this.pressData(globalMoveFighterID,++this.m_iSummonUpSequence,16);
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_numHardRate;
      }
      
      override public function set numHardRate(value:Number) : void
      {
         this.m_numHardRate = value;
      }
      
      protected function get iVerticalDirect() : int
      {
         return this.m_iVerticalDirect;
      }
      
      protected function set iVerticalDirect(iValue:int) : void
      {
         this.m_iVerticalDirect = iValue;
         this.scaleY = this.m_iVerticalDirect;
      }
      
      protected function get iHorizontalDirect() : int
      {
         return this.m_iHorizontalDirect;
      }
      
      protected function set iHorizontalDirect(iValue:int) : void
      {
         this.m_iHorizontalDirect = iValue;
         this.scaleX = this.m_iHorizontalDirect;
      }
      
      protected function get IsNeedShadow() : Boolean
      {
         return this.m_bIsNeedShadow;
      }
      
      protected function get IsHasShadow() : Boolean
      {
         return this.m_bIsNeedShadow && null != this.a_1100;
      }
      
      protected function set IsNeedShadow(bIsNeedShadow:Boolean) : void
      {
         this.m_bIsNeedShadow = bIsNeedShadow;
      }
      
      protected function InitShadow() : void
      {
         if(!this.IsNeedShadow)
         {
            return;
         }
         this.a_1100 = new Bitmap();
         this.a_1100.bitmapData = AurShadow.a_4106();
         this.a_1100.width = a_3491.a_1080 * 1.2;
         this.a_1100.height = a_3491.a_1081 * 0.6;
         this.a_1100.alpha = 0.8;
         this.a_1100.cacheAsBitmap = true;
         this.SetShadowPos();
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.a_1100,BattleLayerDefine.EFFECTS_BASE_TYPE);
         this.a_1100.visible = visible;
      }
      
      override public function set visible(bIsVisible:Boolean) : void
      {
         super.visible = bIsVisible;
         this.UpdateShadowVisible();
      }
      
      private function UpdateShadowVisible() : void
      {
         if(this.IsHasShadow && this.a_1100.visible != this.visible)
         {
            this.a_1100.visible = this.visible && !a_1462 && this.IsInBattle();
         }
      }
      
      private function SetShadowPos() : void
      {
         if(!this.IsHasShadow)
         {
            return;
         }
         this.a_1100.x = 0.5 * (a_3491.a_1080 - this.a_1100.width) + m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080;
         this.a_1100.y = a_3491.a_1081 - this.a_1100.height + m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081;
         this.UpdateShadowVisible();
      }
      
      private function UpdateShadowPos(fOffsetX:Number, fOffsetY:Number) : void
      {
         if(!this.IsHasShadow)
         {
            return;
         }
         this.a_1100.x += fOffsetX;
         this.a_1100.y += fOffsetY;
         this.UpdateShadowVisible();
      }
      
      private function RealeaseShadow() : void
      {
         if(null != this.a_1100)
         {
            if(null != this.a_1100.parent)
            {
               this.a_1100.parent.removeChild(this.a_1100);
            }
            this.a_1100 = null;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         this.RealeaseShadow();
         return super.a_3940();
      }
      
      public function get IsBoss() : Boolean
      {
         return true;
      }
      
      override public function get IsBossIntruder() : Boolean
      {
         return true;
      }
   }
}

