package com.aurora.ui.maogoutd.resource.Intruder.newBoss.Xiaoming
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.FrozenEffect;
   import com.aurora.ui.maogoutd.resource.effect.StompEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.mouseXiaoming.MouseXiaomingShot;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class HandsomeXiaomingBossMoveIntruder extends a_4206 implements IBossMoveIntruder
   {
      
      private static const POSITION_SKILL_POSE_1:Array = [[BattleFieldView.a_1012 - 2,BattleFieldView.a_1011 - 3],[1,1]];
      
      private static const POSITION_SKILL_POSE_2:Array = [[1,BattleFieldView.a_1011 - 3],[BattleFieldView.a_1012 - 2,1]];
      
      private static const POSITION_SKILL_CYCLONE_1:Array = [[BattleFieldView.a_1012 - 2,BattleFieldView.a_1011 - 2],[BattleFieldView.a_1012 - 3,BattleFieldView.a_1011 - 5],[2,BattleFieldView.a_1011 - 4],[0,1]];
      
      private static const POSITION_SKILL_CYCLONE_2:Array = [[1,BattleFieldView.a_1011 - 2],[2,BattleFieldView.a_1011 - 4],[BattleFieldView.a_1012 - 3,BattleFieldView.a_1011 - 5],[BattleFieldView.a_1012 - 2,1]];
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      private var m_iChangeFireWizardLableIndex:int = 0;
      
      private var m_iAttackTimes:int = 0;
      
      private var m_iAddNum:int;
      
      protected var a_1309:int = 6;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 1000;
      
      protected var a_1312:int = 2;
      
      protected var a_1321:int = 0;
      
      private var m_iLastBossStatus:int;
      
      private var m_pStart:Point;
      
      private var m_pEnd:Point;
      
      private var m_iLength:int;
      
      protected var m_iBossStatus:int = 0;
      
      protected var m_iPeriodTime:int = 0;
      
      private var m_iStepTime:int = 0;
      
      private var m_iAddSpeed:int;
      
      private var m_iCurrentTime:int;
      
      protected var a_1598:a_3491;
      
      private var m_stTmpFieldGrid:a_3491;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_arrSkill_Pose:Array;
      
      private var m_arrSkill_Cyclone:Array;
      
      protected var m_numHardRate:Number = 1;
      
      private var m_iNumShotYPos:int;
      
      public function HandsomeXiaomingBossMoveIntruder()
      {
         a_1481 = false;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HandsomeXiaomingBossMoveIntruder) as HandsomeXiaomingBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HandsomeXiaomingBossMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         a_1467 = -135;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 5;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1462 = false;
         a_1463 = true;
         this.m_iChangeFireWizardLableIndex = 0;
         this.m_iAttackTimes = 0;
         this.m_iBossStatus = 0;
         this.m_iPeriodTime = 7;
         a_1339 = 15000;
         this.m_numHardRate = 1;
         a_1279 = -width * 0.5 + 100;
         a_1465 = 3;
         this.a_1321 = 0;
         a_1481 = false;
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_numHardRate;
      }
      
      override public function set numHardRate(value:Number) : void
      {
         this.m_numHardRate = value;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0)
            {
               if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 10)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 10;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  play();
               }
            }
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 != this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0 && a_1275 != this.m_iChangeFireWizardLableIndex + 10)
            {
               a_1275 = this.m_iChangeFireWizardLableIndex + 10;
               gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 10] as FrameLabel).frame);
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               play();
            }
         }
         a_3419();
         var stDataEvent:a_1778 = new a_1778("AurBossBloodProgress");
         stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         var stDataEvent:a_1778 = new a_1778("AurBossBloodProgress");
         stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iStepX:int = 0;
         var iStepY:int = 0;
         var stStompEffect:StompEffect = null;
         var stFrozenEffect:FrozenEffect = null;
         var stTempFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var stTargetFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         this.m_iCurrentTime = iCurrentTime;
         if(0 == iCurrentTime % 2)
         {
            return false;
         }
         if(!a_1460)
         {
            this.m_iAttackTimes = 0;
            this.m_iBossStatus = 0;
            this.m_iPeriodTime = 7;
            a_1465 = 0;
            a_1275 = this.m_iChangeFireWizardLableIndex + 1;
            gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         if(0 == this.m_iBossStatus)
         {
            if(7 == this.m_iPeriodTime)
            {
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.GetRandom(BattleFieldView.a_1012 - 1)][BattleFieldView.a_1011 - 1];
               x = a_3491.a_1080 * this.a_1598.m_iXGridNo + a_1279;
               y = a_3491.a_1081 * this.a_1598.m_iYGridNo + a_1467;
               ChangeFieldGrid(this.a_1598);
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 1)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 2)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                  }
               }
               this.m_iBossStatus = 4;
               this.m_iPeriodTime = 63;
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(4 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               switch(this.GetRandom(2))
               {
                  case 0:
                     this.m_iBossStatus = 12;
                     this.m_iNumShotYPos = this.GetRandom(1);
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_iNumShotYPos][BattleFieldView.a_1011 - 1];
                     break;
                  case 1:
                     this.m_iBossStatus = 13;
                     if(this.GetRandom(1))
                     {
                        this.m_arrSkill_Pose = POSITION_SKILL_POSE_1.slice();
                     }
                     else
                     {
                        this.m_arrSkill_Pose = POSITION_SKILL_POSE_2.slice();
                     }
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Pose[0][0]][this.m_arrSkill_Pose[0][1]];
                     break;
                  case 2:
                     if(this.GetRandom(1))
                     {
                        this.m_arrSkill_Cyclone = POSITION_SKILL_CYCLONE_1.slice();
                     }
                     else
                     {
                        this.m_arrSkill_Cyclone = POSITION_SKILL_CYCLONE_2.slice();
                     }
                     this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[0][0]][this.m_arrSkill_Cyclone[0][1]];
                     this.m_iBossStatus = 15;
                     break;
                  default:
                     throw new Error("error!");
               }
               this.m_iPeriodTime = 7;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               x = a_3491.a_1080 * this.a_1598.m_iXGridNo + a_1279;
               y = a_3491.a_1081 * this.a_1598.m_iYGridNo + a_1467;
               ChangeFieldGrid(this.a_1598);
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(12 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 11;
               this.m_iPeriodTime = 28;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                  }
               }
            }
         }
         if(11 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 1;
               this.m_iPeriodTime = 23 * 3;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 3)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 3;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 3] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 4)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 4;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 4] as FrameLabel).frame);
                  }
               }
            }
         }
         if(1 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               numShotXpos = BattleFieldView.a_1011;
               if(55 == this.m_iPeriodTime)
               {
                  stLastWaitShot = MouseXiaomingShot.a_4344();
                  if(!stLastWaitShot)
                  {
                     return false;
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid;
                  stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,a_3491.a_1080 * (numShotXpos - 2),a_3491.a_1081 * (this.m_iNumShotYPos + 0.7),stTargetFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               if(23 * 2 == this.m_iPeriodTime)
               {
                  this.m_iNumShotYPos = 2 + this.m_iNumShotYPos;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_iNumShotYPos][BattleFieldView.a_1011 - 1];
                  x = a_3491.a_1080 * (stTargetFieldGrid.m_iXGridNo + 1) + a_1279;
                  y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + a_1467;
                  ChangeFieldGrid(stTargetFieldGrid);
               }
               if(32 == this.m_iPeriodTime)
               {
                  stLastWaitShot = MouseXiaomingShot.a_4344();
                  if(!stLastWaitShot)
                  {
                     return false;
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_iNumShotYPos][BattleFieldView.a_1011 - 1];
                  stLastWaitShot.a_1797(1,this.a_1312,this.a_1311,a_3491.a_1080 * (numShotXpos - 2),a_3491.a_1081 * (this.m_iNumShotYPos + 0.7),stTargetFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
               if(23 == this.m_iPeriodTime)
               {
                  this.m_iNumShotYPos = 2 + this.m_iNumShotYPos;
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_iNumShotYPos][BattleFieldView.a_1011 - 1];
                  x = a_3491.a_1080 * (stTargetFieldGrid.m_iXGridNo + 1) + a_1279;
                  y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + a_1467;
                  ChangeFieldGrid(stTargetFieldGrid);
               }
               if(9 == this.m_iPeriodTime)
               {
                  stLastWaitShot = MouseXiaomingShot.a_4344();
                  if(!stLastWaitShot)
                  {
                     return false;
                  }
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_iNumShotYPos][BattleFieldView.a_1011 - 1];
                  stLastWaitShot.a_1797(2,this.a_1312,this.a_1311,a_3491.a_1080 * (numShotXpos - 2),a_3491.a_1081 * (this.m_iNumShotYPos + 0.7),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 7;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(13 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 2;
               this.m_iPeriodTime = 28;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                  }
               }
            }
         }
         if(2 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 5;
               this.m_iPeriodTime = 21;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 8)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
                  }
               }
            }
            trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
         }
         if(5 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(10 == this.m_iPeriodTime)
               {
                  stStompEffect = StompEffect.a_3926();
                  stStompEffect.a_1797(false);
                  stStompEffect.x = this.m_arrSkill_Pose[0][1] * a_3491.a_1080 - 29;
                  stStompEffect.y = this.m_arrSkill_Pose[0][0] * a_3491.a_1081 - 49;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stStompEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
                  for(iStepX = this.m_arrSkill_Pose[0][1] - 1; iStepX <= this.m_arrSkill_Pose[0][1] + 1; iStepX++)
                  {
                     for(iStepY = this.m_arrSkill_Pose[0][0] - 1; iStepY <= this.m_arrSkill_Pose[0][0] + 1; iStepY++)
                     {
                        stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iStepY][iStepX];
                        if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
                        {
                           stTempFieldGrid.m_stAttackFighter.a_3958(105);
                           stFrozenEffect = FrozenEffect.a_3926();
                           stFrozenEffect.a_1797(false);
                           stFrozenEffect.x = iStepX * a_3491.a_1080;
                           stFrozenEffect.y = iStepY * a_3491.a_1080 + 40;
                           m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFrozenEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
                           if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
                           {
                              m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stFrozenEffect,iStepX,iStepY);
                           }
                        }
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 14;
               this.m_iPeriodTime = 7;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Pose[1][0]][this.m_arrSkill_Pose[1][1]];
               x = a_3491.a_1080 * this.a_1598.m_iXGridNo + a_1279;
               y = a_3491.a_1081 * this.a_1598.m_iYGridNo + a_1467;
               ChangeFieldGrid(this.a_1598);
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(14 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 6;
               this.m_iPeriodTime = 28;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                  }
               }
            }
         }
         if(6 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 7;
               this.m_iPeriodTime = 21;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 7)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 7;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 7] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 8)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 8;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 8] as FrameLabel).frame);
                  }
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(7 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               if(10 == this.m_iPeriodTime)
               {
                  stStompEffect = StompEffect.a_3926();
                  stStompEffect.a_1797(false);
                  stStompEffect.x = this.m_arrSkill_Pose[1][1] * a_3491.a_1080 - 29;
                  stStompEffect.y = this.m_arrSkill_Pose[1][0] * a_3491.a_1081 - 49;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stStompEffect,BattleLayerDefine.EFFECTS_BASE_TYPE);
                  for(iStepX = this.m_arrSkill_Pose[1][1] - 1; iStepX <= this.m_arrSkill_Pose[1][1] + 1; iStepX++)
                  {
                     for(iStepY = this.m_arrSkill_Pose[1][0] - 1; iStepY <= this.m_arrSkill_Pose[1][0] + 1; iStepY++)
                     {
                        stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iStepY][iStepX];
                        if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
                        {
                           stTempFieldGrid.m_stAttackFighter.a_3958(105);
                           stFrozenEffect = FrozenEffect.a_3926();
                           stFrozenEffect.a_1797(false);
                           stFrozenEffect.x = iStepX * a_3491.a_1080;
                           stFrozenEffect.y = iStepY * a_3491.a_1080 + 40;
                           m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFrozenEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
                           if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
                           {
                              m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stFrozenEffect,iStepX,iStepY);
                           }
                        }
                     }
                  }
               }
            }
            if(0 == this.m_iPeriodTime)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 7;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(15 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 3;
               this.m_iPeriodTime = 28;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 5)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 5;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 5] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 6)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 6;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 6] as FrameLabel).frame);
                  }
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(3 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 10;
               this.m_iPeriodTime = 30;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(10 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 8;
               this.m_iPeriodTime = 70;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 9)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 9;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 9] as FrameLabel).frame);
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(8 == this.m_iBossStatus)
         {
            if(70 == this.m_iPeriodTime)
            {
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[0][0]][this.m_arrSkill_Cyclone[0][1]];
               this.m_pStart = new Point(this.a_1598.m_iXGridNo * a_3491.a_1080,this.a_1598.m_iYGridNo * a_3491.a_1081);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[1][0]][this.m_arrSkill_Cyclone[1][1]];
               this.m_pEnd = new Point(this.a_1598.m_iXGridNo * a_3491.a_1080,this.a_1598.m_iYGridNo * a_3491.a_1081);
               this.m_iLength = 20;
               this.m_iStepTime = this.m_iLength;
            }
            else if(50 == this.m_iPeriodTime)
            {
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[1][0]][this.m_arrSkill_Cyclone[1][1]];
               this.m_pStart = new Point(this.a_1598.m_iXGridNo * a_3491.a_1080,this.a_1598.m_iYGridNo * a_3491.a_1081);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[2][0]][this.m_arrSkill_Cyclone[2][1]];
               this.m_pEnd = new Point(this.a_1598.m_iXGridNo * a_3491.a_1080,this.a_1598.m_iYGridNo * a_3491.a_1081);
               this.m_iLength = 30;
               this.m_iStepTime = this.m_iLength;
            }
            else if(20 == this.m_iPeriodTime)
            {
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[2][0]][this.m_arrSkill_Cyclone[2][1]];
               this.m_pStart = new Point(this.a_1598.m_iXGridNo * a_3491.a_1080,this.a_1598.m_iYGridNo * a_3491.a_1081);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[this.m_arrSkill_Cyclone[3][0]][this.m_arrSkill_Cyclone[3][1]];
               this.m_pEnd = new Point(this.a_1598.m_iXGridNo * a_3491.a_1080,this.a_1598.m_iYGridNo * a_3491.a_1081);
               this.m_iLength = 20;
               this.m_iStepTime = this.m_iLength;
            }
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
               --this.m_iStepTime;
               iStepX = int((this.m_iLength - this.m_iStepTime) / this.m_iLength * (this.m_pEnd.x - this.m_pStart.x));
               iStepY = int((this.m_iLength - this.m_iStepTime) / this.m_iLength * (this.m_pEnd.y - this.m_pStart.y));
               if(this.m_iPeriodTime > this.m_iLength / 2)
               {
                  iStepX += (this.m_pEnd.x - this.m_pStart.x) / this.m_iLength;
               }
               else
               {
                  iStepX -= (this.m_pEnd.x - this.m_pStart.x) / this.m_iLength;
               }
               x = this.m_pStart.x + iStepX;
               y = this.m_pStart.y + iStepY + a_1467;
               iXGridNo = int(x / a_3491.a_1080);
               iYGridNo = int((y - a_1467 + a_3491.a_1081 / 2) / a_3491.a_1081);
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iYGridNo][iXGridNo];
               ChangeFieldGrid(this.a_1598);
               this.a_3502(this.a_1598);
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 9;
               this.m_iPeriodTime = 20;
               if(a_1339 > this.m_numHardRate * 5000)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 1)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 1;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 1] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(a_1275 != this.m_iChangeFireWizardLableIndex + 2)
                  {
                     a_1275 = this.m_iChangeFireWizardLableIndex + 2;
                     gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 2] as FrameLabel).frame);
                  }
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         if(9 == this.m_iBossStatus)
         {
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
            if(this.m_iPeriodTime == 0)
            {
               this.m_iBossStatus = 0;
               this.m_iPeriodTime = 7;
               if(a_1275 != this.m_iChangeFireWizardLableIndex + 0)
               {
                  a_1275 = this.m_iChangeFireWizardLableIndex + 0;
                  gotoAndStop((a_1276[this.m_iChangeFireWizardLableIndex + 0] as FrameLabel).frame);
               }
               trace("******************************************m_iBossStatus=" + this.m_iBossStatus + "*****************************************");
            }
         }
         return true;
      }
      
      private function GetRandom(iSeed:int) : int
      {
         trace("m_iCurrentTime%(iSeed + 1):",int(this.m_iCurrentTime / 10) % (iSeed + 1));
         return int(this.m_iCurrentTime / 10) % (iSeed + 1);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
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
         return true;
      }
      
      protected function a_3503(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            stFieldGrid.a_3503();
         }
         return true;
      }
   }
}

