package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class SkyCherryPartyWindTextEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function SkyCherryPartyWindTextEffect()
      {
         super();
         a_1279 = -112;
         m_iYDisplayCenterPos = -29;
      }
      
      public static function a_3926() : SkyCherryPartyWindTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(SkyCherryPartyWindTextEffect) as SkyCherryPartyWindTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyCherryPartyWindTextEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 11)
         {
            this.ReleaseBath();
         }
         else if(a_1273 == a_1274 || a_1278 != null)
         {
            this.a_3940();
         }
      }
      
      private function ReleaseBath() : void
      {
         var iX:int = 0;
         if(!this.stOriginalFieldGrid)
         {
            return;
         }
         var stTargetFieldGrid:a_3491 = null;
         for(var iY:int = 0; iY < BattleFieldView.a_1012; iY++)
         {
            for(iX = 0; iX < BattleFieldView.a_1011; iX++)
            {
               stTargetFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(iX,iY);
               if(Boolean(stTargetFieldGrid) && Boolean(stTargetFieldGrid.m_stCrispyKiteMouse != null) && stTargetFieldGrid.m_stCrispyKiteMouse.iLifeValue > 0)
               {
                  stTargetFieldGrid.m_stCrispyKiteMouse.SpecialSkillCallBack(6);
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.stOriginalFieldGrid = null;
         super.a_3940();
         return true;
      }
   }
}

