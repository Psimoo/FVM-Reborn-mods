package com.aurora.ui.maogoutd.resource.defender.PigYear.BothWayMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BothWayMeowBaseAttackFighter extends a_3953
   {
      
      public function BothWayMeowBaseAttackFighter()
      {
         super();
         a_1095 = BothWayMeowDefence.DEFENSE_PRICE;
         a_1318 = true;
         a_1317 = 3;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BothWayMeowBaseAttackFighter) as BothWayMeowBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BothWayMeowBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = BothWayMeowDefence.a_3966(m_iSkillDegree);
         a_1311 = BothWayMeowDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BothWayMeowDefence.a_3964(a_1094);
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
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            for(i = 0; i < 4; i++)
            {
               stLastWaitShot = BothWayMeowShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1307 = 12;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1318 && iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos + 34,y + this.a_3956() + 23,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            numShotXpos = width - numShotXpos;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos - 20,y + this.a_3956() + 23,a_1334.m_stCurrentBattbleFieldView,a_1334,true);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3956() : Number
      {
         return 0.2 * height;
      }
   }
}

