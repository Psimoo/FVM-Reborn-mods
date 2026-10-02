package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.TeLuoYiMuMa
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class DesertMuMaMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 10000;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private var lastFieldGrid:a_3491;
      
      public function DesertMuMaMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DesertMuMaMouseMoveIntruder) as DesertMuMaMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DesertMuMaMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 70;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.lastFieldGrid = null;
         a_1339 = MAX_LIFE;
         a_1464 = true;
         a_1279 = -width * 0.15 - 8 - 62;
         m_iYDisplayCenterPos = 10;
         a_1272 = 0;
         tagCom.AddTag(401);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.lastFieldGrid = null;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
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
         var suppFieldGrid:a_3491 = null;
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
         if(stFieldGrid != null && stFieldGrid != this.lastFieldGrid)
         {
            this.lastFieldGrid = stFieldGrid;
            this.a_3502(this.lastFieldGrid);
            if(m_stCurrentFieldGrid == null)
            {
               return true;
            }
            suppFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
            if(suppFieldGrid != null)
            {
               this.a_3502(suppFieldGrid);
            }
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseOnlyFrozen();
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function ShowBoomDieEffect() : void
      {
         var stSmallMouseBoomdie:a_4143 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         if(!a_1461 && a_1339 <= 0 && null != parent && m_stCurrentFieldGrid != null)
         {
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            iPosX = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            iPosY = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081;
            stSmallMouseBoomdie.x = iPosX;
            stSmallMouseBoomdie.y = iPosY - 24;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

