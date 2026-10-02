package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.WanderingDeitMouse
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.utils.Dictionary;
   
   public class IsLandWanderingDeitBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (20 * 0.4);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_DISAPPEAR:uint = 7;
      
      private static const STATE_SKILL_ONE:uint = 8;
      
      private static const STATE_SKILL_TWO:uint = 9;
      
      private static const STATE_SKILL_THREE_BEGIN:uint = 10;
      
      private static const STATE_SKILL_THREE_LOOP:uint = 11;
      
      private static const STATE_SKILL_THREE_END:uint = 12;
      
      private static const STATE_WAITING1:uint = 13;
      
      private static const STATE_MOVE1:uint = 14;
      
      private var top_border:int = -3;
      
      private var bottom_border:int = 10;
      
      private var left_border:int = -7;
      
      private var right_border:int = 11;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      public function IsLandWanderingDeitBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -145;
         a_1467 = -66;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(IsLandWanderingDeitBoss,IsLandWanderingDeitBossMovie) as IsLandWanderingDeitBoss;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1463 = false;
         a_1465 = 0;
         tagCom.AddTag(40012);
         return b;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_WAITING1 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE1 + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_WAITING1 + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_MOVE1 + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_DISAPPEAR + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 20;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,35,8,3]);
         m_vStateCache.push([STATE_WAITING,25]);
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillTwo);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,8,9,m_stRandomSeed.nextInt(7)]);
         m_vStateCache.push([STATE_SKILL_ONE,34]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         var arr:Array = [[2,1],[2,2],[2,4],[2,5],[5,1],[5,2],[5,4],[5,5]];
         var idx:int = int(m_stRandomSeed.nextInt(arr.length));
         m_vStateCache.push([STATE_APPEAR,8,arr[idx][0],arr[idx][1]]);
         m_vStateCache.push([STATE_SKILL_TWO,45]);
         m_vStateCache.push([STATE_WAITING1,40,arr[idx][0] + 2,arr[idx][1]]);
         if(arr[idx][1] <= 3)
         {
            m_vStateCache.push([STATE_MOVE,arr[idx][0] + 2,this.top_border]);
         }
         else
         {
            m_vStateCache.push([STATE_MOVE,arr[idx][0] + 2,this.bottom_border]);
         }
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         var idx:int = int(m_stRandomSeed.nextInt(3));
         if(idx == 0)
         {
            m_vStateCache.push([STATE_MOVE1,5,this.top_border,5,0]);
            m_vStateCache.push([STATE_SKILL_THREE_BEGIN,16]);
            m_vStateCache.push([STATE_SKILL_THREE_LOOP,5,6]);
         }
         else if(idx == 1)
         {
            m_vStateCache.push([STATE_MOVE1,4,this.bottom_border,4,6]);
            m_vStateCache.push([STATE_SKILL_THREE_BEGIN,16]);
            m_vStateCache.push([STATE_SKILL_THREE_LOOP,4,0]);
         }
         else
         {
            m_vStateCache.push([STATE_MOVE1,this.right_border,3,8,3]);
            m_vStateCache.push([STATE_SKILL_THREE_BEGIN,16]);
            m_vStateCache.push([STATE_SKILL_THREE_LOOP,2,3]);
         }
         m_vStateCache.push([STATE_SKILL_THREE_END,11]);
         m_vStateCache.push([STATE_WAITING,40]);
         m_vStateCache.push([STATE_DISAPPEAR,9]);
         m_vStateCache.push([STATE_HIDE,30]);
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
            case STATE_WAITING1:
            case STATE_APPEAR:
               a_1465 = 0;
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_MOVE1:
               visible = true;
               this.SetIsCannotSee(false);
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_HIDE:
               visible = false;
               this.SetIsCannotSee(true);
               break;
            case STATE_DISAPPEAR:
               this.SetIsCannotSee(true);
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(false);
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_SKILL_THREE_LOOP:
               this.SetIsCannotSee(false);
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2],60 / (20 * 0.3));
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetMoveToPosition2(iNoX:int, iNoY:int, numSpeed:Number = -0.1234) : int
      {
         return setMoveToPosition(getPosXByXGridNo(iNoX),getPosYByYGridNo(iNoY),numSpeed);
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
         if(m_iBossState == STATE_BORN || m_iBossState == STATE_HIDE)
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
         var i:int = 0;
         var j:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         var m_iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 21)
               {
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 152 || a_1273 == 311)
               {
                  for(i = -2; i <= 2; i++)
                  {
                     for(j = -1; j <= 1; j++)
                     {
                        this.SleepCard(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo + i,m_iYGridNo + j));
                     }
                  }
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 106 || a_1273 == 265)
               {
                  this.DropBook();
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_THREE_LOOP || m_iBossState == STATE_MOVE1;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
         m_iBossState = iDeadState;
         play();
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
         if(m_iBossState == STATE_SKILL_THREE_LOOP)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         if(bIsCanChangeToFieldGrid && m_iBossState == STATE_SKILL_THREE_LOOP)
         {
            this.a_3502(m_stCurrentFieldGrid);
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      public function DropBook() : void
      {
         var targetGrid:a_3491 = null;
         var effect:IsLandWanderingDeitMouseScrollEffect = null;
         var grid:a_3491 = null;
         var m_iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         var iCheckNoX:int = 1;
         var iNum:int = 0;
         for(var i:* = 4; i >= 1; i--)
         {
            grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,m_iYGridNo);
            if(BattleDestroyUtil.HasDefense2(grid))
            {
               iNum++;
            }
            if(iNum == 2)
            {
               iCheckNoX = i;
               break;
            }
         }
         targetGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iCheckNoX,m_iYGridNo);
         effect = BattleEffectUtil.CreateGameEffect(IsLandWanderingDeitMouseScrollEffect,IsLandWanderingDeitMouseScrollMovie,targetGrid) as IsLandWanderingDeitMouseScrollEffect;
         effect.x = x - 120;
         effect.y = y - 70;
         effect.InitData(targetGrid,this);
      }
      
      public function RecoverByMist() : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         var addHp:int = Math.min(m_InitialLifeValue - a_1339,1000);
         if(addHp <= 0)
         {
            return;
         }
         a_3969(-addHp);
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = 550;
         stAddBloodEffect.y = 430;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
      }
      
      private function SleepCard(stTempFieldGrid:a_3491) : void
      {
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.SleepTime2(15 * 20);
         }
      }
      
      override public function get height() : Number
      {
         return 165;
      }
      
      override protected function a_3940() : Boolean
      {
         BattleDestroyUtil.ClearBook(m_stCurrentFieldGrid);
         return super.a_3940();
      }
   }
}

