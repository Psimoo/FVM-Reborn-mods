package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.boss
{
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.utils.Dictionary;
   
   public class TheSnakeThiefBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 8.5;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SNAKE_WAKE:uint = 8;
      
      private static const STATE_ATTACK:uint = 9;
      
      private static const STATE_SKILL_ONE:uint = 10;
      
      private static const STATE_APPEAR_OUT:uint = 11;
      
      private static const STATE_APPEAR_IN:uint = 12;
      
      private static const STATE_SKILL_TWO:uint = 13;
      
      private static const STATE_SKILL_THREE_BEGIN:uint = 14;
      
      private static const STATE_SKILL_THREE_DO:uint = 15;
      
      private static const STATE_SKILL_THREE_END:uint = 16;
      
      private static const STATE_ATTACK_SNAKE:uint = 17;
      
      private static const STATE_WIN:uint = 18;
      
      private var brozeSnakeBoss:TheBrozeSnakeBoss;
      
      private var brozeSnakeShield:TheBrozeSnakeShield;
      
      private var m_iLeaveTick:int = -1;
      
      private var lastPosX:int = 0;
      
      private var lastPosY:int = 3;
      
      private var m_bWin:Boolean = false;
      
      private var m_bCalChange:Boolean = false;
      
      private var m_bHasShield:Boolean = true;
      
      public function TheSnakeThiefBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -48;
         a_1467 = -30;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TheSnakeThiefBoss) as TheSnakeThiefBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheSnakeThiefBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1465 = 0;
         this.lastPosX = 0;
         this.lastPosY = 3;
         a_1377 = 100;
         this.m_bCalChange = false;
         this.m_bWin = false;
         return b;
      }
      
      override protected function InitState() : void
      {
         setLifeValue();
         this.SetIsCannotSee(true);
         stop();
         m_vSkillID.length = 0;
         a_1465 = 0;
         m_iRestTick = 0;
         m_iBossState = STATE_NONE;
         this.SetRandomSeed();
         this.InitSkillCache();
         InitShadow();
         if(this.brozeSnakeShield == null)
         {
            this.brozeSnakeShield = TheBrozeSnakeShield.a_3926();
            this.addChild(this.brozeSnakeShield);
         }
         this.brozeSnakeShield.a_1797(false);
         this.brozeSnakeShield.a_3567();
      }
      
      override public function get width() : Number
      {
         return 90;
      }
      
      override public function get height() : Number
      {
         return 105;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SNAKE_WAKE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_ATTACK + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_ATTACK_SNAKE + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_WIN + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 27;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_SNAKE_WAKE + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_ATTACK + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_APPEAR_OUT + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_APPEAR_IN + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_ATTACK_SNAKE + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_WIN + "_" + 1] = 26;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 27;
      }
      
      override protected function set a_1460(value:Boolean) : void
      {
         super.a_1460 = value;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      public function GetRandom() : RandomSeed
      {
         return m_stRandomSeed;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,32,0,3]);
         m_vStateCache.push([STATE_SNAKE_WAKE,22]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         var posX:int = 0;
         var posY:int = 0;
         m_vStateCache.length = 0;
         for(var i:int = 0; i < 3; i++)
         {
            m_vStateCache.push([STATE_APPEAR_OUT,5]);
            posX = -1;
            posY = -1;
            do
            {
               posX = int(m_stRandomSeed.nextInt(3));
               posY = int(m_stRandomSeed.nextInt(7));
            }
            while(posX == this.lastPosX && posY == this.lastPosY);
            this.lastPosX = posX;
            this.lastPosY = posY;
            m_vStateCache.push([STATE_APPEAR_IN,3,posX,this.lastPosY]);
            m_vStateCache.push([STATE_SKILL_ONE,2 * 10]);
         }
         m_vStateCache.push([STATE_APPEAR_OUT,5]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         var posY:int = -1;
         do
         {
            posY = int(m_stRandomSeed.nextInt(7));
         }
         while(0 == this.lastPosX && posY == this.lastPosY);
         this.lastPosX = 0;
         this.lastPosY = posY;
         m_vStateCache.push([STATE_APPEAR_IN,3,0,this.lastPosY]);
         m_vStateCache.push([STATE_SKILL_TWO,29]);
         m_vStateCache.push([STATE_WAITING,5 * 10]);
      }
      
      public function CallWIN() : void
      {
         this.SetIsCannotSee(true);
         this.m_bWin = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR_IN,3,0,5]);
         m_vStateCache.push([STATE_WIN,28]);
         m_vStateCache.push([STATE_NONE,9999]);
      }
      
      public function IsHide() : Boolean
      {
         return m_iBossState == STATE_SKILL_THREE_BEGIN || m_iBossState == STATE_SKILL_THREE_DO;
      }
      
      public function GetBossNoY() : int
      {
         return m_stCurrentFieldGrid.m_iYGridNo;
      }
      
      private function CreateAvatarMouse(iNoX:int, iNoY:int) : void
      {
         var avatarIntruder:TheBossAvatarIntruder = null;
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         avatarIntruder = TheBossAvatarIntruder.a_3926();
         if(avatarIntruder)
         {
            avatarIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            avatarIntruder.m_stMoveIntruderTypeID = 134224545;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(avatarIntruder,stFieldGrid,false);
            avatarIntruder.x = iNoX * a_3491.a_1080;
            avatarIntruder.y = iNoY * a_3491.a_1081;
            avatarIntruder.InitBrozenSnake(this.brozeSnakeBoss,a_1339);
         }
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,14]);
         m_vStateCache.push([STATE_SKILL_THREE_DO,30 * 10]);
         m_vStateCache.push([STATE_SKILL_THREE_END,6]);
      }
      
      private function SkillAttackSnake() : void
      {
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR_OUT,5]);
         m_vStateCache.push([STATE_APPEAR_IN,3,7,3]);
         m_vStateCache.push([STATE_ATTACK_SNAKE,12]);
         m_vStateCache.push([STATE_APPEAR_IN,3,0,3]);
         m_vStateCache.push([STATE_WAITING,300 * 10]);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         this.m_bCalChange = true;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(true);
         this.visible = true;
         this.m_bCalChange = false;
      }
      
      protected function DoStateChange() : void
      {
         if(m_stCurrentFieldGrid.m_iXGridNo >= 7 && this.m_bCalChange == false)
         {
            this.SkillAttackSnake();
         }
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         super.ChangeFieldGrid(stNextFieldGrid);
         this.DoStateChange();
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.brozeSnakeBoss != null)
         {
            this.brozeSnakeBoss.a_3940();
            this.brozeSnakeBoss = null;
         }
         this.brozeSnakeShield.StopPlay();
         super.a_3940();
         return true;
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
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
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_SNAKE_WAKE:
               this.SetIsCannotSee(true);
               this.brozeSnakeBoss = TheBrozeSnakeBoss.a_3926();
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,3);
               this.brozeSnakeBoss.a_1797(this,stNextFieldGrid.m_stCurrentBattbleFieldView,false);
               break;
            case STATE_APPEAR_OUT:
               this.SetIsCannotSee(false);
               break;
            case STATE_APPEAR_IN:
               this.SetIsCannotSee(false);
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3],0);
               break;
            case STATE_SKILL_ONE:
               this.SetIsCannotSee(false);
               this.brozeSnakeBoss.SwitchSkillOne(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               break;
            case STATE_SKILL_TWO:
               this.brozeSnakeBoss.SwitchSkillTwo();
               break;
            case STATE_SKILL_THREE_BEGIN:
               this.m_iLeaveTick = 30 * 20;
               this.brozeSnakeBoss.SwitchSkillThree();
               this.SetIsCannotSee(false);
               break;
            case STATE_SKILL_THREE_DO:
               a_1475 = false;
               this.SetIsCannotSee(true);
               break;
            case STATE_SKILL_THREE_END:
               this.m_iLeaveTick = -1;
               this.SetIsCannotSee(false);
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(false);
               break;
            case STATE_WIN:
               this.SetIsCannotSee(true);
               break;
            case STATE_NONE:
               this.SetIsCannotSee(true);
               this.visible = false;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args[0] == 0)
         {
            if(m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_THREE_END || m_iBossState == STATE_WAITING)
            {
               super.a_3969(20000);
               m_iRestTick = 0;
               m_vStateCache.length = 0;
               m_vStateCache.push([STATE_WAITING,42]);
            }
         }
      }
      
      override public function a_4210() : Boolean
      {
         if(m_iBossState == STATE_SKILL_THREE_DO)
         {
            m_iRestTick = 0;
            m_vStateCache.length = 0;
            m_vStateCache.push([STATE_SKILL_THREE_END,6]);
            m_vStateCache.push([STATE_MOVE,30 * 10]);
            m_vStateCache.push([STATE_WAITING,10]);
            this.brozeSnakeBoss.testSkillThree();
         }
         else
         {
            this.a_3969(BOOM_INJURE_LIFE);
         }
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var j:int = 0;
         var grid:a_3491 = null;
         if(this.brozeSnakeBoss != null)
         {
            this.brozeSnakeBoss.TickUpdate(iCurrentTime);
         }
         if(m_iBossState == STATE_MOVE)
         {
            --this.m_iLeaveTick;
            a_1464 = false;
            a_1350 = a_3491.a_1080 / (20 * 3);
            this.GoAheadMouse(iCurrentTime);
         }
         else if(m_iBossState == STATE_SKILL_THREE_DO)
         {
            --this.m_iLeaveTick;
            a_1475 = false;
            a_1464 = true;
            a_1350 = a_3491.a_1080 / (20 * 3);
            this.GoAheadMouse(iCurrentTime);
         }
         else
         {
            a_1464 = true;
         }
         if(this.m_iLeaveTick == 0)
         {
            this.m_iLeaveTick = -1;
            m_iRestTick = 0;
            m_vStateCache.length = 0;
         }
         super.a_4216(iCurrentTime);
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         var bShield:Boolean = true;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX + i,iNoY + j);
               if(grid != null && grid.m_stMouseEarthHole != null)
               {
                  bShield = false;
                  break;
               }
            }
         }
         this.m_bHasShield = bShield;
         if(this.brozeSnakeShield != null)
         {
            if(bShield && m_iBossState != STATE_SNAKE_WAKE && m_iBossState != STATE_BORN && m_iBossState != STATE_NONE && m_iBossState != STATE_APPEAR_IN && m_iBossState != STATE_APPEAR_OUT && m_iBossState != STATE_WIN && m_iBossState != STATE_SKILL_THREE_BEGIN && m_iBossState != STATE_SKILL_THREE_DO && m_iBossState != STATE_SKILL_THREE_END && m_iBossState != STATE_ATTACK_SNAKE)
            {
               this.brozeSnakeShield.SetVisible(true);
            }
            else
            {
               this.brozeSnakeShield.SetVisible(false);
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_bHasShield == true)
         {
            super.a_3969(iRduceLifeValue * 0.1);
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_bHasShield == true)
         {
            super.a_4209(iRduceLifeValue * 0.1);
         }
         else
         {
            super.a_4209(iRduceLifeValue);
         }
         return true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_BORN != m_iBossState && STATE_BORN != m_iBossState && STATE_SKILL_THREE_BEGIN != m_iBossState && STATE_SKILL_THREE_DO != m_iBossState && !this.m_bWin && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var pos1:int = 0;
         var pos2:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState == STATE_SKILL_ONE)
         {
            trace("m_iCurrentFrame::" + a_1273 + "  " + iCurrentTime);
         }
         switch(m_iBossState)
         {
            case STATE_SNAKE_WAKE:
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 165 || a_1273 == 318)
               {
                  pos1 = int(m_stRandomSeed.nextInt(7));
                  this.CreateAvatarMouse(1,pos1);
                  pos2 = -1;
                  do
                  {
                     pos2 = int(m_stRandomSeed.nextInt(7));
                  }
                  while(pos1 == pos2);
                  this.CreateAvatarMouse(1,pos2);
               }
               break;
            case STATE_ATTACK_SNAKE:
               if(a_1273 == 175 || a_1273 == 330)
               {
                  this.brozeSnakeBoss.EnterWait();
               }
               break;
            case STATE_WIN:
               if(a_1273 == 361 || a_1273 == 209)
               {
                  if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
                  {
                     a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
                  }
               }
         }
         return true;
      }
      
      public function ExitWait() : void
      {
         m_iRestTick = 0;
         m_vStateCache.length = 0;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE && m_iBossState <= STATE_SKILL_THREE_END);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
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
      }
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      override protected function IsCanEat(stBaseDefense:a_3962) : Boolean
      {
         return !stBaseDefense.m_isShowFrozen && stBaseDefense.CanBeEat() && !(stBaseDefense is a_3924);
      }
      
      private function GoAheadMouse(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var numMoveSpeed:Number = NaN;
         if(!a_1460)
         {
            this.a_1460 = true;
         }
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(x == (a_1283 ? 0 : BattleFieldView.a_1013) && m_stCurrentFieldGrid.m_stBaseLander != null)
         {
            x += a_1283 ? 2 : -2;
            SetClarmLanderTime();
         }
         if(!a_1283 && x <= 0 || a_1283 && x >= BattleFieldView.a_1013)
         {
            x += a_1350 * a_1470;
         }
         if(a_1474 <= 0 && iCurrentTime >= a_1472 + a_1471 && !a_1475 && ((m_stCurrentFieldGrid.m_stProtector == null || m_stCurrentFieldGrid.m_stProtector.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stAttackFighter == null || !this.IsCanEat(m_stCurrentFieldGrid.m_stAttackFighter)) && (m_stCurrentFieldGrid.m_stFlowerDefense == null || m_stCurrentFieldGrid.m_stFlowerDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter == null || m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stTrayDefense == null || m_stCurrentFieldGrid.m_stTrayDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense == null || m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stOceanGoddessToolDefense == null || m_stCurrentFieldGrid.m_stOceanGoddessToolDefense.m_isShowFrozen) && (m_stCurrentFieldGrid.m_stBoomDefense == null || m_stCurrentFieldGrid.m_stBoomDefense.m_isShowFrozen || !m_stCurrentFieldGrid.m_stBoomDefense
         .isCanBeEaten) || a_1464))
         {
            a_1472 = iCurrentTime;
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               this.ChangeFieldGrid(stNextFieldGrid);
               if(stNextFieldGrid.m_stBaseLander != null)
               {
                  SetClarmLanderTime();
               }
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         if(a_1474 > 0)
         {
            --a_1474;
            numMoveSpeed = a_3491.a_1080 / 20;
            if(!a_1283)
            {
               numMoveSpeed *= -1;
            }
            x += numMoveSpeed * m_fClimbWidthTick;
            y += GetHeightByClarmLanderTime();
            iXGridNo = int((x + 60) / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               this.ChangeFieldGrid(stNextFieldGrid);
               if(stNextFieldGrid.m_stBaseLander != null)
               {
                  SetClarmLanderTime();
               }
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         iXGridNo = int(Math.max(x + 30,0) / a_3491.a_1080);
         var eatGerid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470) && !a_1464)
         {
            if(eatGerid.m_stBaseLander != null && SetClarmLanderTime())
            {
               a_1475 = false;
               this.ResetMovieStatus();
            }
            if(null != eatGerid.m_stProtector && this.IsCanEat(eatGerid.m_stProtector))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stProtector);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stAttackFighter && this.IsCanEat(eatGerid.m_stAttackFighter))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stAttackFighter);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stBoomDefense && eatGerid.m_stBoomDefense.isCanBeEaten && this.IsCanEat(eatGerid.m_stBoomDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stBoomDefense);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stFlowerDefense && this.IsCanEat(eatGerid.m_stFlowerDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stFlowerDefense);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stBaseAuxiliaryFighter && this.IsCanEat(eatGerid.m_stBaseAuxiliaryFighter))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stBaseAuxiliaryFighter);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stTrayDefense && this.IsCanEat(eatGerid.m_stTrayDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stTrayDefense);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stHoneyTrapBaseDefense && this.IsCanEat(eatGerid.m_stHoneyTrapBaseDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stHoneyTrapBaseDefense);
               this.ResetMovieStatus();
            }
            else if(null != eatGerid.m_stOceanGoddessToolDefense && this.IsCanEat(eatGerid.m_stOceanGoddessToolDefense))
            {
               a_1477 = iCurrentTime;
               a_1475 = true;
               a_4215(eatGerid.m_stOceanGoddessToolDefense);
               this.ResetMovieStatus();
            }
            else if(a_1475)
            {
               a_1475 = false;
               this.ResetMovieStatus();
            }
         }
         EattingJudge();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(STATE_DEAD == m_iBossState || STATE_NONE == m_iBossState)
         {
            return false;
         }
         var strKey:String = getBossFrameStateKey();
         if(m_iBossState == STATE_MOVE && a_1475)
         {
            strKey = STATE_ATTACK + "_" + IsInjured;
         }
         var iNextFrameID:int = int(m_dictBossStateFrameID[strKey]);
         if(null == m_dictBossStateFrameID[strKey] || 0 >= iNextFrameID)
         {
            throw Error("BaseBossMoveIntruder::ResetMovieStatus->Error strKey = " + strKey);
         }
         GotoAndStopFrame(iNextFrameID - 1,false);
         return true;
      }
   }
}

