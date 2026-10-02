package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.BurgerKingBoss
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class BurgerKingMoveIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 8.5;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE_BEGIN:uint = 8;
      
      private static const STATE_SKILL_ONE_DO:uint = 9;
      
      private static const STATE_SKILL_ONE_END:uint = 10;
      
      private static const STATE_SKILL_TWO_BEGIN:uint = 11;
      
      private static const STATE_SKILL_TWO_DO:uint = 12;
      
      private static const STATE_SKILL_TWO_END:uint = 13;
      
      private static const STATE_SKILL_THREE_BEGIN:uint = 14;
      
      private static const STATE_SKILL_THREE_DO:uint = 15;
      
      private static const STATE_SKILL_THREE_END:uint = 16;
      
      private var m_stArrADMouse:Array = new Array();
      
      private var m_stTankMouseOne:BurgerTankMouseMoveIntruder = null;
      
      private var m_stTankMouseTwo:BurgerTankMouseMoveIntruder = null;
      
      private var m_stTankMouseThree:BurgerTankMouseMoveIntruder = null;
      
      private var m_bFirstThreeSkill:Boolean = false;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var m_iCreateIndex:int = 0;
      
      public function BurgerKingMoveIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -100;
         a_1467 = -80;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(BurgerKingMoveIntruderBoss) as BurgerKingMoveIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurgerKingMoveIntruderBossMovie;
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
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 24;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_ONE_BEGIN + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DO + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_TWO_DO + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SKILL_THREE_DO + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 24;
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
         m_vStateCache.push([STATE_BORN,8,3,0]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillOne);
      }
      
      private function SkillOne() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         for(var i:* = int(this.m_stArrADMouse.length - 1); i >= 0; i--)
         {
            if(this.m_stArrADMouse[i].iLifeValue <= 0)
            {
               this.m_stArrADMouse.splice(i,1);
            }
         }
         m_vStateCache.length = 0;
         if(this.m_stArrADMouse.length < 3)
         {
            m_iXGridNo = 8;
            m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
            m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo]);
            m_vStateCache.push([STATE_SKILL_ONE_BEGIN,17]);
            m_vStateCache.push([STATE_SKILL_ONE_DO,6]);
            m_vStateCache.push([STATE_SKILL_ONE_DO,6]);
            m_vStateCache.push([STATE_SKILL_ONE_END,14]);
            m_vStateCache.push([STATE_WAITING,2 * 10]);
         }
         else
         {
            this.CacheNextSkill();
         }
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 3 + m_stRandomSeed.nextInt(3);
         var m_iYGridNo:int = int(m_stRandomSeed.nextInt(7));
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo]);
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,15]);
         var array:Array = BattleRandomUtil.ShuffleArray(new Array(0,1,2,3,4),m_stRandomSeed);
         var idx:int = int(m_stRandomSeed.nextInt(4));
         for(var i:int = 0; i < 3; i++)
         {
            m_vStateCache.push([STATE_SKILL_TWO_DO,9,array[i] + 1]);
         }
         m_vStateCache.push([STATE_SKILL_TWO_END,14]);
         m_vStateCache.push([STATE_WAITING,1 * 10]);
      }
      
      private function SkillThree() : void
      {
         var i:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var m_iSceneCount:* = 3;
         if(this.m_stTankMouseOne == null || this.m_stTankMouseOne.iLifeValue <= 0)
         {
            m_iSceneCount--;
            this.m_stTankMouseOne = null;
         }
         if(this.m_stTankMouseTwo == null || this.m_stTankMouseTwo.iLifeValue <= 0)
         {
            m_iSceneCount--;
            this.m_stTankMouseTwo = null;
         }
         if(this.m_stTankMouseThree == null || this.m_stTankMouseThree.iLifeValue <= 0)
         {
            m_iSceneCount--;
            this.m_stTankMouseThree = null;
         }
         var m_iLeaveCount:int = 3 - m_iSceneCount;
         m_vStateCache.length = 0;
         if(m_iLeaveCount > 0)
         {
            if(this.m_bFirstThreeSkill == false)
            {
               this.m_bFirstThreeSkill = true;
            }
            else
            {
               m_iXGridNo = 8;
               m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
               m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo]);
            }
            m_vStateCache.push([STATE_SKILL_THREE_BEGIN,23,m_iSceneCount]);
            for(i = 0; i < m_iLeaveCount; i++)
            {
               m_vStateCache.push([STATE_SKILL_THREE_DO,6]);
            }
            m_vStateCache.push([STATE_SKILL_THREE_END,14]);
            m_vStateCache.push([STATE_WAITING,2 * 10]);
         }
         else
         {
            this.CacheNextSkill();
         }
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var m_iSceneCount:int = 0;
         var burgerkingThinkEffect:BurgerkingThinkEffect = null;
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
               iNextValue = 36;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
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
               burgerkingThinkEffect = BurgerkingThinkEffect.a_3926();
               if(m_iSceneCount == 0)
               {
                  burgerkingThinkEffect.a_1797(false,0);
               }
               else
               {
                  burgerkingThinkEffect.a_1797(false,1);
               }
               burgerkingThinkEffect.x = x - 80;
               burgerkingThinkEffect.y = y;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(burgerkingThinkEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               break;
            case STATE_SKILL_TWO_DO:
               this.m_iCreateIndex = m_vStateCache[0][2];
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
         return STATE_MOVE != m_iBossState && a_1339 > 0;
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
         var adMoveIntruder:BurgerADMouseMoveIntruder = null;
         var iID:int = 0;
         var tankMoveIntruder:BurgerTankMouseMoveIntruder = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 32)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE_DO:
               if(a_1273 == 82 || a_1273 == 231)
               {
                  adMoveIntruder = BurgerADMouseMoveIntruder.a_3926();
                  if(adMoveIntruder)
                  {
                     adMoveIntruder.a_1797((globalMoveFighterID << 16) + m_stCurrentFieldGrid.m_iYGridNo,-1);
                     adMoveIntruder.m_stMoveIntruderTypeID = 134224481;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(adMoveIntruder,m_stCurrentFieldGrid,false);
                     adMoveIntruder.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 - 20;
                     adMoveIntruder.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + 65;
                  }
                  this.m_stArrADMouse.push(adMoveIntruder);
                  a_3969(900);
               }
               break;
            case STATE_SKILL_TWO_DO:
               iID = 90;
               if(a_1273 == 122 || a_1273 == 271)
               {
                  switch(this.m_iCreateIndex)
                  {
                     case 1:
                        stBaseMoveIntruder = a_4255.getInstance().a_4256(8389011);
                        iID = 50;
                        break;
                     case 2:
                        stBaseMoveIntruder = a_4255.getInstance().a_4256(8389009);
                        iID = 60;
                        break;
                     case 3:
                        stBaseMoveIntruder = a_4255.getInstance().a_4256(8389010);
                        iID = 70;
                        break;
                     case 4:
                        stBaseMoveIntruder = a_4255.getInstance().a_4256(8389012);
                        iID = 80;
                        break;
                     case 5:
                        stBaseMoveIntruder = a_4255.getInstance().a_4256(8389015);
                        iID = 90;
                  }
                  if(stBaseMoveIntruder)
                  {
                     stBaseMoveIntruder.SpecialSkillCallBack(m_stCurrentFieldGrid,100000,a_3491.a_1080 / (4 * 20));
                     stBaseMoveIntruder.a_1797((1 << 16) + m_stCurrentFieldGrid.m_iYGridNo + iID,-1);
                     stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389008;
                     stBaseMoveIntruder.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stBaseMoveIntruder.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true,BattleLayerDefine.INTRUDER_SKY_TYPE);
                  }
               }
               break;
            case STATE_SKILL_THREE_DO:
               if(a_1273 == 169 || a_1273 == 318)
               {
                  tankMoveIntruder = BurgerTankMouseMoveIntruder.a_3926();
                  if(tankMoveIntruder)
                  {
                     tankMoveIntruder.a_1797((globalMoveFighterID << 16) + m_stCurrentFieldGrid.m_iYGridNo,-1);
                     tankMoveIntruder.m_stMoveIntruderTypeID = 134224482;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(tankMoveIntruder,m_stCurrentFieldGrid,false);
                     tankMoveIntruder.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 - 30;
                     tankMoveIntruder.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + 65;
                  }
                  if(this.m_stTankMouseOne == null)
                  {
                     this.m_stTankMouseOne = tankMoveIntruder;
                     this.m_stTankMouseOne.m_iIndex = 1;
                  }
                  else if(this.m_stTankMouseTwo == null)
                  {
                     this.m_stTankMouseTwo = tankMoveIntruder;
                     this.m_stTankMouseTwo.m_iIndex = 2;
                  }
                  else if(this.m_stTankMouseThree == null)
                  {
                     this.m_stTankMouseThree = tankMoveIntruder;
                     this.m_stTankMouseThree.m_iIndex = 3;
                  }
                  a_3969(900);
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_BEGIN && m_iBossState <= STATE_SKILL_ONE_END);
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
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

