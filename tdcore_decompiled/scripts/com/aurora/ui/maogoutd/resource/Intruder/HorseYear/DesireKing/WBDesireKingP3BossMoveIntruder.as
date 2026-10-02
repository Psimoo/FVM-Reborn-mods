package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2GroundSpurEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2GroundSpurMovie;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2PoisonBottleEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2.WBDesireKingP2PoisonBottleMovie;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3.WBDesireKingP3LClawMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3.WBDesireKingP3RClawMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.utils.Dictionary;
   
   public class WBDesireKingP3BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_DISAPPEAR:uint = 7;
      
      protected static const STATE_WAITING_NO_BEAR:uint = 8;
      
      protected static const STATE_SKILL_ONE_BEGIN:uint = 9;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 10;
      
      protected static const STATE_SKILL_ONE_END:uint = 11;
      
      protected static const STATE_SKILL_TWO_ATTACK1:uint = 12;
      
      protected static const STATE_SKILL_TWO_ATTACK2:uint = 13;
      
      protected static const STATE_SKILL_THREE_BEGIN:uint = 14;
      
      protected static const STATE_SKILL_THREE_LOOP:uint = 15;
      
      protected static const STATE_SKILL_THREE_END:uint = 16;
      
      protected static const STATE_SKILL_FOUR:uint = 17;
      
      protected static const STATE_SKILL_FIVE_BEGIN:uint = 18;
      
      protected static const STATE_SKILL_FIVE_LOOP:uint = 19;
      
      protected static const STATE_SKILL_FIVE_END:uint = 20;
      
      private var leftClaw:WBDesireKingP3LClawMoveIntruder;
      
      private var rightClaw:WBDesireKingP3RClawMoveIntruder;
      
      private var m_bHasBorn:Boolean = false;
      
      private var m_iRunTick:int = 0;
      
      private var m_iSkillFourTime:int = -1;
      
      private var m_skillTwoArr:Array = [[-1,2,1],[-1,6,2],[9,2,3],[9,6,4]];
      
      private var m_iSkillTwoTimes:int = 0;
      
      private var moveArray:Array = [STATE_MOVE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBDesireKingP3BossMoveIntruder()
      {
         super();
         _bossStep = 3;
         a_1279 = -115;
         a_1467 = -118;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireKingP3BossMoveIntruder,WBDesireKingP3BossMovie) as WBDesireKingP3BossMoveIntruder;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_ATTACK1 + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_ATTACK2 + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_ATTACK1 + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_ATTACK2 + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 1] = 16;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillFive);
      }
      
      override protected function InitSkillCache() : void
      {
         this.m_iSkillTwoTimes = 0;
         this.m_iSkillFourTime = -1;
         a_1465 = 0;
         this.m_bHasBorn = false;
         m_vStateCache.length = 0;
         this.m_iRunTick = 9999;
         iLastNoX = 4;
         iLastNoY = 3;
         m_vStateCache.push([STATE_BORN,33,4,3]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_DISAPPEAR,6]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillOne() : void
      {
         this.m_bHasBorn = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,5,8,m_stRandomSeed.nextInt(2) == 0 ? 2 : 4]);
         m_vStateCache.push([STATE_SKILL_ONE_BEGIN,14]);
         m_vStateCache.push([STATE_SKILL_ONE_LOOP,35]);
         m_vStateCache.push([STATE_SKILL_ONE_END,15]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillTwo() : void
      {
         ++this.m_iSkillTwoTimes;
         WBDesireKingCandleMgr.getInstance().ResetTimes(this.m_iSkillTwoTimes);
         this.m_bHasBorn = true;
         m_vStateCache.length = 0;
         tagCom.AddTag(40005);
         var arr:Array = shuffleArray(this.m_skillTwoArr);
         for(var i:int = 0; i < arr.length; i++)
         {
            if(arr[i][1] == 2)
            {
               m_vStateCache.push([STATE_SKILL_TWO_ATTACK2,16,arr[i][0],arr[i][1]]);
            }
            else
            {
               m_vStateCache.push([STATE_SKILL_TWO_ATTACK1,15,arr[i][0],arr[i][1]]);
            }
            m_vStateCache.push([STATE_HIDE,15]);
         }
         m_vStateCache.push([STATE_HIDE,40]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,28,7,m_stRandomSeed.nextInt(2) == 0 ? 1 : 5]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP,25]);
         m_vStateCache.push([STATE_SKILL_THREE_END,11]);
         m_vStateCache.push([STATE_HIDE,40]);
      }
      
      private function SkillFour() : void
      {
         if(this.leftClaw != null)
         {
            this.leftClaw.a_4158();
            this.leftClaw = null;
         }
         if(this.rightClaw != null)
         {
            this.rightClaw.a_4158();
            this.rightClaw = null;
         }
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FOUR,40,8,(m_stRandomSeed.nextInt(2) == 0 ? 1 : 4) + m_stRandomSeed.nextInt(2)]);
         m_vStateCache.push([STATE_WAITING,60]);
      }
      
      private function SkillFive() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_DISAPPEAR,6]);
         m_vStateCache.push([STATE_HIDE,5]);
         m_vStateCache.push([STATE_APPEAR,5,4,3]);
         m_vStateCache.push([STATE_WAITING,15]);
         m_vStateCache.push([STATE_SKILL_FIVE_BEGIN,29]);
         m_vStateCache.push([STATE_SKILL_FIVE_END,8]);
         m_vStateCache.push([STATE_WAITING,50]);
         m_vStateCache.push([STATE_DISAPPEAR,6]);
         m_vStateCache.push([STATE_HIDE,40]);
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
         var j:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         if(this.m_iSkillFourTime != -1)
         {
            ++this.m_iSkillFourTime;
            if(this.m_iSkillFourTime == 7)
            {
               this.CreateGroundSpur(iNoX - 1,iNoY - 1);
               this.CreateGroundSpur(iNoX - 1,iNoY);
               this.CreateGroundSpur(iNoX - 1,iNoY + 1);
            }
            else if(this.m_iSkillFourTime == 14)
            {
               this.CreateGroundSpur(iNoX - 2,iNoY - 1);
               this.CreateGroundSpur(iNoX - 2,iNoY);
               this.CreateGroundSpur(iNoX - 2,iNoY + 1);
            }
            else if(this.m_iSkillFourTime == 21)
            {
               this.CreateGroundSpur(iNoX - 4,iNoY - 1);
               this.CreateGroundSpur(iNoX - 4,iNoY);
               this.CreateGroundSpur(iNoX - 4,iNoY + 1);
            }
            else if(this.m_iSkillFourTime == 22)
            {
               this.m_iSkillFourTime = -1;
            }
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 9)
               {
                  this.ClearOneGridIgnoreFangYu(8,3);
               }
               else if(a_1273 == 10)
               {
                  this.ClearOneGridIgnoreFangYu(7,2);
                  this.ClearOneGridIgnoreFangYu(7,4);
               }
               else if(a_1273 == 11)
               {
                  this.ClearOneGridIgnoreFangYu(6,1);
                  this.ClearOneGridIgnoreFangYu(6,5);
                  this.ClearOneGridIgnoreFangYu(5,0);
                  this.ClearOneGridIgnoreFangYu(5,6);
               }
               else if(a_1273 == 12)
               {
                  this.ClearOneGridIgnoreFangYu(4,0);
                  this.ClearOneGridIgnoreFangYu(4,6);
                  this.ClearOneGridIgnoreFangYu(3,1);
                  this.ClearOneGridIgnoreFangYu(3,5);
               }
               else if(a_1273 == 13)
               {
                  this.ClearOneGridIgnoreFangYu(3,2);
                  this.ClearOneGridIgnoreFangYu(3,4);
               }
               else if(a_1273 == 14)
               {
                  this.ClearOneGridIgnoreFangYu(4,3);
               }
               break;
            case STATE_SKILL_THREE_BEGIN:
               if(a_1273 == 163)
               {
                  this.CreatePosion(iNoX - 2,iNoY);
                  this.CreatePosion(iNoX - 2,iNoY - 1);
                  this.CreatePosion(iNoX - 2,iNoY + 1);
               }
               break;
            case STATE_SKILL_TWO_ATTACK1:
               if(a_1273 == 111)
               {
                  this.CreateCandles(iNoX,iNoY);
               }
               break;
            case STATE_SKILL_TWO_ATTACK2:
               if(a_1273 == 129)
               {
                  this.CreateCandles(iNoX,iNoY);
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 197)
               {
                  a_1465 = 0;
               }
               else if(a_1273 == 213)
               {
                  for(i = -1; i <= 0; i++)
                  {
                     for(j = -1; j <= 1; j++)
                     {
                        this.ClearOneGridIgnoreFangYu(iNoX + i,iNoY + j);
                     }
                  }
                  this.m_iSkillFourTime = 0;
               }
               break;
            case STATE_SKILL_FIVE_BEGIN:
               if(a_1273 == 234)
               {
                  a_1465 = 3;
               }
               else if(a_1273 == 240)
               {
                  this.ClearOneGridAllLight(2,2);
                  this.ClearOneGridAllLight(3,2);
                  this.ClearOneGridAllLight(4,2);
                  this.ClearOneGridAllLight(5,2);
                  this.ClearOneGridAllLight(6,2);
                  this.ClearOneGridAllLight(2,3);
                  this.ClearOneGridAllLight(3,3);
                  this.ClearOneGridAllLight(4,3);
                  this.ClearOneGridAllLight(5,3);
                  this.ClearOneGridAllLight(6,3);
                  this.ClearOneGridAllLight(2,4);
                  this.ClearOneGridAllLight(3,4);
                  this.ClearOneGridAllLight(4,4);
                  this.ClearOneGridAllLight(5,4);
                  this.ClearOneGridAllLight(6,4);
               }
               else if(a_1273 == 245)
               {
                  this.ClearOneGridAllLight(1,1);
                  this.ClearOneGridAllLight(2,1);
                  this.ClearOneGridAllLight(3,1);
                  this.ClearOneGridAllLight(4,1);
                  this.ClearOneGridAllLight(5,1);
                  this.ClearOneGridAllLight(6,1);
                  this.ClearOneGridAllLight(7,1);
                  this.ClearOneGridAllLight(1,5);
                  this.ClearOneGridAllLight(2,5);
                  this.ClearOneGridAllLight(3,5);
                  this.ClearOneGridAllLight(4,5);
                  this.ClearOneGridAllLight(5,5);
                  this.ClearOneGridAllLight(6,5);
                  this.ClearOneGridAllLight(7,5);
                  this.ClearOneGridAllLight(1,2);
                  this.ClearOneGridAllLight(1,3);
                  this.ClearOneGridAllLight(1,4);
                  this.ClearOneGridAllLight(7,2);
                  this.ClearOneGridAllLight(7,3);
                  this.ClearOneGridAllLight(7,4);
               }
               else if(a_1273 == 250)
               {
                  this.ClearOneGridAllLight(0,0);
                  this.ClearOneGridAllLight(1,0);
                  this.ClearOneGridAllLight(2,0);
                  this.ClearOneGridAllLight(3,0);
                  this.ClearOneGridAllLight(4,0);
                  this.ClearOneGridAllLight(5,0);
                  this.ClearOneGridAllLight(6,0);
                  this.ClearOneGridAllLight(7,0);
                  this.ClearOneGridAllLight(8,0);
                  this.ClearOneGridAllLight(0,6);
                  this.ClearOneGridAllLight(1,6);
                  this.ClearOneGridAllLight(2,6);
                  this.ClearOneGridAllLight(3,6);
                  this.ClearOneGridAllLight(4,6);
                  this.ClearOneGridAllLight(5,6);
                  this.ClearOneGridAllLight(6,6);
                  this.ClearOneGridAllLight(7,6);
                  this.ClearOneGridAllLight(8,6);
                  this.ClearOneGridAllLight(0,1);
                  this.ClearOneGridAllLight(0,2);
                  this.ClearOneGridAllLight(0,3);
                  this.ClearOneGridAllLight(0,4);
                  this.ClearOneGridAllLight(0,5);
                  this.ClearOneGridAllLight(8,1);
                  this.ClearOneGridAllLight(8,2);
                  this.ClearOneGridAllLight(8,3);
                  this.ClearOneGridAllLight(8,4);
                  this.ClearOneGridAllLight(8,5);
               }
               else if(a_1273 == 252)
               {
                  a_1789.getInstance().dispatchEvent(new a_1778("WBDesireKing3Skill5"));
               }
               break;
            case STATE_SKILL_FIVE_END:
               if(a_1273 == 278)
               {
                  a_1465 = 0;
               }
         }
         return true;
      }
      
      private function ClearBox() : void
      {
         var stAurDataEvent:a_1778 = new a_1778("ClearWBBox");
         a_1789.getInstance().dispatchEvent(stAurDataEvent);
         BattleCardUtil.UnLockAllCard(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
      }
      
      private function ClearOneGridAllLight(iNoX:int, iNoY:int) : void
      {
         WBDesireKingUtil.ClearOneGridAllLight(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      private function CreateGroundSpur(iNoX:int, iNoY:int) : void
      {
         var effectGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var effect2:WBDesireKingP2GroundSpurEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingP2GroundSpurEffect,WBDesireKingP2GroundSpurMovie,effectGrid) as WBDesireKingP2GroundSpurEffect;
         effect2.InitData(effectGrid);
      }
      
      private function CreateCandles(iNoX:int, iNoY:int) : void
      {
         if(iNoX == 0 && iNoY == 2)
         {
            this.ClearOneGrid(0,0);
            this.ClearOneGrid(0,1);
            this.ClearOneGrid(0,2);
         }
         else if(iNoX == 8 && iNoY == 2)
         {
            this.ClearOneGrid(8,0);
            this.ClearOneGrid(8,1);
            this.ClearOneGrid(8,2);
         }
         else if(iNoX == 8 && iNoY == 6)
         {
            this.ClearOneGrid(8,4);
            this.ClearOneGrid(8,5);
            this.ClearOneGrid(8,6);
         }
         else if(iNoX == 0 && iNoY == 6)
         {
            this.ClearOneGrid(0,4);
            this.ClearOneGrid(0,5);
            this.ClearOneGrid(0,6);
         }
         if(this.m_iSkillTwoTimes == 1)
         {
            this.CreateCandle(iNoX,iNoY - 1);
         }
         else if(this.m_iSkillTwoTimes == 2)
         {
            if(iNoX == 0 && iNoY == 2)
            {
               this.CreateCandle(0,1);
               this.CreateCandle(0,2);
            }
            else if(iNoX == 8 && iNoY == 2)
            {
               this.CreateCandle(8,1);
               this.CreateCandle(8,2);
            }
            else if(iNoX == 8 && iNoY == 6)
            {
               this.CreateCandle(8,4);
               this.CreateCandle(8,5);
            }
            else if(iNoX == 0 && iNoY == 6)
            {
               this.CreateCandle(0,4);
               this.CreateCandle(0,5);
            }
         }
         else if(iNoX == 0 && iNoY == 2)
         {
            this.CreateCandle(0,0);
            this.CreateCandle(0,1);
            this.CreateCandle(0,2);
         }
         else if(iNoX == 8 && iNoY == 2)
         {
            this.CreateCandle(8,0);
            this.CreateCandle(8,1);
            this.CreateCandle(8,2);
         }
         else if(iNoX == 8 && iNoY == 6)
         {
            this.CreateCandle(8,4);
            this.CreateCandle(8,5);
            this.CreateCandle(8,6);
         }
         else if(iNoX == 0 && iNoY == 6)
         {
            this.CreateCandle(0,4);
            this.CreateCandle(0,5);
            this.CreateCandle(0,6);
         }
      }
      
      private function CreateCandle(iNoX:int, iNoY:int) : void
      {
         var effectGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var effect2:WBDesireKingCandleEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingCandleEffect,WBDesireKingCandleMovie,effectGrid) as WBDesireKingCandleEffect;
         effect2.InitData(effectGrid,m_stRandomSeed,_bossStep);
      }
      
      private function CreatePosion(iNoX:int, iNoY:int) : void
      {
         var newGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var effect:WBDesireKingP2PoisonBottleEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingP2PoisonBottleEffect,WBDesireKingP2PoisonBottleMovie,newGrid) as WBDesireKingP2PoisonBottleEffect;
         effect.InitData(newGrid);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var grid:a_3491 = null;
         _iTimeNum = iCurrentTime;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         ++this.m_iRunTick;
         if(this.m_iRunTick == 14)
         {
            this.ClearBox();
            this.leftClaw = WBDesireKingP3LClawMoveIntruder.a_3926();
            BattleEffectUtil.CreateMouse(this.leftClaw,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo - 1),134235594);
            this.leftClaw.InitData();
         }
         else if(this.m_iRunTick == 60 + 14)
         {
            grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,m_stRandomSeed.nextInt(4) * 2);
            this.rightClaw = WBDesireKingP3RClawMoveIntruder.a_3926();
            BattleEffectUtil.CreateMouse(this.rightClaw,grid,134235595);
            this.rightClaw.x += 60;
            this.rightClaw.InitData(this);
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            InitState();
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
            if(this.IsMoving() && x < 540)
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
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         iNextValue = int(m_vStateCache[0][1]);
         switch(iNextState)
         {
            case STATE_BORN:
            case STATE_APPEAR:
            case STATE_SKILL_FOUR:
               a_1283 = false;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_TWO_ATTACK1:
            case STATE_SKILL_TWO_ATTACK2:
               a_1283 = m_vStateCache[0][2] < 5;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_ONE_BEGIN:
               this.m_iRunTick = 0;
               break;
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
               if(iNextValue == 40)
               {
                  tagCom.RemoveTag(40005);
               }
               break;
            case STATE_SKILL_THREE_BEGIN:
               a_1465 = 3;
               a_1283 = false;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_FIVE_BEGIN:
               tagCom.AddTag(40005);
               break;
            case STATE_SKILL_FIVE_LOOP:
            case STATE_SKILL_FIVE_END:
               tagCom.RemoveTag(40005);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetAppearToGrid2(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         SetIsCannotSee(false);
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
      
      private function ClearOneGrid(iNoX:int, iNoY:int) : void
      {
         BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      private function ClearOneGridIgnoreFangYu(iNoX:int, iNoY:int) : void
      {
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
   }
}

