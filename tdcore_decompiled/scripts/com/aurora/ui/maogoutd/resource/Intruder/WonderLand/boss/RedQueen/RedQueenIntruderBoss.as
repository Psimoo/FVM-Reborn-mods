package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.RedQueen
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.Desert.Anubis.AnubisFirstShot;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.FrostGiants.IceEarthHole;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.utils.Dictionary;
   import flash.utils.clearInterval;
   
   public class RedQueenIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_SKILL_ONE:uint = 7;
      
      private static const STATE_SKILL_TWO:uint = 8;
      
      private static const STATE_SKILL_THREE:uint = 9;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 10;
      
      private static const STATE_CHG_TOWARD:uint = 11;
      
      private static const STATE_SPECIAL_WAITING:uint = 12;
      
      private static const STATE_FLASH_IN:uint = 13;
      
      private static const STATE_FLASH_OUT:uint = 14;
      
      private static var intervalId:int = 0;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var randomField:Array = new Array();
      
      private var m_isAddHole:Boolean;
      
      private var RandomArray:Array = new Array();
      
      public function RedQueenIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -45 + 197 - 5;
         a_1467 = -35 - 5;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RedQueenIntruderBoss) as RedQueenIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return RedQueenIntruderBossMovie;
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
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = 8 + 2;
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = 8 + 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 8 + 4;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 8 + 5;
         m_dictBossStateFrameID[STATE_SPECIAL_WAITING + "_" + 1] = 8 + 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 8 + 7;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 8 + 8;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 8 + 9;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 18;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         var m_iXGridNo:int = 8;
         var m_iYGridNo:int = 2;
         m_vStateCache.push([STATE_BORN,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_WAITING,1 * 10]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
         m_vStateCache.push([STATE_APPEAR,0,5,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillTwo);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_FLASH_IN,4]);
         m_vStateCache.push([STATE_SKILL_ONE,73]);
         m_vStateCache.push([STATE_SPECIAL_WAITING,31]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
         var m_iYGridNo:int = int(m_stRandomSeed.nextInt(7));
         m_vStateCache.push([STATE_APPEAR,8,m_iYGridNo,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_FLASH_IN,4]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,0,2,0]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_FLASH_IN,4]);
         m_vStateCache.push([STATE_SKILL_TWO,83]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
         m_vStateCache.push([STATE_APPEAR,0,5,0]);
      }
      
      private function SkillThree() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE,30]);
         m_vStateCache.push([STATE_WAITING,4 * 20]);
         m_vStateCache.push([STATE_FLASH_OUT,4]);
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
               iNextValue = 51;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               this.visible = true;
               break;
            case STATE_APPEAR:
               this.SetIsCannotSee(true);
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.visible = false;
               break;
            case STATE_FLASH_IN:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               this.visible = false;
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
         ChangeToFieldGrid(stNextFieldGrid);
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
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var iXGridNo:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_ONE:
               if(a_1273 == 130 || a_1273 == 385)
               {
                  this.SetIsCannotSee(true);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 132 || a_1273 == 387)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 133 || a_1273 == 388)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 134 || a_1273 == 389)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 143 || a_1273 == 398)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 4);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 155 || a_1273 == 410)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 156 || a_1273 == 411)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 157 || a_1273 == 412)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 158 || a_1273 == 413)
               {
                  this.SetIsCannotSee(false);
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 180 || a_1273 == 435)
               {
                  this.ActionSkillOne();
               }
               break;
            case STATE_FLASH_IN:
               if(a_1273 == 60 || a_1273 == 315)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 221 || a_1273 == 473)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               if(a_1273 == 229 || a_1273 == 481)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 231 || a_1273 == 483)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 2,m_stCurrentFieldGrid.m_iYGridNo + 2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 233 || a_1273 == 485)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 3,m_stCurrentFieldGrid.m_iYGridNo + 3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 237 || a_1273 == 489)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 4,m_stCurrentFieldGrid.m_iYGridNo + 4);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 240 || a_1273 == 452)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 5,m_stCurrentFieldGrid.m_iYGridNo + 3);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 243 || a_1273 == 455)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 6,m_stCurrentFieldGrid.m_iYGridNo + 2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 246 || a_1273 == 458)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 7,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 249 || a_1273 == 461)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 8,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 253 || a_1273 == 465)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 7,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 256 || a_1273 == 468)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 6,m_stCurrentFieldGrid.m_iYGridNo - 2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 260 || a_1273 == 472)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 5,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 263 || a_1273 == 475)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 4,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 266 || a_1273 == 478)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 3,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 268 || a_1273 == 480)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 2,m_stCurrentFieldGrid.m_iYGridNo - 2);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 272 || a_1273 == 484)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  this.a_3502(stTargetFieldGrid);
               }
               else if(a_1273 == 274 || a_1273 == 486)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  this.a_3502(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 294 || a_1273 == 548)
               {
                  xStart = 3;
                  xEnd = 8;
                  yStart = 0;
                  yEnd = 6;
                  for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                  {
                     iXGridNo = 5;
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                        if(stTargetFieldGrid.a_3492())
                        {
                           iXGridNo = xIndex;
                           break;
                        }
                     }
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,yIndex);
                     this.addSpadePokerEffect(stTargetFieldGrid);
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
         for(var i:int = 0; i < 5; i++)
         {
            do
            {
               m_iXGridNo = m_stRandomSeed.nextInt(4) + 1;
               m_iYGridNo = int(m_stRandomSeed.nextInt(7));
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1 || stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid.m_stBaseLander != null);
            this.randomField[i] = stTargetFieldGrid;
         }
      }
      
      protected function ClearFrozenFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         this.m_isAddHole = stFieldGrid.m_isShowFrozen;
         if(null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,1,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense && stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         if(this.m_isAddHole)
         {
            this.addEarthHole(stFieldGrid);
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
      
      private function ActionSkillOne() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:* = undefined;
         var stStartFieldGrid:a_3491 = null;
         var i:int = 0;
         while(this.RandomArray.length > 0)
         {
            this.RandomArray.pop();
         }
         for(var j:int = 0; j < 1; j++)
         {
            do
            {
               iXGridNo = m_stRandomSeed.nextInt(3) + 6;
            }
            while(this.RandomArray.indexOf(iXGridNo) != -1 || iXGridNo >= BattleFieldView.a_1011);
            this.RandomArray.push(iXGridNo);
         }
         for(var k:int = 0; k < this.RandomArray.length; k++)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               iXGridNo = int(this.RandomArray[k]);
               iYGridNo = i;
               stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               this.addGiantPokerEffect(stStartFieldGrid);
            }
         }
      }
      
      private function RealeaseMouse(m_TargetFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:* = undefined;
         var stStartFieldGrid:a_3491 = null;
         clearInterval(intervalId);
         intervalId = -1;
         if(null == m_TargetFieldGrid)
         {
            return;
         }
         stStartFieldGrid = m_TargetFieldGrid;
         if(stStartFieldGrid != null)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389417);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389417).toString(16));
            }
            stBaseMoveIntruder.a_1797((1 << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389417;
            stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = 0 + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
      }
      
      private function addGiantPokerEffect(stFieldGrid:a_3491) : void
      {
         var stEffect:AddGiantPokerEffect = null;
         clearInterval(intervalId);
         if(stFieldGrid != null)
         {
            stEffect = AddGiantPokerEffect.a_3926();
            stEffect.m_TargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE,stFieldGrid);
            stEffect.play();
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         }
      }
      
      private function addSpadePokerEffect(stFieldGrid:a_3491) : void
      {
         var stEffect:AddSpadePokerEffect = null;
         if(stFieldGrid != null)
         {
            stEffect = AddSpadePokerEffect.a_3926();
            stEffect.m_TargetFieldGrid = stFieldGrid;
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.BOSS_BOTTOM_EFFECT_TYPE,stFieldGrid);
            stEffect.play();
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         }
      }
      
      private function AddSkillOneShot(stStartField:a_3491) : void
      {
         if(stStartField == null)
         {
            return;
         }
         var stLastWaitShot:a_4348 = AnubisFirstShot.a_4344();
         var iPosX:int = stStartField.m_iXGridNo * a_3491.a_1080 - 17;
         var iPosY:int = stStartField.m_iYGridNo * a_3491.a_1081 - 20;
         stLastWaitShot.a_1797(0,0,50,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,0);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
      }
      
      private function ActionSkillTwo() : void
      {
      }
      
      private function ActionSkillThree(stTempFieldGrid:a_3491) : void
      {
         if(null != stTempFieldGrid)
         {
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
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_iTableID * 100,1000);
      }
   }
}

