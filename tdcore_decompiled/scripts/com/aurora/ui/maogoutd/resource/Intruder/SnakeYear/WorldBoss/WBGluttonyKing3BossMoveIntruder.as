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
   
   public class WBGluttonyKing3BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DISAPPEAR:uint = 8;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 9;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 10;
      
      protected static const STATE_SKILL_ONE_END:uint = 11;
      
      protected static const STATE_SKILL_TWO:uint = 12;
      
      protected static const STATE_SKILL_THREE_BEGIN:uint = 13;
      
      protected static const STATE_SKILL_THREE_LOOP:uint = 14;
      
      protected static const STATE_SKILL_THREE_END:uint = 15;
      
      protected static const STATE_SKILL_FOUR:uint = 16;
      
      protected static const STATE_SKILL_FIVE_MOVE_BEGIN:uint = 17;
      
      protected static const STATE_SKILL_FIVE_MOVE_LOOP:uint = 18;
      
      protected static const STATE_SKILL_FIVE_BEGIN:uint = 19;
      
      protected static const STATE_SKILL_FIVE_LOOP:uint = 20;
      
      protected static const STATE_SKILL_FIVE_END:uint = 21;
      
      protected var skill1Array:Array = new Array([1,8],[2,8],[3,8],[4,8],[5,8]);
      
      protected var weaponEffect:WBBoss3WeaponEffect;
      
      protected var skill3Array:Array = new Array([1,6],[2,6],[3,6],[4,6],[5,6]);
      
      protected var skill4Array:Array = new Array([0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[6,0],[6,1],[6,2],[6,3],[6,4],[6,5]);
      
      private var hasUseSkill2:Boolean = false;
      
      private var change2Skill5:Boolean = false;
      
      private var change2Skill5Damage:int = 0;
      
      public function WBGluttonyKing3BossMoveIntruder()
      {
         super();
         a_1279 = -168;
         m_iYDisplayCenterPos = -50;
         _bossStep = 3;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGluttonyKing3BossMoveIntruder) as WBGluttonyKing3BossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGluttonyKing3BossMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
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
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_MOVE_BEGIN + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_MOVE_LOOP + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_MOVE_BEGIN + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_MOVE_LOOP + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 17;
      }
      
      protected function SkillOne() : void
      {
         m_vStateCache.length = 0;
         GetRandomPos(this.skill1Array);
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,21]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,50]);
         m_vStateCache.push([STATE_SKILL_ONE_END,17]);
         m_vStateCache.push([STATE_DISAPPEAR,8]);
         m_vStateCache.push([STATE_NONE,30]);
      }
      
      private function CreateWeapon() : void
      {
         var grid:a_3491 = null;
         var weapon:WBBoss3WeaponEffect = null;
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 6,m_stCurrentFieldGrid.m_iYGridNo);
         if(grid == null)
         {
            return;
         }
         weapon = WBBoss3WeaponEffect.a_3926();
         if(weapon)
         {
            weapon.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,-1);
            weapon.m_stMoveIntruderTypeID = 134235398;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(weapon,grid,false,BattleLayerDefine.EFFECTS_TOP_TYPE);
            weapon.x = grid.m_iXGridNo * a_3491.a_1080;
            weapon.y = grid.m_iYGridNo * a_3491.a_1081;
            this.weaponEffect = weapon;
         }
      }
      
      private function BackWeapon() : void
      {
         if(this.weaponEffect == null)
         {
            return;
         }
         this.weaponEffect.ForceDamage();
         this.weaponEffect = null;
      }
      
      protected function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 8;
         iLastNoY = 3;
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0,1]);
         m_vStateCache.push([STATE_SKILL_TWO,34]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_DISAPPEAR,8]);
         m_vStateCache.push([STATE_NONE,30]);
      }
      
      protected function SkillThree() : void
      {
         m_vStateCache.length = 0;
         GetRandomPos(this.skill3Array);
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0,1]);
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,10]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP,10]);
         m_vStateCache.push([STATE_SKILL_THREE_END,18]);
         m_vStateCache.push([STATE_WAITING,30]);
         m_vStateCache.push([STATE_DISAPPEAR,8]);
         m_vStateCache.push([STATE_NONE,50]);
      }
      
      protected function SkillFour() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 8;
         iLastNoY = 3;
         m_vStateCache.push([STATE_APPEAR,5,iLastNoX,iLastNoY,0,1]);
         m_vStateCache.push([STATE_SKILL_FOUR,30]);
         m_vStateCache.push([STATE_NONE,50]);
      }
      
      protected function SkillFive() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FIVE_MOVE_BEGIN,6]);
         m_vStateCache.push([STATE_SKILL_FIVE_MOVE_LOOP,4,4,0]);
         m_vStateCache.push([STATE_SKILL_FIVE_BEGIN,4]);
         m_vStateCache.push([STATE_SKILL_FIVE_LOOP,12]);
         m_vStateCache.push([STATE_SKILL_FIVE_END,15]);
         m_vStateCache.push([STATE_WAITING,50]);
         m_vStateCache.push([STATE_DISAPPEAR,8]);
      }
      
      public function CreateFlys() : void
      {
         this.CreateFly(8,1);
         this.CreateFly(8,2);
         this.CreateFly(8,3);
         this.CreateFly(8,4);
         this.CreateFly(8,5);
         this.CreateFly(5,0);
         this.CreateFly(5,1);
         this.CreateFly(5,5);
         this.CreateFly(5,6);
         this.CreateFly(3,2);
         this.CreateFly(3,3);
         this.CreateFly(3,4);
         this.CreateFly(0,1,true);
         this.CreateFly(0,2,true);
         this.CreateFly(0,3,true);
         this.CreateFly(0,4,true);
         this.CreateFly(0,5,true);
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
      
      protected function CreateFly(iNoX:int, iNoY:int, bReverse:Boolean = false) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         var flySolider:WBFlySoliderMouseMoveIntruder = WBFlySoliderMouseMoveIntruder.a_3926();
         if(flySolider)
         {
            flySolider.a_1797((globalMoveFighterID << 16) + grid.m_iYGridNo,bReverse ? 1 : -1);
            flySolider.m_stMoveIntruderTypeID = 134235393;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(flySolider,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            if(bReverse)
            {
               flySolider.x = grid.m_iXGridNo * a_3491.a_1080 + 40;
            }
            else
            {
               flySolider.x = grid.m_iXGridNo * a_3491.a_1080 + 20;
            }
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
         this.hasUseSkill2 = false;
         m_vStateCache.length = 0;
         iLastNoX = 7;
         iLastNoY = 4;
         m_vStateCache.push([STATE_BORN,7,4,0]);
         m_vStateCache.push([STATE_NONE,20]);
      }
      
      private function CreateEtChat(iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var stEffect:WBEtchatEffect = null;
         stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         if(stFieldGrid != null)
         {
            stEffect = WBEtchatEffect.a_3926();
            stEffect.m_iRemainTick = 100;
            stEffect.m_TargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = iNoX * a_3491.a_1080 + 8;
            stEffect.y = iNoY * a_3491.a_1081 + 10;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         }
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid2:a_3491 = null;
         var stEffect:WBBossBoomSceneEffect = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_APPEAR:
               if(a_1273 == 68 && this.change2Skill5 == true)
               {
                  m_iRestTick = 0;
                  this.SkillFive();
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 146 && this.hasUseSkill2 == false)
               {
                  this.hasUseSkill2 = true;
                  for(i = 0; i < BattleFieldView.a_1012; i++)
                  {
                     for(j = 2; j < BattleFieldView.a_1011; j++)
                     {
                        this.AddEffect(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,i));
                     }
                  }
               }
               break;
            case STATE_SKILL_THREE_END:
               if(a_1273 == 181)
               {
                  this.CreateFlys();
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 203)
               {
                  stFieldGrid2 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3);
                  stEffect = WBBossBoomSceneEffect.a_3926();
                  stEffect.a_1797(false);
                  stEffect.x = stFieldGrid2.m_iXGridNo * a_3491.a_1080 + 160;
                  stEffect.y = stFieldGrid2.m_iYGridNo * a_3491.a_1081 - 74;
                  stFieldGrid2.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid2);
                  stFieldGrid2.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
               }
               else if(a_1273 == 207)
               {
                  this.CreateEtChat(5,3);
                  this.CreateEtChat(6,3);
                  this.CreateEtChat(7,3);
                  this.CreateEtChat(5,4);
                  this.CreateEtChat(6,4);
                  this.CreateEtChat(7,4);
                  this.CreateEtChat(5,5);
                  this.CreateEtChat(6,5);
                  this.CreateEtChat(7,5);
               }
               else if(a_1273 == 210)
               {
                  this.CreateEtChat(1,4);
                  this.CreateEtChat(2,4);
                  this.CreateEtChat(3,4);
                  this.CreateEtChat(4,4);
                  this.CreateEtChat(1,5);
                  this.CreateEtChat(2,5);
                  this.CreateEtChat(3,5);
                  this.CreateEtChat(4,5);
               }
               else if(a_1273 == 213)
               {
                  this.CreateEtChat(4,1);
                  this.CreateEtChat(5,1);
                  this.CreateEtChat(6,1);
                  this.CreateEtChat(7,1);
                  this.CreateEtChat(4,3);
                  this.CreateEtChat(4,2);
                  this.CreateEtChat(5,2);
                  this.CreateEtChat(6,2);
                  this.CreateEtChat(7,2);
               }
               else if(a_1273 == 216)
               {
                  this.CreateEtChat(1,1);
                  this.CreateEtChat(2,1);
                  this.CreateEtChat(3,1);
                  this.CreateEtChat(1,2);
                  this.CreateEtChat(2,2);
                  this.CreateEtChat(3,2);
                  this.CreateEtChat(1,3);
                  this.CreateEtChat(2,3);
                  this.CreateEtChat(3,3);
               }
               break;
            case STATE_SKILL_FIVE_END:
               if(a_1273 == 255)
               {
                  for(i = 0; i < BattleFieldView.a_1012; i++)
                  {
                     for(j = 0; j < BattleFieldView.a_1011; j++)
                     {
                        a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,i));
                     }
                  }
               }
               else if(a_1273 == 265)
               {
                  this.change2Skill5Damage = 0;
                  this.change2Skill5 = false;
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
            this.hasUseSkill2 = false;
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_FOUR);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_FIVE_MOVE_LOOP;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0 && !(m_iBossState >= STATE_SKILL_FIVE_MOVE_BEGIN && m_iBossState >= STATE_SKILL_FIVE_END);
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
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         switch(iNextState)
         {
            case STATE_BORN:
               iNextValue = 45;
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_NONE:
               SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_SKILL_FIVE_MOVE_LOOP:
               SetIsCannotSee(true);
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]),10);
               break;
            case STATE_DISAPPEAR:
            case STATE_SKILL_FIVE_MOVE_BEGIN:
            case STATE_SKILL_FIVE_BEGIN:
            case STATE_SKILL_FIVE_LOOP:
            case STATE_SKILL_FIVE_END:
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_ONE_BEGIN:
               a_3502(m_stCurrentFieldGrid);
               a_1465 = 0;
               break;
            case STATE_SKILL_ONE_LOOP:
               this.CreateWeapon();
               break;
            case STATE_SKILL_ONE_END:
               this.BackWeapon();
               break;
            case STATE_SKILL_TWO:
               a_1465 = 3;
               break;
            case STATE_SKILL_THREE_BEGIN:
               a_3502(m_stCurrentFieldGrid);
               a_1465 = 3;
               a_1283 = false;
               SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_SKILL_FOUR:
               a_1465 = 3;
               a_1283 = false;
               break;
            case STATE_APPEAR:
               a_1465 = 3;
               SetIsCannotSee(false);
               this.visible = true;
               a_1465 = 0;
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_WAITING:
               SetIsCannotSee(false);
               a_1465 = 0;
               break;
            case STATE_MOVE:
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]));
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.change2Skill5Damage = 0;
         this.change2Skill5 = false;
         a_1465 = 3;
         this.weaponEffect = null;
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
      }
      
      override public function OnReduceLife(iReduce:int) : void
      {
         if(this.change2Skill5 == false)
         {
            this.change2Skill5Damage += iReduce;
            if(this.change2Skill5Damage > _ReduceOneStepLifeValue * 2)
            {
               this.change2Skill5Damage = 0;
               this.change2Skill5 = true;
            }
         }
      }
   }
}

