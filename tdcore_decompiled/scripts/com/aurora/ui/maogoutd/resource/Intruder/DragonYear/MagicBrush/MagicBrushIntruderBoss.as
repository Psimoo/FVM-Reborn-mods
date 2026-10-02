package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.MagicBrush
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
   
   public class MagicBrushIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (0.3 * 20);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_AIR_WAITING:uint = 7;
      
      private static const STATE_AIRTOLAND:uint = 8;
      
      private static const STATE_LAND_WAITING:uint = 9;
      
      private static const STATE_LANDTOAIR:uint = 10;
      
      private static const STATE_SKILL_ONE:uint = 11;
      
      private static const STATE_SKILL_TWO:uint = 12;
      
      private static const STATE_SKILL_THREE:uint = 13;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 14;
      
      private static const STATE_CHG_TOWARD:uint = 15;
      
      protected var a_1312:int = 4;
      
      protected var a_1311:int = 1000;
      
      private var m_BornArray:Array = new Array([7,3],[7,4],[7,5]);
      
      private var m_SkillTwoArray:Array = new Array([8,2],[8,3],[8,4],[6,2],[6,3],[6,4]);
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_TotalLifeValue:int;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_CanSkillField:Array = new Array();
      
      private var iTotalNum:int = 7;
      
      public function MagicBrushIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -112;
         a_1467 = 111;
         m_iYDisplayCenterPos = -280;
         scaleX = scaleY = 0.825;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MagicBrushIntruderBoss) as MagicBrushIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicBrushIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         return b;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
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
         m_dictBossStateFrameID[STATE_AIR_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_AIRTOLAND + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_LAND_WAITING + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_LANDTOAIR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_AIR_WAITING + "_" + 1] = 2 + 8;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 2 + 8;
         m_dictBossStateFrameID[STATE_AIRTOLAND + "_" + 1] = 3 + 8;
         m_dictBossStateFrameID[STATE_LAND_WAITING + "_" + 1] = 4 + 8;
         m_dictBossStateFrameID[STATE_LANDTOAIR + "_" + 1] = 5 + 8;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 6 + 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 7 + 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 9 + 8;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 19;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][0]);
         var m_iYGridNo:int = int(this.m_BornArray[m_stRandomSeed.nextInt(this.m_BornArray.length)][1]);
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_AIR_WAITING,5 * 10]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 2;
         var m_iYGridNo:int = m_stRandomSeed.nextInt(5) + 1;
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         if(!a_1283)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_SKILL_ONE,31]);
         m_vStateCache.push([STATE_LAND_WAITING,5 * 10]);
         m_vStateCache.push([STATE_LANDTOAIR,5]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = int(this.m_SkillTwoArray[m_stRandomSeed.nextInt(this.m_SkillTwoArray.length)][0]);
         var m_iYGridNo:int = int(this.m_SkillTwoArray[m_stRandomSeed.nextInt(this.m_SkillTwoArray.length)][1]);
         m_vStateCache.push([STATE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         if(a_1283)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_SKILL_TWO,47]);
         m_vStateCache.push([STATE_LAND_WAITING,5 * 10]);
         m_vStateCache.push([STATE_LANDTOAIR,5]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE,41]);
         m_vStateCache.push([STATE_AIR_WAITING,5 * 10]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
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
               iNextValue = 45;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               break;
            case STATE_AIR_WAITING:
               this.SetIsCannotSee(false);
               a_1465 = 3;
               break;
            case STATE_LANDTOAIR:
               a_1465 = 3;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            default:
               this.SetIsCannotSee(false);
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
         this.visible = true;
         this.ChangeToFieldGrid(stNextFieldGrid);
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
            bIsCanChangeToFieldGrid = this.ChangeToFieldGrid(stNextFieldGrid);
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return a_1339 > 0;
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
         var stNextFieldGrid:a_3491 = null;
         var bIsCanChangeToFieldGrid:Boolean = false;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 10)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 25)
               {
                  this.ActionSkillThree(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 108 || a_1273 == 277)
               {
                  a_1465 = 0;
                  this.a_3502(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 118 || a_1273 == 287)
               {
                  stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 2,m_stCurrentFieldGrid.m_iYGridNo);
                  this.ActionSkillOne(stStartFieldGrid);
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 136 || a_1273 == 306)
               {
                  a_1465 = 0;
                  this.a_3502(m_stCurrentFieldGrid);
               }
               else if(a_1273 == 160 || a_1273 == 328)
               {
                  this.ActionSkillTwo(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 192 || a_1273 == 362)
               {
                  a_1465 = 3;
               }
               else if(a_1273 == 199 || a_1273 == 369)
               {
                  this.ActionSkillThree(m_stCurrentFieldGrid);
               }
         }
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
         var bIsCanChangeToFieldGrid:Boolean = this.ChangeToFieldGrid(stNextFieldGrid);
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE || m_iBossState == STATE_SKILL_TWO || m_iBossState == STATE_SKILL_THREE);
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
      
      override protected function SetIsCannotSee(bIsCannotSee:Boolean, bIsSetVisible:Boolean = true) : void
      {
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         SetCannotSeeByFighter(bIsCannotSee);
      }
      
      override protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return false;
         }
         ChangeFieldGrid(stNextFieldGrid);
         return true;
      }
      
      private function ActionSkillOne(stFieldGrid:a_3491) : void
      {
         var stClawMarkEffect:ClawMarkEffect = null;
         if(stFieldGrid != null)
         {
            stClawMarkEffect = ClawMarkEffect.a_3926();
            stClawMarkEffect.a_1598 = stFieldGrid;
            stClawMarkEffect.a_3958 = 10;
            stClawMarkEffect.a_1797(true);
            stClawMarkEffect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stClawMarkEffect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stClawMarkEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
         }
      }
      
      private function ActionSkillTwo(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = -1; i < 2; i++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo - 1,stFieldGrid.m_iYGridNo + i * 2);
               stBaseMoveIntruder = SmallDragonFireMouseMoveIntruder.a_3926();
               if(Boolean(stBaseMoveIntruder) && Boolean(stTargetFieldGrid))
               {
                  (stBaseMoveIntruder as SmallDragonFireMouseMoveIntruder).FULL_HP = this.iLifeValue * 0.05 > 1000 ? int(this.iLifeValue * 0.05) : 1000;
                  stBaseMoveIntruder.a_1797((1 << 16) + stTargetFieldGrid.m_iYGridNo,-1);
                  stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
                  stBaseMoveIntruder.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                  stBaseMoveIntruder.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stTargetFieldGrid,false,BattleLayerDefine.SHOT_TYPE);
               }
            }
         }
      }
      
      private function ActionSkillThree(stFieldGrid:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var stCloudMistEffect:CloudMistEffect = null;
         if(stFieldGrid)
         {
            this.randomFieldGrid(stFieldGrid);
            while(this.randomField.length > 0)
            {
               stTargetFieldGrid = this.randomField.pop();
               if(stTargetFieldGrid != null)
               {
                  stCloudMistEffect = CloudMistEffect.a_3926();
                  stCloudMistEffect.a_3958 = 46;
                  stCloudMistEffect.a_1598 = stTargetFieldGrid;
                  stCloudMistEffect.a_1797(false);
                  stCloudMistEffect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                  stCloudMistEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
                  stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stCloudMistEffect,BattleLayerDefine.OBSTACL_TYPE,stTargetFieldGrid);
               }
            }
         }
      }
      
      private function randomFieldGrid(stFieldGrid:a_3491) : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var m_index:int = 0;
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         while(this.m_CanSkillField.length > 0)
         {
            this.m_CanSkillField.pop();
         }
         if(stFieldGrid != null)
         {
            for(j = 0; j < BattleFieldView.a_1012; j++)
            {
               for(i = 0; i < BattleFieldView.a_1011; i++)
               {
                  stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
                  if(!stTargetFieldGrid.m_isSilent && (stTargetFieldGrid.m_stFlowerDefense != null || stTargetFieldGrid.m_stAttackFighter != null && !(stTargetFieldGrid.m_stAttackFighter is a_3924)))
                  {
                     this.m_CanSkillField.push(stTargetFieldGrid);
                  }
               }
            }
         }
         var iCnt:int = 0;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         if(this.m_CanSkillField.length <= this.iTotalNum)
         {
            for(i = 0; i < this.m_CanSkillField.length; i++)
            {
               this.randomField.push(this.m_CanSkillField[i]);
            }
            for(i = 0; i < this.iTotalNum - this.m_CanSkillField.length; i++)
            {
               do
               {
                  m_iXGridNo = int(m_stRandomSeed.nextInt(BattleFieldView.a_1011));
                  m_iYGridNo = int(m_stRandomSeed.nextInt(BattleFieldView.a_1012));
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               }
               while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_isSilent);
               this.randomField.push(stTargetFieldGrid);
            }
         }
         else
         {
            for(k = 0; k < this.iTotalNum; k++)
            {
               do
               {
                  m_index = int(m_stRandomSeed.nextInt(this.m_CanSkillField.length));
               }
               while(this.randomField.indexOf(this.m_CanSkillField[m_index]) != -1);
               this.randomField.push(this.m_CanSkillField[m_index]);
            }
         }
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

