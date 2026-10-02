package com.aurora.ui.maogoutd.resource.defender.RabbitYear.BeeSlime
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SmallBeeSlimeSecondAttackFighter extends a_3953
   {
      
      private var m_appearedTimes:int = 0;
      
      private var cdTime:int;
      
      public function SmallBeeSlimeSecondAttackFighter()
      {
         super();
         a_1095 = SmallBeeSlimeDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 11;
         a_1317 = 2;
         a_1337 = 3;
         a_1333 = true;
         a_1309 = 1 * 20;
         a_1311 = SmallBeeSlimeDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SmallBeeSlimeSecondAttackFighter) as SmallBeeSlimeSecondAttackFighter;
      }
      
      public function get appearedTimes() : int
      {
         return this.m_appearedTimes;
      }
      
      public function set appearedTimes(value:int) : void
      {
         this.m_appearedTimes = value;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallBeeSlimeSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 1 * 20;
         a_1311 = SmallBeeSlimeDefence.a_3965(a_1094);
         a_1275 = 1;
         this.appearedTimes = 0;
         a_1308 = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SmallBeeSlimeDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var numShotYpos:Number = NaN;
         var i:int = 0;
         var j:int = 0;
         this.cdTime = a_1321 == 0 ? 0 : a_1309;
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(iCurrentTime - this.appearedTimes >= 20 * 20)
         {
            this.a_3969(a_1339);
            return false;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + this.cdTime)
         {
            if(SmallBeeSlimeDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            a_1323 = 0;
            for(j = 0; j < 10; j++)
            {
               stLastWaitShot = SmallBeeSlimeSecondShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1307 = 6;
            a_1275 = 1;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = 34;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            numShotYpos = 57;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            numShotXpos = 47;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            numShotYpos = 30;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
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
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

