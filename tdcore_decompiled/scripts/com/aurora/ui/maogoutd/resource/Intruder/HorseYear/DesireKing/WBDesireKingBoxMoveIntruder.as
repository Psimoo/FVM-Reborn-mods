package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBDesireKingBoxMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_stRandomArr:Array = [];
      
      private var m_iSkillIdx:int = 0;
      
      private var m_iTick:int = 0;
      
      private var m_iCreateHandTick:int = 0;
      
      private var m_iStarCount:int = 0;
      
      private var m_stBOSS:BaseBossMoveIntruder;
      
      public function WBDesireKingBoxMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBDesireKingBoxMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireKingBoxMoveIntruder,WBDesireKingBoxMovie) as WBDesireKingBoxMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 100000;
         INJURED_LIFE = 0;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_iTick = 0;
         this.m_iCreateHandTick = 0;
         this.m_iStarCount = 0;
         a_1481 = false;
         a_1464 = true;
         SetAnimationOnce2Loop(0,1,0,1);
         tagCom.AddTag(401);
         AddTag(5);
         AddTag(10);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(8);
         }
         return true;
      }
      
      public function InitData(randomArr:Array, boss:BaseBossMoveIntruder) : void
      {
         this.m_stRandomArr = randomArr;
         this.m_iSkillIdx = -1;
         this.m_stBOSS = boss;
         this.TriggerOnceAnim();
      }
      
      public function TriggerOnceAnim() : void
      {
         if(a_1339 <= 0)
         {
            return;
         }
         ++this.m_iSkillIdx;
         SetAnimationOnce2Loop(0,1,0,1);
         this.SetAppearToGrid(this.m_stRandomArr[this.m_iSkillIdx][0],this.m_stRandomArr[this.m_iSkillIdx][1]);
      }
      
      private function SetAppearToGrid(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = iXGridNo * 60 + 30;
         this.y = iYGridNo * 64 + 32;
         ChangeFieldGrid(stNextFieldGrid);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         this.m_iTick = iCurrentTime;
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         var tick:int = this.m_iTick - this.m_iCreateHandTick;
         if(tick == 30)
         {
            this.CreateMouse(iNoX - 1,iNoY - 1);
         }
         else if(tick == 50)
         {
            this.CreateMouse(iNoX - 1,iNoY);
         }
         else if(tick == 70)
         {
            this.CreateMouse(iNoX - 1,iNoY + 1);
         }
         else if(tick == 80)
         {
            SetAnimation(5,5);
         }
         return true;
      }
      
      protected function CreateMouse(iNoX:int, iNoY:int) : void
      {
         WBDesireKingUtil.CreateCalamityRat(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
      
      public function a_4158() : void
      {
         if(a_1339 <= 0)
         {
            return;
         }
         a_1339 = 0;
         this.ResetMovieStatus();
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         this.m_iTick = iCurrentTime;
         super.a_4140(iCurrentTime);
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 13)
            {
               BattleDestroyUtil.ClearOneGridIgnoreFangYu(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 42)
            {
               WBDesireKingUtil.DelayDamageBOSS(this.m_stBOSS,60000 * this.m_iStarCount,1000);
               if(this.m_iSkillIdx >= 2)
               {
                  this.a_4158();
               }
               else
               {
                  SetAnimation(7,7);
               }
            }
            else if(a_1273 == 69)
            {
               if(this.m_iSkillIdx >= 2)
               {
                  this.a_4158();
               }
               else
               {
                  SetAnimation(7,7);
               }
            }
            else if(a_1273 == 92)
            {
               this.TriggerOnceAnim();
            }
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      private function TriggerSkill() : void
      {
         if(a_1273 >= 17 && a_1273 <= 26)
         {
            if(this.m_stRandomArr[this.m_iSkillIdx][2] == 1)
            {
               ++this.m_iStarCount;
               SetAnimation(2,2);
            }
            else
            {
               this.m_iCreateHandTick = this.m_iTick;
               SetAnimationOnce2Loop(3,4,3,4);
            }
            BattleCardUtil.UnLockLeftestCard(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
         }
      }
      
      override public function a_4210() : Boolean
      {
         this.TriggerSkill();
         return false;
      }
      
      override public function a_4213() : Boolean
      {
         return false;
      }
      
      override public function a_4212() : Boolean
      {
         this.TriggerSkill();
         return false;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function a_3969(value:int) : Boolean
      {
         return false;
      }
      
      override public function a_4209(value:int) : Boolean
      {
         return false;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         return false;
      }
   }
}

