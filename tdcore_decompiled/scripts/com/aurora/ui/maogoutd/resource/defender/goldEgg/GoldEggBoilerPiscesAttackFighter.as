package com.aurora.ui.maogoutd.resource.defender.goldEgg
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.goldEgg.GoldEggBoilerPiscesShot;
   import flash.display.FrameLabel;
   
   public class GoldEggBoilerPiscesAttackFighter extends a_3953
   {
      
      public function GoldEggBoilerPiscesAttackFighter()
      {
         super();
         a_1314 = true;
         a_1337 = -20;
         a_1338 = 12;
         a_1312 = 15;
         a_1095 = GoldEggBoilerPiscesDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1304 = GoldEggBoilerPiscesDefine.GetShotTypeID();
         a_1310 = GoldEggBoilerPiscesDefine.SHOT_DELAY_TIMENUM;
         a_1317 = GoldEggBoilerPiscesDefine.CONTINUE_SHOT_INTERVAL;
         a_1309 = GoldEggBoilerPiscesDefine.a_3966(m_iSkillDegree);
         a_1311 = int(GoldEggBoilerPiscesDefine.a_3965(a_1094));
         if(a_1336)
         {
            a_1336.x += 38;
            a_1336.y += 2;
         }
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldEggBoilerPiscesAttackFighter) as GoldEggBoilerPiscesAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldEggBoilerPiscesAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = GoldEggBoilerPiscesDefine.a_3966(m_iSkillDegree);
         a_1311 = int(1.35 * GoldEggBoilerPiscesDefine.a_3965(a_1094));
         if(a_1336)
         {
            a_1336.x += 38;
            a_1336.y += 2;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldEggBoilerPiscesDefine.a_3964();
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
            stLastWaitShot = GoldEggBoilerPiscesShot.a_4344();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 0;
               a_1324.push(stLastWaitShot);
               for(i = 0; i < 1; i++)
               {
                  stLastWaitShot = GoldEggBoilerPiscesShot.a_4344();
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
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(a_1323 == 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 85,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(a_1323 == 1)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 85,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width + 30;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

