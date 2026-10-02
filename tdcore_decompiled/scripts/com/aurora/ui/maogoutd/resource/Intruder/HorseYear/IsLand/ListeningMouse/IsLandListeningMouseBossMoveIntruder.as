package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.ListeningMouse
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import flash.utils.Dictionary;
   
   public class IsLandListeningMouseBossMoveIntruder extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (20 * 0.5);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_DIS_APPEAR:uint = 7;
      
      private static const STATE_SKILL_ONE_DRILL_IN:uint = 8;
      
      private static const STATE_SKILL_ONE_DRILL_MOVE:uint = 9;
      
      private static const STATE_SKILL_ONE_DRILL_OUT:uint = 10;
      
      private static const STATE_SKILL_TWO:uint = 11;
      
      private static const STATE_SKILL_THREE:uint = 12;
      
      private var hasBorn:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      public function IsLandListeningMouseBossMoveIntruder()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = -136;
         a_1467 = -65;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(IsLandListeningMouseBossMoveIntruder,IsLandListeningMouseBossMovie) as IsLandListeningMouseBossMoveIntruder;
      }
      
      override public function get height() : Number
      {
         return 180;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1465 = 0;
         tagCom.AddTag(40012);
         return b;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DRILL_IN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DRILL_MOVE + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DRILL_OUT + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_DIS_APPEAR + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DRILL_IN + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DRILL_MOVE + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_ONE_DRILL_OUT + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 20;
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
         if(m_stRandomSeed.nextInt(2) == 0)
         {
            m_vStateCache.push([STATE_BORN,39,7,1]);
         }
         else
         {
            m_vStateCache.push([STATE_BORN,39,7,5]);
         }
         m_vStateCache.push([STATE_WAITING,10]);
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
         this.hasBorn = true;
         m_vStateCache.length = 0;
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         m_vStateCache.push([STATE_SKILL_ONE_DRILL_IN,10]);
         if(iNoX == 8)
         {
            m_vStateCache.push([STATE_SKILL_ONE_DRILL_MOVE,7,iNoY]);
         }
         m_vStateCache.push([STATE_SKILL_ONE_DRILL_MOVE,6,iNoY]);
         m_vStateCache.push([STATE_SKILL_ONE_DRILL_MOVE,5,iNoY]);
         m_vStateCache.push([STATE_SKILL_ONE_DRILL_MOVE,4,iNoY]);
         m_vStateCache.push([STATE_SKILL_ONE_DRILL_MOVE,3,iNoY]);
      }
      
      private function SkillOne2() : void
      {
         this.hasBorn = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_ONE_DRILL_OUT,20]);
         m_vStateCache.push([STATE_WAITING,50]);
         m_vStateCache.push([STATE_DIS_APPEAR,10]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillTwo() : void
      {
         this.hasBorn = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,10,7,m_stRandomSeed.nextInt(5) + 1]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SKILL_TWO,34]);
         m_vStateCache.push([STATE_WAITING,50]);
      }
      
      private function SkillThree() : void
      {
         this.hasBorn = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_APPEAR,10,8,m_stRandomSeed.nextInt(5) + 1]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SKILL_THREE,36]);
         m_vStateCache.push([STATE_WAITING,30]);
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
               this.a_3502(m_stCurrentFieldGrid);
               break;
            case STATE_HIDE:
               visible = false;
               this.SetIsCannotSee(true);
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_MOVE:
            case STATE_SKILL_ONE_DRILL_MOVE:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_SKILL_ONE_DRILL_IN:
               a_1465 = 1;
               break;
            case STATE_SKILL_ONE_DRILL_OUT:
               a_1465 = 0;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      protected function setMoveToPosition3(iNoX:int, iNoY:int, duration:int) : void
      {
         var fDistanceX:Number = getPosXByXGridNo(iNoX) - this.x;
         var fDistanceY:Number = getPosYByYGridNo(iNoY) - this.y;
         m_fMoveSpeedY = fDistanceY / duration;
         m_fMoveSpeedX = fDistanceX / duration;
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
         var bCreateLine:int = 0;
         var arr:Array = null;
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
            case STATE_SKILL_ONE_DRILL_MOVE:
               if(m_iRestTick == 1 && this.CheckCanSkill())
               {
                  this.SkillOne2();
               }
               break;
            case STATE_SKILL_ONE_DRILL_OUT:
               if(a_1273 == 117 || a_1273 == 276)
               {
                  for(i = -1; i <= 1; i++)
                  {
                     for(j = -1; j <= 1; j++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo + i - 1,m_iYGridNo + j);
                        BattleDestroyUtil.ClearOneGrid(stTargetFieldGrid);
                        stTargetFieldGrid.buffCom.AddBuff(20047,5);
                     }
                  }
               }
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 148 || a_1273 == 307)
               {
                  for(i = 0; i < 7; i++)
                  {
                     bCreateLine = -1;
                     for(j = 2; j < 6; j++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,i);
                        if(stTargetFieldGrid != null && BattleDestroyUtil.HasDefense2(stTargetFieldGrid) == false && !stTargetFieldGrid.HasTag(40010))
                        {
                           bCreateLine = j;
                           break;
                        }
                     }
                     if(bCreateLine == -1)
                     {
                        for(j = 2; j < 6; j++)
                        {
                           stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,i);
                           if(stTargetFieldGrid != null && !stTargetFieldGrid.HasTag(40010))
                           {
                              bCreateLine = j;
                              break;
                           }
                        }
                     }
                     if(bCreateLine != -1)
                     {
                        this.CreateMouse(bCreateLine,i);
                     }
                  }
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 169 || a_1273 == 328)
               {
                  this.CreateBullet(7,m_iYGridNo - 1);
               }
               else if(a_1273 == 178 || a_1273 == 337)
               {
                  this.CreateBullet(7,m_iYGridNo + 1);
               }
               else if(a_1273 == 190 || a_1273 == 349)
               {
                  arr = [];
                  for(i = 0; i < 7; i++)
                  {
                     if(i != m_iYGridNo - 1 && i != m_iYGridNo + 1 && i != m_iYGridNo)
                     {
                        arr.push(i);
                     }
                  }
                  arr = BattleRandomUtil.ShuffleArray(arr,m_stRandomSeed);
                  this.CreateBullet(7,m_iYGridNo);
                  this.CreateBullet(7,arr[1]);
                  this.CreateBullet(7,arr[2]);
               }
         }
         return true;
      }
      
      private function CreateBullet(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var effect:IsLandSoundWaveBulletEffect = BattleEffectUtil.CreateGameEffect(IsLandSoundWaveBulletEffect,IsLandSoundWaveBulletEffectMovie,grid) as IsLandSoundWaveBulletEffect;
         effect.InitData(grid);
      }
      
      private function CreateMouse(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         var mouse:IsLandPrisonMouseMoveIntruder = IsLandPrisonMouseMoveIntruder.a_3926();
         BattleEffectUtil.CreateMouse(mouse,grid,134240641);
         this.a_3502(grid);
      }
      
      private function CheckCanSkill() : Boolean
      {
         var j:int = 0;
         var m_iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo - 1;
         var m_iYGridNo:int = m_stCurrentFieldGrid.m_iYGridNo;
         if(m_iXGridNo <= 2)
         {
            return true;
         }
         if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo).HasTag(40010))
         {
            return true;
         }
         loop0:
         for(var i:int = -1; i <= 1; )
         {
            j = -1;
            while(true)
            {
               if(j > 1)
               {
                  i++;
                  continue loop0;
               }
               if(!BattleDestroyUtil.HasDefense2(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo + i,m_iYGridNo + j)))
               {
                  break;
               }
               j++;
            }
            return false;
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState >= STATE_SKILL_ONE_DRILL_IN && m_iBossState <= STATE_SKILL_THREE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_SKILL_ONE_DRILL_MOVE;
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
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         super.ReduceAllLife(this.GetBossFinalDamage(iRduceLifeValue),bIsIgnoreArmor,ishowHuijing);
         return true;
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
         if(damage > 0 && a_1465 == 1 && _damageParam.indexOf(50005) == -1)
         {
            return 0;
         }
         return damage;
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

