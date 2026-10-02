package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss.WBGluttonyKingBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.utils.Dictionary;
   
   public class WBLazyKing3BossMoveIntruder extends WBGluttonyKingBossMoveIntruder
   {
      
      protected static const STATE_BORN:uint = 6;
      
      protected static const STATE_LIGHT_SPLASH_OUT:uint = 7;
      
      protected static const STATE_LIGHT_SPLASH_IN:uint = 8;
      
      protected static const STATE_SPEED_IN:uint = 9;
      
      protected static const STATE_SPLASH_OUT:uint = 10;
      
      protected static const STATE_SPLASH_IN:uint = 11;
      
      protected static const STATE_SPEED_TO_DIZZY:uint = 12;
      
      protected static const STATE_DIZZY:uint = 13;
      
      protected static const STATE_DIZZY_TO_WAITING:uint = 14;
      
      protected static const STATE_SKILL_ONE:uint = 15;
      
      protected static const STATE_SKILL_TWO:uint = 16;
      
      protected static const STATE_SKILL_THREE_BEGIN:uint = 17;
      
      protected static const STATE_SKILL_THREE_LOOP:uint = 18;
      
      protected static const STATE_SKILL_THREE_END:uint = 19;
      
      protected static const STATE_SKILL_FOUR:uint = 20;
      
      protected static const STATE_SKILL_FIVE_BEGIN:uint = 21;
      
      protected static const STATE_SKILL_FIVE_LOOP:uint = 22;
      
      protected static const STATE_SKILL_FIVE_END:uint = 23;
      
      protected static const STATE_MOVE_ONE:uint = 30;
      
      protected static const STATE_LIGHT_SPLASH_HIDE:uint = 33;
      
      protected static const STATE_SPEED_WAIT:uint = 34;
      
      private var m_bHasBorn:Boolean = false;
      
      private var top_border:int = -3;
      
      private var bottom_border:int = 10;
      
      private var left_border:int = -7;
      
      private var right_border:int = 11;
      
      private var m_SkillFiveCount:int = 0;
      
      private var m_stBatteryEffect:WBLazy3BatteryEffect = null;
      
      private var m_iCreateShellIdx:int = 0;
      
      private var m_iSplashInPos1:Array = [0,0,0];
      
      private var m_iSplashInPos2:Array = [0,0,0];
      
      private var m_iSplashInPos3:Array = [0,0,0];
      
      private var bHasIceShellTag:Boolean = false;
      
      private var _buffEffect:Array = [null,null,null,null];
      
      private var m_lCrabArr:Array = [286401056,286401070,286401071];
      
      private var m_iSkill3LoopCount:int = 0;
      
      private var iFireTagTick:int = 0;
      
      private var moveArray:Array = [STATE_MOVE,STATE_SKILL_THREE_LOOP,STATE_SKILL_FIVE_LOOP,STATE_MOVE_ONE];
      
      private var invicibleArray:Array = [STATE_BORN,STATE_HIDE,STATE_NONE];
      
      public function WBLazyKing3BossMoveIntruder()
      {
         super();
         _bossStep = 3;
         a_1279 = -52;
         a_1467 = -100;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyKing3BossMoveIntruder) as WBLazyKing3BossMoveIntruder;
      }
      
      override protected function a_3940() : Boolean
      {
         this._buffEffect = [null,null,null,null];
         super.a_3940();
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyKing3BossMoveIntruderMovie;
      }
      
      override protected function InitBossStateFrameID() : void
      {
         m_dictBossStateFrameID = new Dictionary();
         m_dictBossStateFrameID[STATE_BORN + "_" + 0] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_SPEED_WAIT + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 0] = 2;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_HIDE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_MOVE_ONE + "_" + 0] = 3;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_OUT + "_" + 0] = 4;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_IN + "_" + 0] = 5;
         m_dictBossStateFrameID[STATE_SPEED_IN + "_" + 0] = 6;
         m_dictBossStateFrameID[STATE_SPLASH_OUT + "_" + 0] = 7;
         m_dictBossStateFrameID[STATE_SPLASH_IN + "_" + 0] = 8;
         m_dictBossStateFrameID[STATE_SPEED_TO_DIZZY + "_" + 0] = 9;
         m_dictBossStateFrameID[STATE_DIZZY + "_" + 0] = 10;
         m_dictBossStateFrameID[STATE_DIZZY_TO_WAITING + "_" + 0] = 11;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 0] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 0] = 14;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 0] = 15;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 0] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 0] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 0] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 0] = 19;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 0] = 20;
         m_dictBossStateFrameID[STATE_BORN + "_" + 1] = 1;
         m_dictBossStateFrameID[STATE_WAITING + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_SPEED_WAIT + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_HIDE + "_" + 1] = 2;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_HIDE + "_" + 0] = 12;
         m_dictBossStateFrameID[STATE_MOVE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_MOVE_ONE + "_" + 1] = 3;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_OUT + "_" + 1] = 4;
         m_dictBossStateFrameID[STATE_LIGHT_SPLASH_IN + "_" + 1] = 5;
         m_dictBossStateFrameID[STATE_SPEED_IN + "_" + 1] = 6;
         m_dictBossStateFrameID[STATE_SPLASH_OUT + "_" + 1] = 7;
         m_dictBossStateFrameID[STATE_SPLASH_IN + "_" + 1] = 8;
         m_dictBossStateFrameID[STATE_SPEED_TO_DIZZY + "_" + 1] = 9;
         m_dictBossStateFrameID[STATE_DIZZY + "_" + 1] = 10;
         m_dictBossStateFrameID[STATE_DIZZY_TO_WAITING + "_" + 1] = 11;
         m_dictBossStateFrameID[STATE_SKILL_ONE + "_" + 1] = 12;
         m_dictBossStateFrameID[STATE_SKILL_TWO + "_" + 1] = 13;
         m_dictBossStateFrameID[STATE_SKILL_THREE_BEGIN + "_" + 1] = 14;
         m_dictBossStateFrameID[STATE_SKILL_THREE_LOOP + "_" + 1] = 15;
         m_dictBossStateFrameID[STATE_SKILL_THREE_END + "_" + 1] = 16;
         m_dictBossStateFrameID[STATE_SKILL_FOUR + "_" + 1] = 17;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_BEGIN + "_" + 1] = 18;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_LOOP + "_" + 1] = 19;
         m_dictBossStateFrameID[STATE_SKILL_FIVE_END + "_" + 1] = 20;
      }
      
      override protected function InitSkillFunction() : void
      {
         m_vSkillFunction.push(this.SkillOne);
         m_vSkillFunction.push(this.SkillTwo);
         m_vSkillFunction.push(this.SkillThree);
         m_vSkillFunction.push(this.SkillFour);
         m_vSkillFunction.push(this.SkillFive);
      }
      
      override protected function InitSkillCache() : void
      {
         a_1465 = 0;
         this.m_bHasBorn = false;
         this.m_stBatteryEffect = null;
         this.bHasIceShellTag = false;
         tagCom.AddTag(353);
         this.SkillBorn();
      }
      
      private function SkillBorn() : void
      {
         m_vStateCache.length = 0;
         iLastNoX = 6;
         iLastNoY = 4;
         this.m_SkillFiveCount = 0;
         this.m_iCreateShellIdx = m_stRandomSeed.nextInt(2) + 1;
         m_vStateCache.push([STATE_BORN,26,3,4]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,30]);
      }
      
      private function SkillOne() : void
      {
         this.m_bHasBorn = true;
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SPLASH_IN,4,8,m_stRandomSeed.nextInt(4) * 2]);
         m_vStateCache.push([STATE_SKILL_ONE,47]);
         m_vStateCache.push([STATE_WAITING,20]);
      }
      
      private function SkillTwo() : void
      {
         this.m_bHasBorn = true;
         m_vStateCache.length = 0;
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         if(iNoY == 0)
         {
            this.m_iSplashInPos1 = [8,0,2];
            this.m_iSplashInPos2 = [6,2,2];
            this.m_iSplashInPos3 = [4,4,0];
         }
         else if(iNoY == 2)
         {
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               this.m_iSplashInPos1 = [8,2,1];
               this.m_iSplashInPos2 = [6,0,2];
            }
            else
            {
               this.m_iSplashInPos1 = [8,2,2];
               this.m_iSplashInPos2 = [6,4,1];
            }
            this.m_iSplashInPos3 = [4,2,0];
         }
         else if(iNoY == 4)
         {
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               this.m_iSplashInPos1 = [8,4,1];
               this.m_iSplashInPos2 = [6,2,2];
            }
            else
            {
               this.m_iSplashInPos1 = [8,4,2];
               this.m_iSplashInPos2 = [6,6,1];
            }
            this.m_iSplashInPos3 = [4,4,0];
         }
         else if(iNoY == 6)
         {
            this.m_iSplashInPos1 = [8,6,1];
            this.m_iSplashInPos2 = [6,4,1];
            this.m_iSplashInPos3 = [4,2,0];
         }
         m_vStateCache.push([STATE_LIGHT_SPLASH_OUT,13]);
         m_vStateCache.push([STATE_LIGHT_SPLASH_HIDE,17]);
         m_vStateCache.push([STATE_LIGHT_SPLASH_IN,12,this.m_iSplashInPos3[0],this.m_iSplashInPos3[1]]);
         m_vStateCache.push([STATE_SKILL_TWO,46]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,2,this.m_iSplashInPos3[1]]);
         this.SkillThree1();
      }
      
      private function SkillThree() : void
      {
         m_vStateCache.length = 0;
         this.m_iSkill3LoopCount = 0;
         ++this.m_iCreateShellIdx;
         visible = true;
         m_vStateCache.push([STATE_MOVE_ONE,7,this.top_border,7,0]);
         m_vStateCache.push([STATE_SKILL_THREE_BEGIN,10]);
         m_vStateCache.push([STATE_SKILL_THREE_LOOP,7,6,0.26]);
         m_vStateCache.push([STATE_SKILL_THREE_END,5]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_MOVE,7,this.bottom_border]);
      }
      
      private function SkillThree1() : void
      {
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillThree3() : void
      {
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillThree2() : void
      {
         m_vStateCache.length = 0;
         m_vStateCache.push([STATE_SPEED_TO_DIZZY,6]);
         m_vStateCache.push([STATE_DIZZY,20]);
         m_vStateCache.push([STATE_DIZZY_TO_WAITING,9]);
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function SkillFour() : void
      {
         m_vStateCache.length = 0;
         var iNoY:int = 1 + m_stRandomSeed.nextInt(3) * 2;
         m_vStateCache.push([STATE_MOVE_ONE,this.right_border,iNoY,8,iNoY]);
         m_vStateCache.push([STATE_SKILL_FOUR,45]);
         m_vStateCache.push([STATE_WAITING,20]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,6,iNoY]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,4,iNoY]);
         m_vStateCache.push([STATE_SPEED_IN,9]);
         m_vStateCache.push([STATE_SPEED_WAIT,0,2,iNoY]);
         this.SkillThree3();
      }
      
      private function SkillFive() : void
      {
         m_vStateCache.length = 0;
         ++this.m_SkillFiveCount;
         if(this.m_SkillFiveCount % 2 == 1)
         {
            m_vStateCache.push([STATE_SPLASH_IN,4,6,5]);
            m_vStateCache.push([STATE_SKILL_FIVE_BEGIN,28]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,3,5,0.6,false]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,3,this.bottom_border,0.6,false]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,3,1,0.6,true,3,this.top_border]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,6,1,0.6,true]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,6,3,0.6,true]);
         }
         else
         {
            m_vStateCache.push([STATE_SPLASH_IN,4,3,3]);
            m_vStateCache.push([STATE_SKILL_FIVE_BEGIN,28]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,3,this.top_border,0.6,false]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,3,5,0.6,true,3,this.bottom_border]);
            m_vStateCache.push([STATE_SKILL_FIVE_LOOP,6,5,0.6,true]);
         }
         m_vStateCache.push([STATE_SKILL_FIVE_END,10]);
         m_vStateCache.push([STATE_WAITING,10]);
         m_vStateCache.push([STATE_SPLASH_OUT,6]);
         m_vStateCache.push([STATE_HIDE,20]);
      }
      
      private function RemoveAllBuff() : void
      {
         this.bHasIceShellTag = tagCom.HasTag(126);
         tagCom.RemoveTag(125);
         tagCom.RemoveTag(126);
         tagCom.RemoveTag(127);
         tagCom.RemoveTag(128);
      }
      
      private function CreateGoldShell(iNoX:int, iNoY:int, moveType:int) : void
      {
         this.CreateShell(WBLazyGoldShellMoveIntruder.a_3926(),iNoX,iNoY,moveType);
      }
      
      private function CreateIceShell(iNoX:int, iNoY:int, moveType:int) : void
      {
         if(this.bHasIceShellTag == true)
         {
            if(m_stRandomSeed.nextInt(2) == 0)
            {
               this.CreateFireShell(iNoX,iNoY,moveType);
            }
            else
            {
               this.CreatePoisonShell(iNoX,iNoY,moveType);
            }
            return;
         }
         this.CreateShell(WBLazyIceShellMoveIntruder.a_3926(),iNoX,iNoY,moveType);
      }
      
      private function CreatePoisonShell(iNoX:int, iNoY:int, moveType:int) : void
      {
         this.CreateShell(WBLazyPoisonShellMoveIntruder.a_3926(),iNoX,iNoY,moveType);
      }
      
      private function CreateFireShell(iNoX:int, iNoY:int, moveType:int) : void
      {
         this.CreateShell(WBLazyFireShellMoveIntruder.a_3926(),iNoX,iNoY,moveType);
      }
      
      private function CreateShell(shell:WBLazyBaseShellMoveIntruder, iNoX:int, iNoY:int, moveType:int) : void
      {
         var iNewNoX:Number = iNoX;
         if(moveType == 1)
         {
            iNewNoX = 8;
         }
         var grid1:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNewNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         shell.a_1797(0,-1);
         shell.iGlobalMoveFighterID = a_4265();
         shell.m_stMoveIntruderTypeID = 134235537;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(shell,grid1);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(shell,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
         shell.x = a_3491.a_1080 * (iNewNoX + 0.5);
         shell.y = a_3491.a_1081 * (iNoY + 0.5);
         shell.InitBoss(this,moveType,iNoX,iNoY,70);
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
            if(finalDamage > 100000)
            {
               finalDamage = 100000;
            }
            if(tagCom.HasTag(127) == true && _damageParam.indexOf(132) != -1)
            {
               finalDamage *= 1.03;
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
         if(a_1273 >= 48 && a_1273 <= 96)
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
      
      private function AddBattery() : void
      {
         this.m_stBatteryEffect = BattleEffectUtil.CreateGameEffect(WBLazy3BatteryEffect,WBLazy3BatteryEffectMovie,m_stCurrentFieldGrid) as WBLazy3BatteryEffect;
         this.m_stBatteryEffect.SetAnimation(0);
      }
      
      public function AddBatteryValue() : void
      {
         if(this.m_stBatteryEffect != null)
         {
            this.m_stBatteryEffect.AddValue();
         }
      }
      
      private function RemoveBattery() : void
      {
         if(this.m_stBatteryEffect == null)
         {
            return;
         }
         this.m_stBatteryEffect.SetAnimation(4,true);
         this.m_stBatteryEffect = null;
      }
      
      private function UpdateBuffEffect() : void
      {
         var stEffect:BaseGameEffect = null;
         for(var i:int = 0; i < this._buffEffect.length; i++)
         {
            stEffect = this._buffEffect[i];
            if(stEffect != null)
            {
               stEffect.x = x;
               stEffect.y = y;
               stEffect.SetReversed(IsReversed());
            }
         }
         if(this.m_stBatteryEffect != null)
         {
            this.m_stBatteryEffect.x = x;
            this.m_stBatteryEffect.y = y;
            this.m_stBatteryEffect.SetReversed(IsReversed());
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
         var iNoY4:int = 0;
         var i:int = 0;
         var j:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         switch(m_iBossState)
         {
            case STATE_BORN:
               if(a_1273 == 4)
               {
                  this.ClearFieldGridDefense2(5,0);
               }
               else if(a_1273 == 5)
               {
                  this.ClearFieldGridDefense2(4,0);
               }
               else if(a_1273 == 6)
               {
                  this.ClearFieldGridDefense2(3,0);
               }
               else if(a_1273 == 7)
               {
                  this.ClearFieldGridDefense2(2,1);
                  this.ClearFieldGridDefense2(3,1);
                  this.ClearFieldGridDefense2(3,2);
               }
               else if(a_1273 == 8)
               {
                  this.ClearFieldGridDefense2(4,2);
                  this.ClearFieldGridDefense2(5,2);
               }
               else if(a_1273 == 9)
               {
                  this.ClearFieldGridDefense2(6,2);
                  this.ClearFieldGridDefense2(7,3);
               }
               else if(a_1273 == 10)
               {
                  this.ClearFieldGridDefense2(6,3);
               }
               else if(a_1273 == 11)
               {
                  this.ClearFieldGridDefense2(5,4);
               }
               else if(a_1273 == 12)
               {
                  this.ClearFieldGridDefense2(4,4);
                  this.ClearFieldGridDefense2(3,4);
               }
               break;
            case STATE_SPEED_IN:
               if(a_1273 == 79)
               {
                  ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo));
                  this.CheckCrab();
               }
               else if(a_1273 == 81)
               {
                  ChangeToFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo));
                  this.CheckCrab();
               }
               break;
            case STATE_SKILL_ONE:
               if(a_1273 == 148)
               {
                  this.CreateStar(0);
                  this.CreateStar(2);
                  this.CreateStar(4);
                  this.CreateStar(6);
               }
               break;
            case STATE_SKILL_TWO:
               if(this.m_iCreateShellIdx % 2 == 0)
               {
                  if(a_1273 == 187)
                  {
                     this.CreateFireShell(1,1,0);
                     this.CreateIceShell(1,5,0);
                  }
                  else if(a_1273 == 198)
                  {
                     this.CreatePoisonShell(5,2,1);
                     this.CreatePoisonShell(5,4,1);
                  }
                  else if(a_1273 == 209)
                  {
                     this.CreateGoldShell(6,0,1);
                     this.CreateGoldShell(6,6,1);
                     this.CreateGoldShell(2,3,0);
                  }
               }
               else if(a_1273 == 187)
               {
                  this.CreateFireShell(1,1,0);
                  this.CreateIceShell(1,5,0);
               }
               else if(a_1273 == 198)
               {
                  this.CreateFireShell(2,2,0);
                  this.CreateIceShell(2,4,0);
               }
               else if(a_1273 == 209)
               {
                  this.CreatePoisonShell(6,0,1);
                  this.CreateGoldShell(6,3,1);
                  this.CreatePoisonShell(6,6,1);
               }
               break;
            case STATE_SKILL_THREE_LOOP:
               if(a_1273 == 238)
               {
                  ++this.m_iSkill3LoopCount;
                  if(this.m_iSkill3LoopCount == 1)
                  {
                     this.CreateFly(6,0);
                     this.CreateFly(6,1);
                     this.CreateFly(6,2);
                  }
                  else if(this.m_iSkill3LoopCount == 2)
                  {
                     this.CreateFly(6,2);
                     this.CreateFly(6,3);
                     this.CreateFly(6,4);
                  }
                  else if(this.m_iSkill3LoopCount == 3)
                  {
                     this.CreateFly(6,4);
                     this.CreateFly(6,5);
                     this.CreateFly(6,6);
                  }
               }
               break;
            case STATE_SKILL_FOUR:
               if(a_1273 == 290)
               {
                  iNoY4 = m_stCurrentFieldGrid.m_iYGridNo;
                  this.CreateWave(iNoY4 - 1);
                  this.CreateWave(iNoY4);
                  this.CreateWave(iNoY4 + 1);
               }
               break;
            case STATE_LIGHT_SPLASH_HIDE:
               if(a_1273 == 135)
               {
                  this.CreateLight(this.m_iSplashInPos2[0],this.m_iSplashInPos2[1],this.m_iSplashInPos2[2]);
               }
               break;
            case STATE_SKILL_FIVE_BEGIN:
               if(a_1273 == 312)
               {
                  for(i = 0; i < BattleFieldView.a_1012; i++)
                  {
                     for(j = 0; j < BattleFieldView.a_1011; j++)
                     {
                        this.DeepSleepCard(j,i);
                     }
                  }
                  this.AddBattery();
                  if(this.m_SkillFiveCount % 2 == 1)
                  {
                     this.CreateBatterySolider(3,5,3,5);
                     this.CreateBatterySolider(3,1,3,1);
                     this.CreateBatterySolider(6,3,6,3);
                  }
                  else
                  {
                     this.CreateBatterySolider(3,1,3,1);
                     this.CreateBatterySolider(3,5,3,5);
                     this.CreateBatterySolider(6,5,6,5);
                  }
               }
               break;
            case STATE_SPLASH_IN:
               if(a_1273 == 94)
               {
                  a_3502(m_stCurrentFieldGrid);
               }
         }
         return true;
      }
      
      private function CreateBatterySolider(iNoX:int, iNoY:int, iNoX2:int, iNoY2:int) : void
      {
         var grid:a_3491 = null;
         var grid2:a_3491 = null;
         var flySolider:WBLazy3AccumulatorMoveIntruder = null;
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         grid2 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX2,iNoY2);
         flySolider = WBLazy3AccumulatorMoveIntruder.a_3926();
         if(flySolider)
         {
            flySolider.a_1797((globalMoveFighterID << 16) + iNoY + 100,-1);
            flySolider.m_stMoveIntruderTypeID = 134235570;
            grid.m_stCurrentBattbleFieldView.a_3459(flySolider,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            flySolider.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
            flySolider.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
            flySolider.InitData(this,grid2);
         }
      }
      
      private function CreateLight(iNoX:int, iNoY:int, type:int) : void
      {
         var lightEffect:BaseGameEffect = null;
         var lightUpEffect:WBLazy3LightUpEffect = null;
         var lightDownEffect:WBLazy3LightDownEffect = null;
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         if(type == 1)
         {
            lightUpEffect = BattleEffectUtil.CreateGameEffect(WBLazy3LightUpEffect,WBLazy3LightUpEffectMovie,grid) as WBLazy3LightUpEffect;
            lightUpEffect.targetGrid = grid;
            lightEffect = lightUpEffect;
         }
         else if(type == 2)
         {
            lightDownEffect = BattleEffectUtil.CreateGameEffect(WBLazy3LightDownEffect,WBLazy3LightDownEffectMovie,grid) as WBLazy3LightDownEffect;
            lightDownEffect.targetGrid = grid;
            lightEffect = lightDownEffect;
         }
         lightEffect.SetAnimation(0,true);
      }
      
      private function CheckCrab() : void
      {
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(m_stCurrentFieldGrid.m_stAttackFighter != null && this.m_lCrabArr.indexOf(m_stCurrentFieldGrid.m_stAttackFighter.a_3512()) != -1 && m_stCurrentFieldGrid.m_stAttackFighter.m_iDefenseStateType == 1)
         {
            this.SetAppearToGrid2(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            ReduceLife2(200000,[130]);
            m_iRestTick = 0;
            m_vStateCache.length = 0;
            this.SkillThree2();
            m_stCurrentFieldGrid.m_stAttackFighter.SpecialSkillCallBack();
         }
         else
         {
            a_3502(m_stCurrentFieldGrid);
         }
      }
      
      private function CreateWave(iNoY:int) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(7,iNoY);
         if(grid == null)
         {
            return;
         }
         var tideEffect:WBLazy3TideEffect = BattleEffectUtil.CreateGameEffect(WBLazy3TideEffect,WBLazy3TideEffectMovie,grid) as WBLazy3TideEffect;
         tideEffect.InitData(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,iNoY);
      }
      
      private function CreateStar(iNoY1:int) : void
      {
         var iNoX1:int = m_stCurrentFieldGrid.m_iXGridNo;
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX1 - 1,iNoY1);
         var starEffect:WBLazy3StarEffect = BattleEffectUtil.CreateGameEffect(WBLazy3StarEffect,WBLazy3StarEffectMovie,grid) as WBLazy3StarEffect;
         starEffect.InitData(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,iNoY1);
      }
      
      private function ClearFieldGridDefense2(iNoX:int, iNoY:int) : void
      {
         a_3502(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
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
               ReduceLife2(30000,[130]);
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
            InitState();
            a_1460 = true;
            _MAXLifeValue = iLifeValue;
            _Reduce2ShieldLifeValue = _MAXLifeValue * 0.25;
            _ReduceOneStepLifeValue = _MAXLifeValue * 0.1;
         }
         if(m_iBossState != STATE_DEAD && a_1339 <= 0)
         {
            LifeIsZeroHandle(STATE_DEAD);
            return false;
         }
         if(m_iBossState == STATE_DEAD)
         {
            nextFrame();
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
            if(this.IsMoving() && x < 540)
            {
               a_3502(m_stCurrentFieldGrid);
            }
            if(a_1278 != null)
            {
               GotoAndStopFrame(a_1275);
            }
            --m_iRestTick;
            return false;
         }
         return this.SwitchState(iCurrentTime);
      }
      
      protected function CreateFly(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = null;
         var flySolider:WBLazyBubbleMoveIntruder = null;
         grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         flySolider = WBLazyBubbleMoveIntruder.a_3926();
         if(flySolider)
         {
            flySolider.a_1797((globalMoveFighterID << 16) + iNoY,-1);
            flySolider.m_stMoveIntruderTypeID = 134235538;
            grid.m_stCurrentBattbleFieldView.a_3459(flySolider,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            flySolider.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
            flySolider.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
            flySolider.InitData(0);
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
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var bIsCanChangeToFieldGrid:Boolean = ChangeToFieldGrid(stNextFieldGrid);
         SetIsCannotSee(!bIsCanChangeToFieldGrid,false);
         this.UpdateBuffEffect();
      }
      
      private function CreateFogInRange(iNoX:int, iNoY:int) : void
      {
         var j:int = 0;
         if(!tagCom.HasTag(127))
         {
            return;
         }
         for(var i:int = iNoX - 2; i <= iNoX + 2; i++)
         {
            for(j = iNoY - 2; j <= iNoY + 2; j++)
            {
               WBLazyUtil.CreateFogInOne(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,i,j);
            }
         }
         BattleEffectUtil.CreateGameEffect2(WBLazyPoisonWaveEffectMovie,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY)).SetAnimation(0,true);
      }
      
      private function DestroyInRange(iNoX:int, iNoY:int) : void
      {
         var j:int = 0;
         if(!tagCom.HasTag(125))
         {
            return;
         }
         for(var i:int = iNoX - 1; i <= iNoX + 1; i++)
         {
            for(j = iNoY - 1; j <= iNoY + 1; j++)
            {
               this.ClearFieldGridDefense2(i,j);
            }
         }
         BattleEffectUtil.CreateGameEffect2(WBLazyExplosionWaveEffectMovie,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY)).SetAnimation(0,true);
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
      
      private function DeepSleepCard(iNoX:int, iNoY:int) : void
      {
         var stTempFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            WBLazyUtil.SleepByNightMare(stTempFieldGrid.m_stAttackFighter,30 * 20);
         }
      }
      
      override protected function SwitchState(iCurrentTime:int) : Boolean
      {
         var iNoX1:int = 0;
         var iNoY1:int = 0;
         if(0 == m_vStateCache.length)
         {
            CacheNextSkill();
         }
         var iNextState:uint = uint(m_vStateCache[0][0]);
         var iNextValue:int = int(m_vStateCache[0][1]);
         var iNoX:int = 0;
         var iNoY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         switch(iNextState)
         {
            case STATE_SPEED_WAIT:
               iNoX1 = int(m_vStateCache[0][2]);
               iNoY1 = int(m_vStateCache[0][3]);
               this.SetAppearToGrid2(iNoX1,iNoY1);
               this.SplitColdInRange(iNoX1,iNoY1);
               this.CreateFogInRange(iNoX1,iNoY1);
               this.DestroyInRange(iNoX1,iNoY1);
               break;
            case STATE_SKILL_FIVE_END:
               this.RemoveBattery();
               break;
            case STATE_SPLASH_IN:
               visible = true;
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               if(m_vStateCache[0][4] == null)
               {
                  a_1283 = false;
               }
               else
               {
                  a_1283 = m_vStateCache[0][4];
               }
               break;
            case STATE_BORN:
               a_1283 = false;
               visible = true;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_LIGHT_SPLASH_IN:
               this.RemoveAllBuff();
               SetIsCannotSee(false);
               a_1283 = false;
               visible = true;
               this.SetAppearToGrid2(m_vStateCache[0][2],m_vStateCache[0][3]);
               break;
            case STATE_SKILL_THREE_LOOP:
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2],60 / (20 * m_vStateCache[0][3]));
               break;
            case STATE_SKILL_FIVE_LOOP:
               a_1283 = m_vStateCache[0][4];
               gotoAndStop(a_1273);
               if(m_vStateCache[0].length > 5)
               {
                  this.SetAppearToGrid2(m_vStateCache[0][5],m_vStateCache[0][6]);
               }
               iNextValue = this.SetMoveToPosition2(m_vStateCache[0][1],m_vStateCache[0][2],60 / (20 * m_vStateCache[0][3]));
            case STATE_SPLASH_OUT:
            case STATE_LIGHT_SPLASH_OUT:
               break;
            case STATE_MOVE:
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][1],m_vStateCache[0][2]);
               break;
            case STATE_MOVE_ONE:
               SetIsCannotSee(false);
               this.SetAppearToGrid2(m_vStateCache[0][1],m_vStateCache[0][2]);
               iNextValue = this.SetMoveToPosition3(m_vStateCache[0][3],m_vStateCache[0][4]);
               break;
            case STATE_WAITING:
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
               break;
            case STATE_LIGHT_SPLASH_HIDE:
               this.CreateLight(this.m_iSplashInPos1[0],this.m_iSplashInPos1[1],this.m_iSplashInPos1[2]);
               SetIsCannotSee(true);
               visible = false;
         }
         m_vStateCache.shift();
         ChangeState(iNextState,iNextValue,iCurrentTime);
         return true;
      }
      
      private function SetMoveToPosition2(iNoX:int, iNoY:int, numSpeed:Number) : int
      {
         return setMoveToPosition(getPosXByXGridNo(iNoX),getPosYByYGridNo(iNoY),numSpeed);
      }
      
      private function SetMoveToPosition3(iNoX:int, iNoY:int) : int
      {
         var numSpeed:Number = 60 / (20 * 0.3);
         if(iNoX == m_stCurrentFieldGrid.m_iXGridNo)
         {
            numSpeed = 60 / (20 * 0.25);
         }
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
   }
}

