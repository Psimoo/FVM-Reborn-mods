package com.aurora.ui.maogoutd.resource.defender.defenderSet.threeDumplings
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.BaseAttackFighterSet;
   
   public class ThreeDumplingsFirstAttackFighterSet extends BaseAttackFighterSet
   {
      
      public function ThreeDumplingsFirstAttackFighterSet()
      {
         super(3);
         a_1304 = ThreeDumplingsDefine.GetShotTypeID();
         a_1095 = ThreeDumplingsDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1310 = ThreeDumplingsDefine.SHOT_DELAY_TIMENUM;
         a_1317 = ThreeDumplingsDefine.CONTINUE_SHOT_INTERVAL;
         a_1333 = true;
         a_1338 = 10;
      }
      
      public static function a_3926() : BaseAttackFighterSet
      {
         return PoolManager.getInstance().CheckOutOne(ThreeDumplingsFirstAttackFighterSet) as ThreeDumplingsFirstAttackFighterSet;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThreeDumplingsFirstAttackFighterSetMovie;
      }
      
      override protected function InitData() : void
      {
         super.InitData();
         m_isThreeDirectionShot = true;
         a_1313 = true;
         if(null != a_1336)
         {
            a_1336.y += 10;
         }
      }
      
      override protected function a_3964() : int
      {
         return ThreeDumplingsDefine.a_3964(a_1094);
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
         return 0.25 * height - 4;
      }
      
      override protected function a_3965() : int
      {
         return ThreeDumplingsDefine.a_3965(a_1094);
      }
      
      override protected function a_3966() : int
      {
         return ThreeDumplingsDefine.a_3966(m_iSkillDegree);
      }
   }
}

