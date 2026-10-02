package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.utils.Dictionary;
   
   public class WBGluttonyKing1BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_SPECIAL_WAITING:uint = 7;
      
      protected static const STATE_DISAPPEAR:uint = 8;
      
      protected static const STATE_SKILL_ONE:uint = 9;
      
      protected static const STATE_SKILL_TWO_BEGIN:uint = 10;
      
      protected static const STATE_SKILL_TWO_LOOP:uint = 11;
      
      protected static const STATE_SKILL_TWO_DISAPPEAR:uint = 12;
      
      protected static const STATE_SKILL_THREE:uint = 13;
      
      protected static const STATE_SKILL_FOUR:uint = 14;
      
      protected static const STATE_SKILL_DEAD_BEGIN:uint = 15;
      
      protected static const STATE_SKILL_DEAD_LOOP:uint = 16;
      
      private var createFogIndex:int = 0;
      
      private var createLine:Array = [];
      
      private var createFogTick:int = 0;
      
      protected var skill1Array:Array = new Array([2,5],[2,6],[4,5],[4,6],[5,5],[5,6],[6,5],[6,6]);
      
      protected var skill2Array:Array = new Array([0,7],[0,8],[1,7],[1,8],[2,7],[2,8],[4,7],[4,8],[5,7],[5,8],[6,7],[6,8]);
      
      private var hasUseSkill2Array:Array = new Array();
      
      protected var skill3Array:Array = new Array([0,6],[0,7],[0,8],[3,6],[3,7],[3,8],[6,6],[6,7],[6,8]);
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var skill5Array:Array = new Array([0,8],[1,8],[5,8],[6,8]);
      
      public function WBGluttonyKing1BossMoveIntruder()
      {
         super();
         _bossStep = 1;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGluttonyKing1BossMoveIntruder) as WBGluttonyKing1BossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         super.a_3940();
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGluttonyKing1BossMoveIntruderMovie;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DISAPPEAR + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_BEGIN + "_" + 0] = 24;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_LOOP + "_" + 0] = 25;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 24;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DISAPPEAR + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_BEGIN + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_SKILL_DEAD_LOOP + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 24;
      }
      
      protected function SkillOne() : void
      {
         GetRandomPos(this.skill1Array);
         m_vStateCache.push([STATE_DISAPPEAR,6]);
         m_vStateCache.push([STATE_NONE,20]);
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0]);
         m_vStateCache.push([STATE_SKILL_ONE,53]);
         iLastNoX -= 2;
         m_vStateCache.push([STATE_DISAPPEAR,6,-1,iLastNoX,iLastNoY]);
         m_vStateCache.push([STATE_NONE,20]);
      }
      
      protected function SkillTwo() : void
      {
         GetRandomPos(this.skill2Array);
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,20]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,22]);
         m_vStateCache.push([STATE_SKILL_TWO_DISAPPEAR,13]);
         m_vStateCache.push([STATE_NONE,20 + 20]);
      }
      
      protected function SkillThree() : void
      {
         GetRandomPos(this.skill3Array);
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_THREE,29]);
         m_vStateCache.push([STATE_SPECIAL_WAITING,14]);
         m_vStateCache.push([STATE_WAITING,20 + 20]);
      }
      
      public function CreateFlys() : void
      {
         var array:Array = shuffleArray([0,1,2,3,4,5,6]);
         this.CreateFly(7,array[0]);
         this.CreateFly(7,array[1]);
         this.CreateFly(7,array[2]);
      }
      
      public function DoCreateLine2(iNoY:int) : void
      {
         if(this.hasUseSkill2Array.indexOf(iNoY) == -1)
         {
            this.hasUseSkill2Array.push(iNoY);
            this.createLine.push(iNoY);
         }
      }
      
      public function DoCreateLine(iNoY:int) : void
      {
         this.DoCreateLine2(iNoY);
      }
      
      private function CreateHamburger(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = null;
         var burgerSolider:WBHamburgerSoliderMouseMoveIntruder = null;
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         burgerSolider = WBHamburgerSoliderMouseMoveIntruder.a_3926();
         if(burgerSolider)
         {
            burgerSolider.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
            burgerSolider.m_stMoveIntruderTypeID = 134235394;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(burgerSolider,grid,false);
            burgerSolider.x = grid.m_iXGridNo * a_3491.a_1080;
            burgerSolider.y = grid.m_iYGridNo * a_3491.a_1081;
            burgerSolider.CreateTarget(grid.m_iXGridNo,grid.m_iYGridNo);
            burgerSolider.m_stBoss = this;
         }
      }
      
      protected function CreateFly(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = null;
         var flySolider:WBFlySoliderMouseMoveIntruder = null;
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         flySolider = WBFlySoliderMouseMoveIntruder.a_3926();
         if(flySolider)
         {
            flySolider.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
            flySolider.m_stMoveIntruderTypeID = 134235393;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(flySolider,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            flySolider.x = grid.m_iXGridNo * a_3491.a_1080;
            flySolider.y = grid.m_iYGridNo * a_3491.a_1081;
         }
      }
      
      protected function AddEffect(stFieldGrid:a_3491) : void
      {
         var stEffect:WBFogEffect = null;
         if(stFieldGrid != null)
         {
            stEffect = WBFogEffect.a_3926();
            stEffect.m_TargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 32;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 35;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         }
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
         iLastNoX = 7;
         iLastNoY = 4;
         m_vStateCache.push([STATE_BORN,7,4,0]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
         this.createLine = [];
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var g:int = 0;
         if(this.createLine.length > 0 && iCurrentTime % 4 == 0 && this.createFogIndex >= 0 && m_stCurrentFieldGrid != null)
         {
            for(g = 0; g < this.createLine.length; g++)
            {
               this.AddEffect(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.createFogIndex,this.createLine[g]));
            }
            --this.createFogIndex;
         }
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 46)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 130 || a_1273 == 360)
               {
                  a_1465 = 3;
               }
               else if(a_1273 == 137 || a_1273 == 367)
               {
                  a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iLastNoX - 1,iLastNoY));
                  a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iLastNoX - 2,iLastNoY));
                  a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iLastNoX - 3,iLastNoY));
               }
               else if(a_1273 == 144 || a_1273 == 374)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
               }
               else if(a_1273 == 147 || a_1273 == 377)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeToFieldGrid(stTargetFieldGrid);
                  a_1465 = 0;
               }
               break;
            case STATE_SKILL_TWO_BEGIN:
               if(a_1273 == 182 || a_1273 == 412)
               {
                  a_1465 = 3;
               }
               else if(a_1273 == 192 || a_1273 == 422)
               {
                  this.createLine.length = 0;
                  this.DoCreateLine(iLastNoY);
                  if(this.createLine.length > 0)
                  {
                     this.createFogIndex = 8;
                  }
               }
               break;
            case STATE_SKILL_TWO_DISAPPEAR:
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 237 || a_1273 == 467)
               {
                  this.CreateFlys();
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 275 || a_1273 == 505)
               {
                  this.CreateHamburger(m_stRandomSeed.nextInt(3) + 1,m_stRandomSeed.nextInt(5) + 1);
               }
               break;
            case STATE_SKILL_DEAD_BEGIN:
               if(a_1273 == 520)
               {
                  CallChangeStep();
               }
               break;
            case STATE_SKILL_DEAD_LOOP:
               a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(iDefenseTypeID == 286851424 || iDefenseTypeID == 286851408 || iDefenseTypeID == 286851614 || iDefenseTypeID == 286851615)
         {
            this.hasUseSkill2Array.length = 0;
         }
      }
      
      protected function SkillFour() : void
      {
         var iNoY:int = 1 + m_stRandomSeed.nextInt(2) * 3 + m_stRandomSeed.nextInt(2);
         while(iNoY == iLastNoY)
         {
            iNoY = 1 + m_stRandomSeed.nextInt(2) * 3 + m_stRandomSeed.nextInt(2);
         }
         iLastNoY = iNoY;
         m_vStateCache.push([STATE_MOVE,iLastNoX,iLastNoY]);
         m_vStateCache.push([STATE_SKILL_FOUR,33]);
         m_vStateCache.push([STATE_WAITING,10]);
      }
      
      private function HandleDie() : void
      {
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         GetRandomPos(this.skill5Array);
         m_vStateCache.push([STATE_DISAPPEAR,6]);
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0]);
         m_vStateCache.push([STATE_SKILL_DEAD_BEGIN,27]);
         m_vStateCache.push([STATE_SKILL_DEAD_LOOP,-6,iLastNoY]);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE && m_iBossState <= STATE_SKILL_FOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_DEAD_LOOP;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0;
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
            if(a_1273 == a_1274)
            {
               gotoAndStop(544);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
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
               iNextValue = 54;
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_NONE:
               SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_DISAPPEAR:
               SetIsCannotSee(true);
               if(m_vStateCache[0][2] == -1)
               {
                  setAppearToGrid(m_vStateCache[0][3],m_vStateCache[0][4]);
               }
               break;
            case STATE_SKILL_TWO_DISAPPEAR:
               SetIsCannotSee(true);
               break;
            case STATE_SPECIAL_WAITING:
               break;
            case STATE_APPEAR:
               SetIsCannotSee(false);
               this.visible = true;
               a_1465 = 0;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_WAITING:
               break;
            case STATE_MOVE:
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]));
               break;
            case STATE_SKILL_DEAD_BEGIN:
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_DEAD_LOOP:
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]),19);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.hasUseSkill2Array.length = 0;
         this.m_bHasHandleDie = false;
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
      }
   }
}

