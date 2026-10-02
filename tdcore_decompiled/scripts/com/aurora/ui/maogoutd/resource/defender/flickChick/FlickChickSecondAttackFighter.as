package com.aurora.ui.maogoutd.resource.defender.flickChick
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.eggBoilerPisces.EggBoilerPiscesShot;
   import flash.display.FrameLabel;
   
   public class FlickChickSecondAttackFighter extends a_3953
   {
      
      public function FlickChickSecondAttackFighter()
      {
         super();
         a_1095 = FlickChickDefine.DEFENSE_PRICE;
         a_1314 = true;
         a_1337 = -30;
         a_1312 = 15;
         a_1096 = false;
         a_1310 = 10;
         a_1317 = 8;
         a_1309 = FlickChickDefine.a_3966(m_iSkillDegree);
         a_1311 = Math.round(FlickChickDefine.a_3965(a_1094) * (1 + 0.3));
         a_1337 += 20;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FlickChickSecondAttackFighter) as FlickChickSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlickChickSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = FlickChickDefine.a_3966(m_iSkillDegree);
         a_1311 = Math.round(FlickChickDefine.a_3965(a_1094) * (1 + 0.3));
         if(a_1336)
         {
            a_1336.x += 38;
            a_1336.y += 2;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
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
            stLastWaitShot = EggBoilerPiscesShot.GetFreeShot2();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 1;
               a_1324.push(stLastWaitShot);
               for(i = 0; i < 1; i++)
               {
                  stLastWaitShot = EggBoilerPiscesShot.GetFreeShot2();
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
         return super.a_3954(iCurrentTime);
      }
      
      override protected function a_3955() : Number
      {
         return width + 50;
      }
      
      override protected function a_3956() : Number
      {
         return -15;
      }
   }
}

