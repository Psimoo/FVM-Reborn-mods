package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Arrogant
{
   import a_4718.b_182;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBBirdCageEffect extends a_4206
   {
      
      private static const ONE_GRID_SPEED:Number = 0.5;
      
      private var m_iStartTimeNum:int;
      
      private var m_bHasBorn:Boolean = false;
      
      private var attackFigherID:String = null;
      
      private var producerID:String = null;
      
      public function WBBirdCageEffect()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBBirdCageEffect) as WBBirdCageEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBBirdCageEffectMovie;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_dicCannotAddCard["WBBirdCageEffect"] = true;
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            delete stFieldGrid.m_dicCannotAddCard["WBBirdCageEffect"];
         }
         return true;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 10000;
         a_1279 = -48;
         m_iYDisplayCenterPos = -66;
         a_1272 = 0;
         a_1463 = true;
         this.m_iStartTimeNum = -1;
         this.m_bHasBorn = false;
         this.attackFigherID = null;
         this.producerID = null;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            this.ClearShield(m_stCurrentFieldGrid);
            m_stCurrentFieldGrid.m_bShowFrozenEffect = true;
         }
         if(this.attackFigherID != null)
         {
            a_2036.getInstance().tagCom.RemoveSum("StopCD_" + this.attackFigherID);
            this.attackFigherID = null;
         }
         if(this.producerID != null)
         {
            a_2036.getInstance().tagCom.RemoveSum("StopCD_" + this.producerID);
            this.producerID = null;
         }
         super.a_3940();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_bHasBorn && iRduceLifeValue > 0)
         {
            iRduceLifeValue = 100;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      public function RealDie() : void
      {
         super.a_3969(iLifeValue);
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.SetAnimationOnce2Loop2(0,1);
            AddTag(10);
            this.m_iStartTimeNum = iCurrentTime;
         }
         var iXGridNo:int = GetiNoX();
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFieldGrid);
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         if(iCurrentTime % 2 == 1)
         {
            if(a_1273 == 21)
            {
               this.m_bHasBorn = true;
               RemoveTag(10);
               if(m_stCurrentFieldGrid.m_stAttackFighter != null && !(m_stCurrentFieldGrid.m_stAttackFighter is a_3924))
               {
                  m_stCurrentFieldGrid.m_bShowFrozenEffect = false;
                  this.attackFigherID = m_stCurrentFieldGrid.m_stAttackFighter.a_3512().toString();
                  m_stCurrentFieldGrid.m_stAttackFighter.m_isShowFrozen = true;
                  a_2036.getInstance().tagCom.AddSum("StopCD_" + this.attackFigherID);
               }
               else
               {
                  if(null == m_stCurrentFieldGrid.m_stFlowerDefense)
                  {
                     this.RealDie();
                     return true;
                  }
                  m_stCurrentFieldGrid.m_bShowFrozenEffect = false;
                  this.producerID = m_stCurrentFieldGrid.m_stFlowerDefense.a_3512().toString();
                  m_stCurrentFieldGrid.m_stFlowerDefense.m_isShowFrozen = true;
                  a_2036.getInstance().tagCom.AddSum("StopCD_" + this.producerID);
               }
            }
         }
         if(this.m_bHasBorn == true)
         {
            if(m_stCurrentFieldGrid.m_stAttackFighter == null && this.attackFigherID != null)
            {
               a_2036.getInstance().tagCom.RemoveSum("StopCD_" + this.attackFigherID);
               this.attackFigherID = null;
            }
            if(m_stCurrentFieldGrid.m_stFlowerDefense == null && this.producerID != null)
            {
               a_2036.getInstance().tagCom.RemoveSum("StopCD_" + this.producerID);
               this.producerID = null;
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 70)
         {
            if(m_stCurrentFieldGrid)
            {
               this.SetAnimationOnce2Loop2(2,3);
               this.addShield(m_stCurrentFieldGrid);
            }
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_bHasBorn)
            {
               if(a_1339 > 4000)
               {
                  this.SetAnimation2(3);
               }
               else
               {
                  this.SetAnimation2(4);
               }
            }
         }
         else
         {
            this.SetAnimation2(5);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

