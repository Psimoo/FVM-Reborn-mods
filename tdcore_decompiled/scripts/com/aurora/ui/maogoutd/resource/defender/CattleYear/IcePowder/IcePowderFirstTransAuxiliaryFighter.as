package com.aurora.ui.maogoutd.resource.defender.CattleYear.IcePowder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   
   public class IcePowderFirstTransAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      public function IcePowderFirstTransAuxiliaryFighter()
      {
         super();
         a_1095 = IcePowderAuxiliaryDefine.DEFENSE_PRICE;
         m_numMoveSpeedMultiplier = -1;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(IcePowderFirstTransAuxiliaryFighter) as IcePowderFirstTransAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return IcePowderFirstTransAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = IcePowderAuxiliaryDefine.a_3965(a_1094);
         m_numAttackAddend = IcePowderAuxiliaryDefine.GetAttackAddend(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return IcePowderAuxiliaryDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
   }
}

