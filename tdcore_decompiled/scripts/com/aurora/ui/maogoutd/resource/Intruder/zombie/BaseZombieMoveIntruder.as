package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.zombie.handEffect.BaseHandEffect;
   
   public class BaseZombieMoveIntruder extends a_4206
   {
      
      protected var m_iTotalLife:int;
      
      protected var m_bCanZombify:Boolean = false;
      
      public function BaseZombieMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_bCanZombify = true;
         this.m_iTotalLife = 100;
         return true;
      }
      
      public function OnZombify(hand:BaseHandEffect) : void
      {
         if(!this.m_bCanZombify)
         {
            return;
         }
         hand.a_1797(false);
         hand.x = this.x;
         hand.y = this.y;
         hand.SetPosition(this.a_1279);
         if(Boolean(m_stCurrentFieldGrid) && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView))
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(hand,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
         }
         this.m_bCanZombify = false;
      }
      
      override public function a_4210() : Boolean
      {
         BoomIsReduceLife = true;
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         return true;
      }
   }
}

