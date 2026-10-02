package com.aurora.ui.maogoutd.resource.Intruder.DesertMouse.NaughtyKid
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class NaughtyKidMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1000;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      public function NaughtyKidMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(NaughtyKidMouseMoveIntruder) as NaughtyKidMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return NaughtyKidMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1462 = false;
         a_1275 = 2;
         gotoAndStop((a_1276[2] as FrameLabel).frame);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1275 == 8 || a_1275 == 9)
            {
               a_1275 = 2 + 2 * int(Math.random() * 3);
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 == 8 || a_1275 == 9)
            {
               a_1275 = 2 + 2 * int(Math.random() * 3) + 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 10)
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid != null)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         trace("m_iCurrentFrame::::" + a_1273);
         if(!a_1475 && a_1273 == (a_1276[a_1275] as FrameLabel).frame + 9)
         {
            x -= 20;
            a_1275 = 2 + 2 * int(Math.random() * 3) + (a_1339 > MAX_INJURED_LIFE ? 0 : 1);
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo <= 0 || iXGridNo >= BattleFieldView.a_1011)
         {
            SetCannotSeeByFighter(false);
         }
         else if(a_1475)
         {
            SetCannotSeeByFighter(false);
         }
         else
         {
            SetCannotSeeByFighter(true);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

