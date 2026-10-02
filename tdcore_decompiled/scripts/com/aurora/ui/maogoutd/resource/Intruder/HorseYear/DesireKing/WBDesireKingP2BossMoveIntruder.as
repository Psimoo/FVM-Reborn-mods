package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2BellEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2BellMovie;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2BoxMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2GroundSpurEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2GroundSpurMovie;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2PoisonBottleEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2PoisonBottleMovie;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.utils.Dictionary;
   
   public class WBDesireKingP2BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DISAPPEAR:uint = 7;
      
      protected static const STATE_WAITING_NO_BEAR:uint = 8;
      
      protected static const STATE_SKILL_ONE:uint = 9;
      
      protected static const STATE_SKILL_TWO_BEGIN:uint = 10;
      
      protected static const STATE_SKILL_TWO_LOOP:uint = 11;
      
      protected static const STATE_SKILL_TWO_END:uint = 12;
      
      protected static const STATE_SKILL_THREE:uint = 13;
      
      protected static const STATE_SKILL_THREE_ATTACK:uint = 14;
      
      protected static const STATE_SKILL_THREE_END:uint = 15;
      
      protected static const STATE_SKILL_FOUR:uint = 16;
      
      protected static const STATE_SKILL_DEAD:uint = 17;
      
      private var m_bHasBorn:Boolean = false;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_stBoxMouse:WBDesireKingP2BoxMoveIntruder;
      
      private var m_stBell:BaseGameEffect;
      
      private var m_skill3Arr:Array = [[6,0],[7,0],[8,0],[9,0],[9,3],[9,4],[9,5],[6,4],[6,5],[6,6]];
      
      private var m_skill3Arr2:Array = [[7,1],[6,2],[7,3],[6,4],[7,5]];
      
      private var m_iRealNoX:int = 0;
      
      private var m_iRealNoY:int = 0;
      
      private var moveArray:Array = [STATE_MOVE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBDesireKingP2BossMoveIntruder()
      {
         super();
         _bossStep = 2;
         a_1279 = -68;
         a_1467 = -272;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireKingP2BossMoveIntruder,WBDesireKingP2BossMovie) as WBDesireKingP2BossMoveIntruder;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_WAITING_NO_BEAR + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_ATTACK + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_WAITING_NO_BEAR + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE_ATTACK + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 26;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 26;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 26;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 26;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.m_bHasHandleDie = false;
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
         a_1465 = 0;
         this.m_bHasBorn = false;
         this.m_stBoxMouse = null;
         this.SkillBorn();
      }
      
      private function SkillBorn() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 4;
         m_vStateCache.push([STATE_BORN,46,8,3]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_DISAPPEAR,5]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         this.m_bHasBorn = true;
         if(m_stRandomSeed.nextInt(2) == 0)
         {
            m_vStateCache.push([STATE_APPEAR,4,4,1]);
         }
         else
         {
            m_vStateCache.push([STATE_APPEAR,4,2,5]);
         }
         m_vStateCache.push([STATE_SKILL_ONE,17]);
         m_vStateCache.push([STATE_HIDE,50]);
      }
      
      private function ClearBox() : void
      {
         if(this.m_stBoxMouse != null)
         {
            this.m_stBoxMouse.a_4158();
         }
         BattleCardUtil.UnLockAllCard(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         this.ClearBox();
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,27,8,m_stRandomSeed.nextInt(3) * 2 + 1]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,35]);
         m_vStateCache.push([STATE_SKILL_TWO_END,7]);
         m_vStateCache.push([STATE_WAITING_NO_BEAR,30]);
      }
      
      private function SkillThree() : void
      {
         WBDesireKingCandleMgr.getInstance().a_4158();
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE,11]);
         m_vStateCache.push([STATE_HIDE,15]);
         var idx:int = int(m_stRandomSeed.nextInt(4));
         m_vStateCache.push([STATE_SKILL_THREE_ATTACK,14,this.m_skill3Arr[idx][0],this.m_skill3Arr[idx][1]]);
         m_vStateCache.push([STATE_HIDE,15]);
         idx = 4 + m_stRandomSeed.nextInt(3);
         m_vStateCache.push([STATE_SKILL_THREE_ATTACK,14,this.m_skill3Arr[idx][0],this.m_skill3Arr[idx][1]]);
         m_vStateCache.push([STATE_HIDE,15]);
         idx = 7 + m_stRandomSeed.nextInt(3);
         m_vStateCache.push([STATE_SKILL_THREE_ATTACK,14,this.m_skill3Arr[idx][0],this.m_skill3Arr[idx][1]]);
         m_vStateCache.push([STATE_HIDE,15]);
         idx = int(m_stRandomSeed.nextInt(this.m_skill3Arr2.length));
         m_vStateCache.push([STATE_SKILL_THREE_END,15,this.m_skill3Arr2[idx][0],this.m_skill3Arr2[idx][1]]);
         m_vStateCache.push([STATE_WAITING,50]);
      }
      
      private function SkillFour() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FOUR,33]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_DISAPPEAR,5]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillDead() : void
      {
         this.ClearBox();
         WBDesireKingCandleMgr.getInstance().a_4158();
         a_1789.getInstance().dispatchEvent(new a_1778("WBDesireKingDead"));
         if(this.m_stBell != null)
         {
            this.m_stBell.a_3940();
            this.m_stBell = null;
         }
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_DISAPPEAR,5]);
         m_vStateCache.push([STATE_SKILL_DEAD,27,6,2]);
      }
      
      protected function CreateBox() : void
      {
         var m_stRandomArr:Array = null;
         var m_TargetFieldGrid:a_3491 = null;
         var boxMouse:WBDesireKingP2BoxMoveIntruder = null;
         m_stRandomArr = [];
         m_stRandomArr = shuffleArray([[1,1,0],[3,1,0],[1,5,0],[3,5,0]]);
         var bornArr:Array = shuffleArray([1,1,1,2]);
         m_stRandomArr = [[3,m_stCurrentFieldGrid.m_iYGridNo,0]].concat(m_stRandomArr);
         for(var i:int = 0; i < 4; i++)
         {
            m_stRandomArr[i][2] = bornArr[i];
         }
         m_TargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stRandomArr[0][0],m_stRandomArr[0][1]);
         boxMouse = WBDesireKingP2BoxMoveIntruder.a_3926();
         boxMouse.a_1797((1 << 16) + 1000 + m_stRandomArr[0][1] * 100 + m_stRandomArr[0][0],-1);
         boxMouse.m_stMoveIntruderTypeID = 134235591;
         m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(boxMouse,m_TargetFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         boxMouse.x = (m_TargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         boxMouse.y = (m_TargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         boxMouse.InitData(m_stRandomArr,this);
         this.m_stBoxMouse = boxMouse;
      }
      
      private function CreateBell() : void
      {
         var battleView:BattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         var grid:a_3491 = battleView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
         if(grid == null)
         {
            return;
         }
         var effect:WBDesireKingP2BellEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingP2BellEffect,WBDesireKingP2BellMovie,grid) as WBDesireKingP2BellEffect;
         effect.InitData(battleView);
         this.m_stBell = effect;
      }
      
      private function ClearOneGridIgnoreFangYu(iNoX:int, iNoY:int) : void
      {
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var newGrid:a_3491 = null;
         var effect:WBDesireKingP2PoisonBottleEffect = null;
         var effectGrid:a_3491 = null;
         var effect2:WBDesireKingCandleEffect = null;
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 3)
               {
                  this.ClearOneGridIgnoreFangYu(7,1);
               }
               else if(a_1273 == 6)
               {
                  this.ClearOneGridIgnoreFangYu(6,1);
               }
               else if(a_1273 == 14)
               {
                  this.ClearOneGridIgnoreFangYu(5,5);
               }
               else if(a_1273 == 17)
               {
                  this.ClearOneGridIgnoreFangYu(4,5);
               }
               else if(a_1273 == 25)
               {
                  this.ClearOneGridIgnoreFangYu(1,3);
               }
               else if(a_1273 == 39)
               {
                  this.ClearOneGridIgnoreFangYu(6,3);
               }
               else if(a_1273 == 40)
               {
                  this.ClearOneGridIgnoreFangYu(7,3);
               }
               else if(a_1273 == 44)
               {
                  this.ClearOneGridIgnoreFangYu(8,3);
               }
               break;
            case STATE_APPEAR:
               if(a_1273 == 63 || a_1273 == 242)
               {
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 89 || a_1273 == 259)
               {
                  this.CreateBell();
               }
               break;
            case STATE_SKILL_TWO_BEGIN:
               if(a_1273 == 98 || a_1273 == 281)
               {
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo));
               }
               else if(a_1273 == 117 || a_1273 == 299)
               {
                  newGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
                  effect = BattleEffectUtil.CreateGameEffect(WBDesireKingP2PoisonBottleEffect,WBDesireKingP2PoisonBottleMovie,newGrid) as WBDesireKingP2PoisonBottleEffect;
                  effect.InitData(newGrid);
               }
               break;
            case STATE_SKILL_TWO_END:
               if(a_1273 == 136 || a_1273 == 319)
               {
                  this.CreateBox();
                  WBDesireKingUtil.LockCards(4,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
               }
               break;
            case STATE_SKILL_THREE_ATTACK:
               if(a_1273 == 172 || a_1273 == 354)
               {
                  effectGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.m_iRealNoX - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  effect2 = BattleEffectUtil.CreateGameEffect(WBDesireKingCandleEffect,WBDesireKingCandleMovie,effectGrid) as WBDesireKingCandleEffect;
                  effect2.InitData(effectGrid,m_stRandomSeed,_bossStep);
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 215 || a_1273 == 397)
               {
                  this.CreateGroundSpurs1();
               }
               else if(a_1273 == 220 || a_1273 == 402)
               {
                  this.CreateGroundSpurs2();
               }
               break;
            case STATE_SKILL_DEAD:
               if(a_1273 == 420)
               {
                  this.CreateGroundSpurs1();
               }
               else if(a_1273 == 425)
               {
                  this.CreateGroundSpurs2();
               }
         }
         return true;
      }
      
      private function CreateGroundSpurs1() : void
      {
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         this.CreateGroundSpur(iNoX - 1,iNoY - 1);
         this.CreateGroundSpur(iNoX + 1,iNoY - 1);
         this.CreateGroundSpur(iNoX - 1,iNoY + 1);
         this.CreateGroundSpur(iNoX + 1,iNoY + 1);
      }
      
      private function CreateGroundSpurs2() : void
      {
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         this.CreateGroundSpur(iNoX - 2,iNoY - 2);
         this.CreateGroundSpur(iNoX + 2,iNoY - 2);
         this.CreateGroundSpur(iNoX - 2,iNoY + 2);
         this.CreateGroundSpur(iNoX + 2,iNoY + 2);
      }
      
      private function CreateGroundSpur(iNoX:int, iNoY:int) : void
      {
         var effectGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(effectGrid == null)
         {
            return;
         }
         var effect2:WBDesireKingP2GroundSpurEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingP2GroundSpurEffect,WBDesireKingP2GroundSpurMovie,effectGrid) as WBDesireKingP2GroundSpurEffect;
         effect2.InitData(effectGrid);
      }
      
      private function HandleDie() : void
      {
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         this.SkillDead();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         _iTimeNum = iCurrentTime;
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
            if(this.IsMoving())
            {
               a_3502(m_stCurrentFieldGrid);
            }
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      override protected function IsMoving() : Boolean
      {
         return this.moveArray.indexOf(m_iBossState) != -1;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(x > getPosXByXGridNo(9))
         {
            return false;
         }
         if(y < getPosYByYGridNo(0))
         {
            return false;
         }
         if(y > getPosYByYGridNo(7))
         {
            return false;
         }
         if(this.m_bHasBorn == false)
         {
            return false;
         }
         return this.invicibleArray.indexOf(m_iBossState) == -1 && a_1339 > 0;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               CallChangeStep();
               a_3940();
               return false;
            }
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         var iNoX:int = 0;
         var iNoY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         SetIsCannotSee(STATE_HIDE == iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
            case STATE_APPEAR:
            case STATE_SKILL_TWO_BEGIN:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_THREE:
               tagCom.AddTag(40005);
               break;
            case STATE_SKILL_THREE_ATTACK:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_THREE_END:
               tagCom.RemoveTag(40005);
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_DEAD:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_ONE:
               SetIsCannotSee(false);
               break;
            case STATE_WAITING:
               SetIsCannotSee(false);
               break;
            case STATE_DEAD:
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_FOUR:
               break;
            case STATE_DISAPPEAR:
               SetIsCannotSee(true);
               break;
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
               break;
            case STATE_SKILL_DEAD:
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetAppearToGrid2(iXGridNo:int, iYGridNo:int) : void
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         iNoX = iXGridNo;
         iNoY = iYGridNo;
         this.m_iRealNoX = iXGridNo;
         this.m_iRealNoY = iYGridNo;
         if(iNoX < 0)
         {
            iNoX = 0;
         }
         if(iNoX > 8)
         {
            iNoX = 8;
         }
         if(iNoY < 0)
         {
            iNoY = 0;
         }
         if(iNoY > 6)
         {
            iNoY = 6;
         }
         this.x = getPosXByXGridNo(iXGridNo);
         this.y = getPosYByYGridNo(iYGridNo);
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         ChangeToFieldGrid(stNextFieldGrid);
         this.visible = true;
      }
   }
}

