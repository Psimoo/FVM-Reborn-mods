package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.utils.Dictionary;
   
   public class WBDesireKingP1BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DISAPPEAR:uint = 7;
      
      protected static const STATE_SKILL_ONE:uint = 8;
      
      protected static const STATE_SKILL_TWO:uint = 9;
      
      protected static const STATE_SKILL_TWO_WAIT:uint = 10;
      
      protected static const STATE_SKILL_THREE:uint = 11;
      
      protected static const STATE_SKILL_FOUR:uint = 12;
      
      protected static const STATE_SKILL_FOUR_APPEAR1:uint = 13;
      
      protected static const STATE_SKILL_FOUR_APPEAR2:uint = 14;
      
      protected static const STATE_SKILL_DEAD:uint = 15;
      
      private var m_bHasBorn:Boolean = false;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_stBoxMouse:WBDesireKingBoxMoveIntruder;
      
      private var m_stRandomArr:Array = [];
      
      private var m_iHideTick:int = -1;
      
      private var moveArray:Array = [STATE_MOVE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBDesireKingP1BossMoveIntruder()
      {
         super();
         _bossStep = 1;
         a_1279 = -76;
         a_1467 = -52;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireKingP1BossMoveIntruder,WBDesireKingP1BossMovie) as WBDesireKingP1BossMoveIntruder;
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
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_WAIT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR1 + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR2 + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_TWO_WAIT + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR1 + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_APPEAR2 + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_SKILL_DEAD + "_" + 1] = 22;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.m_bHasHandleDie = false;
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
         a_1465 = 0;
         this.m_bHasBorn = false;
         this.m_stBoxMouse = null;
         this.m_iHideTick = -1;
         this.SkillBorn();
      }
      
      private function SkillBorn() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 4;
         m_vStateCache.push([STATE_BORN,28,6,4]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         this.m_bHasBorn = true;
         m_vStateCache.push([STATE_APPEAR,11,3,m_stRandomSeed.nextInt(2) == 1 ? 1 : 5]);
         m_vStateCache.push([STATE_SKILL_ONE,31]);
         m_vStateCache.push([STATE_WAITING,30]);
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
         this.m_bHasBorn = true;
         this.ClearBox();
         m_vStateCache.push([STATE_DISAPPEAR,11]);
         m_vStateCache.push([STATE_HIDE,30]);
         m_vStateCache.push([STATE_SKILL_TWO,24,8,m_stRandomSeed.nextInt(4) * 2]);
         m_vStateCache.push([STATE_SKILL_TWO_WAIT,45]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         this.m_bHasBorn = true;
         m_vStateCache.push([STATE_SKILL_THREE,42]);
         m_vStateCache.push([STATE_HIDE,50]);
      }
      
      private function SkillFour() : void
      {
         WBDesireKingCandleMgr.getInstance().a_4158();
         this.m_bHasBorn = true;
         var iLastNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         var nextNoY:int = 0;
         if(iLastNoY == 1)
         {
            nextNoY = m_stRandomSeed.nextInt(2) == 1 ? 3 : 5;
         }
         else if(iLastNoY == 3)
         {
            nextNoY = m_stRandomSeed.nextInt(2) == 1 ? 1 : 5;
         }
         else if(iLastNoY == 5)
         {
            nextNoY = m_stRandomSeed.nextInt(2) == 1 ? 1 : 3;
         }
         else
         {
            nextNoY = m_stRandomSeed.nextInt(3) * 2 + 1;
         }
         m_vStateCache.push([STATE_SKILL_FOUR,22]);
         m_vStateCache.push([STATE_HIDE,5]);
         m_vStateCache.push([STATE_SKILL_FOUR_APPEAR1,7,8,nextNoY]);
         m_vStateCache.push([STATE_HIDE,5]);
         m_vStateCache.push([STATE_SKILL_FOUR_APPEAR1,7,4,nextNoY]);
         m_vStateCache.push([STATE_HIDE,5]);
         m_vStateCache.push([STATE_SKILL_FOUR_APPEAR2,10,6,nextNoY]);
         m_vStateCache.push([STATE_WAITING,50]);
         m_vStateCache.push([STATE_DISAPPEAR,11]);
      }
      
      private function SkillDead() : void
      {
         this.ClearBox();
         WBDesireKingCandleMgr.getInstance().a_4158();
         a_1789.getInstance().dispatchEvent(new a_1778("WBDesireKingDead"));
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_DISAPPEAR,11]);
         m_vStateCache.push([STATE_APPEAR,11,7,3]);
         m_vStateCache.push([STATE_SKILL_DEAD,32]);
      }
      
      protected function CreateBox() : void
      {
         var m_TargetFieldGrid:a_3491 = null;
         var boxMouse:WBDesireKingBoxMoveIntruder = null;
         this.m_stRandomArr = shuffleArray([[4,1,0],[4,3,0],[4,5,0]]);
         var bornArr:Array = shuffleArray([1,1,2]);
         for(var i:int = 0; i < 3; i++)
         {
            this.m_stRandomArr[i][2] = bornArr[i];
         }
         var iNoX:int = int(this.m_stRandomArr[0][0]);
         var iNoY:int = int(this.m_stRandomArr[0][1]);
         m_TargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         boxMouse = WBDesireKingBoxMoveIntruder.a_3926();
         boxMouse.a_1797((1 << 16) + 1000 + iNoY * 100 + iNoX,-1);
         boxMouse.m_stMoveIntruderTypeID = 134235590;
         m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(boxMouse,m_TargetFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         boxMouse.x = (m_TargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         boxMouse.y = (m_TargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         boxMouse.InitData(this.m_stRandomArr,this);
         this.m_stBoxMouse = boxMouse;
      }
      
      private function CreateRainbow(iNoX:int, iNoY:int) : void
      {
         WBDesireKingUtil.CreateRainbow(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         var newGrid:a_3491 = null;
         var effect:WBDesireKingCandyEffect = null;
         var effect2:WBDesireKingCandleEffect = null;
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 21)
               {
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,4));
               }
               else if(a_1273 == 27)
               {
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,4));
               }
               break;
            case STATE_APPEAR:
               if(a_1273 == 63 || a_1273 == 242)
               {
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 83 || a_1273 == 262)
               {
                  iNoX = m_stCurrentFieldGrid.m_iXGridNo;
                  iNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  this.CreateRainbow(iNoX - 1,iNoY - 1);
                  this.CreateRainbow(iNoX + 1,iNoY - 1);
                  this.CreateRainbow(iNoX - 1,iNoY + 1);
                  this.CreateRainbow(iNoX + 1,iNoY + 1);
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 100 || a_1273 == 229)
               {
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 101 || a_1273 == 230)
               {
                  BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo));
               }
               else if(a_1273 == 117 || a_1273 == 296)
               {
                  newGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  effect = BattleEffectUtil.CreateGameEffect(WBDesireKingCandyEffect,WBDesireKingCandyMovie,newGrid) as WBDesireKingCandyEffect;
                  effect.InitData(newGrid);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 140 || a_1273 == 331)
               {
                  a_1465 = 3;
               }
               else if(a_1273 == 142 || a_1273 == 333)
               {
                  WBDesireKingUtil.LockCards(3,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
               }
               break;
            case STATE_SKILL_FOUR_APPEAR1:
               if(a_1273 == 205 || a_1273 == 396)
               {
                  effect2 = BattleEffectUtil.CreateGameEffect(WBDesireKingCandleEffect,WBDesireKingCandleMovie,m_stCurrentFieldGrid) as WBDesireKingCandleEffect;
                  effect2.InitData(m_stCurrentFieldGrid,m_stRandomSeed,_bossStep);
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 188 || a_1273 == 379)
               {
                  a_1465 = 3;
               }
         }
         return true;
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
         if(this.m_iHideTick != -1 && iCurrentTime - this.m_iHideTick > 20 * 2)
         {
            this.m_iHideTick = -1;
            this.CreateBox();
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
         var iNextValue:int = 0;
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
         iNextValue = int(m_vStateCache[0][1]);
         var iNoX:int = 0;
         var iNoY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         SetIsCannotSee(STATE_HIDE == iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
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
               tagCom.AddTag(40005);
               break;
            case STATE_DISAPPEAR:
               SetIsCannotSee(true);
               break;
            case STATE_APPEAR:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_FOUR_APPEAR1:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_FOUR_APPEAR2:
               a_1465 = 0;
               tagCom.RemoveTag(40005);
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_TWO:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_HIDE:
               a_1465 = 0;
               SetIsCannotSee(true);
               visible = false;
               if(iNextValue == 50)
               {
                  this.m_iHideTick = iCurrentTime;
               }
               break;
            case STATE_SKILL_DEAD:
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetAppearToGrid2(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         var iNoX:int = iXGridNo;
         var iNoY:int = iYGridNo;
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
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.x = getPosXByXGridNo(iXGridNo);
         this.y = getPosYByYGridNo(iYGridNo);
         ChangeToFieldGrid(stNextFieldGrid);
         this.visible = true;
      }
   }
}

