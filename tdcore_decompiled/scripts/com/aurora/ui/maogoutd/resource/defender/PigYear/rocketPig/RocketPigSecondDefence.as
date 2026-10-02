package com.aurora.ui.maogoutd.resource.defender.PigYear.rocketPig
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public dynamic class RocketPigSecondDefence extends a_3953
   {
      
      public function RocketPigSecondDefence()
      {
         super();
         a_1337 = 0;
         a_1312 = 30;
         a_1313 = true;
         a_1310 = 26;
         a_1095 = RocketPigDefence.DEFENSE_PRICE;
         a_1096 = false;
         a_1314 = false;
         a_1309 = RocketPigDefence.a_3966(m_iSkillDegree);
         a_1311 = 1.2 * RocketPigDefence.a_3965(a_1094);
         a_1317 = 8;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(RocketPigSecondDefence,RocketPigSecondDefenceMovie) as RocketPigSecondDefence;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 26;
         super.a_1797(stFieldGrid);
         a_1339 = 60;
         a_1309 = RocketPigDefence.a_3966(m_iSkillDegree);
         a_1311 = 1.2 * RocketPigDefence.a_3965(a_1094);
         a_1317 = 8;
         tagCom.AddTag(30031);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 320;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -80;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:RocketPigSecondDefenceShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(!a_1334.m_stCurrentBattbleFieldView.a_3431())
            {
               return true;
            }
            a_1323 = 1;
            a_1321 = iCurrentTime;
            for(j = 0; j < 3; j++)
            {
               stLastWaitShot = RocketPigSecondDefenceShot.a_4344() as RocketPigSecondDefenceShot;
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
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
   }
}

