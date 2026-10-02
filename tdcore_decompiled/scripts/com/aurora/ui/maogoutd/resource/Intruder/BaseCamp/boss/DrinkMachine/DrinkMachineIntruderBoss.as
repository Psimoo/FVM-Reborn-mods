package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.DrinkMachine
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.FrostGiants.IceEarthHole;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class DrinkMachineIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (0.3 * 20);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE:uint = 7;
      
      private static const STATE_SKILL_TWO:uint = 8;
      
      private static const STATE_SKILL_THREE:uint = 9;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 10;
      
      private static const STATE_CHG_TOWARD:uint = 11;
      
      protected var a_1312:int = 4;
      
      protected var a_1311:int = 1000;
      
      private var m_BornArray:Array = new Array([8,3]);
      
      private var randomField:Array = new Array();
      
      private var m_FirstSkill:Boolean = true;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_TotalLifeValue:int;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function DrinkMachineIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -40;
         a_1467 = -117;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DrinkMachineIntruderBoss) as DrinkMachineIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return DrinkMachineIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
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
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 10;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][0]);
         var m_iYGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][1]);
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
         this.m_FirstSkill = true;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(STATE_DEAD == m_iBossState || STATE_NONE == m_iBossState)
         {
            return false;
         }
         var strKey:String = getBossFrameStateKey();
         var iNextFrameID:int = int(m_dictBossStateFrameID[strKey]);
         if(null == m_dictBossStateFrameID[strKey] || 0 >= iNextFrameID)
         {
            throw Error("BaseBossMoveIntruder::ResetMovieStatus->Error strKey = " + strKey);
         }
         this.GotoAndStopFrame(iNextFrameID - 1,false);
         return true;
      }
      
      override protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         var xx:int = m_iRestTick;
         if(!bIsNeed && a_1275 == iFrame)
         {
            return;
         }
         if(m_iBossState != STATE_WAITING)
         {
            if(a_1275 == iFrame + 8 || a_1275 == iFrame - 8)
            {
               return;
            }
         }
         a_1275 = iFrame;
         m_iFrameLabelStartIndex = (a_1276[iFrame] as FrameLabel).frame;
         gotoAndStop(m_iFrameLabelStartIndex);
         a_3419();
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_ONE,40]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO,40]);
         m_vStateCache.push([STATE_WAITING,2 * 10]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE,50]);
         m_vStateCache.push([STATE_WAITING,4 * 10]);
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
               iNextValue = 46;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               this.SetIsCannotSee(false);
               break;
            default:
               this.SetIsCannotSee(false);
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_iTableID * 100,1000);
      }
      
      override protected function setAppearToGrid(iXGridNo:int, iYGridNo:int, iXOffset:int = 0, iYOffset:int = 0) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = getPosXByXGridNo(iXGridNo) + iXOffset;
         this.y = getPosYByYGridNo(iYGridNo) + iYOffset;
         ChangeToFieldGrid(stNextFieldGrid);
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
         if(!a_1460)
         {
            InitState();
            a_1460 = true;
            this.m_TotalLifeValue = iLifeValue;
         }
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
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 15)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 90 || a_1273 == 233)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 131 || a_1273 == 274)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 182 || a_1273 == 325)
               {
                  this.ActionSkillThree();
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE || m_iBossState == STATE_SKILL_TWO || m_iBossState == STATE_SKILL_THREE || m_iBossState == STATE_SKILL_THREE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         this.GotoAndStopFrame(m_dictBossStateFrameID[STATE_DEAD + "_" + iIsNudity] - 1);
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
            this.InitSkillFunction();
            m_iSkillNum.Value = m_vSkillFunction.length;
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
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      private function ActionSkillOne() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var k:int = 0;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         var n:int = 0;
         loop1:
         for(var i:int = 0; i < 4; )
         {
            while(++n <= 50)
            {
               m_iYGridNo = int(m_stRandomSeed.nextInt(BattleFieldView.a_1012));
               m_iXGridNo = 0;
               for(k = 0; k < BattleFieldView.a_1011; k++)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(k,m_iYGridNo);
                  if(stTargetFieldGrid != null && stTargetFieldGrid.a_3492())
                  {
                     m_iXGridNo = k;
                     break;
                  }
               }
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(!(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_iFieldGridType != 0))
               {
                  addr0155:
                  if(n != 51)
                  {
                     this.randomField.push(stTargetFieldGrid);
                  }
                  i++;
                  continue loop1;
               }
            }
            §§goto(addr0155);
         }
         for(var j:int = 0; j < this.randomField.length; j++)
         {
            stTargetFieldGrid = this.randomField[j];
            stBaseMoveIntruder = EmptyCansMoveIntruder.a_3926();
            if(Boolean(stBaseMoveIntruder) && Boolean(stTargetFieldGrid))
            {
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
               stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false);
               if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stBaseMoveIntruder,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
               }
            }
         }
      }
      
      private function ActionSkillTwo() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stColdDrinkEffect:ColdDrinkEffect = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         var n:int = 0;
         loop1:
         for(var i:int = 0; i < 2; )
         {
            while(++n <= 50)
            {
               m_iXGridNo = m_stRandomSeed.nextInt(3) + 1;
               m_iYGridNo = m_stRandomSeed.nextInt(5) + 1;
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(!(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_iFieldGridType != 0))
               {
                  addr0109:
                  if(n != 51)
                  {
                     this.randomField.push(stTargetFieldGrid);
                  }
                  i++;
                  continue loop1;
               }
            }
            §§goto(addr0109);
         }
         for(var j:int = 0; j < this.randomField.length; j++)
         {
            stTargetFieldGrid = this.randomField[j];
            stColdDrinkEffect = ColdDrinkEffect.a_3926();
            stColdDrinkEffect.a_1797(false);
            stColdDrinkEffect.stTargetFieldGrid = stTargetFieldGrid;
            stColdDrinkEffect.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
            stColdDrinkEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stColdDrinkEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stColdDrinkEffect,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
            }
         }
      }
      
      private function ActionSkillThree() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         var len:int = this.m_FirstSkill ? 2 : 4;
         var n:int = 0;
         loop1:
         for(var i:int = 0; i < len; )
         {
            while(++n <= 50)
            {
               m_iXGridNo = int(m_stRandomSeed.nextInt(9));
               m_iYGridNo = 3;
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               if(this.randomField.indexOf(stTargetFieldGrid) == -1)
               {
                  addr00fc:
                  if(n != 51)
                  {
                     this.randomField.push(stTargetFieldGrid);
                  }
                  i++;
                  continue loop1;
               }
            }
            §§goto(addr00fc);
         }
         for(var j:int = 0; j < this.randomField.length; j++)
         {
            stTargetFieldGrid = this.randomField[j];
            stBaseMoveIntruder = BoomBottleMoveIntruder.a_3926();
            if(Boolean(stBaseMoveIntruder) && Boolean(stTargetFieldGrid))
            {
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stTargetFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
               stTargetFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false);
               if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stBaseMoveIntruder,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo);
               }
            }
         }
         this.m_FirstSkill = false;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stIceEarthHole:IceEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         stIceEarthHole = IceEarthHole.a_3926();
         stIceEarthHole.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
         stIceEarthHole.a_1797(a_1283);
         stIceEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
         stIceEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stIceEarthHole.width);
         stIceEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stIceEarthHole.height) - 15;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stIceEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stIceEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stIceEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stIceEarthHole;
         if(a_1283)
         {
            stIceEarthHole.x = BattleFieldView.a_1013 - stIceEarthHole.x;
         }
      }
      
      protected function ClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
   }
}

