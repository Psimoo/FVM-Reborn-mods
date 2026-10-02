package com.aurora.ui.maogoutd.resource.Intruder.newBoss.candyLolita
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class CandyLolitaIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_FLASH_IN:uint = 6;
      
      private static const STATE_FLASH_OUT:uint = 7;
      
      private static const STATE_CHG_TOWARD:uint = 8;
      
      private static const STATE_SKILL_BORN:uint = 9;
      
      private static const STATE_SKILL_JELLY_MAGIC:uint = 10;
      
      private static const STATE_SKILL_CANDY_SHELL:uint = 11;
      
      private static const STATE_SKILL_SWEET_TOMBSTONE:uint = 12;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 13;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function CandyLolitaIntruder()
      {
         super();
         IsNeedShadow = true;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -0.5 * this.width - 60;
         a_1467 = -45;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CandyLolitaIntruder) as CandyLolitaIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CandyLolitaIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bFirst = true;
         this.m_bCanBeAttack = true;
         this.m_arrHasSweetTombstone = new Array();
         this.m_arrHasCandyShell = new Array();
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         for(var i:int = 0; i < iMaxYGridNum; i++)
         {
            this.m_arrHasSweetTombstone.push(false);
         }
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         for(i = 0; i < iMaxXGridNum; i++)
         {
            this.m_arrHasCandyShell.push(false);
         }
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
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = m_dictBossStateFrameID[STATE_WAITING + "_" + 0];
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_SKILL_JELLY_MAGIC + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_CANDY_SHELL + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 1];
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = m_dictBossStateFrameID[STATE_APPEAR + "_" + 1];
         m_dictBossStateFrameID[STATE_FLASH_IN + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 2;
         m_dictBossStateFrameID[STATE_FLASH_OUT + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 4;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0];
         m_dictBossStateFrameID[STATE_SKILL_JELLY_MAGIC + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 5;
         m_dictBossStateFrameID[STATE_SKILL_CANDY_SHELL + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 6;
         m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 1] = m_dictBossStateFrameID[STATE_SKILL_SWEET_TOMBSTONE + "_" + 0] + 7;
         m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 1] = m_dictBossStateFrameID[STATE_CHG_CAN_BE_ATTACK + "_" + 0];
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = m_dictBossStateFrameID[STATE_DEAD + "_" + 0];
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_CHG_CAN_BE_ATTACK,0]);
         m_vStateCache.push([STATE_SKILL_BORN,83 - 1,4,3]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_MOVE,0,BattleFieldView.a_1011 - 1,3]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_CHG_CAN_BE_ATTACK,0]);
         m_vStateCache.push([STATE_WAITING,30]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.CacheSkillJellyMagic);
         m_vSkillFunction.push(this.CacheSkillCandyShell);
         m_vSkillFunction.push(this.CacheSkillSweetTombstone);
      }
      
      private function CacheSkillJellyMagic() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         if(stTargetFieldGrid.m_iXGridNo != m_stCurrentFieldGrid.m_iXGridNo || stTargetFieldGrid.m_iYGridNo != m_stCurrentFieldGrid.m_iYGridNo)
         {
            m_vStateCache.push([STATE_FLASH_OUT]);
            m_vStateCache.push([STATE_APPEAR,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
            m_vStateCache.push([STATE_FLASH_IN]);
         }
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_JELLY_MAGIC,13 - 1]);
         m_vStateCache.push([STATE_WAITING,40]);
      }
      
      private function CacheSkillCandyShell() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_APPEAR,0,3]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_FLASH_IN]);
         m_vStateCache.push([STATE_SKILL_CANDY_SHELL,23 - 1]);
         m_vStateCache.push([STATE_WAITING,30]);
         m_vStateCache.push([STATE_FLASH_OUT]);
         m_vStateCache.push([STATE_APPEAR,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
         m_vStateCache.push([STATE_CHG_TOWARD,0]);
         m_vStateCache.push([STATE_FLASH_IN]);
         m_vStateCache.push([STATE_WAITING,40]);
      }
      
      private function CacheSkillSweetTombstone() : void
      {
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         var stTargetFieldGrid:a_3491 = GetRandSingleGrid(iMaxXGridNum - 1,iMaxXGridNum - 1,0,iMaxYGridNum - 1,true,-1);
         if(stTargetFieldGrid.m_iXGridNo != m_stCurrentFieldGrid.m_iXGridNo || stTargetFieldGrid.m_iYGridNo != m_stCurrentFieldGrid.m_iYGridNo)
         {
            m_vStateCache.push([STATE_FLASH_OUT]);
            m_vStateCache.push([STATE_APPEAR,stTargetFieldGrid.m_iXGridNo,stTargetFieldGrid.m_iYGridNo]);
            m_vStateCache.push([STATE_FLASH_IN]);
         }
         m_vStateCache.push([STATE_SKILL_SWEET_TOMBSTONE,36 - 1,iMaxXGridNum - 1,3]);
         m_vStateCache.push([STATE_WAITING,40]);
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
            case STATE_FLASH_IN:
               this.SetIsCannotSee(false);
               iNextValue = 5 - 1;
               break;
            case STATE_FLASH_OUT:
               iNextValue = 6 - 1;
               break;
            case STATE_APPEAR:
               iNextValue = 0;
               setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               this.SetIsCannotSee(true);
               break;
            case STATE_MOVE:
               fPosX = getPosXByXGridNo(m_vStateCache[0][2]);
               fPosY = getPosYByYGridNo(m_vStateCache[0][3]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               break;
            case STATE_CHG_CAN_BE_ATTACK:
               this.m_bCanBeAttack = !this.m_bCanBeAttack;
               SetCannotSeeByFighter(!this.m_bCanBeAttack);
               break;
            case STATE_SKILL_BORN:
               this.SetIsCannotSee(false);
               setAppearToGrid(m_vStateCache[0][2],m_vStateCache[0][3]);
               m_iLaunchNum = 1;
               m_iLaunchDelayTick = 4 - 1;
               break;
            case STATE_SKILL_JELLY_MAGIC:
               m_iLaunchNum = 3;
               m_iLaunchDelayTick = 7 - 1;
               m_iLaunchIntervalTick = 2;
               break;
            case STATE_SKILL_CANDY_SHELL:
               m_iLaunchNum = 3;
               m_iLaunchDelayTick = 14 - 1;
               m_iLaunchIntervalTick = 3;
               break;
            case STATE_SKILL_SWEET_TOMBSTONE:
               m_iLaunchNum = 2;
               m_iLaunchDelayTick = 26 - 1;
               m_iLaunchIntervalTick = 1;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function UpdateSpeedByState(iNextState:int) : void
      {
         a_1350 = MOVE_SPEED;
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         var stJellyInst:JellyMouseMoveIntruder = null;
         var stCandyShellInst:CandyShellMouseMoveIntruder = null;
         var stSweetTombstoneInst:SweetTombstoneMouseMoveIntruder = null;
         var i:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var j:int = 0;
         if(!IsCanLaunchShot(iCurrentTime))
         {
            return false;
         }
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_SKILL_BORN:
               this.a_3502(m_stCurrentFieldGrid);
               break;
            case STATE_SKILL_JELLY_MAGIC:
               if(m_iLaunchNum == 2)
               {
                  this.m_arrTargetFieldGrid.length = 0;
                  for(i = 0; i < iMaxXGridNum - 1; i++)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,m_stCurrentFieldGrid.m_iYGridNo);
                     if(stTargetFieldGrid != null && stTargetFieldGrid.a_3492())
                     {
                        this.m_arrTargetFieldGrid.push(stTargetFieldGrid);
                     }
                  }
               }
               if(this.m_arrTargetFieldGrid.length <= 0)
               {
                  break;
               }
               stTargetFieldGrid = this.m_arrTargetFieldGrid.pop();
               stJellyInst = JellyMouseMoveIntruder.a_3926() as JellyMouseMoveIntruder;
               stJellyInst.a_1797(0,-1);
               stJellyInst.iGlobalMoveFighterID = a_4265();
               stJellyInst.m_stMoveIntruderTypeID = 8388608;
               stJellyInst.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stJellyInst,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stJellyInst,stTargetFieldGrid,false);
               stJellyInst.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stJellyInst.height) / 2;
               stJellyInst.SetMaxLifeValue(1000000);
               break;
            case STATE_SKILL_CANDY_SHELL:
               if(m_iLaunchNum == 2)
               {
                  this.m_arrTargetFieldGrid.length = 0;
                  for(i = 0; i < iMaxYGridNum; i++)
                  {
                     if(!this.m_arrHasCandyShell[i])
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,i);
                        if(stTargetFieldGrid != null)
                        {
                           this.m_arrTargetFieldGrid.push(stTargetFieldGrid);
                        }
                     }
                  }
                  for(i = 0; i < 3; i++)
                  {
                     if(i >= this.m_arrTargetFieldGrid.length)
                     {
                        break;
                     }
                     j = int(m_stRandomSeed.nextInt(this.m_arrTargetFieldGrid.length - i));
                     stTargetFieldGrid = this.m_arrTargetFieldGrid[j];
                     this.m_arrTargetFieldGrid[j] = this.m_arrTargetFieldGrid[this.m_arrTargetFieldGrid.length - 1 - i];
                     this.m_arrTargetFieldGrid[this.m_arrTargetFieldGrid.length - 1 - i] = stTargetFieldGrid;
                  }
               }
               if(this.m_arrTargetFieldGrid.length <= 0)
               {
                  break;
               }
               stTargetFieldGrid = this.m_arrTargetFieldGrid.pop();
               stCandyShellInst = CandyShellMouseMoveIntruder.a_3926() as CandyShellMouseMoveIntruder;
               stCandyShellInst.a_1797(0,-1);
               stCandyShellInst.iGlobalMoveFighterID = a_4265();
               stCandyShellInst.m_stMoveIntruderTypeID = 8388608;
               stCandyShellInst.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stCandyShellInst,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stCandyShellInst,stTargetFieldGrid,false);
               stCandyShellInst.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stCandyShellInst.height) / 2;
               stCandyShellInst.SetData(this.m_arrHasCandyShell);
               this.m_arrHasCandyShell[stTargetFieldGrid.m_iYGridNo] = true;
               break;
            case STATE_SKILL_SWEET_TOMBSTONE:
               if(m_iLaunchNum == 1)
               {
                  this.m_arrTargetFieldGrid.length = 0;
                  for(i = 0; i < iMaxYGridNum; i++)
                  {
                     if(!this.m_arrHasSweetTombstone[i])
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,i);
                        if(stTargetFieldGrid != null)
                        {
                           this.m_arrTargetFieldGrid.push(stTargetFieldGrid);
                        }
                     }
                  }
                  for(i = 0; i < 2; i++)
                  {
                     if(i >= this.m_arrTargetFieldGrid.length)
                     {
                        break;
                     }
                     j = int(m_stRandomSeed.nextInt(this.m_arrTargetFieldGrid.length - i));
                     stTargetFieldGrid = this.m_arrTargetFieldGrid[j];
                     this.m_arrTargetFieldGrid[j] = this.m_arrTargetFieldGrid[this.m_arrTargetFieldGrid.length - 1 - i];
                     this.m_arrTargetFieldGrid[this.m_arrTargetFieldGrid.length - 1 - i] = stTargetFieldGrid;
                  }
               }
               if(this.m_arrTargetFieldGrid.length <= 0)
               {
                  break;
               }
               stTargetFieldGrid = this.m_arrTargetFieldGrid.pop();
               stSweetTombstoneInst = SweetTombstoneMouseMoveIntruder.a_3926() as SweetTombstoneMouseMoveIntruder;
               stSweetTombstoneInst.a_1797(0,-1);
               stSweetTombstoneInst.iGlobalMoveFighterID = a_4265();
               stSweetTombstoneInst.m_stMoveIntruderTypeID = 8388608;
               stSweetTombstoneInst.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + a_3491.a_1080 * 0.5;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSweetTombstoneInst,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stSweetTombstoneInst,stTargetFieldGrid,false);
               stSweetTombstoneInst.y = a_3491.a_1081 * stTargetFieldGrid.m_iYGridNo + (a_3491.a_1081 - stSweetTombstoneInst.height) / 2;
               stSweetTombstoneInst.SetMaxLifeValue(1000000,this.m_arrHasSweetTombstone);
               this.m_arrHasSweetTombstone[stTargetFieldGrid.m_iYGridNo] = true;
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_BORN || m_iBossState == STATE_SKILL_JELLY_MAGIC || m_iBossState == STATE_SKILL_CANDY_SHELL || m_iBossState == STATE_SKILL_SWEET_TOMBSTONE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         return STATE_SKILL_BORN != m_iBossState && STATE_FLASH_IN != m_iBossState && STATE_FLASH_OUT != m_iBossState && STATE_SKILL_CANDY_SHELL != m_iBossState && a_1339 > 0;
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
         iHorizontalDirect = 1;
         iVerticalDirect = 1;
         if(0 == m_vSkillID.length)
         {
            iSkillNum = m_iSkillNum.Value;
            if(this.m_bFirst)
            {
               this.m_bFirst = false;
               for(i = 0; i < iSkillNum; i++)
               {
                  m_vSkillID.push(i);
               }
            }
            else
            {
               m_vSkillID.push(m_stRandomSeed.nextInt(2));
               m_vSkillID.push(m_stRandomSeed.nextInt(2));
               m_vSkillID.push(2);
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
         if(bIsSetVisible)
         {
            this.visible = !bIsCannotSee;
         }
         if(m_bIsNoChangeCannotSee)
         {
            return;
         }
         if(this.m_bCanBeAttack)
         {
            SetCannotSeeByFighter(bIsCannotSee);
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

