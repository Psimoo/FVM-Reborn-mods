package com.aurora.ui.maogoutd.resource.defender.HorseYear.marbleSoda
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MarbleSodaBaseDefense extends a_3953
   {
      
      public function MarbleSodaBaseDefense()
      {
         super();
         a_1095 = MarbleSodaDefense.DEFENSE_PRICE;
         a_1310 = MarbleSodaDefense.SHOT_DELAY_TIMENUM;
         a_1312 = 10;
         a_1313 = true;
         a_1333 = true;
         a_1337 = 5;
      }
      
      public static function a_3926() : MarbleSodaBaseDefense
      {
         return PoolManager.getInstance().CheckOutOne(MarbleSodaBaseDefense) as MarbleSodaBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MarbleSodaBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1275 = 1;
            a_1311 = MarbleSodaDefense.a_3965(a_1094);
            a_1309 = MarbleSodaDefense.a_3966(m_iSkillDegree);
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var numShotXpos:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(!MarbleSodaDefense.HasTargetInView(a_1334,0))
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            stLastWaitShot = MarbleSodaNormalShot.a_4344(0);
            a_1324.push(stLastWaitShot);
            a_1323 = 0;
            a_1307 = 2;
            a_1275 = 1;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -50 : 50;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.m_isSpecial = 0;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 40,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return MarbleSodaDefense.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         a_1324.length = 0;
         super.a_3940();
         return true;
      }
   }
}

