package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.boss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   
   public class TheBrozeSnakeBoss extends a_3909
   {
      
      private var HP:int = 3;
      
      private var _battleFieldView:BattleFieldView;
      
      private var _boss:TheSnakeThiefBoss;
      
      private var m_iTargetNoX:int;
      
      private var m_iTargetNoY:int;
      
      private var m_iSkillState:int = 1;
      
      private var m_iLeaveTick:int = 55;
      
      public function TheBrozeSnakeBoss()
      {
         super();
      }
      
      public static function a_3926() : TheBrozeSnakeBoss
      {
         return PoolManager.getInstance().CheckOutOne(TheBrozeSnakeBoss) as TheBrozeSnakeBoss;
      }
      
      override protected function getBindMovie() : Class
      {
         return TheBrozeSnakeBossMovie;
      }
      
      public function a_1797(boss:TheSnakeThiefBoss, battleFieldView:BattleFieldView, isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this._battleFieldView = battleFieldView;
         this._boss = boss;
         battleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE);
         this.x = a_3491.a_1080 * 8 - 250;
         this.y = a_3491.a_1081 * 3 - 160;
         this.visible = true;
         gotoAndStop(1);
         this.HP = 3;
         this.m_iSkillState = 1;
         this.PlayBorn();
         return true;
      }
      
      public function PlayBorn() : void
      {
         this.SetAnimationOnce2Loop(0,1);
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         this.m_iSkillState = 1;
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function TickUpdate(iCurrentTime:int) : void
      {
         var stNextFieldGrid2:a_3491 = null;
         var bullet:TheBrozeSnakeBullet = null;
         var effect:TheBrozenSnakeSkill2Effect = null;
         if(iCurrentTime % 2 == 0)
         {
            return;
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 55 || a_1273 == 211 || a_1273 == 369)
         {
            stNextFieldGrid2 = this._battleFieldView.a_3438(8,3);
            bullet = TheBrozeSnakeBullet.a_3926();
            bullet.a_1797(stNextFieldGrid2);
            bullet.SetMove2Target(this._battleFieldView.a_3438(this.m_iTargetNoX,this.m_iTargetNoY));
         }
         if(a_1273 == 126 || a_1273 == 284 || a_1273 == 441)
         {
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),0);
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),1);
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),2);
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),3);
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),4);
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),5);
            this.CreateBarrier(4 + this._boss.GetRandom().nextInt(3),6);
         }
         if(this.m_iSkillState == 3)
         {
            --this.m_iLeaveTick;
            if(this.m_iLeaveTick == 0)
            {
               this.m_iLeaveTick = 85;
               this.SetAnimationOnce2Loop(3,1);
            }
            if(a_1273 == 77 || a_1273 == 234 || a_1273 == 391)
            {
               effect = TheBrozenSnakeSkill2Effect.a_3926();
               if(this._boss.IsHide())
               {
                  effect.a_1797(this._battleFieldView.a_3438(7,this._boss.GetRandom().nextInt(7)),false);
               }
               else
               {
                  effect.a_1797(this._battleFieldView.a_3438(7,this._boss.GetBossNoY()),false);
               }
            }
         }
         if(this.m_iSkillState == 5)
         {
            --this.m_iLeaveTick;
            if(this.m_iLeaveTick == 0)
            {
               this.ExitWait();
            }
            if(a_1273 == 185 || a_1273 == 342 || a_1273 == 499)
            {
               this._boss.ExitWait();
            }
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function SetAnimation(frame:int) : void
      {
         frame = (3 - this.HP) * 7 + frame;
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         once = (3 - this.HP) * 7 + once;
         loop = (3 - this.HP) * 7 + loop;
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      public function SwitchSkillOne(iNoX:int, iNoY:int) : void
      {
         this.SetAnimationOnce2Loop(2,1);
         this.m_iTargetNoX = iNoX;
         this.m_iTargetNoY = iNoY;
         this.m_iSkillState = 1;
      }
      
      public function SwitchSkillTwo() : void
      {
         this.SetAnimationOnce2Loop(4,1);
         this.m_iSkillState = 2;
      }
      
      public function SwitchSkillThree() : void
      {
         this.m_iSkillState = 3;
         this.m_iLeaveTick = 75;
         this.SetAnimation(1);
      }
      
      public function testSkillThree() : void
      {
         this.m_iSkillState = 3;
         this.m_iLeaveTick = 2;
         this.SetAnimation(1);
      }
      
      public function EnterWait() : void
      {
         if(this.m_iSkillState == 5)
         {
            return;
         }
         if(this.HP == 1)
         {
            if(a_1275 != 22)
            {
               a_1275 = 22;
               gotoAndStop((a_1276[22] as FrameLabel).frame);
            }
            this._boss.CallWIN();
         }
         else
         {
            this.m_iSkillState = 5;
            this.m_iLeaveTick = 55;
            this.SetAnimationOnce2Loop(5,6);
         }
      }
      
      public function ExitWait() : void
      {
         this.SetAnimationOnce2Loop(7,1);
         gotoAndStop((a_1276[(3 - this.HP) * 7 + 7] as FrameLabel).frame);
         --this.HP;
         a_1275 = (3 - this.HP) * 7 + 1;
      }
      
      private function CreateBarrier(iNoX:int, iNoY:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var snakeBarrier:TheSnakeBarrier = null;
         stFieldGrid = this._battleFieldView.a_3438(iNoX,iNoY);
         snakeBarrier = TheSnakeBarrier.a_3926();
         snakeBarrier.m_stCurrentFieldGrid = stFieldGrid;
         snakeBarrier.a_1797(a_1283);
         snakeBarrier.x = a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5) - 25;
         snakeBarrier.y = a_3491.a_1081 * (stFieldGrid.m_iYGridNo + 0.5) - 15;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(snakeBarrier,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(snakeBarrier,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         snakeBarrier.play();
         if(a_1283)
         {
            snakeBarrier.x = BattleFieldView.a_1013 - snakeBarrier.x;
         }
      }
   }
}

