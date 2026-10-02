package com.aurora.ui.maogoutd.resource.Intruder.TigerYear.boss
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.utils.Dictionary;
   
   public class TigerMouseIntruderBoss extends BaseBossMoveIntruder
   {
      
      private static const MOVE_SPEED:Number = 15;
      
      private static const STATE_CHG_CAN_BE_ATTACK:uint = 6;
      
      private static const STATE_CHG_TOWARD:uint = 7;
      
      private static const STATE_SKILL_BORN:uint = 8;
      
      private static const STATE_SKILL_MOVESTART:uint = 9;
      
      private static const STATE_SKILL_FALLBAMBOO_READY:uint = 11;
      
      private static const STATE_SKILL_FALLBAMBOO_THROW_UP:uint = 12;
      
      private static const STATE_SKILL_FALLBAMBOO_THROW_MID:uint = 13;
      
      private static const STATE_SKILL_FALLBAMBOO_THROW_DOWN:uint = 14;
      
      private static const STATE_SKILL_WINDCLOUDS_DROP:uint = 15;
      
      private static const STATE_SKILL_WINDCLOUDS_UP:uint = 16;
      
      private static const STATE_SKILL_WINDCLOUDS_DOWN:uint = 17;
      
      private static const STATE_SKILL_SHADOWBODY_READY:uint = 18;
      
      private static const STATE_SKILL_SHADOWBODY_ACTION:uint = 19;
      
      private static const STATE_SKILL_SHADOWBODY_OUT:uint = 20;
      
      private var m_bFirst:Boolean;
      
      private var m_bCanBeAttack:Boolean;
      
      private var m_arrHasSweetTombstone:Array;
      
      private var m_arrHasCandyShell:Array;
      
      private var m_OutArray:Array = new Array([1,1],[1,2],[1,3],[1,4],[1,5],[2,1],[2,2],[2,3],[2,4],[2,5],[6,1],[6,2],[6,3],[6,4],[6,5],[7,1],[7,2],[7,3],[7,4],[7,5]);
      
      private var shadowPoistion:Array = new Array([0,0],[0,6],[8,3]);
      
      private var skillOneMode:int;
      
      private var shadowIndex:int = 0;
      
      private var m_isJumping:Boolean = false;
      
      private var m_numYSpeed:int = 0;
      
      private var a_1581:int = 0;
      
      private var m_numXSpeed:int = 0;
      
      private var m_arrTargetFieldGrid:Vector.<a_3491> = new Vector.<a_3491>();
      
      public function TigerMouseIntruderBoss()
      {
         super();
         IsNeedShadow = false;
         m_fOrginSpeed = MOVE_SPEED;
         a_1279 = 184;
         a_1467 = -37;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TigerMouseIntruderBoss) as TigerMouseIntruderBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TigerMouseIntruderBossMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         var b:Boolean = false;
         b = super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         m_bSkillIsOrder = true;
         this.m_bFirst = true;
         this.m_bCanBeAttack = true;
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
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SKILL_MOVESTART + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_READY + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_THROW_DOWN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_THROW_MID + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_THROW_UP + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SKILL_WINDCLOUDS_DROP + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_WINDCLOUDS_UP + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_WINDCLOUDS_DOWN + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_SHADOWBODY_READY + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_SHADOWBODY_ACTION + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_SHADOWBODY_OUT + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_BORN + "_" + 1] = 15 + 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 15 + 2;
         m_dictBossStateFrameID[STATE_APPEAR + "_" + 1] = 15 + 2;
         m_dictBossStateFrameID[STATE_CHG_TOWARD + "_" + 1] = 15 + 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 15 + 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 15 + 3;
         m_dictBossStateFrameID[STATE_SKILL_MOVESTART + "_" + 1] = 15 + 4;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_READY + "_" + 1] = 15 + 5;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_THROW_DOWN + "_" + 1] = 15 + 6;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_THROW_MID + "_" + 1] = 15 + 7;
         m_dictBossStateFrameID[STATE_SKILL_FALLBAMBOO_THROW_UP + "_" + 1] = 15 + 8;
         m_dictBossStateFrameID[STATE_SKILL_WINDCLOUDS_DROP + "_" + 1] = 15 + 9;
         m_dictBossStateFrameID[STATE_SKILL_WINDCLOUDS_UP + "_" + 1] = 15 + 10;
         m_dictBossStateFrameID[STATE_SKILL_WINDCLOUDS_DOWN + "_" + 1] = 15 + 11;
         m_dictBossStateFrameID[STATE_SKILL_SHADOWBODY_READY + "_" + 1] = 15 + 12;
         m_dictBossStateFrameID[STATE_SKILL_SHADOWBODY_ACTION + "_" + 1] = 15 + 13;
         m_dictBossStateFrameID[STATE_SKILL_SHADOWBODY_OUT + "_" + 1] = 15 + 14;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 15 + 15;
      }
      
      override protected function InitSkillCache() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_BORN,9,3,0]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
      }
      
      override protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         m_stRandomSeed.setSeed(enterRoom.m_iTableID * 100,1000);
      }
      
      override protected function InitSkillFunction() : void
      {
         var skillRandom:int = 0;
         while(m_vSkillFunction.length > 0)
         {
            m_vSkillFunction.pop();
         }
         skillRandom = int(m_stRandomSeed.nextInt(100));
         if(skillRandom % 2 == 0)
         {
            m_vSkillFunction.push(this.Fallbamboo);
         }
         else
         {
            m_vSkillFunction.push(this.windCloudsSkill);
         }
         skillRandom = int(m_stRandomSeed.nextInt(100));
         if(skillRandom % 2 == 0)
         {
            m_vSkillFunction.push(this.Fallbamboo);
         }
         else
         {
            m_vSkillFunction.push(this.windCloudsSkill);
         }
         skillRandom = int(m_stRandomSeed.nextInt(100));
         if(skillRandom % 2 == 0)
         {
            m_vSkillFunction.push(this.Fallbamboo);
         }
         else
         {
            m_vSkillFunction.push(this.windCloudsSkill);
         }
         m_vSkillFunction.push(this.shadowBodySkill);
      }
      
      private function Fallbamboo() : void
      {
         m_vStateCache.length = 0;
         this.skillOneMode = m_stRandomSeed.nextInt(100) % 3;
         if(this.skillOneMode == 0)
         {
            m_vStateCache.push([STATE_SKILL_MOVESTART,11]);
            m_vStateCache.push([STATE_MOVE,9,6,0]);
            m_vStateCache.push([STATE_SKILL_FALLBAMBOO_READY,11 * 2]);
            m_vStateCache.push([STATE_SKILL_FALLBAMBOO_THROW_UP,39]);
         }
         else if(this.skillOneMode == 1)
         {
            m_vStateCache.push([STATE_SKILL_FALLBAMBOO_READY,11 * 2]);
            m_vStateCache.push([STATE_SKILL_FALLBAMBOO_THROW_MID,39]);
         }
         else if(this.skillOneMode == 2)
         {
            m_vStateCache.push([STATE_SKILL_MOVESTART,11]);
            m_vStateCache.push([STATE_MOVE,9,0,0]);
            m_vStateCache.push([STATE_SKILL_FALLBAMBOO_READY,11 * 2]);
            m_vStateCache.push([STATE_SKILL_FALLBAMBOO_THROW_DOWN,39]);
         }
         m_vStateCache.push([STATE_HIDE,2]);
         m_vStateCache.push([STATE_APPEAR,9,3,0]);
         m_vStateCache.push([STATE_SKILL_WINDCLOUDS_DROP,30]);
      }
      
      private function windCloudsSkill() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_WINDCLOUDS_UP,8]);
         m_vStateCache.push([STATE_HIDE,2]);
         do
         {
            m_iXGridNo = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][0]);
            m_iYGridNo = int(this.m_OutArray[m_stRandomSeed.nextInt(this.m_OutArray.length)][1]);
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         }
         while(stTargetFieldGrid.m_stAttackFighter is a_3924);
         m_vStateCache.push([STATE_APPEAR,m_iXGridNo,m_iYGridNo,0]);
         m_vStateCache.push([STATE_SKILL_WINDCLOUDS_DOWN,21]);
         m_vStateCache.push([STATE_WAITING,2 * 20]);
         m_vStateCache.push([STATE_MOVE,9,3,0]);
      }
      
      private function shadowBodySkill() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SKILL_SHADOWBODY_READY,32]);
         this.shadowIndex = m_stRandomSeed.nextInt(100) % 3;
         if(this.shadowIndex != 2)
         {
            m_vStateCache.push([STATE_APPEAR,this.shadowPoistion[this.shadowIndex][0],this.shadowPoistion[this.shadowIndex][1],0]);
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_SKILL_SHADOWBODY_ACTION,41]);
         m_vStateCache.push([STATE_WAITING,5 * 20]);
         m_vStateCache.push([STATE_SKILL_SHADOWBODY_OUT,2]);
         m_vStateCache.push([STATE_APPEAR,9,3,0]);
         if(this.shadowIndex != 2)
         {
            m_vStateCache.push([STATE_CHG_TOWARD,0]);
         }
         m_vStateCache.push([STATE_SKILL_WINDCLOUDS_DROP,30]);
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var iNextState:uint = 0;
         var fPosX:Number = NaN;
         var fPosY:Number = NaN;
         if(0 == m_vStateCache.length)
         {
            this.CacheNextSkill();
         }
         iNextState = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         this.UpdateSpeedByState(iNextState);
         a_1465 = 0;
         this.SetIsCannotSee(false);
         switch(iNextState)
         {
            case STATE_SKILL_BORN:
               iNextValue = 45;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               this.visible = true;
               break;
            case STATE_APPEAR:
               iNextValue = 0;
               this.setAppearToGrid(m_vStateCache[0][1],m_vStateCache[0][2],m_vStateCache[0][3]);
               this.SetIsCannotSee(true);
               break;
            case STATE_MOVE:
               a_1465 = 3;
               fPosX = getPosXByXGridNo(m_vStateCache[0][1]) + m_vStateCache[0][3];
               fPosY = getPosYByYGridNo(m_vStateCache[0][2]);
               iNextValue = setMoveToPosition(fPosX,fPosY);
               break;
            case STATE_SKILL_FALLBAMBOO_READY:
            case STATE_SKILL_FALLBAMBOO_THROW_UP:
            case STATE_SKILL_FALLBAMBOO_THROW_MID:
            case STATE_SKILL_FALLBAMBOO_THROW_DOWN:
            case STATE_SKILL_MOVESTART:
               a_1465 = 3;
               break;
            case STATE_SKILL_WINDCLOUDS_DROP:
            case STATE_SKILL_WINDCLOUDS_UP:
               a_1465 = 3;
               this.visible = true;
               break;
            case STATE_SKILL_WINDCLOUDS_DOWN:
               a_1465 = 0;
               this.visible = true;
               break;
            case STATE_SKILL_SHADOWBODY_READY:
               a_1465 = 3;
               break;
            case STATE_SKILL_SHADOWBODY_ACTION:
               this.visible = true;
               a_1465 = 0;
               break;
            case STATE_SKILL_SHADOWBODY_OUT:
               this.SetIsCannotSee(true);
               break;
            case STATE_HIDE:
               this.SetIsCannotSee(true);
               this.visible = false;
               break;
            case STATE_WAITING:
               this.SetIsCannotSee(false);
               a_1465 = 0;
               break;
            case STATE_CHG_TOWARD:
               a_1283 = !a_1283;
               this.SetIsCannotSee(true);
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
         this.visible = false;
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
         if(this.a_1581 > 0 && m_iBossState == 15)
         {
            --this.a_1581;
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            iXGridNo = getXGridNoByPosX();
            iYGridNo = getYGridNoByPosY();
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            bIsCanChangeToFieldGrid = ChangeToFieldGrid(stNextFieldGrid);
            if(bIsCanChangeToFieldGrid)
            {
               trace("飞行到 iXGridNo:" + iXGridNo + ">>>iYGridNo:" + iYGridNo);
            }
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
         var stTargetFieldGrid:a_3491 = null;
         var index:int = 0;
         var iMaxXGridNum:int = BattleFieldView.a_1011;
         var iMaxYGridNum:int = BattleFieldView.a_1012;
         if(m_iBossState != STATE_WAITING)
         {
         }
         switch(m_iBossState)
         {
            case STATE_SKILL_FALLBAMBOO_THROW_DOWN:
               if(a_1273 == 105 || a_1273 == 480)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,0);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 114 || a_1273 == 490)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,2);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 122 || a_1273 == 498)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,4);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 131 || a_1273 == 507)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,6);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_FALLBAMBOO_THROW_MID:
               if(a_1273 == 146 || a_1273 == 522)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,3);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 153 || a_1273 == 529)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,3);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 160 || a_1273 == 536)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,3);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 169 || a_1273 == 545)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(1,3);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_FALLBAMBOO_THROW_UP:
               if(a_1273 == 185 || a_1273 == 561)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 194 || a_1273 == 570)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(6,4);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 202 || a_1273 == 578)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,2);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               else if(a_1273 == 211 || a_1273 == 587)
               {
                  stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(2,0);
                  this.addBambooMouse(stTargetFieldGrid);
               }
               break;
            case STATE_SKILL_WINDCLOUDS_DOWN:
               if(a_1273 == 258 || a_1273 == 634)
               {
                  this.ActionSkillTwo();
               }
               break;
            case STATE_SKILL_SHADOWBODY_ACTION:
               if(a_1273 == 313 || a_1273 == 689)
               {
                  for(index = 0; index < this.shadowPoistion.length; index++)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.shadowPoistion[index][0],this.shadowPoistion[index][1]);
                     if(index != this.shadowIndex && stTargetFieldGrid != null)
                     {
                        this.addShadowbodyMouse(stTargetFieldGrid);
                     }
                  }
               }
               else if(a_1273 == 331 || a_1273 == 707)
               {
                  if(this.shadowIndex == 0)
                  {
                     for(index = 0; index < 3; index++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + index,0);
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
                  else if(this.shadowIndex == 1)
                  {
                     for(index = 0; index < 3; index++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + index,6);
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
                  else if(this.shadowIndex == 2)
                  {
                     for(index = 0; index < 3; index++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8 - index,3);
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
               }
               else if(a_1273 == 332 || a_1273 == 709)
               {
                  if(this.shadowIndex == 0)
                  {
                     for(index = 0; index < 5; index++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + 3 + index,0);
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
                  else if(this.shadowIndex == 1)
                  {
                     for(index = 0; index < 5; index++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 + 3 + index,6);
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
                  else if(this.shadowIndex == 2)
                  {
                     for(index = 0; index < 5; index++)
                     {
                        stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8 - 3 - index,3);
                        this.a_3502(stTargetFieldGrid);
                     }
                  }
               }
               else if(a_1273 == 346 || a_1273 == 722)
               {
                  if(this.shadowIndex == 0)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,0);
                     this.a_3502(stTargetFieldGrid);
                  }
                  else if(this.shadowIndex == 1)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(8,6);
                     this.a_3502(stTargetFieldGrid);
                  }
                  else if(this.shadowIndex == 2)
                  {
                     stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(0 - index,3);
                     this.a_3502(stTargetFieldGrid);
                  }
               }
         }
         return true;
      }
      
      override protected function IsSkillState() : Boolean
      {
         return false;
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
      
      private function ActionSkillTwo() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = m_stCurrentFieldGrid.m_iXGridNo - 1;
         var xEnd:int = m_stCurrentFieldGrid.m_iXGridNo + 1;
         var yStart:int = m_stCurrentFieldGrid.m_iYGridNo - 1;
         var yEnd:int = m_stCurrentFieldGrid.m_iYGridNo + 1;
         var stFieldGridVector:Array = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.a_3502(stTargetFieldGrid);
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
      
      private function addBambooMouse(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         stBaseMoveIntruder = BambooMouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stFieldGrid.m_iYGridNo * a_3491.a_1081;
            stFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
         return true;
      }
      
      private function addShadowbodyMouse(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         stBaseMoveIntruder = ShadowbodyMouseMoveIntruder.a_3926();
         if(stBaseMoveIntruder)
         {
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + stFieldGrid.m_iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            stBaseMoveIntruder.x = stFieldGrid.m_iXGridNo * a_3491.a_1080;
            stFieldGrid.m_stMouseObstacle = stBaseMoveIntruder;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stFieldGrid,false);
         }
         return true;
      }
   }
}

