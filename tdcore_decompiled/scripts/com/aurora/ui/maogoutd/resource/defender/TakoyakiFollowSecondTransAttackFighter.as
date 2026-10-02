package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class TakoyakiFollowSecondTransAttackFighter extends a_3953
   {
      
      public function TakoyakiFollowSecondTransAttackFighter()
      {
         super();
         a_1095 = 225;
         a_1096 = true;
         a_1304 = b_183.b_196;
         a_1313 = true;
         a_1309 = 60;
         a_1310 = 10;
         a_1315 = true;
         a_1317 = 6;
         a_1333 = true;
         a_1335 = 17;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(TakoyakiFollowSecondTransAttackFighter) as TakoyakiFollowSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TakoyakiFollowSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 60;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(a_1334.m_stCurrentBattbleFieldView.a_3431())
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
               if(stLastWaitShot)
               {
                  a_1321 = iCurrentTime;
                  a_1323 = 1;
                  a_1324.push(stLastWaitShot);
                  for(i = 0; i < 3; i++)
                  {
                     stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
                     if(null == stLastWaitShot)
                     {
                        return false;
                     }
                     a_1324.push(stLastWaitShot);
                  }
                  a_1307 = a_1273;
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            super.a_3954(iCurrentTime);
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 3 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (6 - 3) + 5 * (m_iSkillDegree - 6);
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

