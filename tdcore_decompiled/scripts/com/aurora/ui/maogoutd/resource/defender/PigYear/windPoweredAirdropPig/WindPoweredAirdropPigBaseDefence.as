package com.aurora.ui.maogoutd.resource.defender.PigYear.windPoweredAirdropPig
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WindPoweredAirdropPigBaseDefence extends a_3953
   {
      
      private var shotTimes:int = 3;
      
      public function WindPoweredAirdropPigBaseDefence()
      {
         super();
         a_1337 = 0;
         a_1312 = 30;
         a_1313 = true;
         a_1310 = 26;
         a_1095 = WindPoweredAirdropPigDefence.DEFENSE_PRICE;
         a_1096 = false;
         a_1309 = 5 * 20;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(WindPoweredAirdropPigBaseDefence) as WindPoweredAirdropPigBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindPoweredAirdropPigBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 26;
         super.a_1797(stFieldGrid);
         a_1317 = 8;
         a_1309 = 5 * 20;
         this.shotTimes = 3;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return WindPoweredAirdropPigDefence.a_3964(a_1094);
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
         var stLastWaitShot:a_4348 = null;
         var stNewShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var k:int = 0;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.shotTimes <= 0)
            {
               this.a_3969(a_1339);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            for(k = 0; k < a_1324.length; k++)
            {
               a_1324.pop();
            }
            for(j = 0; j < 2; j++)
            {
               stNewShot = WindPoweredAirdropPigBaseShot.a_4344();
               if(null == stNewShot)
               {
                  return false;
               }
               a_1324.push(stNewShot);
            }
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(0 == a_1323)
            {
               this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            else if(1 == a_1323)
            {
               this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo);
               --this.shotTimes;
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function LaunchShot(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var numShotXpos:Number = a_1283 ? -this.a_3955() : this.a_3955();
         var stLastWaitShot:a_4348 = a_1324.pop();
         var stStartField:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
   }
}

