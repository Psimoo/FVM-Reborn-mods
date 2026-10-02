package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.utils.Dictionary;
   
   public class WBLazyKingBossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_SPEED_MOVE:uint = 7;
      
      protected static const STATE_SPEED_TO_DIZZY:uint = 8;
      
      protected static const STATE_DIZZY:uint = 9;
      
      protected static const STATE_DIZZY_TO_WAITING:uint = 10;
      
      protected static const STATE_COVER_OUT:uint = 11;
      
      protected static const STATE_COVER_IN:uint = 12;
      
      protected static const STATE_SKILL_ONE:uint = 13;
      
      protected static const STATE_SKILL_ONE_LOOP:uint = 14;
      
      protected static const STATE_SKILL_ONE_END:uint = 15;
      
      protected static const STATE_SKILL_TWO:uint = 16;
      
      protected static const STATE_SKILL_TWO_SNAIL_READY:uint = 17;
      
      protected static const STATE_SKILL_TWO_READY_LOOP:uint = 18;
      
      protected static const STATE_SKILL_TWO_WHIP:uint = 19;
      
      protected static const STATE_SKILL_THREE:uint = 20;
      
      protected static const STATE_SKILL_FOUR:uint = 21;
      
      protected static const STATE_DEAD_BEGIN:uint = 22;
      
      protected static const STATE_DEAD_LOOP:uint = 23;
      
      protected static const STATE_MOVE_ONE:uint = 30;
      
      protected static const STATE_MOVE_TWO:uint = 31;
      
      protected static const STATE_MOVE_THREE:uint = 32;
      
      private var m_iSkillRIdx1:int = 0;
      
      private var m_iSkillRIdx2:int = 0;
      
      private var m_iSkillRIdx4:int = 0;
      
      private var m_bHasBorn:Boolean = false;
      
      private var top_border:int = -3;
      
      private var bottom_border:int = 10;
      
      private var left_border:int = -7;
      
      private var right_border:int = 11;
      
      private var bHasIceShellTag:Boolean = false;
      
      private var _buffEffect:Array = [null,null,null,null];
      
      private var m_lCrabArr:Array = [286401056,286401070,286401071];
      
      private var m_bHasHandleDie:Boolean = false;
      
      private var iFireTagTick:int = 0;
      
      private var moveArray:Array = [STATE_MOVE,STATE_DEAD_LOOP,STATE_SKILL_ONE_LOOP,STATE_MOVE_ONE,STATE_MOVE_TWO,STATE_MOVE_THREE,STATE_SPEED_MOVE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBLazyKingBossMoveIntruder()
      {
         super();
         _bossStep = 1;
         a_1279 = 28;
         a_1467 = -90;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyKingBossMoveIntruder) as WBLazyKingBossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         this._buffEffect = [null,null,null,null];
         super.a_3940();
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyKingBossMoveIntruderMovie;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_ONE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_TWO + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_THREE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_SPEED_MOVE + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_SPEED_TO_DIZZY + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_DIZZY + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_DIZZY_TO_WAITING + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_COVER_OUT + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_COVER_IN + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_TWO_SNAIL_READY + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_TWO_READY_LOOP + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_TWO_WHIP + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_MOVE_ONE + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_MOVE_TWO + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_MOVE_THREE + "_" + 1] = 20;
         m_dictBossStateFrameID[STATE_SPEED_MOVE + "_" + 1] = 21;
         m_dictBossStateFrameID[STATE_SPEED_TO_DIZZY + "_" + 1] = 22;
         m_dictBossStateFrameID[STATE_DIZZY + "_" + 1] = 23;
         m_dictBossStateFrameID[STATE_DIZZY_TO_WAITING + "_" + 1] = 24;
         m_dictBossStateFrameID[STATE_COVER_OUT + "_" + 1] = 25;
         m_dictBossStateFrameID[STATE_COVER_IN + "_" + 1] = 26;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 27;
         m_dictBossStateFrameID[STATE_SKILL_ONE_LOOP + "_" + 1] = 28;
         m_dictBossStateFrameID[STATE_SKILL_ONE_END + "_" + 1] = 29;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 30;
         m_dictBossStateFrameID[STATE_SKILL_TWO_SNAIL_READY + "_" + 1] = 31;
         m_dictBossStateFrameID[STATE_SKILL_TWO_READY_LOOP + "_" + 1] = 32;
         m_dictBossStateFrameID[STATE_SKILL_TWO_WHIP + "_" + 1] = 33;
         m_dictBossStateFrameID[STATE_SKILL_THREE + "_" + 1] = 34;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 35;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 0] = 36;
         m_dictBossStateFrameID[STATE_DEAD + "_" + 1] = 36;
         m_dictBossStateFrameID[STATE_DEAD_BEGIN + "_" + 0] = 36;
         m_dictBossStateFrameID[STATE_DEAD_BEGIN + "_" + 1] = 36;
         m_dictBossStateFrameID[STATE_DEAD_LOOP + "_" + 0] = 37;
         m_dictBossStateFrameID[STATE_DEAD_LOOP + "_" + 1] = 37;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillFour);
      }
      
      override protected function InitSkillCache() : void
      {
         a_1465 = 0;
         this.m_bHasBorn = false;
         this.bHasIceShellTag = false;
         this.m_iSkillRIdx1 = m_stRandomSeed.nextInt(2);
         this.m_iSkillRIdx2 = m_stRandomSeed.nextInt(2);
         this.m_iSkillRIdx4 = m_stRandomSeed.nextInt(2);
         this.SkillBorn();
      }
      
      private function SkillBorn() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 4;
         m_vStateCache.push([STATE_BORN,45,6,5]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_MOVE,6,this.bottom_border]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillOne() : void
      {
         m_vStateCache.length = 0;
         this.m_bHasBorn = true;
         if(this.m_iSkillRIdx1 == 0)
         {
            m_vStateCache.push([STATE_MOVE_ONE,4,this.bottom_border,4,6]);
            m_vStateCache.push([STATE_SKILL_ONE,15]);
            m_vStateCache.push([STATE_SKILL_ONE_LOOP,4,2]);
            m_vStateCache.push([STATE_SKILL_ONE_END,9]);
            m_vStateCache.push([STATE_MOVE_TWO,0,2]);
            m_vStateCache.push([STATE_COVER_OUT,9]);
            m_vStateCache.push([STATE_HIDE,30]);
         }
         else
         {
            m_vStateCache.push([STATE_MOVE_ONE,4,this.top_border,4,0]);
            m_vStateCache.push([STATE_SKILL_ONE,15]);
            m_vStateCache.push([STATE_SKILL_ONE_LOOP,4,4]);
            m_vStateCache.push([STATE_SKILL_ONE_END,9]);
            m_vStateCache.push([STATE_MOVE_TWO,0,4]);
            m_vStateCache.push([STATE_COVER_OUT,9]);
            m_vStateCache.push([STATE_HIDE,30]);
         }
      }
      
      private function SkillTwo() : void
      {
         m_vStateCache.length = 0;
         this.m_bHasBorn = true;
         if(this.m_iSkillRIdx2 == 0)
         {
            m_vStateCache.push([STATE_COVER_IN,7,8,1]);
            m_vStateCache.push([STATE_SKILL_TWO,26]);
            m_vStateCache.push([STATE_SKILL_TWO_WHIP,19]);
            m_vStateCache.push([STATE_WAITING,20]);
         }
         else
         {
            m_vStateCache.push([STATE_COVER_IN,7,8,5]);
            m_vStateCache.push([STATE_SKILL_TWO,26]);
            m_vStateCache.push([STATE_SKILL_TWO_WHIP,19]);
            m_vStateCache.push([STATE_WAITING,20]);
         }
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         var iNoYFirst:int = 2 + m_stRandomSeed.nextInt(3);
         m_vStateCache.push([STATE_MOVE,8,iNoYFirst]);
         m_vStateCache.push([STATE_SKILL_THREE,25]);
         var nextOffset:int = m_stRandomSeed.nextInt(3) - 1;
         var iNoY:int = iNoYFirst + nextOffset;
         if(nextOffset == 0)
         {
            m_vStateCache.push([STATE_WAITING,20]);
         }
         else
         {
            m_vStateCache.push([STATE_MOVE,8,iNoY]);
            m_vStateCache.push([STATE_WAITING,10]);
         }
         m_vStateCache.push([STATE_SPEED_MOVE,0,iNoY]);
         this.SkillThree1();
      }
      
      private function SkillThree1() : void
      {
         m_vStateCache.push([STATE_COVER_OUT,9]);
         m_vStateCache.push([STATE_HIDE,10]);
      }
      
      private function SkillThree2() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SPEED_TO_DIZZY,9]);
         m_vStateCache.push([STATE_DIZZY,30]);
         m_vStateCache.push([STATE_DIZZY_TO_WAITING,4]);
         m_vStateCache.push([STATE_COVER_OUT,9]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillFour() : void
      {
         m_vStateCache.length = 0;
         if(this.m_iSkillRIdx4 == 0)
         {
            m_vStateCache.push([STATE_COVER_IN,7,8,5]);
            m_vStateCache.push([STATE_SKILL_FOUR,42]);
            m_vStateCache.push([STATE_WAITING,10]);
            m_vStateCache.push([STATE_MOVE,8,this.bottom_border]);
            m_vStateCache.push([STATE_HIDE,10]);
         }
         else
         {
            m_vStateCache.push([STATE_COVER_IN,7,8,1]);
            m_vStateCache.push([STATE_SKILL_FOUR,42]);
            m_vStateCache.push([STATE_WAITING,10]);
            m_vStateCache.push([STATE_MOVE,8,this.top_border]);
            m_vStateCache.push([STATE_HIDE,10]);
         }
      }
      
      private function SkillDead() : void
      {
         a_1283 = false;
         m_vStateCache.push([STATE_DEAD_BEGIN,34]);
         m_vStateCache.push([STATE_DEAD_LOOP]);
      }
      
      private function RemoveAllBuff() : void
      {
         this.bHasIceShellTag = tagCom.HasTag(126);
         tagCom.RemoveTag(125);
         tagCom.RemoveTag(126);
         tagCom.RemoveTag(127);
         tagCom.RemoveTag(128);
      }
      
      private function CreateGoldShells() : void
      {
         this.CreateGoldShell(5,2);
         this.CreateGoldShell(5,4);
      }
      
      private function CreateIceShells() : void
      {
         if(this.m_iSkillRIdx2 == 0)
         {
            this.CreateIceShell(1,1);
            this.CreateIceShell(1,5);
         }
         else
         {
            this.CreateIceShell(3,0);
            this.CreateIceShell(3,6);
         }
      }
      
      private function CreateGoldShell(iNoX:int, iNoY:int) : void
      {
         this.CreateShell(WBLazyGoldShellMoveIntruder.a_3926(),iNoX,iNoY);
      }
      
      private function CreatePoisonShell(iNoX:int, iNoY:int) : void
      {
         this.CreateShell(WBLazyPoisonShellMoveIntruder.a_3926(),iNoX,iNoY);
      }
      
      private function CreateFireShell(iNoX:int, iNoY:int) : void
      {
         this.CreateShell(WBLazyFireShellMoveIntruder.a_3926(),iNoX,iNoY);
      }
      
      private function CreateIceShell(iNoX:int, iNoY:int) : void
      {
         if(this.bHasIceShellTag == true)
         {
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               this.CreateFireShell(iNoX,iNoY);
            }
            else
            {
               this.CreatePoisonShell(iNoX,iNoY);
            }
            return;
         }
         this.CreateShell(WBLazyIceShellMoveIntruder.a_3926(),iNoX,iNoY);
      }
      
      private function CreateShell(shell:WBLazyBaseShellMoveIntruder, iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         grid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         shell.a_1797(0,-1);
         shell.iGlobalMoveFighterID = a_4265();
         shell.m_stMoveIntruderTypeID = 134235537;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(shell,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(shell,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         shell.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         shell.y = a_3491.a_1081 * (grid1.m_iYGridNo + 0.5);
         shell.InitBoss(this,0,iNoX,iNoY,40);
      }
      
      private function ChangeDamage(damage:int) : int
      {
         var finalDamage:int = damage;
         if(_damageParam.indexOf(130) != -1)
         {
            finalDamage = damage;
         }
         else
         {
            if(tagCom.HasTag(128) == true && damage > 0)
            {
               if(damage > 10000)
               {
                  finalDamage = 10000;
               }
               else
               {
                  finalDamage = damage;
               }
            }
            if(tagCom.HasTag(127) == true && _damageParam.indexOf(132) != -1)
            {
               finalDamage *= 1.01;
            }
         }
         return finalDamage;
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
      
      private function CanBuffEffectState() : Boolean
      {
         if(visible == false)
         {
            return false;
         }
         if(a_1273 > 500)
         {
            return false;
         }
         if(a_1273 >= 323 && a_1273 <= 340)
         {
            return false;
         }
         if(a_1273 >= 96 && a_1273 <= 113)
         {
            return false;
         }
         return true;
      }
      
      private function AddBuffEffect() : void
      {
         var stEffect:BaseGameEffect = null;
         for(var i:int = 0; i < this._buffEffect.length; i++)
         {
            if(tagCom.HasTag(125 + i) == true && this._buffEffect[i] == null && this.CanBuffEffectState())
            {
               this._buffEffect[i] = WBLazyUtil.CreateBOSSBuffEffect(i,m_stCurrentFieldGrid);
            }
         }
         this.UpdateBuffEffect();
      }
      
      private function UpdateBuffEffect() : void
      {
         var stEffect:BaseGameEffect = null;
         for(var i:int = 0; i < this._buffEffect.length; i++)
         {
            stEffect = this._buffEffect[i];
            if(stEffect != null)
            {
               if(IsReversed())
               {
                  stEffect.x = x;
               }
               else
               {
                  stEffect.x = x;
               }
               stEffect.y = y;
               stEffect.SetReversed(IsReversed());
            }
         }
      }
      
      private function RemoveBuffEffect() : void
      {
         var stEffect:BaseGameEffect = null;
         for(var i:int = 0; i < this._buffEffect.length; i++)
         {
            stEffect = this._buffEffect[i];
            if(stEffect != null)
            {
               if(tagCom.HasTag(125 + i) == false || !this.CanBuffEffectState())
               {
                  stEffect.SetAnimation(2,true);
                  this._buffEffect[i] = null;
               }
            }
         }
      }
      
      override protected function CheckIsCanLaunchSkill(iCurrentTime:int) : Boolean
      {
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               break;
            case STATE_SKILL_TWO:
               if(a_1273 == 172 || a_1273 == 399)
               {
                  this.RemoveAllBuff();
                  this.CreateGoldShells();
               }
               break;
            case STATE_SKILL_TWO_WHIP:
               if(a_1273 == 205 || a_1273 == 432)
               {
                  this.CreateIceShells();
               }
               break;
            case STATE_SKILL_THREE:
               if(a_1273 == 228 || a_1273 == 455)
               {
                  this.CreateFly(m_stCurrentFieldGrid.m_iYGridNo - 1,0);
                  this.CreateFly(m_stCurrentFieldGrid.m_iYGridNo,0);
                  this.CreateFly(m_stCurrentFieldGrid.m_iYGridNo + 1,0);
               }
               break;
            case STATE_SPEED_MOVE:
               if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_stAttackFighter != null)
               {
                  if(this.m_lCrabArr.indexOf(m_stCurrentFieldGrid.m_stAttackFighter.a_3512()) != -1 && m_stCurrentFieldGrid.m_stAttackFighter.m_iDefenseStateType == 1)
                  {
                     ReduceLife2(200000,[130]);
                     m_iRestTick = 0;
                     m_vStateCache.length = 0;
                     this.SkillThree2();
                     m_stCurrentFieldGrid.m_stAttackFighter.SpecialSkillCallBack();
                  }
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 252 || a_1273 == 480)
               {
                  this.CreateLiquid(8,0);
                  this.CreateLiquid(8,1);
                  this.CreateLiquid(8,2);
               }
               if(a_1273 == 257 || a_1273 == 485)
               {
                  this.CreateLiquid(7,0);
                  this.CreateLiquid(7,1);
                  this.CreateLiquid(7,2);
               }
               if(a_1273 == 262 || a_1273 == 490)
               {
                  this.CreateLiquid(6,0);
                  this.CreateLiquid(6,1);
                  this.CreateLiquid(6,2);
               }
               if(a_1273 == 267 || a_1273 == 495)
               {
                  this.CreateLiquid(5,0);
                  this.CreateLiquid(5,1);
                  this.CreateLiquid(5,2);
               }
         }
         return true;
      }
      
      private function CreateLiquid(iNoX:int, iNoY:int) : void
      {
         if(m_stCurrentFieldGrid.m_iYGridNo > 3)
         {
            iNoY += 4;
         }
         WBLazyUtil.CreateLiquid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,iNoX,iNoY);
      }
      
      private function HandleDie() : void
      {
         this.m_bHasHandleDie = true;
         m_iRestTick = 0;
         m_vStateCache.length = 0;
         this.SkillDead();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         _iTimeNum = iCurrentTime;
         this.AddBuffEffect();
         this.RemoveBuffEffect();
         this.UpdateBuffEffect();
         if(tagCom.HasTag(125))
         {
            ++this.iFireTagTick;
            if(this.iFireTagTick > 0 && this.iFireTagTick % (3 * 20) == 0)
            {
               ReduceLife2(10000,[130]);
            }
         }
         else
         {
            this.iFireTagTick = -1;
         }
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
            this.InitState();
            a_1460 = true;
            _MAXLifeValue = iLifeValue;
            _Reduce2ShieldLifeValue = _MAXLifeValue * 0.25;
            _ReduceOneStepLifeValue = _MAXLifeValue * 0.1;
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
            if(this.IsMoving())
            {
               a_3502(m_stCurrentFieldGrid);
            }
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(536);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      protected function CreateFly(iNoY:int, delayTick:int) : void
      {
         var flySolider:WBLazyBubbleMoveIntruder = null;
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,iNoY);
         flySolider = WBLazyBubbleMoveIntruder.a_3926();
         if(flySolider)
         {
            flySolider.a_1797((globalMoveFighterID << 16) + iNoY,-1);
            flySolider.m_stMoveIntruderTypeID = 134235538;
            grid.m_stCurrentBattbleFieldView.a_3459(flySolider,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            flySolider.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
            flySolider.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
            flySolider.InitData(delayTick);
         }
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
         var m_iLastX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var m_iLastY:int = m_stCurrentFieldGrid.m_iYGridNo;
         var iXGridNo:int = getXGridNoByPosX();
         var iYGridNo:int = getYGridNoByPosY();
         var m_bOutRange:Boolean = false;
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
            m_bOutRange = true;
         }
         if(iXGridNo > 8)
         {
            iXGridNo = 8;
            m_bOutRange = true;
         }
         if(iYGridNo < 0)
         {
            iYGridNo = 0;
            m_bOutRange = true;
         }
         if(iYGridNo > 6)
         {
            iYGridNo = 6;
            m_bOutRange = true;
         }
         if(m_iLastX == iXGridNo && m_iLastY == iYGridNo)
         {
            return;
         }
         if(m_bOutRange == false)
         {
            if(m_iBossState == STATE_SKILL_ONE_LOOP)
            {
               this.SleepCard(iXGridNo + 1,iYGridNo);
               this.SleepCard(iXGridNo + 2,iYGridNo);
               this.SleepCard(iXGridNo + 3,iYGridNo);
            }
            else if(m_iBossState == STATE_MOVE_TWO && (iXGridNo == 1 || iXGridNo == 3))
            {
               this.SplitColdInRange(iXGridNo,iYGridNo);
            }
            else if(m_iBossState == STATE_SPEED_MOVE && (iXGridNo == 1 || iXGridNo == 3 || iXGridNo == 5 || iXGridNo == 7))
            {
               this.SplitColdInRange(iXGridNo,iYGridNo);
            }
         }
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         SetIsCannotSee(!bIsCanChangeToFieldGrid,false);
         this.UpdateBuffEffect();
      }
      
      private function SplitColdInRange(iNoX:int, iNoY:int) : void
      {
         if(!tagCom.HasTag(126))
         {
            return;
         }
         this.SplitColdInOne(iNoX - 1,iNoY - 1);
         this.SplitColdInOne(iNoX - 1,iNoY);
         this.SplitColdInOne(iNoX - 1,iNoY + 1);
         this.SplitColdInOne(iNoX,iNoY - 1);
         this.SplitColdInOne(iNoX,iNoY);
         this.SplitColdInOne(iNoX,iNoY + 1);
         this.SplitColdInOne(iNoX + 1,iNoY - 1);
         this.SplitColdInOne(iNoX + 1,iNoY);
         this.SplitColdInOne(iNoX + 1,iNoY + 1);
         BattleEffectUtil.CreateGameEffect2(WBLazyColdWaveEffectMovie,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY)).SetAnimation(0,true);
      }
      
      private function SplitColdInOne(iNoX:int, iNoY:int) : void
      {
         WBLazyUtil.FrozenCard(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      override protected function IsMoving() : Boolean
      {
         return this.moveArray.indexOf(m_iBossState) != -1;
      }
      
      override protected function IsCanReduceLife() : Boolean
      {
         if(x > getPosXByXGridNo(9))
         {
            return false;
         }
         if(y < getPosYByYGridNo(0))
         {
            return false;
         }
         if(y > getPosYByYGridNo(7))
         {
            return false;
         }
         if(this.m_bHasBorn == false)
         {
            return false;
         }
         return this.invicibleArray.indexOf(m_iBossState) == -1 && a_1339 > 0;
      }
      
      private function SleepCard(iNoX:int, iNoY:int) : void
      {
         var stTempFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            WBLazyUtil.SleepByDeep(stTempFieldGrid.m_stAttackFighter,60 * 20);
         }
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         if(0 == m_vStateCache.length)
         {
            if(this.m_bHasHandleDie == true)
            {
               CallChangeStep();
               this.a_3940();
               return false;
            }
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         var iNoX:int = 0;
         var iNoY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         SetIsCannotSee(STATE_HIDE == iNextState);
         switch(iNextState)
         {
            case STATE_BORN:
            case STATE_COVER_IN:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_ONE_LOOP:
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_SKILL_ONE:
               SetIsCannotSee(false);
               break;
            case STATE_MOVE:
            case STATE_MOVE_TWO:
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_MOVE_ONE:
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_MOVE_THREE:
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_SPEED_MOVE:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2],60 / (20 * 0.3));
               break;
            case STATE_DEAD_LOOP:
               iNextValue = setMoveToPosition(600,y,60 / (20 * 0.2));
               break;
            case STATE_WAITING:
               SetIsCannotSee(false);
               break;
            case STATE_DEAD:
               SetIsCannotSee(true);
               break;
            case STATE_SKILL_FOUR:
               WBLazyLiquidEffect.m_lUpBloodArr.length = 0;
               break;
            case STATE_HIDE:
               SetIsCannotSee(true);
               visible = false;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetMoveToPosition3(iNoX:int, iNoY:int) : int
      {
         var numSpeed:Number = 60 / (20 * 0.4);
         if(iNoX == m_stCurrentFieldGrid.m_iXGridNo)
         {
            numSpeed = 60 / (20 * 0.35);
         }
         return setMoveToPosition(getPosXByXGridNo(iNoX),getPosYByYGridNo(iNoY),numSpeed);
      }
      
      private function SetMoveToPosition2(iNoX:int, iNoY:int, numSpeed:Number) : int
      {
         return setMoveToPosition(getPosXByXGridNo(iNoX),getPosYByYGridNo(iNoY),numSpeed);
      }
      
      private function SetAppearToGrid2(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         var iNoX:int = iXGridNo;
         var iNoY:int = iYGridNo;
         if(iNoX < 0)
         {
            iNoX = 0;
         }
         if(iNoX > 8)
         {
            iNoX = 8;
         }
         if(iNoY < 0)
         {
            iNoY = 0;
         }
         if(iNoY > 6)
         {
            iNoY = 6;
         }
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         this.x = getPosXByXGridNo(iXGridNo);
         this.y = getPosYByYGridNo(iYGridNo);
         ChangeToFieldGrid(stNextFieldGrid);
         this.visible = true;
      }
      
      override protected function InitState() : void
      {
         super.InitState();
         this.m_bHasHandleDie = false;
      }
   }
}

