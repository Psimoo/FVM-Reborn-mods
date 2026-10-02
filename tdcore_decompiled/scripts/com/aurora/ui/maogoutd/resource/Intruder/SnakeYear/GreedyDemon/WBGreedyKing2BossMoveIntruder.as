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
   
   public class WBGreedyKing2BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_BORN_LOOP:uint = 7;
      
      protected static const STATE_BORN_END:uint = 8;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 9;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 10;
      
      protected static const STATE_SKILL_ONE_END:uint = 11;
      
      protected static const STATE_SKILL_ONE_APPEAR_OUT:uint = 12;
      
      protected static const STATE_SKILL_ONE_APPEAR_IN:uint = 13;
      
      protected static const STATE_SKILL_TWO:uint = 14;
      
      protected static const STATE_SKILL_THREE:uint = 15;
      
      protected static const STATE_SKILL_THREE_END:uint = 16;
      
      protected static const STATE_SKILL_FOUR:uint = 17;
      
      protected static const STATE_SKILL_FOUR_WAIT:uint = 18;
      
      protected static const STATE_SKILL_FOUR_END:uint = 19;
      
      protected static const STATE_SKILL_DEAD:uint = 20;
      
      protected static const STATE_WAITING2:uint = 21;
      
      protected static const STATE_HIDE2:uint = 22;
      
      private var coinEffect1:WBGreedyCoinEffect;
      
      private var coinEffect2:WBGreedyCoinEffect;
      
      private var reallyBalloon:WBGreedyBalloonMoveIntruder;
      
      private var realColor:int = 0;
      
      private var isDead:Boolean = false;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var balloonEffects:Array = new Array();
      
      private var randomGrid:Array = [[2,0],[4,0],[6,0],[2,6],[4,6],[6,6],[1,1],[3,1],[5,1],[7,1],[1,5],[3,5],[5,5],[7,5]];
      
      public function WBGreedyKing2BossMoveIntruder()
      {
         super();
         _bossStep = 2;
         a_1279 = -84;
         a_1467 = -58;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyKing2BossMoveIntruder) as WBGreedyKing2BossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyKing2BossMoveIntruderMovie;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_BORN_LOOP + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_BORN_END + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_OUT + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_IN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_WAIT + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_END + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 30;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 30;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_BORN_LOOP + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_BORN_END + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_OUT + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_IN + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 26;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 27;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_WAIT + "_" + 1] = 28;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_END + "_" + 1] = 29;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 30;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 30;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_HIDE2 + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_HIDE2 + "_" + 1] = 17;
      }
      
      public function SkillFront() : void
      {
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,17,false]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,12]);
         m_vStateCache.push([STATE_SKILL_ONE_END,12]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_OUT,12]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_IN,8,1,-1,true]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_MOVE,3,-1,true]);
         m_vStateCache.push([STATE_SKILL_TWO,41]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_MOVE,7,-1,true]);
         m_vStateCache.push([STATE_MOVE,5,-1,false]);
         m_vStateCache.push([STATE_SKILL_THREE,30]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_MOVE,0,-1,false]);
         m_vStateCache.push([STATE_SKILL_THREE_END,18,true]);
         m_vStateCache.push([STATE_SKILL_FOUR,23]);
         m_vStateCache.push([STATE_SKILL_FOUR_WAIT,15]);
         m_vStateCache.push([STATE_SKILL_FOUR_END,12]);
         m_vStateCache.push([STATE_WAITING,50]);
      }
      
      public function SkillBack() : void
      {
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,17,false]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,12]);
         m_vStateCache.push([STATE_SKILL_ONE_END,12]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_OUT,12]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_IN,8,7,-1,false]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_MOVE,5,-1,false]);
         m_vStateCache.push([STATE_SKILL_TWO,41]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_MOVE,1,-1,false]);
         m_vStateCache.push([STATE_MOVE,3,-1,true]);
         m_vStateCache.push([STATE_SKILL_THREE,30]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_MOVE,8,-1,true]);
         m_vStateCache.push([STATE_SKILL_THREE_END,18,false]);
         m_vStateCache.push([STATE_SKILL_FOUR,23]);
         m_vStateCache.push([STATE_SKILL_FOUR_WAIT,15]);
         m_vStateCache.push([STATE_SKILL_FOUR_END,12]);
         m_vStateCache.push([STATE_WAITING,50]);
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
         this.CreateBalloonEffect(8,3);
         m_vStateCache.push([STATE_HIDE2,20]);
         m_vStateCache.push([STATE_BORN,31,8,3,0]);
         m_vStateCache.push([STATE_BORN_LOOP,11]);
         m_vStateCache.push([STATE_BORN_END,12]);
         m_vStateCache.push([STATE_WAITING2,20]);
         this.realColor = m_stRandomSeed.nextInt(3);
         m_bPostEnemy = true;
         this.isDead = false;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var stDataEvent:a_1778 = null;
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
               else if(a_1273 == 5)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 25)
               {
                  this.CreateBallEffect(7,3);
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 258 || a_1273 == 492)
               {
                  if(a_1283)
                  {
                     this.CreateBallEffect(1,3);
                  }
                  else
                  {
                     this.CreateBallEffect(7,3);
                  }
               }
               break;
            case STATE_SKILL_ONE_APPEAR_IN:
               if(a_1273 == 138 || a_1273 == 371)
               {
                  if(x < 240)
                  {
                     this.CreateBalloon2Effect2(5 + m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                     this.CreateBalloon2Effect2(5 + m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                     this.CreateBalloon2Effect2(5 + m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                     this.CreateBalloon2Effect2(5 + m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                  }
                  else
                  {
                     this.CreateBalloon2Effect2(m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                     this.CreateBalloon2Effect2(m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                     this.CreateBalloon2Effect2(m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                     this.CreateBalloon2Effect2(m_stRandomSeed.nextInt(3),2 + m_stRandomSeed.nextInt(3));
                  }
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 214 || a_1273 == 448)
               {
                  if(a_1283)
                  {
                     this.coinEffect1 = this.CreateCoinEffect(6,1);
                     this.coinEffect2 = this.CreateCoinEffect(6,5);
                  }
                  else
                  {
                     this.coinEffect1 = this.CreateCoinEffect(2,1);
                     this.coinEffect2 = this.CreateCoinEffect(2,5);
                  }
               }
               break;
            case STATE_MOVE:
               this.ClearFieldGridDefense2(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 177 || a_1273 == 411)
               {
                  this.CreateBabys();
               }
            case STATE_DEAD:
            case STATE_SKILL_DEAD:
               if(a_1273 == 545 || a_1273 == 551)
               {
                  stDataEvent = new a_1778("ReduceEnergy2");
                  stDataEvent.dataObject = 1000;
                  if(root)
                  {
                     root.dispatchEvent(stDataEvent);
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
         this.isDead = true;
         if(this.coinEffect1 != null)
         {
            this.coinEffect1.SetAnimation2(2);
            this.coinEffect1 = null;
         }
         if(this.coinEffect2 != null)
         {
            this.coinEffect2.SetAnimation2(2);
            this.coinEffect2 = null;
         }
         for(var i:int = 0; i < this.balloonEffects.length; i++)
         {
            this.balloonEffects[i].a_3969(this.balloonEffects[i].iLifeValue);
         }
         this.reallyBalloon.ReduceLifeReal();
         m_vStateCache.push([STATE_SKILL_DEAD,63]);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_FOUR_END);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_BORN_LOOP != m_iBossState && STATE_BORN_END != m_iBossState && STATE_HIDE2 != m_iBossState && STATE_WAITING2 != m_iBossState && STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0;
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
      
      private function CreateCoinEffect(iNoX:int, iNoY:int) : WBGreedyCoinEffect
      {
         var stFieldGrid:a_3491 = null;
         var coinEffect:WBGreedyCoinEffect = null;
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return null;
         }
         coinEffect = WBGreedyCoinEffect.a_3926();
         coinEffect.m_TargetFieldGrid = stFieldGrid;
         coinEffect.a_1797(false);
         coinEffect.x = iNoX * a_3491.a_1080 + 8;
         coinEffect.y = iNoY * a_3491.a_1081 + 10;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(coinEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(coinEffect);
         return coinEffect;
      }
      
      private function CreateBalloonEffect(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var balloon:WBGreedyBalloonMoveIntruder = WBGreedyBalloonMoveIntruder.a_3926();
         balloon.a_1797((globalMoveFighterID << 16) + grid1.m_iYGridNo,-1);
         balloon.m_stMoveIntruderTypeID = 134235457;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(balloon,grid1,false,BattleLayerDefine.INTRUDER_SKY_TYPE);
         balloon.SetPosition(iNoX,iNoY);
         this.reallyBalloon = balloon;
      }
      
      private function CreateBalloon2Effect(iNoX:int, iNoY:int) : WBGreedyBalloon2MoveIntruder
      {
         if(m_stCurrentFieldGrid == null)
         {
            return null;
         }
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var balloon:WBGreedyBalloon2MoveIntruder = WBGreedyBalloon2MoveIntruder.a_3926();
         balloon.a_1797((globalMoveFighterID << 16) + iNoY * 10 + iNoX,-1);
         balloon.m_stMoveIntruderTypeID = 134235458;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(balloon,grid1,false,BattleLayerDefine.INTRUDER_SKY_TYPE);
         balloon.SetPosition(iNoX,iNoY);
         this.balloonEffects.push(balloon);
         return balloon;
      }
      
      private function CreateBalloon2Effect2(iNoX:int, iNoY:int) : void
      {
         if(this.balloonEffects.length >= 14)
         {
            return;
         }
         var balloon2:WBGreedyBalloon2MoveIntruder = this.CreateBalloon2Effect(iNoX,iNoY);
         var index:int = int(m_stRandomSeed.nextInt(this.randomGrid.length));
         balloon2.InitRandomPos(this,this.randomGrid[index][0],this.randomGrid[index][1],true);
      }
      
      public function RemoveBalloon2Effect(ball:WBGreedyBalloon2MoveIntruder) : void
      {
         if(this.isDead)
         {
            return;
         }
         var index:int = this.balloonEffects.indexOf(ball);
         if(index != -1)
         {
            this.balloonEffects.splice(index,1);
         }
      }
      
      private function CreateBallEffect(iNoX:int, iNoY:int) : void
      {
         var ballEffect:WBGreedyBallMoveIntruder = null;
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         a_3502(stFieldGrid);
         ballEffect = WBGreedyBallMoveIntruder.a_3926();
         ballEffect.m_TargetFieldGrid = stFieldGrid;
         if(iNoX > 4)
         {
            ballEffect.a_1797(false);
            ballEffect.x = iNoX * a_3491.a_1080 + 8;
            ballEffect.y = iNoY * a_3491.a_1081 + 10;
         }
         else
         {
            ballEffect.a_1797(true);
            ballEffect.x = iNoX * a_3491.a_1080 + 41;
            ballEffect.y = iNoY * a_3491.a_1081 + 10;
         }
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(ballEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(ballEffect);
      }
      
      private function CreateBabys() : void
      {
         var array1:Array = [0,1,2];
         for(var i:int = 0; i < 3; i++)
         {
            if(i != this.realColor)
            {
               array1.push(i);
            }
         }
         var array:Array = shuffleArray(array1);
         var arrayBaby:Array = new Array();
         var baby1:WBGreedyBabyMoveIntruder = this.CreateBaby(array[0],4,0);
         var baby2:WBGreedyBabyMoveIntruder = this.CreateBaby(array[1],7,2);
         var baby3:WBGreedyBabyMoveIntruder = this.CreateBaby(array[2],6,6);
         var baby4:WBGreedyBabyMoveIntruder = this.CreateBaby(array[3],2,6);
         var baby5:WBGreedyBabyMoveIntruder = this.CreateBaby(array[4],1,2);
         arrayBaby.push(baby1);
         arrayBaby.push(baby2);
         arrayBaby.push(baby3);
         arrayBaby.push(baby4);
         arrayBaby.push(baby5);
         baby1.InitData(this.realColor,arrayBaby,1000);
         baby2.InitData(this.realColor,arrayBaby,1000);
         baby3.InitData(this.realColor,arrayBaby,1000);
         baby4.InitData(this.realColor,arrayBaby,1000);
         baby5.InitData(this.realColor,arrayBaby,1000);
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
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var stDataEvent:a_1778 = null;
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               CallChangeStep();
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
               SetIsCannotSee(true);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_NONE:
            case STATE_HIDE2:
               this.visible = false;
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
            case STATE_SKILL_ONE_BEGIN:
               a_1283 = m_vStateCache[0][2];
               break;
            case STATE_SKILL_ONE_APPEAR_OUT:
               this.reallyBalloon.CallChangePos();
               break;
            case STATE_SKILL_ONE_APPEAR_IN:
               setAppearToGrid(m_vStateCache[0][2],m_stCurrentFieldGrid.m_iYGridNo);
               a_1283 = m_vStateCache[0][4];
               break;
            case STATE_SKILL_THREE_END:
               a_1283 = m_vStateCache[0][2];
               if(this.coinEffect1 != null)
               {
                  this.coinEffect1.SetAnimation2(2);
                  this.coinEffect1 = null;
               }
               if(this.coinEffect2 != null)
               {
                  this.coinEffect2.SetAnimation2(2);
                  this.coinEffect2 = null;
               }
               break;
            case STATE_MOVE:
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),y,60 / (10 * 1.3));
               a_1283 = m_vStateCache[0][3];
               break;
            case STATE_DEAD:
            case STATE_SKILL_DEAD:
               a_1283 = false;
               SetIsCannotSee(true);
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

