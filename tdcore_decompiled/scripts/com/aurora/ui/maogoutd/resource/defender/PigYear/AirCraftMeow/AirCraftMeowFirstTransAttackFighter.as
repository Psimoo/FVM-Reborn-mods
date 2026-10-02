package com.aurora.ui.maogoutd.resource.defender.PigYear.AirCraftMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AirCraftMeowFirstTransAttackFighter extends a_3953
   {
      
      public function AirCraftMeowFirstTransAttackFighter()
      {
         super();
         a_1314 = true;
         a_1313 = true;
         a_1333 = true;
         a_1095 = AirCraftMeowDefine.DEFENSE_PRICE;
         a_1310 = AirCraftMeowDefine.SHOT_DELAY_TIMENUM;
         a_1317 = AirCraftMeowDefine.CONTINUE_SHOT_INTERVAL;
         a_1309 = AirCraftMeowDefine.a_3966(m_iSkillDegree);
         a_1311 = AirCraftMeowDefine.a_3965(a_1094) * (1 + AirCraftMeowDefine.FIRSTTRANS_ADDITION);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(AirCraftMeowFirstTransAttackFighter) as AirCraftMeowFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AirCraftMeowFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = AirCraftMeowDefine.a_3966(m_iSkillDegree);
         a_1311 = AirCraftMeowDefine.a_3965(a_1094) * (1 + AirCraftMeowDefine.FIRSTTRANS_ADDITION);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return AirCraftMeowDefine.a_3964(a_1094);
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
         trace("m_iCurrentFrame::" + a_1273);
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
            a_1323 = 1;
            for(iCountShot = 0; iCountShot < 1; iCountShot++)
            {
               stBaseShot = AirCraftMeowShot.GetFreeShot1();
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
         if(a_1314 && iCurrentTime - a_1321 == a_1310 + a_1317 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.m_isSpecial = 1;
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

