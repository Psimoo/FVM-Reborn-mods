package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingSlotUiEffect extends BaseGameEffect
   {
      
      private var stGameCardView:GameCardView;
      
      public function WBDesireKingSlotUiEffect()
      {
         super();
      }
      
      public function InitData(card:GameCardView) : void
      {
         BattleCardUtil.LockCard(card);
         this.stGameCardView = card;
         SetAnimationOnce2Loop(0,1);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         if(!a_2036.getInstance().tagCom.HasTag(300 + this.stGameCardView.cardIndex))
         {
            SetAnimation(2,true);
         }
      }
   }
}

