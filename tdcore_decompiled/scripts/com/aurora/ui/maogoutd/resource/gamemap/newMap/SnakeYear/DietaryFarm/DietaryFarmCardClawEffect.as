package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class DietaryFarmCardClawEffect extends a_4108
   {
      
      private var stGameCardView:GameCardView;
      
      public var battleView:BattleFieldView;
      
      private var m_iRunTick:int = 0;
      
      private var m_bBoom2Die:Boolean = false;
      
      private var m_iState:int = 0;
      
      public function DietaryFarmCardClawEffect()
      {
         super();
      }
      
      public static function a_3926() : DietaryFarmCardClawEffect
      {
         return PoolManager.getInstance().CheckOutOne(DietaryFarmCardClawEffect,DietaryFarmCardClawEffectMovie) as DietaryFarmCardClawEffect;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         ShowPlayAnimation(0,1);
         a_1279 = -50;
         m_iYDisplayCenterPos = -42;
         this.m_iRunTick = 0;
         this.m_bBoom2Die = false;
         this.m_iState = 0;
         a_1789.getInstance().addEventListener("Boom_JunBao_Mouse",this.On_Boom_JunBao_Mouse);
         return true;
      }
      
      private function On_Boom_JunBao_Mouse(e:a_1778) : void
      {
         if(this.m_iState != 0)
         {
            return;
         }
         if(this.m_bBoom2Die == false)
         {
            this.m_bBoom2Die = true;
            PlayAnimation(2);
            this.m_iRunTick = 999;
         }
      }
      
      public function AddGameCardView(gameCardView:GameCardView) : void
      {
         this.stGameCardView = gameCardView;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.m_iState == 0)
         {
            ++this.m_iRunTick;
            if(this.m_iRunTick == 25)
            {
               ShowPlayAnimation(2,3);
            }
            if(a_1273 == 23)
            {
               if(this.stGameCardView != null && this.m_bBoom2Die == false)
               {
                  this.StopCard();
               }
               else
               {
                  this.a_3940();
               }
            }
         }
         else if(!a_2036.getInstance().tagCom.HasTag(300 + this.stGameCardView.cardIndex))
         {
            this.stGameCardView.iGrowTimes = 0;
            this.stGameCardView.a_3514();
            this.a_3940();
         }
      }
      
      private function StopCard() : void
      {
         this.m_iState = 1;
         BattleCardUtil.LockCard(this.stGameCardView);
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("Boom_JunBao_Mouse",this.On_Boom_JunBao_Mouse);
         super.a_3940();
         return true;
      }
   }
}

