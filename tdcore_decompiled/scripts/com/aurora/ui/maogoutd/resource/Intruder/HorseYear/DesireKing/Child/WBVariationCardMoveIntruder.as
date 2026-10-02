package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import a_4718.b_179;
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBVariationCardMoveIntruder extends BaseGameMoveIntruder
   {
      
      private static var ONCE_DAMAGE_LIFE:int = 100000000;
      
      public function WBVariationCardMoveIntruder()
      {
         super();
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 400000000;
         INJURED_LIFE = 0;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1481 = false;
         a_1464 = true;
         SetAnimationOnce2Loop(0,1,0,1);
         tagCom.AddTag(401);
         tagCom.AddTag(20024);
         AddTag(5);
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         a_1789.getInstance().addEventListener("WBDesireKingDead",this.OnWBDesireKingDead);
         return true;
      }
      
      private function OnWBDesireKingDead(stDataEvent:a_1778) : void
      {
         this.a_3940();
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:a_3491 = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         iLifeValue;
         if(tempFieldGrid.m_iXGridNo != m_stCurrentFieldGrid.m_iXGridNo || tempFieldGrid.m_iYGridNo != m_stCurrentFieldGrid.m_iYGridNo)
         {
            return;
         }
         if(iDefenseTypeID == b_179.a_403 || iDefenseTypeID == b_179.enm_HelmetCopperScoop || iDefenseTypeID == b_179.enm_HelmetSilverScoop || iDefenseTypeID == b_179.enm_HelmetGoldenScoop)
         {
            ReduceLife2(ONCE_DAMAGE_LIFE,[50001]);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4210() : Boolean
      {
         return false;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         a_1789.getInstance().removeEventListener("WBDesireKingDead",this.OnWBDesireKingDead);
         return super.a_3940();
      }
   }
}

