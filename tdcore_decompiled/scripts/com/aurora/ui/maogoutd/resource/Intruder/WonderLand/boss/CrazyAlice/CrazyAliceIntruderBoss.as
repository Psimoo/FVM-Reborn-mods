package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.CrazyAlice
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class CrazyAliceIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (0.2 * 20);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_LITTLE_WAITING:uint = 7;
      
      private static const STATE_LITTLE_MOVE:uint = 8;
      
      private static const STATE_LITTLE_FLASH_IN:uint = 9;
      
      private static const STATE_LITTLE_FLASH_OUT:uint = 10;
      
      private static const STATE_LITTLE_SKILL_ONE:uint = 11;
      
      private static const STATE_BIG_WAITING:uint = 12;
      
      private static const STATE_BIG_MOVE:uint = 13;
      
      private static const STATE_BIG_FLASH_IN:uint = 14;
      
      private static const STATE_BIG_FLASH_OUT:uint = 15;
      
      private static const STATE_SKILL_TWO_JUMP_FIRST:uint = 16;
      
      private static const STATE_SKILL_TWO_JUMP_SECOND:uint = 17;
      
      private static const STATE_SKILL_TWO_JUMP_FINAL:uint = 18;
      
      private static const STATE_BIG__WEAK_WAITING:uint = 19;
      
      private static const STATE_BIG__EAT_DRUG:uint = 20;
      
      private static const STATE_LITTLE_CHG_TOWARD:uint = 21;
      
      private static const STATE_BIG_CHG_TOWARD:uint = 22;
      
      private static const STATE_LITTLE_DEAD:uint = 23;
      
      private static const STATE_BIG_DEAD:uint = 24;
      
      private var m_isBigState:Boolean = false;
      
      private var m_NeedAdd:Boolean = true;
      
      private var m_JumpArray:Array = new Array([2,1,1],[3,1,2],[4,1,1],[5,1,2],[3,3,2],[4,3,1],[5,3,2],[1,5,2],[2,5,1],[3,5,2],[1,7,2],[2,7,1],[3,7,2],[4,7,1]);
      
      private var m_JumpOut:Array = new Array();
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var MazeObstacleOut:Array = new Array([1,4,2],[1,3,3],[1,2,2],[1,1,1],[1,0,4],[2,0,3],[3,0,2],[4,0,1],[5,0,3],[5,2,3],[4,2,2],[3,2,3],[5,4,3],[5,5,2],[5,6,1],[5,7,4],[5,8,1],[4,8,2],[3,8,2],[2,8,3],[1,8,3],[1,6,1],[2,6,2],[3,6,3]);
      
      public function CrazyAliceIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -45 + 663;
         a_1467 = -65 - 73;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CrazyAliceIntruderBoss) as CrazyAliceIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrazyAliceIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_isBigState = false;
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
         m_dictBossStateFrameID[STATE_LITTLE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LITTLE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LITTLE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_LITTLE_FLASH_IN + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_LITTLE_FLASH_OUT + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_LITTLE_SKILL_ONE + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_BIG_WAITING + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_BIG_CHG_TOWARD + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_BIG_MOVE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_BIG_FLASH_IN + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_BIG_FLASH_OUT + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_JUMP_FIRST + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_JUMP_SECOND + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO_JUMP_FINAL + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_BIG__WEAK_WAITING + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_BIG__EAT_DRUG + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_LITTLE_DEAD + "_" + 0] = 30;
         m_dictBossStateFrameID[STATE_BIG_DEAD + "_" + 0] = 31;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 31;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_LITTLE_WAITING + "_" + 1] = 14 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 14 + 2;
         m_dictBossStateFrameID[STATE_LITTLE_CHG_TOWARD + "_" + 1] = 14 + 2;
         m_dictBossStateFrameID[STATE_LITTLE_MOVE + "_" + 1] = 14 + 3;
         m_dictBossStateFrameID[STATE_LITTLE_FLASH_IN + "_" + 1] = 14 + 4;
         m_dictBossStateFrameID[STATE_LITTLE_FLASH_OUT + "_" + 1] = 14 + 5;
         m_dictBossStateFrameID[STATE_LITTLE_SKILL_ONE + "_" + 1] = 14 + 6;
         m_dictBossStateFrameID[STATE_BIG_WAITING + "_" + 1] = 14 + 7;
         m_dictBossStateFrameID[STATE_BIG_CHG_TOWARD + "_" + 1] = 14 + 7;
         m_dictBossStateFrameID[STATE_BIG_MOVE + "_" + 1] = 14 + 8;
         m_dictBossStateFrameID[STATE_BIG_FLASH_IN + "_" + 1] = 14 + 9;
         m_dictBossStateFrameID[STATE_BIG_FLASH_OUT + "_" + 1] = 14 + 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_JUMP_FIRST + "_" + 1] = 14 + 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_JUMP_SECOND + "_" + 1] = 14 + 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO_JUMP_FINAL + "_" + 1] = 14 + 13;
         m_dictBossStateFrameID[STATE_BIG__WEAK_WAITING + "_" + 1] = 14 + 14;
         m_dictBossStateFrameID[STATE_BIG__EAT_DRUG + "_" + 1] = 14 + 15;
         m_dictBossStateFrameID[STATE_LITTLE_DEAD + "_" + 1] = 30;
         m_dictBossStateFrameID[STATE_BIG_DEAD + "_" + 1] = 31;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 31;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,4,3,0]);
         m_vStateCache.push([STATE_LITTLE_WAITING,1 * 10]);
         this.m_NeedAdd = true;
         this.m_JumpArray = new Array([2,1,1],[3,1,2],[4,1,1],[5,1,2],[3,3,2],[4,3,1],[5,3,2],[1,5,2],[2,5,1],[3,5,2],[1,7,2],[2,7,1],[3,7,2],[4,7,1]);
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
         if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_iXGridNo != 4) && m_stCurrentFieldGrid.m_iYGridNo != 3)
         {
            m_vStateCache.push([STATE_APPEAR,4,3,0]);
            m_vStateCache.push([STATE_LITTLE_FLASH_IN,7]);
         }
         m_vStateCache.push([STATE_LITTLE_SKILL_ONE,29]);
         m_vStateCache.push([STATE_BIG_WAITING,1 * 20]);
      }
      
      private function SkillTwo() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var m_index:int = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO_JUMP_FIRST,18]);
         while(this.m_JumpOut.length > 0)
         {
            this.m_JumpOut.pop();
         }
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         var n:int = 0;
         for(var i:int = 0; i < 3; i++)
         {
            n = 0;
            if(this.m_JumpArray.length == 0)
            {
               this.m_NeedAdd = false;
               this.m_JumpArray = new Array([2,1,1],[3,1,2],[4,1,1],[5,1,2],[3,3,2],[4,3,1],[5,3,2],[1,5,2],[2,5,1],[3,5,2],[1,7,2],[2,7,1],[3,7,2],[4,7,1]);
            }
            do
            {
               if(++n > 50 && this.m_JumpArray.length <= 2)
               {
                  this.m_NeedAdd = false;
                  this.m_JumpArray = new Array([2,1,1],[3,1,2],[4,1,1],[5,1,2],[3,3,2],[4,3,1],[5,3,2],[1,5,2],[2,5,1],[3,5,2],[1,7,2],[2,7,1],[3,7,2],[4,7,1]);
               }
               m_index = int(m_stRandomSeed.nextInt(this.m_JumpArray.length));
               m_iXGridNo = int(this.m_JumpArray[m_index][1]);
               m_iYGridNo = int(this.m_JumpArray[m_index][0]);
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924);
            this.randomField.push(stTargetFieldGrid);
            if(this.m_NeedAdd)
            {
               this.m_JumpOut.push([stTargetFieldGrid,this.m_JumpArray[m_index][2]]);
            }
            else
            {
               this.m_JumpOut.push([stTargetFieldGrid,3]);
            }
            this.m_JumpArray.splice(m_index,1);
         }
         this.m_JumpOut.reverse();
         for(var j:int = 0; j < this.randomField.length; j++)
         {
            m_iXGridNo = int(this.randomField[j].m_iXGridNo);
            m_iYGridNo = int(this.randomField[j].m_iYGridNo);
            m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
            m_vStateCache.push([STATE_SKILL_TWO_JUMP_SECOND,11]);
         }
         m_vStateCache.push([STATE_APPEAR,4,3,0]);
         m_vStateCache.push([STATE_SKILL_TWO_JUMP_FINAL,19]);
         m_vStateCache.push([STATE_BIG__WEAK_WAITING,5 * 10]);
         m_vStateCache.push([STATE_BIG__EAT_DRUG,40]);
         m_vStateCache.push([STATE_LITTLE_FLASH_OUT,4]);
      }
      
      private function SkillThree() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_LITTLE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,3,0,0]);
         m_vStateCache.push([STATE_LITTLE_FLASH_IN,7]);
         m_iXGridNo = 3 + 4;
         m_iYGridNo = 0;
         m_vStateCache.push([STATE_LITTLE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_LITTLE_FLASH_OUT,4]);
         m_vStateCache.push([STATE_LITTLE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_APPEAR,7,6,0]);
         m_vStateCache.push([STATE_LITTLE_FLASH_IN,7]);
         m_iXGridNo = 7 - 4;
         m_iYGridNo = 6;
         m_vStateCache.push([STATE_LITTLE_MOVE,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_LITTLE_FLASH_OUT,4]);
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
               iNextValue = 75;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               this.visible = true;
               break;
            case STATE_APPEAR:
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(false);
               this.visible = false;
               break;
            case STATE_LITTLE_FLASH_IN:
            case STATE_BIG_FLASH_IN:
            case STATE_SKILL_TWO_JUMP_SECOND:
            case STATE_SKILL_TWO_JUMP_FINAL:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_LITTLE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_LITTLE_CHG_TOWARD:
            case STATE_BIG_CHG_TOWARD:
               a_1283 = !a_1283;
               this.SetIsCannotSee(false);
               this.visible = true;
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
         if(bIsCanChangeToFieldGrid)
         {
            this.a_3502(m_stCurrentFieldGrid);
            if(m_stCurrentFieldGrid.m_iYGridNo == 0)
            {
               this.RealeaseMouse(m_stCurrentFieldGrid,1);
            }
            else if(m_stCurrentFieldGrid.m_iYGridNo == 6)
            {
               this.RealeaseMouse(m_stCurrentFieldGrid,2);
            }
         }
      }
      
      private function RealeaseMouse(m_TargetFieldGrid:a_3491, type:int) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:* = undefined;
         var stStartFieldGrid:a_3491 = null;
         if(null == m_TargetFieldGrid)
         {
            return;
         }
         if(type == 1)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_TargetFieldGrid.m_iXGridNo,m_TargetFieldGrid.m_iYGridNo);
            if(stStartFieldGrid != null)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389413);
               if(null == stBaseMoveIntruder)
               {
                  throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389413).toString(16));
               }
               stBaseMoveIntruder.a_1797((1 << 16) + iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389413;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = 0 + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
            }
         }
         else if(type == 2)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_TargetFieldGrid.m_iXGridNo + 1,m_TargetFieldGrid.m_iYGridNo);
            if(stStartFieldGrid != null)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389422);
               if(null == stBaseMoveIntruder)
               {
                  throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389422).toString(16));
               }
               stBaseMoveIntruder.a_1797((1 << 16) + iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389422;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = 0 + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
            }
         }
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
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_BORN != m_iBossState && a_1339 > 0;
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
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
         }
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 19)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_LITTLE_SKILL_ONE:
               if(a_1273 == 133 || a_1273 == 336)
               {
                  this.a_3502(m_stCurrentFieldGrid);
                  this.ActionSkillOne();
               }
               break;
            case STATE_LITTLE_FLASH_IN:
               if(a_1273 == 102 || a_1273 == 305)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_SKILL_TWO_JUMP_SECOND:
               if(a_1273 == 196 || a_1273 == 398)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_TWO_JUMP_FINAL:
               if(a_1273 == 209 || a_1273 == 411)
               {
                  xStart = Math.max(m_stCurrentFieldGrid.m_iXGridNo - 1,0);
                  xEnd = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
                  yStart = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 1,0);
                  yEnd = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        this.a_3502(stStartFieldGrid);
                     }
                  }
               }
         }
         return true;
      }
      
      private function randomFieldGrid() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         for(var i:int = 0; i < 2; i++)
         {
            do
            {
               m_iXGridNo = int(m_stRandomSeed.nextInt(4));
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null);
            this.randomField[i] = stTargetFieldGrid;
         }
      }
      
      private function ActionSkillOne() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var count:int = 0;
         for(var j:int = 0; j < this.MazeObstacleOut.length; j++)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.MazeObstacleOut[j][1],this.MazeObstacleOut[j][0]);
            if(Boolean(stStartFieldGrid) && Boolean(stStartFieldGrid.m_stMouseObstacle) && stStartFieldGrid.m_iFieldGridType == 4)
            {
               count++;
            }
         }
         if(count > 15)
         {
            return;
         }
         for(var i:int = 0; i < this.MazeObstacleOut.length; i++)
         {
            stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.MazeObstacleOut[i][1],this.MazeObstacleOut[i][0]);
            switch(this.MazeObstacleOut[i][2])
            {
               case 1:
                  stBaseMoveIntruder = MazeObstacleOneMoveIntruder.a_3926();
                  break;
               case 2:
                  stBaseMoveIntruder = MazeObstacleTwoMoveIntruder.a_3926();
                  break;
               case 3:
                  stBaseMoveIntruder = MazeObstacleThreeMoveIntruder.a_3926();
                  break;
               case 4:
                  stBaseMoveIntruder = MazeObstacleFourMoveIntruder.a_3926();
                  break;
               default:
                  stBaseMoveIntruder = null;
            }
            if(Boolean(stBaseMoveIntruder) && Boolean(stStartFieldGrid) && !(stStartFieldGrid.m_stAttackFighter is a_3924))
            {
               stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stStartFieldGrid.m_iYGridNo,-1);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
               stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
               stBaseMoveIntruder.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081;
               stStartFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
               stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
            }
         }
      }
      
      private function ActionSkillTwo() : void
      {
         var stStartFieldGrid:a_3491 = null;
         var temp:Array = null;
         var stBaseEffect:* = undefined;
         this.a_3502(m_stCurrentFieldGrid);
         if(this.m_JumpOut.length > 0)
         {
            temp = this.m_JumpOut.pop();
            if(temp)
            {
               stStartFieldGrid = temp[0];
               if(stStartFieldGrid != null)
               {
                  switch(temp[1])
                  {
                     case 1:
                        stBaseEffect = BrokenGridLightEffect.a_3926();
                        break;
                     case 2:
                        stBaseEffect = BrokenGridDarkEffect.a_3926();
                        break;
                     default:
                        stBaseEffect = null;
                  }
                  if(stBaseEffect != null)
                  {
                     stBaseEffect.m_TargetFieldGrid = stStartFieldGrid;
                     stBaseEffect.a_1797(false);
                     stBaseEffect.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stBaseEffect.y = stStartFieldGrid.m_iYGridNo * a_3491.a_1081;
                     stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stBaseEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartFieldGrid);
                     stBaseEffect.play();
                     stStartFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stBaseEffect);
                  }
               }
            }
         }
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_LITTLE_SKILL_ONE || m_iBossState == STATE_SKILL_TWO_JUMP_FIRST || m_iBossState == STATE_SKILL_TWO_JUMP_SECOND || m_iBossState == STATE_SKILL_TWO_JUMP_FINAL);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_LITTLE_MOVE || m_iBossState == STATE_BIG_MOVE;
      }
      
      override protected function LifeIsZeroHandle(iDeadState:int) : void
      {
         ClearState();
         var iIsNudity:int = IsInjured ? 1 : 0;
         if(this.m_isBigState)
         {
            GotoAndStopFrame(m_dictBossStateFrameID[STATE_BIG_DEAD + "_" + iIsNudity] - 1);
         }
         else
         {
            GotoAndStopFrame(m_dictBossStateFrameID[STATE_LITTLE_DEAD + "_" + iIsNudity] - 1);
         }
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
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.IsCanReduceLife() && iRduceLifeValue != 0)
         {
            if(m_iBossState == STATE_BIG__WEAK_WAITING)
            {
               super.a_3969(iRduceLifeValue * 3);
            }
            else
            {
               super.a_3969(iRduceLifeValue);
            }
            UpdateBossBloodProgress();
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.IsCanReduceLife() && iRduceLifeValue != 0)
         {
            if(m_iBossState == STATE_BIG__WEAK_WAITING)
            {
               super.a_4209(iRduceLifeValue * 3);
            }
            else
            {
               super.a_4209(iRduceLifeValue);
            }
            UpdateBossBloodProgress();
         }
         return true;
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

