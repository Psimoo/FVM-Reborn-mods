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
   
   public class WBArrogantBoss2MoveInteuder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_APPEAR_OUT:uint = 7;
      
      protected static const STATE_APPEAR_IN:uint = 8;
      
      protected static const STATE_SKILL_ONE:uint = 12;
      
      protected static const STATE_SKILL_TWO_BEGIN:uint = 15;
      
      protected static const STATE_SKILL_TWO_LOOP:uint = 16;
      
      protected static const STATE_SKILL_TWO_END:uint = 17;
      
      protected static const STATE_SKILL_THREE:uint = 18;
      
      protected static const STATE_SKILL_FOUR:uint = 19;
      
      protected static const STATE_SKILL_DEAD:uint = 20;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_iChangeNoY:int = -1;
      
      public function WBArrogantBoss2MoveInteuder()
      {
         super();
         _bossStep = 2;
         a_1279 = -54;
         a_1467 = -55;
         a_1789.getInstance().addEventListener("WB_Apple_Dead",this.On_WB_Apple_Dead);
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBArrogantBoss2MoveInteuder) as WBArrogantBoss2MoveInteuder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBArrogantBoss2MoveInteuderMovie;
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
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 10 + 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 10 + 2;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 1] = 10 + 3;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 1] = 10 + 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 10 + 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 10 + 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 10 + 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 10 + 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 10 + 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 10 + 10;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 10 + 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 22;
      }
      
      public function SkillBorn() : void
      {
         AddTag(10);
         RemoveTag(27);
         m_vStateCache.push([STATE_BORN,32]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      public function SkillOne() : void
      {
         var lGrid:Array = [[4,2],[3,2],[2,3],[2,4],[3,4]];
         var index:int = int(m_stRandomSeed.nextInt(5));
         m_vStateCache.push([STATE_APPEAR_IN,12,lGrid[index][0],lGrid[index][1],true]);
         m_vStateCache.push([STATE_SKILL_ONE,51]);
         m_vStateCache.push([STATE_APPEAR_OUT,6]);
      }
      
      public function SkillTwo() : void
      {
         m_vStateCache.push([STATE_APPEAR_IN,12,7,3,false]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,11]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,11]);
         m_vStateCache.push([STATE_SKILL_TWO_END,29]);
         m_vStateCache.push([STATE_WAITING,20,false]);
      }
      
      public function SkillThree() : void
      {
         var iNoY:int = int(m_stRandomSeed.nextInt(7));
         while(iNoY == 3)
         {
            iNoY = int(m_stRandomSeed.nextInt(7));
         }
         m_vStateCache.push([STATE_MOVE,7,iNoY,60 / (20 * 0.3)]);
         m_vStateCache.push([STATE_WAITING,10,false]);
         m_vStateCache.push([STATE_SKILL_THREE,44]);
         m_vStateCache.push([STATE_WAITING,20,true]);
         m_vStateCache.push([STATE_APPEAR_OUT,6]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      public function SkillFour() : void
      {
         var iLastNoY:int = int(m_stRandomSeed.nextInt(7));
         m_vStateCache.push([STATE_APPEAR_IN,12,8,iLastNoY,false]);
         m_vStateCache.push([STATE_SKILL_FOUR,35]);
         m_vStateCache.push([STATE_WAITING,10,false]);
         var iNoY:int = int(m_stRandomSeed.nextInt(7));
         while(iNoY == iLastNoY || Math.abs(iLastNoY - iNoY) > 4)
         {
            iNoY = int(m_stRandomSeed.nextInt(7));
         }
         m_vStateCache.push([STATE_MOVE,8,iNoY,60 / (20 * 0.5)]);
         m_vStateCache.push([STATE_SKILL_FOUR,35]);
         m_vStateCache.push([STATE_WAITING,20,false]);
         m_vStateCache.push([STATE_APPEAR_OUT,6]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      public function SkillDead() : void
      {
         m_vStateCache.push([STATE_APPEAR_OUT,6,false]);
         m_vStateCache.push([STATE_SKILL_DEAD,43,6,4]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillFour);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = -1;
         iLastNoY = -1;
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
         var iNoY3:int = 0;
         var iNoY6:int = 0;
         var iNoY4:int = 0;
         var bNeedAddEffect:Boolean = false;
         var iNoY5:int = 0;
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
            case STATE_BORN:
               if(a_1273 == 2)
               {
                  this.ClearFieldGridDefense3(8,2);
               }
               else if(a_1273 == 5)
               {
                  this.ClearFieldGridDefense3(7,2);
               }
               else if(a_1273 == 7)
               {
                  this.ClearFieldGridDefense3(6,2);
               }
               else if(a_1273 == 10)
               {
                  this.ClearFieldGridDefense3(5,2);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 115 || a_1273 == 346)
               {
                  iNoX = m_stCurrentFieldGrid.m_iXGridNo;
                  iNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  this.CreateBat(iNoX - 1,iNoY - 1,-1,-1);
                  this.CreateBat(iNoX - 1,iNoY + 1,-1,1);
                  this.CreateBat(iNoX + 1,iNoY - 1,1,-1);
                  this.CreateBat(iNoX + 1,iNoY + 1,1,1);
               }
            case STATE_SKILL_TWO_END:
               if(a_1273 == 173 || a_1273 == 404)
               {
                  iNoY1 = int(m_stRandomSeed.nextInt(7));
                  iNoY2 = int(m_stRandomSeed.nextInt(7));
                  iNoY3 = int(m_stRandomSeed.nextInt(7));
                  while(iNoY1 == iNoY2)
                  {
                     iNoY2 = int(m_stRandomSeed.nextInt(7));
                  }
                  while(iNoY1 == iNoY3 || iNoY2 == iNoY3)
                  {
                     iNoY3 = int(m_stRandomSeed.nextInt(7));
                  }
                  this.CreateHole(iNoY1);
                  this.CreateHole(iNoY2);
                  this.CreateHole(iNoY3);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 210 || a_1273 == 441)
               {
                  AddTag(27);
               }
               else if(a_1273 == 216 || a_1273 == 447)
               {
                  iNoY6 = m_stCurrentFieldGrid.m_iYGridNo;
                  ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,iNoY6));
                  this.ClearFieldGridDefense3(7,iNoY6);
                  this.ClearFieldGridDefense3(6,iNoY6);
               }
               else if(a_1273 == 217 || a_1273 == 448)
               {
                  iNoY4 = m_stCurrentFieldGrid.m_iYGridNo;
                  ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,iNoY4));
                  this.ClearFieldGridDefense3(5,iNoY4);
                  this.ClearFieldGridDefense3(4,iNoY4);
               }
               else if(a_1273 == 218 || a_1273 == 449)
               {
                  bNeedAddEffect = true;
                  if(a_2036.getInstance().tagCom.HasTag(17) || a_2036.getInstance().tagCom.HasTag(18) || a_2036.getInstance().tagCom.HasTag(19))
                  {
                     bNeedAddEffect = false;
                  }
                  a_2036.getInstance().tagCom.AddTag(18);
                  if(bNeedAddEffect)
                  {
                     this.AddOneTimeChangeEffect(288948688);
                     this.AddOneTimeChangeEffect(288948702);
                     this.AddOneTimeChangeEffect(288948703);
                  }
                  iNoY5 = m_stCurrentFieldGrid.m_iYGridNo;
                  ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,iNoY5));
                  this.ClearFieldGridDefense3(3,iNoY5);
                  this.ClearFieldGridDefense3(2,iNoY5);
               }
               else if(a_1273 == 230 || a_1273 == 461)
               {
                  RemoveTag(27);
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 254 || a_1273 == 485)
               {
                  snakeShot = WBSnakeShot.a_4344();
                  stStartField = m_stCurrentFieldGrid;
                  snakeShot.a_1797(0,-7,0,x - 60,y - 15,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField);
                  snakeShot.m_iTargetNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  snakeShot.m_stBOSS2 = this;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(snakeShot,BattleLayerDefine.SHOT_TYPE,stStartField);
               }
               break;
            case STATE_SKILL_DEAD:
               if(a_1273 == 530)
               {
                  this.CreateBat(3,1,0,0);
                  this.CreateBat(1,2,0,0);
                  this.CreateBat(1,4,0,0);
                  this.CreateBat(3,5,0,0);
               }
               else if(a_1273 == 538)
               {
                  CallChangeStep();
               }
               break;
            case STATE_APPEAR_IN:
               if(a_1273 == 291 || a_1273 == 60)
               {
                  this.ClearFieldGridDefense2(m_stCurrentFieldGrid);
               }
               break;
            case STATE_MOVE:
               this.ClearFieldGridDefense2(m_stCurrentFieldGrid);
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
      
      private function ClearFieldGridDefense3(iNoX:int, iNoY:int) : void
      {
         this.ClearFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
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
         return Boolean(m_iBossState >= STATE_SKILL_ONE && m_iBossState <= STATE_SKILL_FOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_NONE != m_iBossState && STATE_BORN != m_iBossState && a_1339 > 0;
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
               setAppearToGrid(5,2);
               _battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
               break;
            case STATE_SKILL_DEAD:
               RemoveTag(10);
               visible = true;
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1283 = false;
               break;
            case STATE_APPEAR_IN:
               RemoveTag(10);
               visible = true;
               SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               a_1283 = m_vStateCache[0][4];
               if(m_vStateCache[0][5] == true)
               {
                  AddTag(27);
               }
               break;
            case STATE_WAITING:
               RemoveTag(27);
               if(m_vStateCache[0][2] == true)
               {
                  setAppearToGrid(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               }
               break;
            case STATE_SKILL_ONE:
            case STATE_SKILL_TWO_BEGIN:
               AddTag(27);
               break;
            case STATE_APPEAR_OUT:
               RemoveTag(27);
               SetIsCannotSee(true);
               if(m_vStateCache[0][2] == true)
               {
                  RemoveTag(27);
               }
               break;
            case STATE_NONE:
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
               break;
            case STATE_MOVE:
               targetY = m_vStateCache[0][2] == -1 ? y : getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),targetY,m_vStateCache[0][3]);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
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
         this.m_bHasHandleDie = false;
      }
      
      private function CreateHole(iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var grid2:a_3491 = null;
         var stPlumberPipelineEntranceMoveIntruder:PlumberPipelineEntranceMoveIntruder = null;
         var stPlumberPipelineOutletMoveIntruder:PlumberPipelineOutletMoveIntruder = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,iNoY);
         grid2 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,iNoY);
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
      
      private function CreateBat(iNoX:int, iNoY:int, iOffsetX:int, iOffsetY:int) : void
      {
         var bat:WBArrogantBatMoveInteuder = null;
         var grid1:a_3491 = _battleView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         bat = WBArrogantBatMoveInteuder.a_3926() as WBArrogantBatMoveInteuder;
         bat.a_1797(0,-1);
         bat.iGlobalMoveFighterID = a_4265();
         bat.m_stMoveIntruderTypeID = 8388608;
         bat.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         _battleView.a_3459(bat,grid1);
         _battleView.AddToBattleView(bat,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         bat.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
         bat.SetMoveOffset(iOffsetX,iOffsetY);
      }
   }
}

