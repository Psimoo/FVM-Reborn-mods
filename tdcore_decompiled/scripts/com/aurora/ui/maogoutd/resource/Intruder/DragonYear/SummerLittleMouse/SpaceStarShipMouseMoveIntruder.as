package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class SpaceStarShipMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3000;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 5;
      
      protected var m_iShipState:int = 0;
      
      private var m_iShipWaitTick:int = 0;
      
      private var m_stTargetGrid:a_3491;
      
      private var m_bLastCreateBullet:Boolean = false;
      
      public function SpaceStarShipMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceStarShipMouseMoveIntruder) as SpaceStarShipMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceStarShipMouseMoveIntruderMovie;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.enm_shotEffectFreezeStop != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         m_iYDisplayCenterPos = -40;
         a_1272 = 0;
         a_1464 = true;
         a_1465 = 3;
         BoomIsReduceLife = true;
         this.m_iShipState = -1;
         this.m_iShipWaitTick = 0;
         this.SwitchState(0);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         super.a_4210();
         return true;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 6)
         {
            a_1275 = 6;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         else if(this.m_iShipState == 0)
         {
            this.SetAnimation(0,1);
         }
         else if(this.m_iShipState == 1)
         {
            this.SetAnimation(4,1);
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      private function SwitchState(iShipState:*) : Boolean
      {
         if(this.m_iShipState != iShipState)
         {
            switch(iShipState)
            {
               case 0:
                  a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
                  if(a_1283 == false)
                  {
                     a_1350 *= -1;
                  }
                  this.SetAnimation(0,1);
                  break;
               case 1:
                  a_1350 = 0;
                  this.m_iShipWaitTick = 26;
                  this.SetAnimation(4,1);
                  break;
               case 2:
                  a_1350 = 0;
                  this.m_iShipWaitTick = 30;
                  this.SetAnimation(2,1);
                  this.m_bLastCreateBullet = false;
            }
            this.m_iShipState = iShipState;
            return true;
         }
         return false;
      }
      
      private function CreateSpaceSatrShipBulletEffect(target:a_3491) : void
      {
         var spaceSatrShipBulletEffect:SpaceSatrShipBulletEffect = SpaceSatrShipBulletEffect.a_3926();
         spaceSatrShipBulletEffect.a_1797(false,target,HasTag(40009));
      }
      
      private function CheckHasCard() : a_3491
      {
         var stFieldGrid:a_3491 = null;
         var stFieldGridVector:Array = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var xEnd:int = m_stCurrentFieldGrid.m_iXGridNo;
         var xStart:int = 0;
         for(var indexX:int = xStart; indexX < xEnd; indexX++)
         {
            stFieldGrid = stFieldGridVector[m_stCurrentFieldGrid.m_iYGridNo][indexX];
            if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
            {
               return stFieldGrid;
            }
         }
         return null;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         if(m_stCurrentFieldGrid.m_iXGridNo <= 6)
         {
            if(iCurrentTime % 2 == 1 && this.m_iShipState == 0 && this.CheckHasCard() != null)
            {
               this.SwitchState(1);
            }
         }
         if((a_1273 == 34 || a_1273 == 56) && this.m_bLastCreateBullet == false)
         {
            this.m_bLastCreateBullet = true;
            this.CreateSpaceSatrShipBulletEffect(this.m_stTargetGrid);
            if(this.CheckHasCard() != null)
            {
               this.SwitchState(1);
            }
            else
            {
               this.SwitchState(0);
            }
         }
         if(this.m_iShipWaitTick > 0)
         {
            --this.m_iShipWaitTick;
            if(this.m_iShipWaitTick <= 0)
            {
               if(this.m_iShipState == 1)
               {
                  stFieldGrid = this.CheckHasCard();
                  if(stFieldGrid != null)
                  {
                     this.SwitchState(2);
                     this.m_stTargetGrid = stFieldGrid;
                  }
                  else
                  {
                     this.SwitchState(0);
                  }
               }
            }
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         super.ChangeFieldGrid(stNextFieldGrid);
         if(stNextFieldGrid.m_iXGridNo == 6)
         {
            this.SwitchState(1);
         }
      }
   }
}

