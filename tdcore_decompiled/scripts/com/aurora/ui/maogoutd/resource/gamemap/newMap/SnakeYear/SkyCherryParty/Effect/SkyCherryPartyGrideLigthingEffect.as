package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class SkyCherryPartyGrideLigthingEffect extends a_4108
   {
      
      public static const m_LightHitCard:Array = [286458192,286458206,286458207,286394464,286394478,286394479];
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function SkyCherryPartyGrideLigthingEffect()
      {
         super();
         a_1279 = -79;
         m_iYDisplayCenterPos = -402;
      }
      
      public static function a_3926() : SkyCherryPartyGrideLigthingEffect
      {
         return PoolManager.getInstance().CheckOutOne(SkyCherryPartyGrideLigthingEffect) as SkyCherryPartyGrideLigthingEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyCherryPartyGrideLigthingEffectMovie;
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
         if(a_1273 == 4)
         {
            this.Releaseskill(this.stOriginalFieldGrid);
         }
         else if(a_1273 == a_1274 || a_1278 != null)
         {
            this.a_3940();
         }
      }
      
      private function Releaseskill(grid:a_3491) : void
      {
         if(!grid)
         {
            return;
         }
         if(Boolean(grid.m_stCrispyKiteMouse) && grid.m_stCrispyKiteMouse.iLifeValue > 0)
         {
            grid.m_stCrispyKiteMouse.SpecialSkillCallBack(2);
            return;
         }
         if(Boolean(grid.m_stAttackFighter) && m_LightHitCard.indexOf(grid.m_stAttackFighter.a_3512()) != -1)
         {
            if(grid.m_stAttackFighter.m_stLigthEffect == null)
            {
               this.m_stLigthEffectFunc(grid.m_stAttackFighter);
            }
         }
         else
         {
            this.a_3502(grid);
         }
      }
      
      private function m_stLigthEffectFunc(stAttackFighter:a_3953) : void
      {
         var stFieldGrid:a_3491 = null;
         var stLigthEffect:SkyCherryPartyGrideDefenceLigthingEffect = null;
         if(stAttackFighter != null && stAttackFighter.m_stLigthEffect == null)
         {
            stFieldGrid = stAttackFighter.stFieldGrid;
            stLigthEffect = SkyCherryPartyGrideDefenceLigthingEffect.a_3926();
            stLigthEffect.stOriginalFieldGrid = stFieldGrid;
            stLigthEffect.a_1797(false);
            stLigthEffect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stLigthEffect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLigthEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
            stAttackFighter.m_stLigthEffect = stLigthEffect;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      private function KillDefense(target:Object) : void
      {
         if(target)
         {
            target.m_iDieType = 1;
            target.a_3969(target.iLifeValue);
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

