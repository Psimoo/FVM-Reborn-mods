package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.TheStorm
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class TheStormBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 8.5;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_APEAR_IN:uint = 8;
      
      private static const STATE_SKILL_APEAR_OUT:uint = 9;
      
      private static const STATE_SKILL_ONE_DO:uint = 10;
      
      private static const STATE_SKILL_TWO_BEGIN:uint = 11;
      
      private static const STATE_SKILL_TWO_DO:uint = 12;
      
      private static const STATE_SKILL_TWO_END:uint = 13;
      
      private static const STATE_SKILL_THREE_BEGIN:uint = 14;
      
      private static const STATE_SKILL_THREE_DO:uint = 15;
      
      private static const STATE_SKILL_THREE_END1:uint = 16;
      
      private static const STATE_SKILL_THREE_END2:uint = 17;
      
      private var m_iSkillIndex:int = 0;
      
      private var m_lTornado:Array = new Array();
      
      private var m_bUseSkillThree:Boolean = false;
      
      private var m_iDestroyCount:int = 0;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      public function TheStormBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -100;
         a_1467 = -60;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TheStormBossMoveIntruder) as TheStormBossMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheStormBossMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         for(var i:int = 0; i < this.m_lTornado.length; i++)
         {
            this.m_lTornado[i].ClearSelf();
         }
         this.m_lTornado.length = 0;
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1465 = 3;
         return b;
      }
      
      override protected function InitState() : void
      {
         this.m_iSkillIndex = 0;
         setLifeValue();
         this.SetIsCannotSee(true);
         stop();
         m_vSkillID.length = 0;
         a_1465 = 3;
         m_iRestTick = 0;
         m_iBossState = STATE_NONE;
         this.SetRandomSeed();
         this.InitSkillCache();
         InitShadow();
      }
      
      override public function get width() : Number
      {
         return 100;
      }
      
      override public function get height() : Number
      {
         return 165;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_IN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_OUT + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END1 + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END2 + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 26;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_IN + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_APEAR_OUT + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DO + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END1 + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END2 + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 26;
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
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = m_stRandomSeed.nextInt(4) + 5;
         var m_iYGridNo:int = 3;
         m_vStateCache.push([STATE_BORN,45,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_WAITING,10 * 2]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = m_stRandomSeed.nextInt(2) + 7;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(2) + 1;
         if(m_stRandomSeed.nextInt(10) < 5)
         {
            m_iYGridNo += 3;
         }
         if(this.m_iSkillIndex == 0 || this.m_iSkillIndex % 2 == 1)
         {
            m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo]);
         }
         else
         {
            m_vStateCache.push([STATE_SKILL_APEAR_OUT,6,m_iXGridNo,m_iYGridNo]);
         }
         ++this.m_iSkillIndex;
         m_vStateCache.push([STATE_SKILL_ONE_DO,34]);
         m_vStateCache.push([STATE_WAITING,10 * 3]);
         m_vStateCache.push([STATE_SKILL_APEAR_IN,5]);
         m_vStateCache.push([STATE_NONE,10 * 3]);
         var m_iXGridNo2:int = 4;
         var m_iYGridNo2:int = 3;
         if(this.m_iSkillIndex % 2 == 1)
         {
            m_iXGridNo2 = m_stRandomSeed.nextInt(2) + 5;
            m_iYGridNo2 = m_stRandomSeed.nextInt(5) + 1;
         }
         m_vStateCache.push([STATE_SKILL_APEAR_OUT,6,m_iXGridNo2,m_iYGridNo2]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,17]);
         m_vStateCache.push([STATE_SKILL_TWO_DO,30]);
         m_vStateCache.push([STATE_SKILL_TWO_END,18]);
         m_vStateCache.push([STATE_WAITING,10 * 2]);
      }
      
      private function SkillThree() : void
      {
         this.m_iDestroyCount = 0;
         this.m_bUseSkillThree = false;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_WAITING,10 * 2]);
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,20]);
         m_vStateCache.push([STATE_SKILL_THREE_DO,20]);
         m_vStateCache.push([STATE_SKILL_THREE_END2,7]);
         m_vStateCache.push([STATE_NONE,40]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var m_iSceneCount:int = 0;
         var grid:a_3491 = null;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         if(iNextState == STATE_SKILL_THREE_END2)
         {
            if(this.m_iDestroyCount >= 12)
            {
               iNextState = STATE_SKILL_THREE_END1;
               iNextValue = 11;
            }
         }
         this.UpdateSpeedByState(iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
               this.SetIsCannotSee(true);
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_NONE:
               this.SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_SKILL_APEAR_OUT:
               this.setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = true;
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_MOVE:
               this.SetIsCannotSee(false);
               this.visible = true;
               iNextValue = setMoveToPosition(getPosXByXGridNo(m_vStateCache[0][1]),getPosYByYGridNo(m_vStateCache[0][2]));
               break;
            case STATE_SKILL_THREE_BEGIN:
               m_iSceneCount = int(m_vStateCache[0][2]);
               break;
            case STATE_SKILL_TWO_DO:
               a_1465 = 0;
               grid = m_stCurrentFieldGrid;
               this.a_3502(grid);
               this.CreateTheStormWhiry(grid.m_iXGridNo - 1,grid.m_iYGridNo,-1,grid.m_iYGridNo);
               this.CreateTheStormWhiry(grid.m_iXGridNo + 1,grid.m_iYGridNo - 1,grid.m_iXGridNo + 2 - grid.m_iYGridNo,-1);
               this.CreateTheStormWhiry(grid.m_iXGridNo + 1,grid.m_iYGridNo + 1,grid.m_iXGridNo + grid.m_iYGridNo - 5,7);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
         this.SetIsCannotSee(true);
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
         if(this.a_1581 > 0 && this.m_isJumping)
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
         return STATE_BORN != m_iBossState && STATE_NONE != m_iBossState && a_1339 > 0;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      private function CreateTheStormWhiry(iNoX:int, iNoY:int, targetX:int = 0, targetY:int = 0) : void
      {
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         var theStormWhirlyMouseMoveIntruder:TheStormWhirlyMouseMoveIntruder = TheStormWhirlyMouseMoveIntruder.a_3926();
         if(theStormWhirlyMouseMoveIntruder)
         {
            theStormWhirlyMouseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            theStormWhirlyMouseMoveIntruder.m_stMoveIntruderTypeID = 134224497;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(theStormWhirlyMouseMoveIntruder,stFieldGrid,false);
            theStormWhirlyMouseMoveIntruder.x = iNoX * a_3491.a_1080;
            theStormWhirlyMouseMoveIntruder.y = iNoY * a_3491.a_1081;
            if(targetX != 0 && targetY != 0)
            {
               theStormWhirlyMouseMoveIntruder.InitData(targetX,targetY);
            }
         }
      }
      
      private function CreateTheStormTornado(iNoX:int, iNoY:int) : void
      {
         var theStormTornadoMouseMoveIntruder:TheStormTornadoMouseMoveIntruder = null;
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stFieldGrid == null)
         {
            return;
         }
         theStormTornadoMouseMoveIntruder = TheStormTornadoMouseMoveIntruder.a_3926();
         if(theStormTornadoMouseMoveIntruder)
         {
            theStormTornadoMouseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
            theStormTornadoMouseMoveIntruder.x = iNoX * a_3491.a_1080 + 120;
            theStormTornadoMouseMoveIntruder.y = iNoY * a_3491.a_1081 - 100;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(theStormTornadoMouseMoveIntruder,BattleLayerDefine.EFFECTS_TOP_TYPE);
            this.m_lTornado.push(theStormTornadoMouseMoveIntruder);
         }
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var stNextFieldGrid:a_3491 = null;
         var iNoX:int = 0;
         var iNoY:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 32)
               {
               }
               break;
            case STATE_SKILL_ONE_DO:
               if(a_1273 == 104 || a_1273 == 271)
               {
                  this.CreateTheStormWhiry(8,0);
                  this.CreateTheStormWhiry(8,1);
                  this.CreateTheStormWhiry(8,2);
                  this.CreateTheStormWhiry(8,3);
                  this.CreateTheStormWhiry(8,4);
                  this.CreateTheStormWhiry(8,5);
                  this.CreateTheStormWhiry(8,6);
               }
               break;
            case STATE_SKILL_TWO_BEGIN:
               if(a_1273 == 132 || a_1273 == 300)
               {
                  iNoX = m_stCurrentFieldGrid.m_iXGridNo;
                  iNoY = m_stCurrentFieldGrid.m_iYGridNo;
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX - 2,iNoY));
                  this.a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX + 2,iNoY));
               }
               break;
            case STATE_SKILL_TWO_END:
               if(a_1273 == 154 || a_1273 == 322)
               {
                  a_1465 = 3;
               }
               break;
            case STATE_SKILL_THREE_BEGIN:
               if(a_1273 == 180 || a_1273 == 345)
               {
                  this.CheckAllGrid();
               }
               break;
            case STATE_SKILL_THREE_DO:
               if(this.m_bUseSkillThree == false && (a_1273 == 187 || a_1273 == 352))
               {
                  this.m_bUseSkillThree = true;
                  this.DestroyAllGrid();
               }
               break;
            case STATE_SKILL_THREE_END1:
               if(a_1273 == 200 || a_1273 == 366)
               {
                  this.CreateTheStormTornado(4,3);
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_APEAR_IN && m_iBossState <= STATE_SKILL_THREE_END2);
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
         ChangeToFieldGrid(stNextFieldGrid);
      }
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      private function DestroyAllGrid() : void
      {
         var j:int = 0;
         for(var i:int = 0; i < 5; i++)
         {
            for(j = 0; j < 5; j++)
            {
               this.DestroyOnGrid(i + 2,j + 1);
            }
         }
      }
      
      private function DestroyOnGrid(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.ClearFieldGridDefense2(stNextFieldGrid);
      }
      
      private function CheckAllGrid() : void
      {
         var j:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var count:int = 0;
         for(var i:int = 0; i < 5; i++)
         {
            for(j = 0; j < 5; j++)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i + 2,j + 3);
               count += this.ClearFieldGridDefense3(stNextFieldGrid);
            }
         }
         this.m_iDestroyCount = count;
      }
      
      protected function ClearFieldGridDefense2(stFieldGrid:a_3491) : int
      {
         if(stFieldGrid == null)
         {
            return 0;
         }
         if(!stFieldGrid.m_isCanBrokeByWind == true)
         {
            return 0;
         }
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            if(stFieldGrid.m_stAttackFighter.a_3512() != 286396512 && stFieldGrid.m_stAttackFighter.a_3512() != 286396526)
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
               return 0;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            return 0;
         }
         if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.m_CatDragonWindBrokeArray.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               stFieldGrid.m_stTrayDefense.m_iDieType = 1;
               stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
               return 0;
            }
         }
         return 0;
      }
      
      protected function ClearFieldGridDefense3(stFieldGrid:a_3491) : int
      {
         if(stFieldGrid == null)
         {
            return 0;
         }
         if(!stFieldGrid.m_isCanBrokeByWind == true)
         {
            return 0;
         }
         if(null != stFieldGrid.m_stProtector && !stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            if(stFieldGrid.m_stAttackFighter.a_3512() != 286396512 && stFieldGrid.m_stAttackFighter.a_3512() != 286396526)
            {
               return 1;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stFlowerDefense && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            return 1;
         }
         if(null != stFieldGrid.m_stTrayDefense && !stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.m_CatDragonWindBrokeArray.indexOf(stFieldGrid.m_stTrayDefense.a_3512()) == -1)
            {
               return 1;
            }
         }
         return 0;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : int
      {
         if(stFieldGrid == null)
         {
            return 0;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
            return 1;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            return 1;
         }
         return 0;
      }
   }
}

