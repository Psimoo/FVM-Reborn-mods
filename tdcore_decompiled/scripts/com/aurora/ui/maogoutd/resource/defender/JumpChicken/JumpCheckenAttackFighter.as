package com.aurora.ui.maogoutd.resource.defender.JumpChicken
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.JumpChicken.JumpCheckenShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class JumpCheckenAttackFighter extends a_3953
   {
      
      public function JumpCheckenAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1304 = JumpCheckenDefine.GetShotTypeID();
         a_1095 = JumpCheckenDefine.DEFENSE_PRICE;
         a_1310 = JumpCheckenDefine.SHOT_DELAY_TIMENUM;
         a_1309 = JumpCheckenDefine.a_3966(m_iSkillDegree);
         a_1311 = JumpCheckenDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(JumpCheckenAttackFighter) as JumpCheckenAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return JumpCheckenAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = JumpCheckenDefine.a_3966(m_iSkillDegree);
         a_1311 = JumpCheckenDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return JumpCheckenDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iValue:int) : Boolean
      {
         super.a_3969(iValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         stBaseShot = null;
         if(null != a_1334 && Boolean(a_1334.m_stCurrentBattbleFieldView.a_3431(3)))
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               for each(stBaseShot in a_1324)
               {
                  stBaseShot.a_4350();
               }
               a_1324.length = 0;
               stBaseShot = JumpCheckenShot.a_4344();
               if(null != stBaseShot)
               {
                  a_1321 = iCurrentTime;
                  a_1323 = 1;
                  a_1324.push(stBaseShot);
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
         return 37;
      }
      
      override protected function a_3956() : Number
      {
         return -20;
      }
   }
}

