package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class AlcoholSecondShot extends AlcoholShot
   {
      
      private static var ms_stAlcoholShotVector:Array = new Array();
      
      public function AlcoholSecondShot()
      {
         super();
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AlcoholSecondShot,AlcoholShotMovie) as AlcoholSecondShot;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         if(Boolean(baseMoveIntruder) && baseMoveIntruder.iLifeValue > 0)
         {
            GuiHuaJiuBuff.AddDrunkBuff(baseMoveIntruder,baseMoveIntruder.m_stCurrentFieldGrid);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
   }
}

