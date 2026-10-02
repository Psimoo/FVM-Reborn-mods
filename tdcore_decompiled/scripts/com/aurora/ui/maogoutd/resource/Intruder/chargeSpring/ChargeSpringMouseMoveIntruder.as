package com.aurora.ui.maogoutd.resource.Intruder.chargeSpring
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.BaseClimbEffect;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.SpringDestroyEffect;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.SpringFullEffect;
   import flash.display.FrameLabel;
   
   public class ChargeSpringMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2340;
      
      private static const MAX_INJURED_LIFE:int = 0.5 * MAX_LIFE;
      
      private static const MAX_ARMOR_LIFE:int = 0.5 * MAX_LIFE;
      
      private static const MAX_INJURED_ARMOR_LIFE:int = 0.5 * MAX_ARMOR_LIFE;
      
      private static const PUT_DOWN_SPRING_TICK:int = 24;
      
      private static const DROP_SPRING_TICK:int = 14;
      
      private var m_bIsHasSpring:Boolean;
      
      private var m_iDropSpringRestTick:int;
      
      public function ChargeSpringMouseMoveIntruder()
      {
         super();
         BoomIsReduceLife = true;
         a_1272 = 0;
         a_1279 = -width * 0.1;
         m_fClimbHeightTick = 3;
      }
      
      public static function a_3926() : ChargeSpringMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(ChargeSpringMouseMoveIntruder) as ChargeSpringMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ChargeSpringMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_bIsHasSpring = true;
         a_1339 = MAX_LIFE;
         a_1466 = MAX_ARMOR_LIFE;
         return true;
      }
      
      private function GotoAndStopFrame(iFrame:uint) : void
      {
         if(iFrame != a_1275)
         {
            a_1275 = iFrame;
            gotoAndStop((a_1276[iFrame] as FrameLabel).frame);
            a_3419();
         }
      }
      
      private function get SpringStatus() : int
      {
         if(this.m_bIsHasSpring)
         {
            if(a_1466 > MAX_INJURED_ARMOR_LIFE)
            {
               return 2;
            }
            return 1;
         }
         return 0;
      }
      
      private function IsCanShowEating() : Boolean
      {
         return a_1475 && 0 >= a_1474;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var iFrameID:int = -1;
         var iSpringStatus:int = this.SpringStatus;
         if(MAX_INJURED_LIFE < a_1339)
         {
            switch(iSpringStatus)
            {
               case 0:
                  iFrameID = this.IsCanShowEating() ? 16 : 2;
                  break;
               case 1:
                  if(DROP_SPRING_TICK == this.m_iDropSpringRestTick)
                  {
                     iFrameID = 4;
                  }
                  else if(a_1473 > 0)
                  {
                     iFrameID = PUT_DOWN_SPRING_TICK != a_1473 ? a_1275 : 4;
                  }
                  else
                  {
                     iFrameID = this.IsCanShowEating() ? 13 : 3;
                  }
                  break;
               case 2:
                  if(a_1473 > 0)
                  {
                     iFrameID = iFrameID = PUT_DOWN_SPRING_TICK != a_1473 ? a_1275 : 1;
                  }
                  else
                  {
                     iFrameID = this.IsCanShowEating() ? 12 : 0;
                  }
            }
         }
         else if(0 < a_1339)
         {
            switch(iSpringStatus)
            {
               case 0:
                  iFrameID = this.IsCanShowEating() ? 17 : 9;
                  break;
               case 1:
                  if(DROP_SPRING_TICK == this.m_iDropSpringRestTick)
                  {
                     iFrameID = 11;
                  }
                  else if(a_1473 > 0)
                  {
                     iFrameID = iFrameID = PUT_DOWN_SPRING_TICK != a_1473 ? a_1275 : 8;
                  }
                  else
                  {
                     iFrameID = this.IsCanShowEating() ? 15 : 6;
                  }
                  break;
               case 2:
                  if(a_1473 > 0)
                  {
                     iFrameID = iFrameID = PUT_DOWN_SPRING_TICK != a_1473 ? a_1275 : 7;
                  }
                  else
                  {
                     iFrameID = this.IsCanShowEating() ? 14 : 5;
                  }
            }
         }
         else
         {
            iFrameID = this.LifeIsZeroHandle();
         }
         if(this.m_iDropSpringRestTick > 0)
         {
            if(DROP_SPRING_TICK != this.m_iDropSpringRestTick && (4 == iFrameID || 11 == iFrameID))
            {
               iFrameID = a_1275;
            }
            else
            {
               this.m_iDropSpringRestTick = 0;
            }
         }
         this.GotoAndStopFrame(iFrameID);
         return true;
      }
      
      private function LifeIsZeroHandle() : int
      {
         this.m_iDropSpringRestTick = 0;
         var iFrameID:int = -1;
         var iSpringStatus:int = this.SpringStatus;
         if(0 == iSpringStatus)
         {
            iFrameID = 18;
         }
         else if(1 == iSpringStatus)
         {
            iFrameID = 19;
         }
         else if(2 == iSpringStatus)
         {
            iFrameID = 20;
         }
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
         return iFrameID;
      }
      
      private function DropSpring() : void
      {
         this.m_bIsHasSpring = false;
         this.m_iDropSpringRestTick = DROP_SPRING_TICK;
         a_1350 = a_3491.a_1080 / (6 * 20);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1466 > 0 && iRduceLifeValue >= a_1466)
         {
            this.DropSpring();
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return super.a_4209(iRduceLifeValue);
      }
      
      private function PutDownClimb() : void
      {
         this.m_bIsHasSpring = false;
         a_1350 = a_3491.a_1080 / (6 * 20);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
         if(m_stCurrentFieldGrid.IsCanPutDownClimb())
         {
            m_stCurrentFieldGrid.m_stBaseLander = a_1466 > MAX_INJURED_ARMOR_LIFE ? SpringFullEffect.a_3926() : SpringDestroyEffect.a_3926();
            m_stCurrentFieldGrid.m_stBaseLander.a_1797(a_1283);
            m_stCurrentFieldGrid.m_stBaseLander.x = x + (a_1283 ? 28 : -28);
            m_stCurrentFieldGrid.m_stBaseLander.y = y + 66;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_stCurrentFieldGrid.m_stBaseLander,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,m_stCurrentFieldGrid);
            if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(m_stCurrentFieldGrid.m_stBaseLander,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            }
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var fOrignXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1474 > 0)
         {
            return true;
         }
         if(a_1466 > 0 && this.m_bIsHasSpring && 0 == a_1473 && null != m_stCurrentFieldGrid && m_stCurrentFieldGrid.IsCanPutDownClimb())
         {
            a_1473 = PUT_DOWN_SPRING_TICK;
            this.ResetMovieStatus();
         }
         else if(a_1473 > 0)
         {
            --a_1473;
            if(0 == a_1473)
            {
               this.PutDownClimb();
               this.ResetMovieStatus();
            }
         }
         SetGameMapModePicnicPosition(fOrignXPos);
         return true;
      }
   }
}

