package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerBoss.ShaManWizard
{
   import com.aurora.protocol.game.maogoutd.CVanishEnemy;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   
   public class ShaManWizardIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 10;
      
      private static const STATE_SKILL_One:uint = 6;
      
      private static const STATE_SKILL_Two:uint = 7;
      
      private static const STATE_SKILL_Three:uint = 8;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 9;
      
      private static const STATE_CHG_TOWARD:uint = 10;
      
      private static const STATE_SKILL_BORN:uint = 11;
      
      private static const STATE_FLASH_IN:uint = 12;
      
      private static const STATE_FLASH_OUT:uint = 13;
      
      private static const STATE_SKILL_Two2:uint = 20;
      
      private static const STATE_DEAD2:uint = 21;
      
      private static const STATE_SKILL_Two3:uint = 22;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_OutArray:Array = new Array([8,0],[8,1],[8,5],[8,6]);
      
      private var m_OutArray2:Array = new Array([6,1],[2,3],[6,5]);
      
      private var m_bWuDi:Boolean = true;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function ShaManWizardIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 10;
         a_1467 = 5;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ShaManWizardIntruderBoss) as ShaManWizardIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShaManWizardIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bCanBeAttack = true;
         a_1339 = 50000;
         return b;
      }
      
      override public function get width() : Number
      {
         return 100;
      }
      
      override public function get height() : Number
      {
         return 165;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_Two2 + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_Two3 + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD2 + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 6 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 6 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 6 + 2;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = 6 + 3;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 6 + 4;
         m_dictBossStateFrameID[STATE_SKILL_One + "_" + 1] = 6 + 5;
         m_dictBossStateFrameID[STATE_SKILL_Two + "_" + 1] = 6 + 6;
         m_dictBossStateFrameID[STATE_SKILL_Two2 + "_" + 1] = 6 + 6;
         m_dictBossStateFrameID[STATE_SKILL_Two3 + "_" + 1] = 6 + 6;
         m_dictBossStateFrameID[STATE_SKILL_Three + "_" + 1] = 6 + 7;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_DEAD2 + "_" + 1] = 14;
      }
      
      override protected function InitSkillCache() : void
      {
         this.m_bWuDi = true;
         this.m_bHasHandleDie = false;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_BORN,6,3,0]);
         m_vStateCache.push([STATE_SKILL_Two2,24]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function HandleDie() : void
      {
         var stEnemyVanish:CVanishEnemy = null;
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         if(m_stCurrentFieldGrid)
         {
            stEnemyVanish = new CVanishEnemy();
            stEnemyVanish.m_iEnemyID = a_1459;
            stEnemyVanish.m_iEnemyTypeID = m_stMoveIntruderTypeID - 8388608;
            stEnemyVanish.m_byYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            stEnemyVanish.m_byXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            a_1088.a_2061(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_byTeamNo,[stEnemyVanish]);
         }
         m_bPostEnemy = false;
         m_vStateCache.push([STATE_FLASH_IN]);
         var idx:int = int(m_stRandomSeed.nextInt(this.m_OutArray2.length));
         m_vStateCache.push([STATE_APPEAR,4,3]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_SKILL_Two3,24]);
         m_vStateCache.push([STATE_DEAD2,19]);
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      private function SkillOne() : void
      {
         this.m_bWuDi = false;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_FLASH_IN]);
         var idx:int = int(m_stRandomSeed.nextInt(this.m_OutArray.length));
         m_vStateCache.push([STATE_APPEAR,this.m_OutArray[idx][0],this.m_OutArray[idx][1],3]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_SKILL_One,23]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_FLASH_IN]);
         var idx:int = int(m_stRandomSeed.nextInt(this.m_OutArray2.length));
         m_vStateCache.push([STATE_APPEAR,this.m_OutArray2[idx][0],this.m_OutArray2[idx][1]]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_SKILL_Two,24]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_FLASH_IN]);
         m_vStateCache.push([STATE_APPEAR,8,m_stRandomSeed.nextInt(5) + 1]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_SKILL_Three,20]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               a_3940();
               return false;
            }
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         var xx:Array = a_1277;
         switch(iNextState)
         {
            case STATE_APPEAR:
               this.visible = false;
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               if(m_vStateCache[0][3] != 3)
               {
                  a_1283 = !a_1283;
               }
               break;
            case STATE_SKILL_BORN:
               iNextValue = 9;
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_FLASH_IN:
               this.SetIsCannotSee(true);
               iNextValue = 12;
               break;
            case STATE_FLASH_OUT:
               this.SetIsCannotSee(true);
               this.visible = true;
               iNextValue = 8;
               break;
            case STATE_CHG_TOWARD:
               this.SetIsCannotSee(true);
               a_1283 = !a_1283;
               break;
            default:
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stNextFieldGrid == null)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo - 1,iYGridNo);
         }
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(true);
      }
      
      protected function a_4349(m_iXGridNo:int, m_iYGridNo:int) : Boolean
      {
         var numDistanceX:Number = Math.abs(getPosXByXGridNo(m_iXGridNo) - x);
         var numDistanceY:Number = Math.abs(getPosYByYGridNo(m_iYGridNo) - y);
         this.m_numXSpeed = (getPosXByXGridNo(m_iXGridNo) - x) / this.a_1581;
         this.m_numYSpeed = (getPosYByYGridNo(m_iYGridNo) - y) / this.a_1581;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         if(this.a_1581 > 0 && this.m_isJumping)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            InitState();
            a_1460 = true;
         }
         if(this.m_bHasHandleDie == false && a_1339 <= 0)
         {
            this.HandleDie();
            return false;
         }
         if(m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(this.m_bWuDi)
         {
            return false;
         }
         return STATE_MOVE != m_iBossState && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var yIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_BORN:
               if(a_1273 == 8)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_FLASH_OUT:
               if(a_1273 == 43 || a_1273 == 136)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_One:
               if(a_1273 == 63 || a_1273 == 157)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_Two:
               if(a_1273 == 90 || a_1273 == 182)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_Two2:
               if(a_1273 == 90 || a_1273 == 182)
               {
                  this.ActionSkillTwo2();
               }
               break;
            case STATE_SKILL_Three:
               if(a_1273 == 96 || a_1273 == 188)
               {
                  this.ActionSkillThree();
               }
               break;
            case STATE_SKILL_Two3:
               if(a_1273 == 90 || a_1273 == 182)
               {
                  for(yIndex = 0; yIndex <= 6; yIndex++)
                  {
                     this.AddShaManSheepPoison(2,yIndex,15);
                     this.AddShaManSheepPoison(6,yIndex,15);
                  }
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_One || m_iBossState == STATE_SKILL_Two || m_iBossState == STATE_SKILL_Two2 || m_iBossState == STATE_SKILL_Three);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
      }
      
      override protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         var iSkillNum:int = 0;
         var i:int = 0;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            for(i = 0; i < iSkillNum; i++)
            {
               m_vSkillID.push(i);
            }
         }
         if(m_bSkillIsOrder)
         {
            iPos = 0;
         }
         else
         {
            iPos = int(m_stRandomSeed.nextInt(m_vSkillID.length));
         }
         var iSkillID:int = m_vSkillID[iPos];
         m_vSkillID.splice(iPos,1);
         m_vSkillFunction[iSkillID]();
      }
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      private function ActionSkillOne() : void
      {
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,m_stCurrentFieldGrid.m_iYGridNo);
         if(stStartFieldGrid == null)
         {
            return;
         }
         this.a_3502(stStartFieldGrid);
         var stLastWaitShot:a_4348 = ShaManSheepShot.a_4344();
         if(Boolean(stLastWaitShot) && Boolean(stStartFieldGrid))
         {
            stLastWaitShot.a_1797(a_4265(),8,100,(stStartFieldGrid.m_iXGridNo - 1) * a_3491.a_1080 + 60,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 26,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
      
      private function ActionSkillTwo() : void
      {
         var xIndex:int = 0;
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         var m_iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         var xStart:int = m_iXGridNo - 1;
         var xEnd:int = m_iXGridNo + 1;
         var yStart:int = m_iYGridNo - 1;
         var yEnd:int = m_iYGridNo + 1;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.AddShaManSheepPoison(xIndex,yIndex,8);
            }
         }
      }
      
      private function ActionSkillTwo2() : void
      {
         for(var xIndex:int = 2; xIndex <= 8; xIndex++)
         {
            this.AddShaManSheepPoison(xIndex,0,8);
            this.AddShaManSheepPoison(xIndex,6,8);
         }
      }
      
      private function AddShaManSheepPoison(xIndex:int, yIndex:int, duration:int) : void
      {
         var stStartFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
         var stLastWaitShot:ShaManSheepPoisonShot = ShaManSheepPoisonShot.a_4344();
         if(stLastWaitShot != null && stStartFieldGrid != null)
         {
            stLastWaitShot.CONTINUE_TICK = duration * 20;
            stLastWaitShot.a_1797(a_4265(),0,30,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 0,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 30,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE);
         }
      }
      
      private function ActionSkillThree() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         var xStart:int = 0;
         var xEnd:int = 8;
         var yStart:int = 0;
         var yEnd:int = 6;
         var stFieldGridVector:Array = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(Boolean(stMoveIntruder) && Boolean(stMoveIntruder.parent) && stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_3969(-500);
                     stMoveIntruder.ChaneSpeed(10,20 * 1);
                     stAddBloodEffect = AddBloodEffect.a_3926();
                     stAddBloodEffect.a_1797(false);
                     stAddBloodEffect.x = stMoveIntruder.x;
                     stAddBloodEffect.y = stMoveIntruder.y;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
                  }
               }
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function SuputingHurt(stFieldGrid:a_3491, value:int) : void
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3969(value);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(true,0,false,value,-1);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
      }
   }
}

