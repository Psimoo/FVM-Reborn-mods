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
   
   public class WBGluttonyKing2BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DISAPPEAR:uint = 8;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 9;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 10;
      
      protected static const STATE_SKILL_ONE_END:uint = 11;
      
      protected static const STATE_SKILL_TWO_BEGIN:uint = 12;
      
      protected static const STATE_SKILL_TWO_LOOP:uint = 13;
      
      protected static const STATE_SKILL_THREE:uint = 14;
      
      protected static const STATE_SKILL_FOUR:uint = 15;
      
      protected static const STATE_SKILL_DEAD:uint = 16;
      
      protected var skill1Array:Array = new Array([0,7],[1,7],[0,8],[1,8],[5,7],[6,7],[5,8],[6,8]);
      
      protected var weaponEffect:WBBoss2WeaponEffect;
      
      protected var skill2Array:Array = new Array([0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0]);
      
      private var hasUseSkill2Array:Array = new Array();
      
      protected var skill3Array:Array = new Array([1,6],[1,7],[3,7],[5,6],[5,7]);
      
      protected var skill4Array:Array = new Array([0,0],[0,1],[0,2],[0,3],[0,4],[1,0],[1,1],[1,2],[1,3],[1,4],[5,0],[5,1],[5,2],[5,3],[5,4],[6,0],[6,1],[6,2],[6,3],[6,4]);
      
      protected var skill4Array1:Array = new Array([1,6],[2,6],[5,6],[6,6],[1,8],[2,8],[5,8],[6,8]);
      
      private var createFogIndex:int = 9;
      
      private var createLine:Array = [];
      
      private var createFogTick:int = 0;
      
      private var m_bHasHandleDie:Boolean = false;
      
      public function WBGluttonyKing2BossMoveIntruder()
      {
         super();
         a_1279 = -122;
         _bossStep = 2;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGluttonyKing2BossMoveIntruder) as WBGluttonyKing2BossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGluttonyKing2BossMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         if(this.weaponEffect != null)
         {
            this.weaponEffect.a_3940();
            this.weaponEffect = null;
         }
         super.a_3940();
         return true;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
      }
      
      protected function SkillOne() : void
      {
         GetRandomPos(this.skill1Array);
         m_vStateCache.push([STATE_APPEAR,8,iLastNoX,iLastNoY,0,0]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,27]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,20]);
         m_vStateCache.push([STATE_SKILL_ONE_END,13]);
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_NONE,20]);
      }
      
      private function CreateWeapon() : void
      {
         var stFieldGrid:a_3491 = null;
         var stEffect:WBBoss2WeaponEffect = null;
         if(this.weaponEffect != null)
         {
            this.weaponEffect.a_3940();
            this.weaponEffect = null;
         }
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 6,m_stCurrentFieldGrid.m_iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid != null)
         {
            a_3502(stFieldGrid);
            stEffect = WBBoss2WeaponEffect.a_3926();
            stEffect.targetGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
            this.weaponEffect = stEffect;
         }
      }
      
      private function BackWeapon() : void
      {
         if(this.weaponEffect == null)
         {
            return;
         }
         this.weaponEffect.SetAnimation2(2);
         this.weaponEffect = null;
      }
      
      protected function SkillTwo() : void
      {
         GetRandomPos(this.skill2Array);
         m_vStateCache.push([STATE_APPEAR,8,iLastNoX,iLastNoY,0,1]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,13]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,9999]);
      }
      
      protected function SkillThree() : void
      {
         GetRandomPos(this.skill3Array);
         m_vStateCache.push([STATE_NONE,30]);
         m_vStateCache.push([STATE_SKILL_THREE,62,iLastNoX,iLastNoY,0]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_NONE,40]);
      }
      
      protected function SkillFour() : void
      {
         GetRandomPos(this.skill4Array1);
         m_vStateCache.push([STATE_APPEAR,8,iLastNoX,iLastNoY,0,0]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_FOUR,39]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_NONE,40]);
      }
      
      public function CreateFlys() : void
      {
         this.CreateFly(3,0);
         this.CreateFly(3,1);
         this.CreateFly(5,2);
         this.CreateFly(5,3);
         this.CreateFly(5,4);
         this.CreateFly(3,5);
         this.CreateFly(3,6);
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
         this.DoCreateLine2(iNoY - 1);
         this.DoCreateLine2(iNoY);
         this.DoCreateLine2(iNoY + 1);
      }
      
      private function CreateHamburger(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = null;
         var burgerSolider:WBHamburgerSolider2MouseMoveIntruder = null;
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         burgerSolider = WBHamburgerSolider2MouseMoveIntruder.a_3926();
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
            flySolider.x = grid.m_iXGridNo * a_3491.a_1080 + 20;
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
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillOne);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 5;
         m_vStateCache.push([STATE_BORN,6,5,0]);
         m_vStateCache.push([STATE_NONE,30]);
         this.createLine = [];
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var g:int = 0;
         var stFieldGrid:a_3491 = null;
         var array:Array = null;
         if(this.createLine.length > 0 && iCurrentTime % 6 == 0 && this.createFogIndex < 9 && m_stCurrentFieldGrid != null)
         {
            for(g = 0; g < this.createLine.length; g++)
            {
               this.AddEffect(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.createFogIndex,this.createLine[g]));
            }
            ++this.createFogIndex;
         }
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 5)
               {
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  a_3502(stFieldGrid);
               }
               if(a_1273 == 12)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_APPEAR:
               if(a_1273 == 73 || a_1273 == 286)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_TWO_BEGIN:
               if(a_1273 == 140 || a_1273 == 355)
               {
                  a_1465 = 3;
               }
               break;
            case STATE_SKILL_TWO_LOOP:
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 170 || a_1273 == 388)
               {
                  a_1465 = 0;
                  a_3502(m_stCurrentFieldGrid);
               }
               if(a_1273 == 212 || a_1273 == 428)
               {
                  this.CreateFlys();
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 252 || a_1273 == 458)
               {
                  array = shuffleArray(this.skill4Array);
                  this.CreateHamburger(array[0][1],array[0][0]);
                  this.CreateHamburger(array[1][1],array[1][0]);
                  this.CreateHamburger(array[2][1],array[2][0]);
               }
               break;
            case STATE_SKILL_DEAD:
               if(a_1273 == 483)
               {
                  CallChangeStep();
               }
               else if(a_1273 == 504)
               {
                  this.CreateFly(7,0);
                  this.CreateFly(7,1);
                  this.CreateFly(7,2);
                  this.CreateFly(7,3);
                  this.CreateFly(7,4);
                  this.CreateFly(7,5);
                  this.CreateFly(7,6);
               }
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
      
      private function HandleDie() : void
      {
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_APPEAR,8,6,3,0,0]);
         m_vStateCache.push([STATE_SKILL_DEAD,66]);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_FOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_TWO_LOOP;
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
               iNextValue = 42;
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_NONE:
               SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_DISAPPEAR:
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_ONE_LOOP:
               this.CreateWeapon();
               break;
            case STATE_SKILL_ONE_END:
               this.BackWeapon();
               break;
            case STATE_SKILL_TWO_LOOP:
               this.createLine.length = 0;
               this.DoCreateLine(iLastNoY);
               if(this.createLine.length > 0)
               {
                  this.createFogIndex = 0;
               }
               iNextValue = setMoveToPosition(getPosXByXGridNo(12),getPosYByYGridNo(m_stCurrentFieldGrid.m_iYGridNo),-20);
               break;
            case STATE_SKILL_THREE:
               a_1283 = false;
               SetIsCannotSee(false);
               this.visible = true;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_SKILL_FOUR:
               a_1283 = false;
               break;
            case STATE_APPEAR:
               a_1283 = m_vStateCache[0][5] == 1;
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
            case STATE_SKILL_DEAD:
               SetIsCannotSee(true);
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

