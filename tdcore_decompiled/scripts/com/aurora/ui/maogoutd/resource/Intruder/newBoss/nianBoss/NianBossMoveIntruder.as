package com.aurora.ui.maogoutd.resource.Intruder.newBoss.nianBoss
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class NianBossMoveIntruder extends a_4206 implements IBossMoveIntruder
   {
      
      private static const STATE_IDLE:Array = [1,17,1,10,1,"待机",true];
      
      private static const STATE_IDLE_2:Array = [1,17,1,19,2,"待机2",true];
      
      private static const STATE_WARNING:Array = [2,18,20,35,1,"预警",true];
      
      private static const STATE_WARNING_2:Array = [2,18,20,35,3,"预警2",true];
      
      private static const STATE_DRILL_OUT:Array = [3,19,36,56,1,"出土",false];
      
      private static const STATE_DRILL_IN:Array = [4,20,57,77,1,"钻入地下",false];
      
      private static const STATE_START_JUMP:Array = [5,21,78,81,1,"开始跳跃",false];
      
      private static const STATE_JUMP:Array = [6,22,82,87,1,"跳跃",false];
      
      private static const STATE_JUMP_END:Array = [7,23,88,91,1,"跳跃结束",false];
      
      private static const STATE_JUMP_2:Array = [9,25,96,106,1,"跳跃2",false];
      
      private static const STATE_JUMP_3:Array = [12,28,115,121,1,"跳跃3",false];
      
      private static const STATE_JUMP_4:Array = [15,31,130,138,1,"跳跃4",false];
      
      private static const STATE_DIE:Array = [33,33,288,342,1,"死亡",false];
      
      protected static const HP_FULL_FRAME_ID:int = 0;
      
      protected static const HP_HALF_FRAME_ID:int = 1;
      
      protected static const STATE_START_FRAME_INDEX:int = 2;
      
      protected static const STATE_END_FRAME_INDEX:int = 3;
      
      protected static const STATE_FRAME_REPEATS:int = 4;
      
      protected static const STATE_NAME:int = 5;
      
      protected static const STATE_CAN_ATTACK:int = 6;
      
      private static const HP_STATE_FULL:int = 1;
      
      private static const HP_STATE_HALF:int = 2;
      
      private var m_arrCurrentState:Array;
      
      private var m_arrNextState:Array;
      
      private var m_strStateLog:String = "AI>>>>";
      
      private var a_1494:int;
      
      private var m_iJumpTime:int;
      
      private var m_iLifeState:int;
      
      protected var m_iPeriodTime:int = 0;
      
      private var a_1598:a_3491;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      protected var m_numHardRate:Number = 1;
      
      private var m_iAttackTimes:int = 0;
      
      private var m_iAddNum:int;
      
      private var m_iCurrentTime:int;
      
      private var m_stDataEvent:a_1778;
      
      public function NianBossMoveIntruder()
      {
         super();
         a_1481 = false;
         this.m_stDataEvent = new a_1778("AurBossBloodProgress");
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(NianBossMoveIntruder) as NianBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return NianBossMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         this.m_arrCurrentState = null;
         this.m_arrNextState = null;
         this.a_1494 = 3;
         this.m_iJumpTime = 0;
         a_1467 = -150;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 5;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1462 = false;
         a_1463 = true;
         a_1339 = 10000;
         this.m_iLifeState = HP_STATE_FULL;
         a_1279 = -40;
         a_1465 = 1;
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
      
      override public function get numHardRate() : Number
      {
         return this.m_numHardRate;
      }
      
      override public function set numHardRate(value:Number) : void
      {
         this.m_numHardRate = value;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.m_numHardRate * 5000)
         {
            this.m_iLifeState = HP_STATE_FULL;
         }
         else if(a_1339 > 0)
         {
            this.m_iLifeState = HP_STATE_HALF;
         }
         else if(a_1339 <= 0)
         {
            this.SwitchState(STATE_DIE);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 != this.m_numHardRate * 5000)
         {
            if(a_1339 <= 0)
            {
               this.m_arrCurrentState = STATE_DIE;
               a_1275 = this.m_arrCurrentState[HP_FULL_FRAME_ID] - 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               play();
            }
         }
         a_3419();
         this.m_stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(root)
         {
            root.dispatchEvent(this.m_stDataEvent);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(iRduceLifeValue);
         var stDataEvent:a_1778 = new a_1778("AurBossBloodProgress");
         stDataEvent.dataObject = a_1339 / (this.m_numHardRate * 15000);
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      private function GetPeriodTime() : int
      {
         if(this.m_arrCurrentState)
         {
            return this.m_arrCurrentState[STATE_FRAME_REPEATS] * (this.m_arrCurrentState[STATE_END_FRAME_INDEX] - this.m_arrCurrentState[STATE_START_FRAME_INDEX]);
         }
         return 0;
      }
      
      private function SwitchState(arrState:Array) : void
      {
         this.m_arrCurrentState = arrState;
         this.m_iPeriodTime = this.GetPeriodTime();
         if(HP_STATE_FULL == this.m_iLifeState)
         {
            a_1275 = this.m_arrCurrentState[HP_FULL_FRAME_ID] - 1;
         }
         else
         {
            a_1275 = this.m_arrCurrentState[HP_HALF_FRAME_ID] - 1;
         }
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
      }
      
      private function OnStartState() : void
      {
         var stHitGroundEffect:NianBossHitGroundEffect = null;
         var stTempFieldGrid:a_3491 = null;
         var iTargetY:int = 0;
         var iTargetX:int = 0;
         iTargetY = 0;
         iTargetX = 0;
         SetCannotSeeByFighter(!this.m_arrCurrentState[STATE_CAN_ATTACK]);
         switch(this.m_arrCurrentState)
         {
            case STATE_IDLE:
            case STATE_IDLE_2:
            case STATE_WARNING:
            case STATE_WARNING_2:
               break;
            case STATE_DRILL_OUT:
               visible = true;
               iTargetY = this.GetRandom(BattleFieldView.a_1012 - 1);
               iTargetX = BattleFieldView.a_1011 - this.GetRandom(2) - 1;
               stTempFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iTargetY][iTargetX];
               x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo + a_1279;
               y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + a_1467;
               ChangeFieldGrid(stTempFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,m_stCurrentFieldGrid);
               ClearDefenseCardByGridNo(iTargetX,iTargetY);
               break;
            case STATE_DRILL_IN:
               break;
            case STATE_START_JUMP:
               iTargetY = this.GetRandom(BattleFieldView.a_1012 - 1);
               if(iTargetY < 0)
               {
                  iTargetY = 0;
               }
               if(iTargetY > BattleFieldView.a_1012 - 1)
               {
                  iTargetY = BattleFieldView.a_1012 - 1;
               }
               if(m_stCurrentFieldGrid.m_iXGridNo >= BattleFieldView.a_1011 - 3)
               {
                  iTargetX = m_stCurrentFieldGrid.m_iXGridNo + this.GetRandom(2) - 5;
               }
               else
               {
                  iTargetX = BattleFieldView.a_1011 - this.GetRandom(2) - 1;
               }
               this.a_1598 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iTargetY][iTargetX];
               break;
            case STATE_JUMP:
               break;
            case STATE_JUMP_END:
               x = a_3491.a_1080 * this.a_1598.m_iXGridNo + a_1279;
               y = a_3491.a_1081 * this.a_1598.m_iYGridNo + a_1467;
               iTargetX = this.a_1598.m_iXGridNo;
               iTargetY = this.a_1598.m_iYGridNo;
               ChangeFieldGrid(this.a_1598);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
               stHitGroundEffect = NianBossHitGroundEffect.a_3926();
               stHitGroundEffect.a_1797(!m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField);
               stHitGroundEffect.x = (iTargetX + 0.5) * a_3491.a_1080 - stHitGroundEffect.width * 0.5;
               stHitGroundEffect.y = (iTargetY + 1.2) * a_3491.a_1081 - stHitGroundEffect.height;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stHitGroundEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1598);
               stHitGroundEffect.play();
               ClearDefenseCardByGridNo(iTargetX,iTargetY);
               break;
            case STATE_DIE:
         }
      }
      
      private function OnContinueState() : void
      {
         var iDistanceX:Number = NaN;
         var iDistanceY:Number = NaN;
         var iSchedule:Number = NaN;
         switch(this.m_arrCurrentState)
         {
            case STATE_IDLE:
            case STATE_WARNING:
            case STATE_DRILL_OUT:
            case STATE_DRILL_IN:
            case STATE_START_JUMP:
               break;
            case STATE_JUMP:
            case STATE_JUMP_2:
            case STATE_JUMP_3:
            case STATE_JUMP_4:
               iDistanceX = this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo;
               iDistanceY = this.a_1598.m_iYGridNo - m_stCurrentFieldGrid.m_iYGridNo;
               iSchedule = (this.GetPeriodTime() - this.m_iPeriodTime) / this.GetPeriodTime();
               x = iDistanceX * iSchedule * a_3491.a_1080 + a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + a_1279;
               y = iDistanceY * iSchedule * a_3491.a_1081 + a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + a_1467;
               break;
            case STATE_JUMP_END:
            case STATE_DIE:
         }
      }
      
      private function OnEndState() : void
      {
         var arrNextState:Array = null;
         switch(this.m_arrCurrentState)
         {
            case STATE_IDLE:
               arrNextState = this.m_arrNextState;
               a_1465 = 0;
               break;
            case STATE_IDLE_2:
               arrNextState = this.m_arrNextState;
               a_1465 = 0;
               break;
            case STATE_WARNING:
            case STATE_WARNING_2:
               arrNextState = STATE_START_JUMP;
               a_1465 = 0;
               break;
            case STATE_DRILL_OUT:
               if(0 == this.m_iJumpTime)
               {
                  this.a_1494 = 3;
                  this.m_iJumpTime = -1;
               }
               --this.a_1494;
               arrNextState = STATE_IDLE;
               if(this.a_1494 == 0)
               {
                  this.m_arrNextState = STATE_WARNING_2;
               }
               else
               {
                  this.m_arrNextState = STATE_WARNING;
               }
               a_1465 = 1;
               break;
            case STATE_DRILL_IN:
               visible = false;
               arrNextState = STATE_IDLE;
               this.m_arrNextState = STATE_DRILL_OUT;
               a_1465 = 1;
               break;
            case STATE_START_JUMP:
               if(Math.abs(this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) <= 3)
               {
                  arrNextState = STATE_JUMP_3;
               }
               else if(Math.abs(this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) <= 4)
               {
                  arrNextState = STATE_JUMP;
               }
               else if(Math.abs(this.a_1598.m_iXGridNo - m_stCurrentFieldGrid.m_iXGridNo) <= 6)
               {
                  arrNextState = STATE_JUMP_4;
               }
               else
               {
                  arrNextState = STATE_JUMP_2;
               }
               a_1465 = 0;
               break;
            case STATE_JUMP:
            case STATE_JUMP_2:
            case STATE_JUMP_3:
            case STATE_JUMP_4:
               if(0 == this.a_1494)
               {
                  this.m_iJumpTime = 5;
                  this.a_1494 = -1;
               }
               arrNextState = STATE_JUMP_END;
               a_1465 = 3;
               break;
            case STATE_JUMP_END:
               --this.m_iJumpTime;
               if(this.m_iJumpTime > 0)
               {
                  arrNextState = STATE_START_JUMP;
               }
               else if(this.m_iJumpTime == 0)
               {
                  arrNextState = STATE_IDLE_2;
                  this.m_arrNextState = STATE_DRILL_IN;
               }
               else
               {
                  arrNextState = STATE_IDLE;
                  this.m_arrNextState = STATE_DRILL_IN;
               }
               a_1465 = 0;
               break;
            case STATE_DIE:
               arrNextState = STATE_DIE;
               a_1465 = 1;
               break;
            default:
               arrNextState = STATE_IDLE;
               a_1465 = 0;
         }
         this.SwitchState(arrNextState);
      }
      
      private function IsStartState() : Boolean
      {
         if(this.m_iPeriodTime == this.GetPeriodTime() && this.m_iPeriodTime != 0)
         {
            return true;
         }
         return false;
      }
      
      private function IsEndState() : Boolean
      {
         return Boolean(this.m_iPeriodTime <= 0);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime % 2 != 0)
         {
            return false;
         }
         this.m_iCurrentTime = iCurrentTime;
         if(a_1339 > this.m_numHardRate * 5000)
         {
            this.m_iLifeState = HP_STATE_FULL;
         }
         else if(a_1339 > 0)
         {
            this.m_iLifeState = HP_STATE_HALF;
         }
         if(!a_1460)
         {
            this.SwitchState(STATE_DRILL_OUT);
            a_1460 = true;
         }
         if(this.IsEndState())
         {
            this.OnEndState();
         }
         if(this.IsStartState())
         {
            this.OnStartState();
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
         }
         else
         {
            this.OnContinueState();
            if(this.m_iPeriodTime > 0)
            {
               --this.m_iPeriodTime;
            }
         }
         return true;
      }
      
      private function GetRandom(iSeed:int) : int
      {
         return int((this.m_iCurrentTime + globalMoveFighterID) / 10) % (iSeed + 1);
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
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
         if(null != stFieldGrid.m_stBoomDefense)
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
      
      protected function a_3503(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            stFieldGrid.a_3503();
         }
         return true;
      }
   }
}

