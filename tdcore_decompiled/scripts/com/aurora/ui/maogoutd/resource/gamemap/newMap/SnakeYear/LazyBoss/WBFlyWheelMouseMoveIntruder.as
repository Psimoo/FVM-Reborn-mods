package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBFlyWheelMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2000000;
      
      private static const MAX_INJURED_LIFE:int = 800000;
      
      private var m_iTick:int = 0;
      
      private var m_iOldFieldGridType:int;
      
      public function WBFlyWheelMouseMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = -10;
         m_iYDisplayCenterPos = -20;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         this.m_iTick = 339;
         this.SetAnimationOnce2Loop(0,1,0,1);
         tagCom.AddTag(40003);
         return true;
      }
      
      public function RealDie() : void
      {
         this.a_3940();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(9,9);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            if(m_stCurrentFieldGrid != null)
            {
               this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
               m_stCurrentFieldGrid.m_iFieldGridType = 8;
            }
         }
         var numOrigXPos:Number = x;
         ++this.m_iTick;
         if(this.m_iTick == 340)
         {
            this.SetAnimationOnce2Loop(2,3,6,7);
         }
         else if(this.m_iTick == 400)
         {
            this.SetAnimationOnce2Loop(4,1,8,5);
         }
         else if(this.m_iTick == 411)
         {
            this.m_iTick = 0;
            this.ShotBullet();
         }
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      protected function ShotBullet() : void
      {
      }
      
      protected function CreateShot(shot:WBFlyWheelShot, yOffset:int) : void
      {
         shot.a_1797(false);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(shot);
         shot.InitData(m_stCurrentFieldGrid,yOffset > 0 ? 1 : -1);
         shot.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
         shot.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + 32 + yOffset;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(iRduceLifeValue > 0)
         {
            iRduceLifeValue = 1000;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(iRduceLifeValue > 0)
         {
            iRduceLifeValue = 1000;
         }
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx = animIdx2;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx = onceAnimIdx2;
            loopAnimIdx = loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
   }
}

