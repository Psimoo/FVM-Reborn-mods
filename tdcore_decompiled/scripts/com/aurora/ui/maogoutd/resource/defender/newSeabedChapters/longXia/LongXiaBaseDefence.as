package com.aurora.ui.maogoutd.resource.defender.newSeabedChapters.longXia
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.newSeabedChapters.longXia.LongXiaBaseShot;
   import flash.display.FrameLabel;
   
   public class LongXiaBaseDefence extends a_3953
   {
      
      public function LongXiaBaseDefence()
      {
         super();
         a_1337 = 0;
         a_1312 = 30;
         a_1313 = true;
         a_1310 = 26;
         a_1095 = LongXiaDefence.DEFENSE_PRICE;
         a_1096 = false;
         a_1314 = false;
         a_1309 = LongXiaDefence.a_3966(m_iSkillDegree);
         a_1311 = LongXiaDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(LongXiaBaseDefence,LongXiaBaseDefenceMovie) as LongXiaBaseDefence;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 26;
         super.a_1797(stFieldGrid);
         a_1309 = LongXiaDefence.a_3966(m_iSkillDegree);
         a_1311 = LongXiaDefence.a_3965(a_1094);
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
         var stLastWaitShot:LongXiaBaseShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(!a_1334.m_stCurrentBattbleFieldView.a_3431())
            {
               return true;
            }
            a_1321 = iCurrentTime;
            stLastWaitShot = LongXiaBaseShot.a_4344() as LongXiaBaseShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 35,y - 80,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         return true;
      }
   }
}

