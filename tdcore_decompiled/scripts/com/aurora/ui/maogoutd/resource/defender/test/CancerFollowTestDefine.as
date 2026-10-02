package com.aurora.ui.maogoutd.resource.defender.test
{
   import a_4718.b_183;
   
   public class CancerFollowTestDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 0;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 1;
      
      internal static const DEFENSE_PRICE:int = 1;
      
      public function CancerFollowTestDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_CancerFollow;
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 60;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 2000;
      }
   }
}

