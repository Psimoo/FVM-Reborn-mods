package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class WBGreedyKing3BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DOWN:uint = 7;
      
      protected static const STATE_AIR_WAIT:uint = 8;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 9;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 10;
      
      protected static const STATE_SKILL_ONE_END:uint = 11;
      
      protected static const STATE_SKILL_ONE_APPEAR_OUT:uint = 12;
      
      protected static const STATE_SKILL_ONE_APPEAR_IN:uint = 13;
      
      protected static const STATE_SKILL_TWO:uint = 14;
      
      protected static const STATE_SKILL_THREE_BEGIN:uint = 15;
      
      protected static const STATE_SKILL_THREE_END:uint = 16;
      
      protected static const STATE_SKILL_FOUR:uint = 17;
      
      protected static const STATE_LAND_WAIT:uint = 18;
      
      protected static const STATE_SKILL_FIVE:uint = 19;
      
      protected static const STATE_LAND_TO_AIR:uint = 20;
      
      protected static const STATE_HIDE:uint = 21;
      
      protected static const STATE_MOVE:uint = 22;
      
      protected static const STATE_HIDE2:uint = 25;
      
      private var realColor:int = 0;
      
      private var coinEffect1:WBGreedyCoin2Effect;
      
      private var coinEffect2:WBGreedyCoin2Effect;
      
      private var coinEffect3:WBGreedyCoin2Effect;
      
      private var m_iSkill1Count:int = 0;
      
      private var m_skillArray:Array = [[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[8,0],[8,1],[8,2],[8,3],[8,4],[8,5],[8,6]];
      
      private var m_iTargetBossNoY:int = 0;
      
      private var m_iTargetActorNoY:int = 0;
      
      private var mouse1:WBGreedyActor2MoveIntruder;
      
      private var mouse2:WBGreedyActor2MoveIntruder;
      
      private var mouse3:WBGreedyActor2MoveIntruder;
      
      private var mouse4:WBGreedyActor2MoveIntruder;
      
      private var eggArray:Array = new Array();
      
      public function WBGreedyKing3BossMoveIntruder()
      {
         super();
         a_1279 = -122;
         m_iYDisplayCenterPos = -336;
         _bossStep = 3;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyKing3BossMoveIntruder) as WBGreedyKing3BossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyKing3BossMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_DOWN + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_AIR_WAIT + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_OUT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_IN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_LAND_WAIT + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FIVE + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_LAND_TO_AIR + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_DOWN + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_AIR_WAIT + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_OUT + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_APPEAR_IN + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_LAND_WAIT + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FIVE + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_LAND_TO_AIR + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_HIDE2 + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_HIDE2 + "_" + 1] = 3;
      }
      
      protected function SkillOne() : void
      {
         m_vStateCache.length = 0;
         if(this.m_iSkill1Count != 0)
         {
            this.m_iTargetBossNoY = 1 + m_stRandomSeed.nextInt(4);
            m_vStateCache.push([STATE_DOWN,9,7,this.m_iTargetBossNoY]);
         }
         this.m_iTargetActorNoY = 1 + m_stRandomSeed.nextInt(2);
         ++this.m_iSkill1Count;
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,20]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,14]);
         m_vStateCache.push([STATE_SKILL_ONE_END,8]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_OUT,13]);
         m_vStateCache.push([STATE_SKILL_ONE_APPEAR_IN,16,2,this.m_iTargetActorNoY]);
         m_vStateCache.push([STATE_MOVE,30,1]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      protected function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,24,4,4]);
         m_vStateCache.push([STATE_DOWN,9,4,3]);
         m_vStateCache.push([STATE_SKILL_TWO,33]);
         m_vStateCache.push([STATE_MOVE,30,0]);
         m_vStateCache.push([STATE_HIDE2,30]);
         m_vStateCache.push([STATE_SKILL_THREE_END,24,4,4]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      protected function SkillFour() : void
      {
         m_vStateCache.length = 0;
         var index:int = int(m_stRandomSeed.nextInt(this.m_skillArray.length));
         m_vStateCache.push([STATE_DOWN,9,this.m_skillArray[index][0],this.m_skillArray[index][1]]);
         m_vStateCache.push([STATE_SKILL_FOUR,39]);
         m_vStateCache.push([STATE_LAND_WAIT,40]);
         m_vStateCache.push([STATE_LAND_TO_AIR,20]);
         m_vStateCache.push([STATE_MOVE,30,0]);
         m_vStateCache.push([STATE_HIDE2,50]);
      }
      
      protected function SkillFive() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FIVE,56,4,3]);
         m_vStateCache.push([STATE_LAND_WAIT,40]);
         m_vStateCache.push([STATE_LAND_TO_AIR,20]);
         m_vStateCache.push([STATE_MOVE,50,0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillFive);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 7;
         iLastNoY = 4;
         this.realColor = m_stRandomSeed.nextInt(3);
         m_vStateCache.push([STATE_BORN,39,4,5]);
         m_vStateCache.push([STATE_DOWN,9,7,4]);
         this.m_iTargetBossNoY = 4;
         m_vStateCache.push([STATE_AIR_WAIT,20]);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var iNoY:int = 0;
         var i:int = 0;
         var stFieldGridVector:Array = null;
         var grid:a_3491 = null;
         var indexX:int = 0;
         var indexY:int = 0;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 2)
               {
                  this.mouse1 = this.CreateActor(2,5);
                  this.mouse1.CallBirth1();
               }
               else if(a_1273 == 13)
               {
                  this.mouse2 = this.CreateActor(6,5);
                  this.mouse2.CallBirth1();
               }
               break;
            case STATE_APPEAR:
               if(a_1273 == 68)
               {
                  m_iRestTick = 0;
                  this.SkillFive();
               }
               break;
            case STATE_SKILL_ONE_APPEAR_OUT:
               if(a_1273 == 116)
               {
                  this.mouse1.CallChange();
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 171)
               {
                  this.CreateBabys();
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 230)
               {
                  a_1465 = 0;
                  RemoveTag(2);
                  RemoveTag(3);
                  a_3502(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 242)
               {
                  this.eggArray.length = 0;
                  iNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  if(x >= 240)
                  {
                     for(indexX = 2; indexX <= 7; indexX++)
                     {
                        this.eggArray.push([indexX,iNoY]);
                     }
                  }
                  else
                  {
                     for(indexX = 2; indexX <= 5; indexX++)
                     {
                        this.eggArray.push([indexX,iNoY - 1]);
                        this.eggArray.push([indexX,iNoY + 1]);
                     }
                  }
               }
               else if(a_1273 == 265)
               {
                  for(i = 0; i < this.eggArray.length; i++)
                  {
                     this.CreateHoleEffect(this.eggArray[i][0],this.eggArray[i][1]);
                  }
               }
               break;
            case STATE_LAND_TO_AIR:
               if(a_1273 == 351)
               {
                  a_1465 = 3;
                  AddTag(2);
                  AddTag(3);
               }
               break;
            case STATE_SKILL_THREE_BEGIN:
               if(a_1273 == 179)
               {
                  this.mouse1 = this.CreateActor(0,4);
                  this.mouse1.CallBirth3();
                  this.mouse2 = this.CreateActor(2,2);
                  this.mouse2.CallBirth3();
                  this.mouse3 = this.CreateActor(6,2);
                  this.mouse3.CallBirth3();
                  this.mouse4 = this.CreateActor(8,4);
                  this.mouse4.CallBirth3();
               }
               else if(a_1273 == 194)
               {
                  this.coinEffect1 = this.CreateCoinEffect(1,5);
               }
               else if(a_1273 == 197)
               {
                  this.coinEffect2 = this.CreateCoinEffect(4,5);
               }
               else if(a_1273 == 200)
               {
                  this.coinEffect3 = this.CreateCoinEffect(7,5);
               }
               break;
            case STATE_SKILL_THREE_END:
               if(a_1273 == 206)
               {
                  if(this.coinEffect3 != null)
                  {
                     this.coinEffect3.SetAnimation2(2);
                     this.coinEffect3 = null;
                  }
               }
               else if(a_1273 == 208)
               {
                  if(this.coinEffect2 != null)
                  {
                     this.coinEffect2.SetAnimation2(2);
                     this.coinEffect2 = null;
                  }
               }
               else if(a_1273 == 210)
               {
                  if(this.coinEffect1 != null)
                  {
                     this.coinEffect1.SetAnimation2(2);
                     this.coinEffect1 = null;
                  }
               }
               else if(a_1273 == 226)
               {
                  this.mouse1.CallDie2();
                  this.mouse2.CallDie2();
                  this.mouse3.CallDie2();
                  this.mouse4.CallDie2();
               }
               break;
            case STATE_SKILL_FIVE:
               if(a_1273 == 282)
               {
                  this.mouse1 = this.CreateActor(2,5);
                  this.mouse1.CallBirth4();
               }
               else if(a_1273 == 292)
               {
                  this.mouse2 = this.CreateActor(6,5);
                  this.mouse2.CallBirth4();
               }
               else if(a_1273 == 336)
               {
                  this.mouse1.CallDie();
                  this.mouse2.CallDie();
               }
               else if(a_1273 == 293)
               {
                  a_1465 = 0;
                  RemoveTag(2);
                  RemoveTag(3);
                  for(indexY = 2; indexY <= 4; indexY++)
                  {
                     for(indexX = 3; indexX <= 5; indexX++)
                     {
                        a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(indexX,indexY));
                     }
                  }
               }
               else if(a_1273 == 325)
               {
                  stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
                  for(indexY = 0; indexY < BattleFieldView.a_1012; indexY++)
                  {
                     for(indexX = 0; indexX < BattleFieldView.a_1011; indexX++)
                     {
                        grid = stFieldGridVector[indexY][indexX];
                        if(grid.m_stAttackFighter != null)
                        {
                           grid.m_stAttackFighter.SleepTime2(20 * 15);
                        }
                     }
                  }
               }
         }
         return true;
      }
      
      private function CreateCoinEffect(iNoX:int, iNoY:int) : WBGreedyCoin2Effect
      {
         var stFieldGrid:a_3491 = null;
         var coinEffect:WBGreedyCoin2Effect = null;
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return null;
         }
         coinEffect = WBGreedyCoin2Effect.a_3926();
         coinEffect.m_TargetFieldGrid = stFieldGrid;
         coinEffect.a_1797(false);
         coinEffect.x = iNoX * a_3491.a_1080 + 8;
         coinEffect.y = iNoY * a_3491.a_1081 + 10;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(coinEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(coinEffect);
         return coinEffect;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_FOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(m_iBossState == STATE_SKILL_FIVE)
         {
            return a_1273 > 295;
         }
         return STATE_SKILL_THREE_BEGIN != m_iBossState && STATE_SKILL_THREE_END != m_iBossState && STATE_HIDE2 != m_iBossState && STATE_SKILL_ONE_APPEAR_OUT != m_iBossState && STATE_SKILL_ONE_APPEAR_IN != m_iBossState && STATE_HIDE != m_iBossState && STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0;
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
         if(m_iBossState != STATE_DEAD && a_1339 <= 0)
         {
            LifeIsZeroHandle(STATE_DEAD);
            return false;
         }
         if(m_iBossState == STATE_DEAD)
         {
            nextFrame();
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
         var iNextState:uint = 0;
         var iNextValue:int = 0;
         var stDataEvent:a_1778 = null;
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         iNextState = uint(m_vStateCache[0][0]);
         iNextValue = int(m_vStateCache[0][1]);
         switch(iNextState)
         {
            case STATE_BORN:
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_NONE:
            case STATE_HIDE:
            case STATE_HIDE2:
               SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_DOWN:
               SetIsCannotSee(false);
               this.visible = true;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_SKILL_ONE_APPEAR_IN:
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_SKILL_ONE_BEGIN:
               SetIsCannotSee(false);
               this.mouse1 = this.CreateActor(2,this.m_iTargetActorNoY);
               this.mouse1.iTargetNoY = this.m_iTargetBossNoY;
               this.mouse1.CallBirth2();
               break;
            case STATE_SKILL_ONE_LOOP:
               break;
            case STATE_SKILL_ONE_END:
               stDataEvent = new a_1778("ReduceEnergy");
               stDataEvent.dataObject = 1000;
               if(root)
               {
                  root.dispatchEvent(stDataEvent);
               }
               break;
            case STATE_SKILL_THREE_END:
            case STATE_SKILL_FIVE:
               SetIsCannotSee(false);
               this.visible = true;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_SKILL_THREE_BEGIN:
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_SKILL_FOUR:
               break;
            case STATE_APPEAR:
               SetIsCannotSee(false);
               this.visible = true;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_WAITING:
               SetIsCannotSee(false);
               break;
            case STATE_MOVE:
               if(m_vStateCache[0][2] == 1)
               {
                  this.mouse1.CallDie2();
               }
               iNextValue = setMoveToPosition(x,-250,12);
         }
         a_1283 = x <= 240;
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function CreateBabys() : void
      {
         var array1:Array = [0,1,2];
         var array2:Array = shuffleArray(array1);
         var array3:Array = [0,1,2];
         var array4:Array = shuffleArray(array3);
         var arrayBaby:Array = new Array();
         var baby1:WBGreedyBabyMoveIntruder = this.CreateBaby(array2[0],1,1);
         var baby2:WBGreedyBabyMoveIntruder = this.CreateBaby(array2[1],1,3);
         var baby3:WBGreedyBabyMoveIntruder = this.CreateBaby(array2[2],1,5);
         var baby4:WBGreedyBabyMoveIntruder = this.CreateBaby(array4[0],7,1);
         var baby5:WBGreedyBabyMoveIntruder = this.CreateBaby(array4[1],7,3);
         var baby6:WBGreedyBabyMoveIntruder = this.CreateBaby(array4[2],7,5);
         arrayBaby.push(baby1);
         arrayBaby.push(baby2);
         arrayBaby.push(baby3);
         arrayBaby.push(baby4);
         arrayBaby.push(baby5);
         arrayBaby.push(baby6);
         baby1.InitData(this.realColor,arrayBaby,1000);
         baby2.InitData(this.realColor,arrayBaby,1000);
         baby3.InitData(this.realColor,arrayBaby,1000);
         baby4.InitData(this.realColor,arrayBaby,1000);
         baby5.InitData(this.realColor,arrayBaby,1000);
         baby6.InitData(this.realColor,arrayBaby,1000);
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
      
      private function CreateActor(iNoX:int, iNoY:int) : WBGreedyActor2MoveIntruder
      {
         var actor:WBGreedyActor2MoveIntruder = null;
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         actor = WBGreedyActor2MoveIntruder.a_3926();
         actor.a_1797((globalMoveFighterID << 16) + grid1.m_iYGridNo,-1);
         actor.m_stMoveIntruderTypeID = 134235475;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(actor,grid1,false,BattleLayerDefine.INTRUDER_SKY_TYPE);
         actor.x = grid1.m_iXGridNo * a_3491.a_1080 + 30;
         actor.y = grid1.m_iYGridNo * a_3491.a_1081 + 32;
         return actor;
      }
      
      private function CreateHoleEffect(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         var balloon:WBGreedyHoleMoveIntruder = WBGreedyHoleMoveIntruder.a_3926();
         balloon.a_1797((globalMoveFighterID << 16) + grid1.m_iYGridNo,-1);
         balloon.m_stMoveIntruderTypeID = 134235473;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(balloon,grid1,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         balloon.x = iNoX * a_3491.a_1080 + 30;
         balloon.y = iNoY * a_3491.a_1081 + 32;
      }
      
      protected function HasDefense(iNoX:int, iNoY:int) : Boolean
      {
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) || null != stFieldGrid.m_stProtector || null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stTrayDefense)
         {
            return true;
         }
         return false;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         a_1465 = 3;
         AddTag(2);
         AddTag(3);
         this.m_iSkill1Count = 0;
      }
   }
}

