package com.aurora.ui.maogoutd.resource.defender.CattleYear.Hercules
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HerculesBaseAttackFighter extends a_3953
   {
      
      public function HerculesBaseAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = HerculesDefine.DEFENSE_PRICE;
         a_1310 = HerculesDefine.SHOT_DELAY_TIMENUM;
         a_1317 = HerculesDefine.CONTINUE_SHOT_INTERVAL;
         a_1309 = HerculesDefine.a_3966(m_iSkillDegree);
         a_1311 = HerculesDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(HerculesBaseAttackFighter) as HerculesBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return HerculesBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = HerculesDefine.a_3966(m_iSkillDegree);
         a_1311 = HerculesDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return HerculesDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iValue:int) : Boolean
      {
         super.a_3969(iValue);
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
         var iCountShot:int = 0;
         var stBaseShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(!(null != a_1334 && a_1334.m_stCurrentBattbleFieldView.a_3431(3) != null))
            {
               return true;
            }
            for each(stBaseShot in a_1324)
            {
               stBaseShot.a_4350();
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            a_1323 = 0;
            for(iCountShot = 0; iCountShot < 2; iCountShot++)
            {
               stBaseShot = HerculesShot.a_4344();
               if(stBaseShot == null)
               {
                  return false;
               }
               a_1324.push(stBaseShot);
            }
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.m_isSpecial = 0;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
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

