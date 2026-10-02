package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.OxHeadHorseface
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.utils.Dictionary;
   
   public class OxHeadBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (20 * 0.4);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_DIS_APPEAR:uint = 7;
      
      private static const STATE_JUMP_BEGIN:uint = 8;
      
      private static const STATE_JUMP_LOOP:uint = 9;
      
      private static const STATE_JUMP_END:uint = 10;
      
      private static const STATE_SKILL_ONE:uint = 11;
      
      private static const STATE_SKILL_TWO:uint = 12;
      
      private static const STATE_SKILL_THREE:uint = 13;
      
      private static const STATE_WAITING2:uint = 14;
      
      private static const STATE_WAITING3:uint = 15;
      
      private static const STATE_WAITING4:uint = 16;
      
      private static const STATE_DIS_APPEAR2:uint = 17;
      
      private static const STATE_SKILL_THREE2:uint = 18;
      
      private var horseBoss:HorsefaceBossMoveIntruder;
      
      private var top_border:int = -3;
      
      private var bottom_border:int = 10;
      
      private var left_border:int = -7;
      
      private var right_border:int = 11;
      
      private var hasBorn:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      public function OxHeadBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -100;
         a_1467 = -60;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(OxHeadBossMoveIntruder,OxHeadBossMoveIntruderMovie) as OxHeadBossMoveIntruder;
      }
      
      override public function get width() : Number
      {
         return 190;
      }
      
      override public function get height() : Number
      {
         return 160;
      }
      
      public function CreateHorseBoss() : void
      {
         var stFieldGrid:a_3491 = null;
         stFieldGrid = m_stCurrentFieldGrid;
         if(stFieldGrid == null)
         {
            return;
         }
         this.horseBoss = HorsefaceBossMoveIntruder.a_3926();
         this.horseBoss.a_1797((1 << 16) + stFieldGrid.m_iYGridNo + 100 + stFieldGrid.m_iXGridNo,-1);
         this.horseBoss.m_stMoveIntruderTypeID = 134240625;
         stFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.horseBoss,stFieldGrid,false,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE);
         this.horseBoss.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.horseBoss.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         this.horseBoss.InitData(this);
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1463 = true;
         tagCom.AddTag(40012);
         a_1789.getInstance().addEventListener("IsLand_CallBossRecover",this.OnBossRecover);
         return b;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         a_1789.getInstance().removeEventListener("IsLand_CallBossRecover",this.OnBossRecover);
         return true;
      }
      
      private function OnBossRecover(stDataEvent:a_1778) : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var addHp:int = Math.min(m_InitialLifeValue - a_1339,2000);
         if(addHp <= 0)
         {
            return;
         }
         this.a_3969(-addHp);
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = 550;
         stAddBloodEffect.y = 430;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_JUMP_BEGIN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_JUMP_LOOP + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_JUMP_END + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE2 + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_JUMP_BEGIN + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_JUMP_LOOP + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_JUMP_END + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE2 + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 22;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING2 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_WAITING3 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING3 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_WAITING4 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING4 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_DIS_APPEAR2 + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_DIS_APPEAR2 + "_" + 1] = 14;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         this.hasBorn = false;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,7,4,3]);
         m_vStateCache.push([STATE_WAITING2,44 + 10]);
         m_vStateCache.push([STATE_DIS_APPEAR,6]);
         m_vStateCache.push([STATE_HIDE,10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         this.hasBorn = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         var offset:int = int(m_stRandomSeed.nextInt(3));
         m_vStateCache.push([STATE_APPEAR,4,4 + offset,2 + offset]);
         m_vStateCache.push([STATE_SKILL_ONE,26]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_WAITING3,20]);
         m_vStateCache.push([STATE_JUMP_BEGIN,4]);
         m_vStateCache.push([STATE_JUMP_LOOP,8,1 + m_stRandomSeed.nextInt(6)]);
         m_vStateCache.push([STATE_JUMP_END,3]);
         m_vStateCache.push([STATE_WAITING,9999]);
      }
      
      public function SkillTwo() : void
      {
         this.hasBorn = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         var arr:Array = this.horseBoss.GetBellPosition();
         if(arr[0] == 1)
         {
            m_vStateCache.push([STATE_DIS_APPEAR,6]);
            m_vStateCache.push([STATE_HIDE,5]);
            m_vStateCache.push([STATE_APPEAR,4,arr[0] + 4,arr[1]]);
         }
         else
         {
            m_vStateCache.push([STATE_MOVE,8,arr[1]]);
         }
         m_vStateCache.push([STATE_SKILL_TWO,40]);
         m_vStateCache.push([STATE_WAITING4,20]);
         m_vStateCache.push([STATE_DIS_APPEAR2,6]);
         m_vStateCache.push([STATE_HIDE,9999]);
      }
      
      public function SkillThree() : void
      {
         m_iRestTick = 0;
         m_vSkillID.length = 0;
         m_vStateCache.length = 0;
         var idx:int = int(m_stRandomSeed.nextInt(2));
         if(idx == 0)
         {
            m_vStateCache.push([STATE_APPEAR,4,7,1]);
            m_vStateCache.push([STATE_SKILL_THREE,29]);
            m_vStateCache.push([STATE_WAITING,10]);
            m_vStateCache.push([STATE_MOVE,7,5]);
         }
         else
         {
            m_vStateCache.push([STATE_APPEAR,4,7,5]);
            m_vStateCache.push([STATE_SKILL_THREE,29]);
            m_vStateCache.push([STATE_WAITING,10]);
            m_vStateCache.push([STATE_MOVE,7,1]);
         }
         m_vStateCache.push([STATE_SKILL_THREE2,29]);
         m_vStateCache.push([STATE_WAITING,30]);
         m_vStateCache.push([STATE_DIS_APPEAR,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_WAITING2:
               this.SetIsCannotSee(false);
               this.visible = true;
               this.CreateHorseBoss();
               break;
            case STATE_WAITING3:
               this.SetIsCannotSee(false);
               this.visible = true;
               this.horseBoss.SkillOne();
               break;
            case STATE_WAITING4:
               this.SetIsCannotSee(false);
               this.visible = true;
               this.setAppearToGrid(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
               break;
            case STATE_DIS_APPEAR2:
               this.horseBoss.SkillTwo();
               break;
            case STATE_HIDE:
               visible = false;
               this.SetIsCannotSee(true);
               break;
            case STATE_SKILL_ONE:
               this.SetIsCannotSee(false);
               a_1283 = false;
               this.visible = true;
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_JUMP_END:
               m_stCurrentFieldGrid.ClearFieldGridDefenseWithOption();
               break;
            case STATE_MOVE:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_JUMP_LOOP:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2],60 / (20 * 0.05));
               break;
            case STATE_DEAD:
               this.horseBoss.iDIYLife = 0;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetMoveToPosition2(iNoX:int, iNoY:int, fMoveSpeed:Number = -0.1234) : int
      {
         var fPosX:Number = getPosXByXGridNo(iNoX);
         var fPosY:Number = getPosYByYGridNo(iNoY);
         return setMoveToPosition(fPosX,fPosY,fMoveSpeed);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(Math.min(iXGridNo,8),iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(false);
         this.visible = true;
      }
      
      protected function a_4349(m_iXGridNo:int, m_iYGridNo:int) : Boolean
      {
         var numDistanceX:Number = Math.abs(getPosXByXGridNo(m_iXGridNo) - x);
         var numDistanceY:Number = Math.abs(getPosYByYGridNo(m_iYGridNo) - y);
         this.m_numXSpeed = (getPosXByXGridNo(m_iXGridNo) - x) / this.a_1581;
         this.m_numYSpeed = (getPosYByYGridNo(m_iYGridNo) - y) / this.a_1581;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         if(this.a_1581 > 0)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(this.hasBorn == false)
         {
            return false;
         }
         if(m_iBossState == STATE_BORN)
         {
            return false;
         }
         if(m_iBossState == STATE_HIDE && _damageParam.indexOf(50004) == -1)
         {
            return false;
         }
         return a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var bellEffect:BellEffect = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 21)
               {
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 79 || a_1273 == 225)
               {
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY - 2),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY - 1),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY + 1),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY + 2),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX - 2,iNoY),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX - 1,iNoY),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX + 1,iNoY),500);
                  BattleDestroyUtil.BurnFieldGridDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX + 2,iNoY),500);
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 92 || a_1273 == 238)
               {
                  BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
               }
               else if(a_1273 == 93 || a_1273 == 239)
               {
                  BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX - 1,iNoY));
               }
               else if(a_1273 == 94 || a_1273 == 240)
               {
                  BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX - 2,iNoY));
               }
               else if(a_1273 == 117 || a_1273 == 262)
               {
                  bellEffect = this.horseBoss.GetBellPosition()[2];
                  bellEffect.Change2Purple();
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 143 || a_1273 == 289)
               {
                  a_1789.getInstance().dispatchEvent(new a_1778("IsLand_CallMouseMove"));
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE && m_iBossState >= STATE_SKILL_THREE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_JUMP_LOOP;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
         this.horseBoss.iDIYLife = 0;
      }
      
      override protected function CacheNextSkill() : void
      {
         var iPos:int = 0;
         var iSkillNum:int = 0;
         var i:int = 0;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            for(i = 0; i < iSkillNum; i++)
            {
               m_vSkillID.push(i);
            }
         }
         if(m_bSkillIsOrder)
         {
            iPos = 0;
         }
         else
         {
            iPos = int(m_stRandomSeed.nextInt(m_vSkillID.length));
         }
         var iSkillID:int = m_vSkillID[iPos];
         m_vSkillID.splice(iPos,1);
         m_vSkillFunction[iSkillID]();
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override protected function MoveMySelf() : void
      {
         if(m_bIsNeedHighPrecision)
         {
            this.x = Math.round(10000 * this.x + 10000 * m_fMoveSpeedX) * 0.0001;
            this.y = Math.round(10000 * this.y + 10000 * m_fMoveSpeedY) * 0.0001;
         }
         else
         {
            this.x += m_fMoveSpeedX;
            this.y += m_fMoveSpeedY;
         }
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_MOVE)
         {
            stNextFieldGrid.ClearFieldGridDefenseWithOption();
         }
      }
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(this.GetBossFinalDamage(iRduceLifeValue));
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(this.GetBossFinalDamage(iRduceLifeValue));
         return true;
      }
      
      private function GetBossFinalDamage(damage:int) : int
      {
         if(damage > 0)
         {
            return damage / 2;
         }
         return damage;
      }
   }
}

