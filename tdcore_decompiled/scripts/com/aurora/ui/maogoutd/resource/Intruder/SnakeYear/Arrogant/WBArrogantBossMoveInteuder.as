package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4752.a_2036;
   import com.aurora.protocol.game.maogoutd.CVanishEnemy;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class WBArrogantBossMoveInteuder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_APPEAR_OUT:uint = 7;
      
      protected static const STATE_APPEAR_IN:uint = 8;
      
      protected static const STATE_HURRICANE_OUT:uint = 9;
      
      protected static const STATE_HURRICANE_IN:uint = 10;
      
      protected static const STATE_HURRICANE_LOOP:uint = 11;
      
      protected static const STATE_HURRICANE_LOOP2:uint = 22;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 12;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 13;
      
      protected static const STATE_SKILL_ONE_END:uint = 14;
      
      protected static const STATE_SKILL_TWO_BEGIN:uint = 15;
      
      protected static const STATE_SKILL_TWO_LOOP:uint = 16;
      
      protected static const STATE_SKILL_TWO_END:uint = 17;
      
      protected static const STATE_SKILL_THREE:uint = 18;
      
      protected static const STATE_SKILL_FOUR:uint = 19;
      
      protected static const STATE_SKILL_DEAD:uint = 20;
      
      private var m_iStartTime:int = 0;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_iChangeNoY:int = -1;
      
      public function WBArrogantBossMoveInteuder()
      {
         super();
         _bossStep = 1;
         a_1279 = -96;
         a_1467 = -90;
         a_1789.getInstance().addEventListener("WB_Apple_Dead",this.On_WB_Apple_Dead);
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBArrogantBossMoveInteuder) as WBArrogantBossMoveInteuder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBArrogantBossMoveInteuderMovie;
      }
      
      private function On_WB_Apple_Dead(e:a_1778) : void
      {
         if(iLifeValue > 0)
         {
            ReduceLife2(40000,[107]);
         }
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_HURRICANE_OUT + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_HURRICANE_LOOP + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_HURRICANE_LOOP2 + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_HURRICANE_IN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 29;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 29;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 14 + 1;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 14 + 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 14 + 1;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 1] = 14 + 2;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 1] = 14 + 3;
         m_dictBossStateFrameID[STATE_HURRICANE_OUT + "_" + 1] = 14 + 4;
         m_dictBossStateFrameID[STATE_HURRICANE_LOOP + "_" + 1] = 14 + 5;
         m_dictBossStateFrameID[STATE_HURRICANE_LOOP2 + "_" + 1] = 14 + 5;
         m_dictBossStateFrameID[STATE_HURRICANE_IN + "_" + 1] = 14 + 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 14 + 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 14 + 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 14 + 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 14 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 14 + 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 14 + 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 14 + 13;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 14 + 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 29;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 29;
      }
      
      public function SkillBorn() : void
      {
         AddTag(10);
         RemoveTag(26);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,4,0]);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,5,0]);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,7,2]);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,6,5]);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,3,4]);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,3,3]);
         m_vStateCache.push([STATE_HURRICANE_LOOP2,4,3]);
         m_vStateCache.push([STATE_HURRICANE_IN,5]);
         m_vStateCache.push([STATE_WAITING,15]);
         m_vStateCache.push([STATE_APPEAR_OUT,6,false]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      public function SkillOne() : void
      {
         m_vStateCache.push([STATE_APPEAR_IN,4,1,1 + m_stRandomSeed.nextInt(5),true,false]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,19]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,11]);
         m_vStateCache.push([STATE_SKILL_ONE_END,7]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      public function SkillTwo() : void
      {
         m_vStateCache.push([STATE_APPEAR_IN,4,6,1 + m_stRandomSeed.nextInt(5),false,true]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,11]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,11]);
         m_vStateCache.push([STATE_SKILL_TWO_END,29]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_APPEAR_OUT,6,true]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      public function SkillThree() : void
      {
         m_vStateCache.push([STATE_HURRICANE_OUT,5]);
         m_vStateCache.push([STATE_HURRICANE_LOOP,7,-1]);
         m_vStateCache.push([STATE_HURRICANE_IN,5]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_THREE,42]);
         m_vStateCache.push([STATE_WAITING,40]);
      }
      
      public function SkillFour() : void
      {
         m_vStateCache.push([STATE_MOVE,20,8,m_stRandomSeed.nextInt(7)]);
         m_vStateCache.push([STATE_SKILL_FOUR,35]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_APPEAR_OUT,6,false]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      public function SkillDead() : void
      {
         m_vStateCache.push([STATE_APPEAR_OUT,6,false]);
         m_vStateCache.push([STATE_APPEAR_IN,4,4,3,false,false]);
         m_vStateCache.push([STATE_SKILL_DEAD,31]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillFour);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = -1;
         iLastNoY = -1;
         a_1465 = 3;
         setAppearToGrid(4,0,0,-100);
         this.SkillBorn();
         m_bPostEnemy = true;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var iNoX:int = 0;
         var iNoY:int = 0;
         var iNoY1:int = 0;
         var iNoY2:int = 0;
         var bNeedAddEffect:Boolean = false;
         var snakeShot:WBSnakeShot = null;
         var stStartField:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         switch(m_iBossState)
         {
            case STATE_HURRICANE_LOOP2:
               if(iCurrentTime - this.m_iStartTime == 12)
               {
                  this.ClearFieldGridDefenseByHurricane2(4,0);
               }
               else if(iCurrentTime - this.m_iStartTime == 24)
               {
                  this.ClearFieldGridDefenseByHurricane2(5,0);
               }
               else if(iCurrentTime - this.m_iStartTime == 32)
               {
                  this.ClearFieldGridDefenseByHurricane2(6,1);
               }
               else if(iCurrentTime - this.m_iStartTime == 42)
               {
                  this.ClearFieldGridDefenseByHurricane2(7,2);
               }
               else if(iCurrentTime - this.m_iStartTime == 52)
               {
                  this.ClearFieldGridDefenseByHurricane2(7,3);
               }
               else if(iCurrentTime - this.m_iStartTime == 62)
               {
                  this.ClearFieldGridDefenseByHurricane2(7,4);
               }
               else if(iCurrentTime - this.m_iStartTime == 72)
               {
                  this.ClearFieldGridDefenseByHurricane2(6,5);
               }
               else if(iCurrentTime - this.m_iStartTime == 80)
               {
                  this.ClearFieldGridDefenseByHurricane2(5,5);
               }
               else if(iCurrentTime - this.m_iStartTime == 88)
               {
                  this.ClearFieldGridDefenseByHurricane2(4,5);
               }
               else if(iCurrentTime - this.m_iStartTime == 94)
               {
                  this.ClearFieldGridDefenseByHurricane2(3,4);
               }
               else if(iCurrentTime - this.m_iStartTime == 104)
               {
                  this.ClearFieldGridDefenseByHurricane2(3,3);
               }
               else if(iCurrentTime - this.m_iStartTime == 112)
               {
                  this.ClearFieldGridDefenseByHurricane2(4,3);
               }
               break;
            case STATE_HURRICANE_LOOP:
               this.ClearFieldGridDefenseByHurricane(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_ONE_END:
               if(a_1273 == 78 || a_1273 == 294)
               {
                  RemoveTag(26);
               }
               break;
            case STATE_SKILL_ONE_LOOP:
               if(a_1273 == 68 || a_1273 == 282)
               {
                  iNoX = m_stCurrentFieldGrid.m_iXGridNo;
                  iNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  this.CreateBat(iNoX - 1,iNoY - 1);
                  this.CreateBat(iNoX - 1,iNoY + 1);
                  this.CreateBat(iNoX + 1,iNoY - 1);
                  this.CreateBat(iNoX + 1,iNoY + 1);
               }
            case STATE_SKILL_TWO_END:
               if(a_1273 == 130 || a_1273 == 340)
               {
                  iNoY1 = int(m_stRandomSeed.nextInt(7));
                  iNoY2 = int(m_stRandomSeed.nextInt(7));
                  while(iNoY1 == iNoY2)
                  {
                     iNoY2 = int(m_stRandomSeed.nextInt(7));
                  }
                  this.CreateHole(iNoY1);
                  this.CreateHole(iNoY2);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 168 || a_1273 == 384)
               {
                  bNeedAddEffect = true;
                  if(a_2036.getInstance().tagCom.HasTag(17) || a_2036.getInstance().tagCom.HasTag(18) || a_2036.getInstance().tagCom.HasTag(19))
                  {
                     bNeedAddEffect = false;
                  }
                  a_2036.getInstance().tagCom.AddTag(17);
                  if(bNeedAddEffect)
                  {
                     this.AddOneTimeChangeEffect(288948688);
                     this.AddOneTimeChangeEffect(288948702);
                     this.AddOneTimeChangeEffect(288948703);
                  }
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 207 || a_1273 == 421)
               {
                  snakeShot = WBSnakeShot.a_4344();
                  stStartField = m_stCurrentFieldGrid;
                  snakeShot.a_1797(0,-7,0,x - 60,y + 10,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField);
                  snakeShot.m_iTargetNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  snakeShot.m_stBOSS = this;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(snakeShot,BattleLayerDefine.SHOT_TYPE,stStartField);
               }
               break;
            case STATE_SKILL_DEAD:
               if(a_1273 == 457)
               {
                  CallChangeStep();
               }
         }
         return true;
      }
      
      private function AddOneTimeChangeEffect(iGameCardTypeID:uint) : void
      {
         var gameCardView:GameCardView = null;
         var timeChangeEffect:WBTimeChangeEffect = null;
         var stRootLocalPoint:Point = null;
         gameCardView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3476(iGameCardTypeID);
         if(gameCardView == null)
         {
            return;
         }
         timeChangeEffect = WBTimeChangeEffect.a_3926();
         timeChangeEffect.a_1797(false);
         timeChangeEffect.x = gameCardView.x - 200 + (gameCardView.parent.x - 114);
         timeChangeEffect.y = gameCardView.y - 98;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(timeChangeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         var stGlobalPoint:Point = timeChangeEffect.parent.localToGlobal(new Point(timeChangeEffect.x,timeChangeEffect.y));
         stRootLocalPoint = root.globalToLocal(stGlobalPoint);
         timeChangeEffect.x = stRootLocalPoint.x;
         timeChangeEffect.y = stRootLocalPoint.y;
         var stRootContainer:DisplayObjectContainer = root as DisplayObjectContainer;
         if(timeChangeEffect.parent.contains(timeChangeEffect))
         {
            timeChangeEffect.parent.removeChild(timeChangeEffect);
         }
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(timeChangeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         stRootContainer.addChild(timeChangeEffect);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(timeChangeEffect);
      }
      
      protected function ClearFieldGridDefense2(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
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
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      private function HandleDie() : void
      {
         var stEnemyVanish:CVanishEnemy = null;
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         if(m_stCurrentFieldGrid)
         {
            a_1789.getInstance().dispatchEvent(new a_1778("ReportImmediately"));
            stEnemyVanish = new CVanishEnemy();
            stEnemyVanish.m_iEnemyID = a_1459;
            stEnemyVanish.m_iEnemyTypeID = m_stMoveIntruderTypeID - 8388608;
            stEnemyVanish.m_byYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            stEnemyVanish.m_byXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
            a_1088.a_2061(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_byTeamNo,[stEnemyVanish]);
         }
         m_bPostEnemy = false;
         SetIsCannotSee(true);
         this.SkillDead();
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_FOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_HURRICANE_LOOP || m_iBossState == STATE_HURRICANE_LOOP2;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_NONE != m_iBossState && STATE_BORN != m_iBossState && STATE_HURRICANE_OUT != m_iBossState && STATE_HURRICANE_LOOP != m_iBossState && STATE_HURRICANE_IN != m_iBossState && a_1339 > 0 && STATE_HURRICANE_LOOP2 != m_iBossState;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         _iTimeNum = iCurrentTime;
         if(a_1581 > 0)
         {
            --a_1581;
            x += m_numXSpeed;
            y += m_numYSpeed;
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
         if(this.m_iStartTime == 0)
         {
            this.m_iStartTime = iCurrentTime;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            this.InitState();
            a_1460 = true;
            _MAXLifeValue = iLifeValue;
            _Reduce2ShieldLifeValue = _MAXLifeValue * 0.25;
            _ReduceOneStepLifeValue = _MAXLifeValue * 0.1;
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
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var targetY:Number = NaN;
         var targetY1:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               this.a_3940();
               return false;
            }
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         switch(iNextState)
         {
            case STATE_BORN:
               this.m_iStartTime = _iTimeNum;
               break;
            case STATE_APPEAR_IN:
               RemoveTag(10);
               visible = true;
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1283 = m_vStateCache[0][4];
               if(m_vStateCache[0][5] == true)
               {
                  AddTag(26);
               }
               break;
            case STATE_SKILL_ONE_BEGIN:
               AddTag(26);
               break;
            case STATE_APPEAR_OUT:
               SetIsCannotSee(true);
               if(m_vStateCache[0][2] == true)
               {
                  RemoveTag(26);
               }
               break;
            case STATE_NONE:
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
               break;
            case STATE_HURRICANE_IN:
               a_1283 = false;
               break;
            case STATE_MOVE:
               targetY = m_vStateCache[0][3] == -1 ? y : getPosYByYGridNo(m_vStateCache[0][3]);
               iNextValue = this.setMoveToPosition2(getPosXByXGridNo(m_vStateCache[0][2]),targetY,iNextValue);
               break;
            case STATE_HURRICANE_LOOP:
            case STATE_HURRICANE_LOOP2:
               targetY1 = m_vStateCache[0][2] == -1 ? y : getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),targetY1,60 / (20 * 0.2));
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      protected function setMoveToPosition2(fPosX:Number, fPosY:Number, duration:int) : int
      {
         var fDistanceX:Number = NaN;
         fDistanceX = fPosX - this.x;
         var fDistanceY:Number = fPosY - this.y;
         var dis:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         var speed:Number = dis / duration;
         m_fMoveSpeedY = fDistanceY / duration;
         m_fMoveSpeedX = fDistanceX / duration;
         return duration;
      }
      
      protected function ClearFieldGridDefenseByHurricane2(iNoX:int, iNoY:int) : void
      {
         this.ClearFieldGridDefenseByHurricane(_battleView.a_3438(iNoX,iNoY));
      }
      
      protected function ClearFieldGridDefenseByHurricane(stFieldGrid:a_3491) : int
      {
         if(stFieldGrid == null)
         {
            return 0;
         }
         if(!stFieldGrid.m_isCanBrokeByWind == true)
         {
            return 0;
         }
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            if(stFieldGrid.m_stAttackFighter.a_3512() != 286396512 && stFieldGrid.m_stAttackFighter.a_3512() != 286396526)
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
               return 0;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense && !stFieldGrid.m_stOceanGoddessToolDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense && !stFieldGrid.m_stHoneyTrapBaseDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.m_CatDragonWindBrokeArray.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_iDieType = 1;
               stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
               return 0;
            }
         }
         return 0;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.m_iStartTime = 0;
         this.m_bHasHandleDie = false;
      }
      
      private function CreateHole(iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var stPlumberPipelineEntranceMoveIntruder:PlumberPipelineEntranceMoveIntruder = null;
         var stPlumberPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,iNoY);
         var grid2:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,iNoY);
         if(grid1 == null || grid2 == null)
         {
            return;
         }
         stPlumberPipelineEntranceMoveIntruder = PlumberPipelineEntranceMoveIntruder.a_3926() as PlumberPipelineEntranceMoveIntruder;
         stPlumberPipelineEntranceMoveIntruder.a_1797(0,-1);
         stPlumberPipelineEntranceMoveIntruder.iGlobalMoveFighterID = a_4265();
         stPlumberPipelineEntranceMoveIntruder.m_stMoveIntruderTypeID = 8388608;
         stPlumberPipelineEntranceMoveIntruder.x = a_3491.a_1080 * grid1.m_iXGridNo + (a_3491.a_1080 - stPlumberPipelineEntranceMoveIntruder.width);
         stPlumberPipelineEntranceMoveIntruder.y = a_3491.a_1081 * grid1.m_iYGridNo + (a_3491.a_1081 - stPlumberPipelineEntranceMoveIntruder.height);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPlumberPipelineEntranceMoveIntruder,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPlumberPipelineEntranceMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         stPlumberPipelineOutletMoveIntruder = PlumberPipelineOutletMoveIntruder.a_3926() as PlumberPipelineOutletMoveIntruder;
         stPlumberPipelineOutletMoveIntruder.a_1797(0,-1);
         stPlumberPipelineOutletMoveIntruder.iGlobalMoveFighterID = a_4265();
         stPlumberPipelineOutletMoveIntruder.m_stMoveIntruderTypeID = 8388608;
         stPlumberPipelineOutletMoveIntruder.x = a_3491.a_1080 * grid2.m_iXGridNo + (a_3491.a_1080 - stPlumberPipelineOutletMoveIntruder.width);
         stPlumberPipelineOutletMoveIntruder.y = a_3491.a_1081 * grid2.m_iYGridNo + (a_3491.a_1081 - stPlumberPipelineOutletMoveIntruder.height);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stPlumberPipelineOutletMoveIntruder,grid2);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPlumberPipelineOutletMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,grid2);
         stPlumberPipelineOutletMoveIntruder.m_stPipelineEntranceMoveIntruder = stPlumberPipelineEntranceMoveIntruder;
         stPlumberPipelineEntranceMoveIntruder.m_stPipelineOutletMoveIntruder = stPlumberPipelineOutletMoveIntruder;
      }
      
      public function GetGuardGlobalID2() : int
      {
         return pressData(globalMoveFighterID,++m_iSummonUpSequence,16);
      }
      
      private function CreateBat(iNoX:int, iNoY:int) : void
      {
         var bat:WBArrogantBatMoveInteuder = null;
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         bat = WBArrogantBatMoveInteuder.a_3926() as WBArrogantBatMoveInteuder;
         bat.a_1797(0,-1);
         bat.iGlobalMoveFighterID = a_4265();
         bat.m_stMoveIntruderTypeID = 8388608;
         bat.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(bat,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(bat,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         bat.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
      }
   }
}

