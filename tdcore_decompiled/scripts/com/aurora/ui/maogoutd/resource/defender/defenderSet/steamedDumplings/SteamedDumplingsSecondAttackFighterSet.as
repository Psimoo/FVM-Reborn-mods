package com.aurora.ui.maogoutd.resource.defender.defenderSet.steamedDumplings
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.BaseAttackFighterSet;
   
   public class SteamedDumplingsSecondAttackFighterSet extends BaseAttackFighterSet
   {
      
      public function SteamedDumplingsSecondAttackFighterSet()
      {
         super(5);
         a_1304 = SteamedDumplingsDefine.GetShotTypeID();
         a_1095 = SteamedDumplingsDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1310 = SteamedDumplingsDefine.SHOT_DELAY_TIMENUM;
         a_1317 = SteamedDumplingsDefine.CONTINUE_SHOT_INTERVAL;
         a_1333 = true;
         a_1337 = -5;
      }
      
      public static function a_3926() : BaseAttackFighterSet
      {
         return PoolManager.getInstance().CheckOutOne(SteamedDumplingsSecondAttackFighterSet) as SteamedDumplingsSecondAttackFighterSet;
      }
      
      override protected function getBindMovie() : Class
      {
         return SteamedDumplingsSecondAttackFighterSetMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return SteamedDumplingsDefine.a_3964();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3956() : Number
      {
         return 0.25 * height + 6;
      }
      
      override protected function a_3965() : int
      {
         return SteamedDumplingsDefine.a_3965(a_1094);
      }
      
      override protected function a_3966() : int
      {
         return SteamedDumplingsDefine.a_3966(m_iSkillDegree);
      }
   }
}

