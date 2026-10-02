package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.protocol.game.maogoutd.CVanishEnemy;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class WBGreedyKing1BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 7;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 8;
      
      protected static const STATE_SKILL_ONE_END:uint = 9;
      
      protected static const STATE_SKILL_ONE_APPEAR_OUT:uint = 10;
      
      protected static const STATE_SKILL_ONE_APPEAR_IN:uint = 11;
      
      protected static const STATE_SKILL_TWO:uint = 12;
      
      protected static const STATE_SKILL_THREE:uint = 13;
      
      protected static const STATE_SKILL_THREE_END:uint = 14;
      
      protected static const STATE_SKILL_FOUR:uint = 15;
      
      protected static const STATE_SKILL_FOUR_WAIT:uint = 16;
      
      protected static const STATE_SKILL_FOUR_END:uint = 17;
      
      protected static const STATE_SKILL_DEAD_BEGIN:uint = 18;
      
      protected static const STATE_SKILL_DEAD_LOOP:uint = 19;
      
      protected static const STATE_SKILL_DEAD_END:uint = 20;
      
      protected static const STATE_WAITING2:uint = 21;
      
      protected static const STATE_HIDE2:uint = 22;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var joker1:WBGreedyActorMoveIntruder;
      
      private var joker2:WBGreedyActorMoveIntruder;
      
      private var curJoker:WBGreedyActorMoveIntruder;
      
      private var coinEffect:WBGreedyCoinEffect;
      
      private var realColor:int = 0;
      
      private var lastCreateCoinY:int = -1;
      
      private var m_iChangeNoY:int = -1;
      
      public function WBGreedyKing1BossMoveIntruder()
      {
         super();
         _bossStep = 1;
         a_1279 = -70;
         a_1467 = -70;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyKing1BossMoveIntruder) as WBGreedyKing1BossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyKing1BossMoveIntruderMovie;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_OUT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_IN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_WAIT + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_END + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_BEGIN + "_" + 0] = 28;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_LOOP + "_" + 0] = 29;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_END + "_" + 0] = 30;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 28;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_OUT + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_IN + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_WAIT + "_" + 1] = 26;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_END + "_" + 1] = 27;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_BEGIN + "_" + 1] = 28;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_LOOP + "_" + 1] = 29;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_END + "_" + 1] = 30;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 28;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_HIDE2 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE2 + "_" + 1] = 15;
      }
      
      public function SkillFront() : void
      {
         m_vStateCache.push([STATE_SKILL_THREE,27]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_MOVE,5,-1,false]);
         m_vStateCache.push([STATE_SKILL_TWO,34]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_MOVE,3,-1,false]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,20]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,12]);
         m_vStateCache.push([STATE_SKILL_ONE_END,12]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_OUT,14,false]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_IN,18]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_MOVE,1,-1,false]);
         m_vStateCache.push([STATE_SKILL_THREE_END,12]);
         m_vStateCache.push([STATE_SKILL_FOUR,23,true]);
         m_vStateCache.push([STATE_SKILL_FOUR_WAIT,48]);
         m_vStateCache.push([STATE_SKILL_FOUR_END,10]);
         m_vStateCache.push([STATE_WAITING,10]);
      }
      
      public function SkillBack() : void
      {
         m_vStateCache.push([STATE_SKILL_THREE,27]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_MOVE,3,-1,true]);
         m_vStateCache.push([STATE_SKILL_TWO,34]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_MOVE,5,-1,true]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,20]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,12]);
         m_vStateCache.push([STATE_SKILL_ONE_END,12]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_OUT,14,true]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_IN,18]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_MOVE,7,-1,true]);
         m_vStateCache.push([STATE_SKILL_THREE_END,12]);
         m_vStateCache.push([STATE_SKILL_FOUR,23,false]);
         m_vStateCache.push([STATE_SKILL_FOUR_WAIT,48]);
         m_vStateCache.push([STATE_SKILL_FOUR_END,10]);
         m_vStateCache.push([STATE_WAITING,10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillFront);
         m_vSkillFunction.push(this.SkillBack);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 7;
         iLastNoY = 3;
         this.visible = false;
         m_vStateCache.push([STATE_HIDE2,22]);
         m_vStateCache.push([STATE_BORN,30,7,3,0]);
         m_vStateCache.push([STATE_WAITING2,20]);
         this.realColor = m_stRandomSeed.nextInt(3);
         m_bPostEnemy = true;
         this.joker1 = this.CreateJoker(8,1);
         this.joker2 = this.CreateJoker(8,5);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var randomIdx:int = 0;
         var randomIdy:int = 0;
         var array:Array = null;
         var arrayBaby:Array = null;
         var baby1:WBGreedyBabyMoveIntruder = null;
         var baby2:WBGreedyBabyMoveIntruder = null;
         var baby3:WBGreedyBabyMoveIntruder = null;
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
                  this.visible = true;
               }
               else if(a_1273 == 9)
               {
                  a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,3));
               }
               else if(a_1273 == 14)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 197 || a_1273 == 424)
               {
                  randomIdx = int(m_stRandomSeed.nextInt(2));
                  randomIdy = a_1283 ? 7 : 1;
                  if(m_stCurrentFieldGrid.m_iYGridNo == 1)
                  {
                     this.CreateCoinEffect(randomIdy,randomIdx == 0 ? 3 : 5);
                  }
                  else if(m_stCurrentFieldGrid.m_iYGridNo == 3)
                  {
                     this.CreateCoinEffect(randomIdy,randomIdx == 0 ? 1 : 5);
                  }
                  else
                  {
                     this.CreateCoinEffect(randomIdy,randomIdx == 0 ? 1 : 3);
                  }
               }
               break;
            case STATE_MOVE:
            case STATE_SKILL_DEAD_LOOP:
               this.ClearFieldGridDefense2(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 235 || a_1273 == 462)
               {
                  this.CreateCar(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 165 || a_1273 == 390)
               {
                  array = shuffleArray([0,1,2]);
                  arrayBaby = new Array();
                  if(!a_1283)
                  {
                     baby1 = this.CreateBaby(array[0],2,0);
                     baby2 = this.CreateBaby(array[1],7,3);
                     baby3 = this.CreateBaby(array[2],2,6);
                     arrayBaby.push(baby1);
                     arrayBaby.push(baby2);
                     arrayBaby.push(baby3);
                     baby1.InitData(this.realColor,arrayBaby,2000);
                     baby2.InitData(this.realColor,arrayBaby,2000);
                     baby3.InitData(this.realColor,arrayBaby,2000);
                  }
                  else
                  {
                     baby1 = this.CreateBaby(array[0],6,0);
                     baby2 = this.CreateBaby(array[1],1,3);
                     baby3 = this.CreateBaby(array[2],6,6);
                     arrayBaby.push(baby1);
                     arrayBaby.push(baby2);
                     arrayBaby.push(baby3);
                     baby1.InitData(this.realColor,arrayBaby,2000);
                     baby2.InitData(this.realColor,arrayBaby,2000);
                     baby3.InitData(this.realColor,arrayBaby,2000);
                  }
               }
         }
         return true;
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
         if(this.joker1 != null)
         {
            this.joker1.CallDie();
            this.joker1 = null;
         }
         if(this.joker2 != null)
         {
            this.joker2.CallDie();
            this.joker2 = null;
         }
         if(this.coinEffect != null)
         {
            this.coinEffect.SetAnimation2(2);
            this.coinEffect = null;
         }
         m_vStateCache.push([STATE_SKILL_DEAD_BEGIN,10]);
         m_vStateCache.push([STATE_SKILL_DEAD_LOOP,11,m_stCurrentFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_DEAD_END,17]);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_FOUR_END);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_DEAD_LOOP;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_NONE != m_iBossState && STATE_BORN != m_iBossState && STATE_HIDE2 != m_iBossState && STATE_WAITING2 != m_iBossState && a_1339 > 0;
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
      
      private function CreateJoker(iNoX:int, iNoY:int) : WBGreedyActorMoveIntruder
      {
         var joker:WBGreedyActorMoveIntruder = null;
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return null;
         }
         joker = WBGreedyActorMoveIntruder.a_3926();
         joker.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
         joker.m_stMoveIntruderTypeID = 134235441;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(joker,grid,false);
         joker.x = (grid.m_iXGridNo + 1) * a_3491.a_1080;
         joker.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         return joker;
      }
      
      private function CreateBaby(iIndex:int, iNoX:int, iNoY:int) : WBGreedyBabyMoveIntruder
      {
         var grid1:a_3491 = null;
         var baby1:WBGreedyBabyMoveIntruder = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(iIndex == 0)
         {
            baby1 = WBGreedyBaby1MoveIntruder.a_3926();
         }
         else if(iIndex == 1)
         {
            baby1 = WBGreedyBaby2MoveIntruder.a_3926();
         }
         else
         {
            baby1 = WBGreedyBaby3MoveIntruder.a_3926();
         }
         baby1.a_1797((globalMoveFighterID << 16) + grid1.m_iYGridNo,-1);
         baby1.m_stMoveIntruderTypeID = 134235477;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(baby1,grid1,false);
         baby1.x = grid1.m_iXGridNo * a_3491.a_1080;
         baby1.y = grid1.m_iYGridNo * a_3491.a_1081;
         return baby1;
      }
      
      private function CreateCar(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         var car:WBGreedyCarMoveIntruder = WBGreedyCarMoveIntruder.a_3926();
         car.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
         car.m_stMoveIntruderTypeID = 134235442;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(car,grid,false);
         if(iNoX < 5)
         {
            car.SetMove2Front();
            car.x = (grid.m_iXGridNo + 2) * a_3491.a_1080;
         }
         else
         {
            car.SetMove2Back();
            car.x = (grid.m_iXGridNo - 1) * a_3491.a_1080;
         }
         car.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
      }
      
      private function CreateCoinEffect(iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = null;
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.lastCreateCoinY = iNoY;
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid != null)
         {
            this.coinEffect = WBGreedyCoinEffect.a_3926();
            this.coinEffect.m_TargetFieldGrid = stFieldGrid;
            this.coinEffect.a_1797(false);
            this.coinEffect.x = iNoX * a_3491.a_1080 + 8;
            this.coinEffect.y = iNoY * a_3491.a_1081 + 10;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.coinEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this.coinEffect);
         }
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var stDataEvent:a_1778 = null;
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               this.a_3940();
               return false;
            }
            CacheNextSkill();
         }
         if(this.joker1 != null && this.joker2 != null)
         {
            if(m_iBossState == STATE_MOVE)
            {
               this.joker1.x = x;
               this.joker2.x = x;
            }
            this.joker1.Change2Damage(IsInjured == 1);
            this.joker2.Change2Damage(IsInjured == 1);
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         switch(iNextState)
         {
            case STATE_BORN:
               SetIsCannotSee(true);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_HIDE2:
               this.visible = false;
               break;
            case STATE_SKILL_ONE_BEGIN:
               a_1283 = false;
               break;
            case STATE_SKILL_FOUR:
               a_1283 = m_vStateCache[0][2];
               this.joker1.CallReverse(a_1283);
               this.joker2.CallReverse(a_1283);
               break;
            case STATE_WAITING:
            case STATE_WAITING2:
               SetIsCannotSee(false);
               break;
            case STATE_SKILL_ONE_END:
               stDataEvent = new a_1778("ReduceEnergy");
               stDataEvent.dataObject = 1000;
               if(root)
               {
                  root.dispatchEvent(stDataEvent);
               }
               break;
            case STATE_SKILL_ONE_APPEAR_OUT:
               a_1283 = m_vStateCache[0][2];
               if(this.joker1.m_stCurrentFieldGrid.m_iYGridNo == this.lastCreateCoinY)
               {
                  this.curJoker = this.joker1;
               }
               else
               {
                  this.curJoker = this.joker2;
               }
               this.m_iChangeNoY = int(this.curJoker.y / a_3491.a_1081);
               this.curJoker.CallAppearIn(m_stCurrentFieldGrid.m_iYGridNo);
               break;
            case STATE_SKILL_ONE_APPEAR_IN:
               setAppearToGrid(m_stCurrentFieldGrid.m_iXGridNo,this.m_iChangeNoY);
               break;
            case STATE_SKILL_THREE_END:
               if(this.coinEffect != null)
               {
                  this.coinEffect.SetAnimation2(2);
                  this.coinEffect = null;
               }
               break;
            case STATE_SKILL_FOUR_WAIT:
               break;
            case STATE_MOVE:
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),y,60 / (10 * 2));
               break;
            case STATE_SKILL_DEAD_BEGIN:
               a_1283 = false;
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_DEAD_LOOP:
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]),24);
               break;
            case STATE_SKILL_DEAD_END:
               CallChangeStep();
               x = 270;
         }
         if(this.joker1 != null && this.joker2 != null)
         {
            if(iNextState == STATE_HIDE2)
            {
               this.joker1.CallWait2();
               this.joker2.CallWait2();
            }
            else if(iNextState == STATE_MOVE)
            {
               this.joker1.CallWait();
               this.joker2.CallWait();
            }
            else
            {
               this.joker1.CallMove();
               this.joker2.CallMove();
            }
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.m_bHasHandleDie = false;
      }
   }
}

