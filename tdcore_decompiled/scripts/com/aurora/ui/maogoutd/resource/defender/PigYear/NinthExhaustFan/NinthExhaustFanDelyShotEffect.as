package com.aurora.ui.maogoutd.resource.defender.PigYear.NinthExhaustFan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class NinthExhaustFanDelyShotEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function NinthExhaustFanDelyShotEffect()
      {
         super();
         a_1279 = -97;
         m_iYDisplayCenterPos = -72;
      }
      
      public static function a_3926() : NinthExhaustFanDelyShotEffect
      {
         return PoolManager.getInstance().CheckOutOne(NinthExhaustFanDelyShotEffect) as NinthExhaustFanDelyShotEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return NinthExhaustFanDelyShotEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         this.addShield(this.stOriginalFieldGrid);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         if(a_1273 == 3)
         {
            this.fullScreenkillSkill(this.stOriginalFieldGrid);
         }
         ++this.m_iStartTime;
      }
      
      private function fullScreenkillSkill(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid)
         {
            for each(stMoveIntruder in stFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector)
            {
               if(Boolean(stMoveIntruder && stMoveIntruder.parent) && Boolean(stMoveIntruder.iLifeValue > 0) && stMoveIntruder.iSpaceState != 1)
               {
                  stMoveIntruder.ReduceAllLife(300);
               }
            }
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         var stVector:Array = null;
         if(stFieldGrid)
         {
            stVector = stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(this.stOriginalFieldGrid);
         super.a_3940();
         return true;
      }
   }
}

