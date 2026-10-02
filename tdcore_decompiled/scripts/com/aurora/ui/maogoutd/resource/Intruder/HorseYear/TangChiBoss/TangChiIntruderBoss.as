package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.TangChiBoss
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.utils.Dictionary;
   
   public class TangChiIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 60 / (20 * 0.35);
      
      private static const STATE_BORN:uint = 6;
      
      private static const STATE_WEAPON_WAITING:uint = 7;
      
      private static const STATE_WEAPON_MOVE:uint = 8;
      
      private static const STATE_SPEED_BEGIN:uint = 9;
      
      private static const STATE_SPEED_LOOP:uint = 10;
      
      private static const STATE_SPEED_END:uint = 11;
      
      private static const STATE_SKILL_ONE:uint = 12;
      
      private static const STATE_SKILL_TWO_BEGIN:uint = 13;
      
      private static const STATE_SKILL_TWO_LOOP:uint = 14;
      
      private static const STATE_SKILL_TWO_END:uint = 15;
      
      private static const STATE_SKILL_THREE_LOOP_NOWEAPON:uint = 16;
      
      private static const STATE_SKILL_THREE_LOOP_WEAPON:uint = 17;
      
      private static const STATE_SKILL_THREE_LOOP_SPECIAL:uint = 18;
      
      private static const STATE_SKILL_THREE_END:uint = 19;
      
      private static const STATE_SKILL_FOUR:uint = 20;
      
      private static const STATE_SKILL_FOUR_INTERRUPT_BEGIN:uint = 21;
      
      private static const STATE_SKILL_FOUR_INTERRUPT_LOOP:uint = 22;
      
      private static const STATE_SKILL_FOUR_INTERRUPT_END:uint = 23;
      
      private static const STATE_WEAPON_WAITING2:uint = 30;
      
      private static const STATE_WAITING1:uint = 31;
      
      private static const STATE_DEAD_BEGIN:uint = 24;
      
      private static const STATE_DEAD_LOOP:uint = 25;
      
      private var top_border:int = -3;
      
      private var bottom_border:int = 10;
      
      private var left_border:int = -7;
      
      private var right_border:int = 11;
      
      private var m_iMoveIndex:int = 0;
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_i2TenPercentHP:int = 0;
      
      private var m_iMAXHP:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      private var moveArr:Array = [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[0,1],[1,1],[2,1],[3,1],[4,1],[5,1],[0,2],[1,2],[2,2],[3,2],[4,2],[5,2],[0,3],[1,3],[2,3],[3,3],[4,3],[5,3],[0,4],[1,4],[2,4],[3,4],[4,4],[5,4],[0,5],[1,5],[2,5],[3,5],[4,5],[5,5],[0,6],[1,6],[2,6],[3,6],[4,6],[5,6]];
      
      private var m_bStop:Boolean = false;
      
      private var m_stBuffEffect:BaseGameEffect = null;
      
      private var m_stSpearMouse:TangChiSpearIntruder = null;
      
      public function TangChiIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = 71 - 165;
         a_1467 = 14 - 84;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TangChiIntruderBoss) as TangChiIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangChiIntruderBossMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         this.RemoveBuffEffect();
         this.RemoveSpear();
         super.a_3940();
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         a_1463 = false;
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
         m_dictBossStateFrameID[STATE_WEAPON_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WEAPON_WAITING2 + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_WEAPON_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_WAITING1 + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SPEED_BEGIN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SPEED_LOOP + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SPEED_END + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP_NOWEAPON + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP_WEAPON + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP_SPECIAL + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_INTERRUPT_BEGIN + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_INTERRUPT_LOOP + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_INTERRUPT_END + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WEAPON_WAITING + "_" + 1] = 2 + 19;
         m_dictBossStateFrameID[STATE_WEAPON_WAITING2 + "_" + 1] = 2 + 19;
         m_dictBossStateFrameID[STATE_WEAPON_MOVE + "_" + 1] = 3 + 19;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 4 + 19;
         m_dictBossStateFrameID[STATE_WAITING1 + "_" + 1] = 4 + 19;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 5 + 19;
         m_dictBossStateFrameID[STATE_SPEED_BEGIN + "_" + 1] = 6 + 19;
         m_dictBossStateFrameID[STATE_SPEED_LOOP + "_" + 1] = 7 + 19;
         m_dictBossStateFrameID[STATE_SPEED_END + "_" + 1] = 8 + 19;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 9 + 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_BEGIN + "_" + 1] = 10 + 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_LOOP + "_" + 1] = 11 + 19;
         m_dictBossStateFrameID[STATE_SKILL_TWO_END + "_" + 1] = 12 + 19;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP_NOWEAPON + "_" + 1] = 13 + 19;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP_WEAPON + "_" + 1] = 14 + 19;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP_SPECIAL + "_" + 1] = 15 + 19;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 16 + 19;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 17 + 19;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_INTERRUPT_BEGIN + "_" + 1] = 18 + 19;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_INTERRUPT_LOOP + "_" + 1] = 19 + 19;
         m_dictBossStateFrameID[STATE_SKILL_FOUR_INTERRUPT_END + "_" + 1] = 20 + 19;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 4 + 19;
         m_dictBossStateFrameID[STATE_DEAD_BEGIN + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_DEAD_LOOP + "_" + 1] = 26;
         m_dictBossStateFrameID[STATE_DEAD_BEGIN + "_" + 0] = 25;
         m_dictBossStateFrameID[STATE_DEAD_LOOP + "_" + 0] = 26;
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
      }
      
      override protected function InitSkillCache() : void
      {
         this.m_bHasHandleDie = false;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_BORN,33,5,3]);
         m_vStateCache.push([STATE_SPEED_BEGIN,18]);
         m_vStateCache.push([STATE_SPEED_LOOP,5,3,8,3,true]);
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.MoveInScene);
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.MoveInScene);
         m_vSkillFunction.push(this.SkillFour);
      }
      
      private function MoveInScene() : void
      {
         m_vStateCache.length = 0;
         var iNoY1:int = int(m_stRandomSeed.nextInt(5));
         m_vStateCache.push([STATE_SPEED_LOOP,this.right_border,iNoY1,8,iNoY1,false]);
         m_vStateCache.push([STATE_SPEED_END,12]);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_ONE,22]);
         m_vStateCache.push([STATE_WAITING1,25]);
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO_BEGIN,17]);
         m_vStateCache.push([STATE_SKILL_TWO_LOOP,0]);
      }
      
      private function SkillTwo2() : void
      {
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_TWO_END,17]);
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_THREE_LOOP_NOWEAPON,2,2]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP_NOWEAPON,2,-2]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP_NOWEAPON,2,2]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP_NOWEAPON,4,-3]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillFour() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FOUR,53]);
         m_vStateCache.push([STATE_WEAPON_WAITING,20]);
      }
      
      private function SkillFour2() : void
      {
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_FOUR_INTERRUPT_BEGIN,5]);
         m_vStateCache.push([STATE_SKILL_FOUR_INTERRUPT_LOOP,30]);
         m_vStateCache.push([STATE_SKILL_FOUR_INTERRUPT_END,11]);
         m_vStateCache.push([STATE_WEAPON_WAITING2,20]);
      }
      
      private function HandleDie() : void
      {
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_DEAD_BEGIN,17]);
         m_vStateCache.push([STATE_DEAD_LOOP,0]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var iNoX3:int = 0;
         var iNoY3:int = 0;
         var fPosX:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               this.a_3940();
               return false;
            }
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
            case STATE_SPEED_LOOP:
               visible = true;
               this.SetIsCannotSee(false);
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][3],m_vStateCache[0][4]);
               a_1283 = m_vStateCache[0][5];
               break;
            case STATE_HIDE:
               visible = false;
               this.SetIsCannotSee(true);
               break;
            case STATE_SKILL_ONE:
               this.SetIsCannotSee(false);
               a_1283 = false;
               this.visible = true;
               break;
            case STATE_SKILL_TWO_BEGIN:
               break;
            case STATE_SKILL_TWO_LOOP:
               this.SetIsCannotSee(false);
               iNextValue = this.SetMoveToPosition2(-2,m_stCurrentFieldGrid.m_iYGridNo,60 / (20 * 0.45));
               break;
            case STATE_SKILL_TWO_END:
               this.setMoveToPosition3(1,m_stCurrentFieldGrid.m_iYGridNo,iNextValue);
               this.m_iMoveIndex = 0;
               break;
            case STATE_WAITING:
            case STATE_WAITING1:
               this.SetIsCannotSee(false);
               this.visible = true;
               break;
            case STATE_SKILL_THREE_LOOP_NOWEAPON:
               this.RemoveSpear();
               a_1283 = true;
               iNoX3 = m_stCurrentFieldGrid.m_iXGridNo + m_vStateCache[0][1];
               iNoY3 = m_stCurrentFieldGrid.m_iYGridNo + m_vStateCache[0][2];
               iNextValue = this.SetMoveToPosition2(iNoX3,iNoY3,60 / (20 * 0.32));
               break;
            case STATE_MOVE:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_DEAD_BEGIN:
               a_1283 = true;
               break;
            case STATE_DEAD_LOOP:
               a_1283 = true;
               fPosX = getPosXByXGridNo(this.right_border);
               iNextValue = setMoveToPosition(fPosX,y);
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
         this.UpdateBuff();
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!IsCalTick(iCurrentTime))
         {
            return false;
         }
         m_iLastCalTime = iCurrentTime;
         ++m_iLaunchRunTick;
         if(!a_1460)
         {
            InitState();
            this.m_bHasHandleDie = false;
            a_1460 = true;
            this.m_iMAXHP = a_1339;
            this.m_i2TenPercentHP = 0.2 * this.m_iMAXHP;
         }
         if(this.m_bHasHandleDie == false && a_1339 <= 0)
         {
            this.HandleDie();
            return false;
         }
         if(m_iRestTick > 0)
         {
            nextFrame();
            if(this.IsMoving())
            {
               this.MoveMySelf();
            }
            this.CheckIsCanLaunchSkill(iCurrentTime);
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(m_iBossState == STATE_BORN || m_iBossState == STATE_HIDE || m_iBossState == STATE_SKILL_THREE_LOOP_NOWEAPON)
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
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var stStartFieldGrid:a_3491 = null;
         var iNoY:int = 0;
         var iNoY2:int = 0;
         var iAdd:int = 0;
         var arr:Array = null;
         var i:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 21)
               {
                  this.a_3502(m_stCurrentFieldGrid);
               }
               break;
            case STATE_WAITING1:
               if(m_iRestTick == 24)
               {
                  iNoY = m_stCurrentFieldGrid.m_iYGridNo + (m_stRandomSeed.nextInt(2) == 0 ? 1 : -1);
                  if(iNoY < 0)
                  {
                     iNoY = 1;
                  }
                  this.CreateSpear(2,iNoY);
               }
               else if(m_iRestTick == 20)
               {
                  iNoY2 = int(m_stRandomSeed.nextInt(5));
                  while(iNoY2 == m_stCurrentFieldGrid.m_iYGridNo)
                  {
                     iNoY2 = int(m_stRandomSeed.nextInt(5));
                  }
                  this.CreateGolfIntruder(8,iNoY2);
                  this.m_bStop = false;
               }
               break;
            case STATE_SKILL_TWO_LOOP:
               this.a_3502(m_stCurrentFieldGrid);
               if(this.m_bStop == true && x < 220)
               {
                  this.CreateGolfEffect(0,m_stCurrentFieldGrid.m_iYGridNo);
                  this.SkillTwo2();
               }
               if(x <= -60)
               {
                  if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
                  {
                     a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
                  }
               }
               break;
            case STATE_SKILL_THREE_LOOP_NOWEAPON:
               this.a_3502(m_stCurrentFieldGrid);
               if(a_1273 == 473 || a_1273 == 481 || a_1273 == 489 || a_1273 == 198 || a_1273 == 206 || a_1273 == 214)
               {
                  if(this.m_iMoveIndex == 0)
                  {
                     this.GoTargetFrame(14,14 + 19);
                  }
                  else if(this.m_iMoveIndex == 1)
                  {
                     this.GoTargetFrame(15,15 + 19);
                     this.CreatePinata(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  else if(this.m_iMoveIndex == 2)
                  {
                     this.GoTargetFrame(14,14 + 19);
                  }
                  else if(this.m_iMoveIndex == 3)
                  {
                     this.GoTargetFrame(15,15 + 19);
                     this.CreatePinata(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  else if(this.m_iMoveIndex == 4)
                  {
                     this.GoTargetFrame(14,14 + 19);
                  }
                  else if(this.m_iMoveIndex == 5)
                  {
                     this.GoTargetFrame(15,15 + 19);
                     this.CreatePinata(m_stCurrentFieldGrid.m_iXGridNo - 2,m_stCurrentFieldGrid.m_iYGridNo);
                  }
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 256 || a_1273 == 531)
               {
                  iAdd = Math.min(this.m_i2TenPercentHP,this.m_iMAXHP - a_1339);
                  if(iAdd > 0)
                  {
                     this.a_3969(-iAdd);
                  }
               }
               break;
            case STATE_SKILL_FOUR_INTERRUPT_BEGIN:
               if(a_1273 == 280 || a_1273 == 555)
               {
                  arr = BattleRandomUtil.ShuffleArray(this.moveArr,m_stRandomSeed);
                  for(i = 0; i < 3; i++)
                  {
                     if(i == 0)
                     {
                        this.CreateParperEffect(EffectManager.getInstance().CheckOutOne(TangChiPaperIntruder,TangChiYellowPaperIntruderMovie) as TangChiPaperIntruder,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(arr[i][0],arr[i][1]));
                     }
                     else if(i == 1)
                     {
                        this.CreateParperEffect(EffectManager.getInstance().CheckOutOne(TangChiPaperIntruder,TangChiRedPaperIntruderMovie) as TangChiPaperIntruder,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(arr[i][0],arr[i][1]));
                     }
                     else
                     {
                        this.CreateParperEffect(EffectManager.getInstance().CheckOutOne(TangChiPaperIntruder,TangChiBluePaperIntruderMovie) as TangChiPaperIntruder,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(arr[i][0],arr[i][1]));
                     }
                  }
               }
         }
         return true;
      }
      
      private function CreateParperEffect(stEffect:TangChiPaperIntruder, grid:a_3491) : void
      {
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         stEffect.x = x - 60;
         stEffect.y = y + 100;
         stEffect.Move2Target(grid);
      }
      
      override public function a_4210() : Boolean
      {
         if(m_iBossState == STATE_SKILL_FOUR && (Boolean(a_1273 < 253 && !IsInjured) || Boolean(a_1273 < 528 && IsInjured)))
         {
            this.SkillFour2();
         }
         else
         {
            this.a_3969(BOOM_INJURE_LIFE);
         }
         return true;
      }
      
      private function GoTargetFrame(idx1:int, idx2:int) : void
      {
         if(IsInjured)
         {
            GotoAndStopFrame(idx2 - 1,true);
         }
         else
         {
            GotoAndStopFrame(idx1 - 1,true);
         }
         ++this.m_iMoveIndex;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return Boolean(m_iBossState == STATE_SKILL_ONE);
      }
      
      override protected function IsMoving() : Boolean
      {
         return m_iBossState == STATE_MOVE || m_iBossState == STATE_WEAPON_MOVE || m_iBossState == STATE_SPEED_LOOP || m_iBossState == STATE_SKILL_THREE_LOOP_NOWEAPON || m_iBossState == STATE_SKILL_TWO_LOOP || m_iBossState == STATE_SKILL_TWO_END || m_iBossState == STATE_DEAD_LOOP;
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
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         if(bIsCanChangeToFieldGrid)
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
      
      private function CreateSpear(iNoX:int, iNoY:int) : void
      {
         var spear:TangChiSpearIntruder = null;
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         this.a_3502(grid1);
         spear = TangChiSpearIntruder.a_3926();
         spear.iGlobalMoveFighterID = a_4265();
         spear.a_1797((globalMoveFighterID << 16) + 200 + iNoY * 10 + iNoX,-1);
         spear.m_stMoveIntruderTypeID = 134224561;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(spear,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(spear,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         spear.x = a_3491.a_1080 * (iNoX + 0.5);
         spear.y = a_3491.a_1081 * (iNoY + 0.5);
         this.m_stSpearMouse = spear;
      }
      
      private function CreatePinata(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         if(grid1.HasTag(501))
         {
            return;
         }
         this.a_3502(grid1);
         var spear:TangChiPinataIntruder = TangChiPinataIntruder.a_3926();
         spear.iGlobalMoveFighterID = a_4265();
         spear.a_1797((globalMoveFighterID << 16) + 0 + iNoY * 10 + iNoX,-1);
         spear.m_stMoveIntruderTypeID = 134224562;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(spear,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(spear,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         spear.x = a_3491.a_1080 * (iNoX + 0.5);
         spear.y = a_3491.a_1081 * (iNoY + 0.5);
      }
      
      private function CreateGolfIntruder(iNoX:int, iNoY:int) : void
      {
         var spear:TangChiGolfIntruder = TangChiGolfIntruder.a_3926();
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         this.a_3502(grid1);
         spear.iGlobalMoveFighterID = a_4265();
         spear.a_1797((globalMoveFighterID << 16) + 100 + iNoY * 10 + iNoX,-1);
         spear.m_stMoveIntruderTypeID = 134224563;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(spear,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(spear,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,grid1);
         spear.x = a_3491.a_1080 * (iNoX + 0.5);
         spear.y = a_3491.a_1081 * (iNoY + 0.5);
         spear.InitBOSS(this);
      }
      
      private function CreateGolfEffect(iNoX:int, iNoY:int) : void
      {
         var stEffect:BaseGameEffect = EffectManager.getInstance().CheckOutEffect(TangChiGolfIntruderMovie);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         stEffect.x = a_3491.a_1080 * (iNoX + 0.5);
         stEffect.y = a_3491.a_1081 * (iNoY + 0.5);
         stEffect.SetAnimation(0,true);
      }
      
      private function UpdateBuff() : void
      {
         var hasBuff:Boolean = this.HasBuff();
         if(hasBuff)
         {
            this.AddBuffEffect();
            this.m_stBuffEffect.x = x;
            this.m_stBuffEffect.y = y;
            this.m_stBuffEffect.visible = visible;
         }
         else if(this.m_stBuffEffect != null)
         {
            this.m_stBuffEffect.visible = false;
         }
      }
      
      private function HasBuff() : Boolean
      {
         if(m_iBossState == STATE_BORN)
         {
            return false;
         }
         if(m_iBossState == STATE_MOVE || m_iBossState == STATE_WAITING || m_iBossState == STATE_WAITING1 || m_iBossState == STATE_SKILL_TWO_BEGIN || m_iBossState == STATE_SKILL_TWO_LOOP || m_iBossState == STATE_SKILL_TWO_END)
         {
            return this.m_stSpearMouse != null && this.m_stSpearMouse.m_stCurrentFieldGrid != null && this.m_stSpearMouse.iLifeValue > 0;
         }
         if(m_iBossState == STATE_SKILL_FOUR_INTERRUPT_BEGIN)
         {
            return false;
         }
         if(m_iBossState == STATE_SKILL_FOUR_INTERRUPT_LOOP)
         {
            return false;
         }
         if(m_iBossState == STATE_SKILL_FOUR_INTERRUPT_END)
         {
            return false;
         }
         return true;
      }
      
      private function ChangeDamage(damage:int) : int
      {
         if(this.m_stBuffEffect != null && this.m_stBuffEffect.visible == true && damage > 500 && _damageParam.indexOf(112) == -1)
         {
            damage = 500;
         }
         return damage;
      }
      
      public function TriggerStop() : void
      {
         this.m_bStop = true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(this.ChangeDamage(iRduceLifeValue));
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return super.a_4209(this.ChangeDamage(iRduceLifeValue));
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return super.ReduceAllLife(this.ChangeDamage(iRduceLifeValue),bIsIgnoreArmor,ishowHuijing);
      }
      
      private function AddBuffEffect() : void
      {
         if(this.m_stBuffEffect != null)
         {
            return;
         }
         var stEffect:BaseGameEffect = EffectManager.getInstance().CheckOutEffect(TangChiBuffEffectMovie);
         stEffect.SetAnimation(0);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         this.m_stBuffEffect = stEffect;
      }
      
      private function UpdateBuffEffect() : void
      {
         if(this.m_stBuffEffect != null)
         {
            this.m_stBuffEffect.x = x;
            this.m_stBuffEffect.y = y;
            this.m_stBuffEffect.visible = visible;
         }
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            this.a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            this.a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      private function RemoveSpear() : void
      {
         if(this.m_stSpearMouse == null)
         {
            return;
         }
         this.m_stSpearMouse.RealDie();
         this.m_stSpearMouse = null;
      }
      
      private function RemoveBuffEffect() : void
      {
         if(this.m_stBuffEffect == null)
         {
            return;
         }
         this.m_stBuffEffect.a_3940();
         this.m_stBuffEffect = null;
      }
   }
}

