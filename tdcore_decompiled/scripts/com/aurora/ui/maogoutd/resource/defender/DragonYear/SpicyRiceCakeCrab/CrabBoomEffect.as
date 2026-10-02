package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpicyRiceCakeCrab
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class CrabBoomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function CrabBoomEffect()
      {
         super();
         a_1279 = -87;
         m_iYDisplayCenterPos = -124;
      }
      
      public static function a_3926() : CrabBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(CrabBoomEffect) as CrabBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrabBoomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 3)
         {
            this.a_4210();
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(this.stOriginalFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(this.stOriginalFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(this.stOriginalFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(this.stOriginalFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.PowerfulBombReduceLifeRate(3100 / 900);
                  }
               }
            }
         }
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

