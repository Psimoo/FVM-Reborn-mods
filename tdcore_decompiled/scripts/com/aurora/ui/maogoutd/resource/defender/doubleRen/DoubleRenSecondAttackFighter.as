package com.aurora.ui.maogoutd.resource.defender.doubleRen
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.DoubleRen.DoubleRenShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DoubleRenSecondAttackFighter extends a_3953
   {
      
      public function DoubleRenSecondAttackFighter()
      {
         super();
         m_isFiveShot = true;
         a_1313 = true;
         a_1333 = true;
         a_1096 = false;
         a_1338 = 5;
         m_isFiveShot = true;
         a_1095 = DoubleRenDefine.DEFENSE_PRICE;
         a_1310 = DoubleRenDefine.SHOT_DELAY_TIMENUM;
         a_1317 = DoubleRenDefine.CONTINUE_SHOT_INTERVAL;
         a_1309 = DoubleRenDefine.a_3966(m_iSkillDegree);
         a_1311 = Math.round(DoubleRenDefine.a_3965(a_1094) * (1 + 0.05));
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DoubleRenSecondAttackFighter) as DoubleRenSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DoubleRenSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = DoubleRenDefine.a_3966(m_iSkillDegree);
         a_1311 = DoubleRenDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DoubleRenDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iValue:int) : Boolean
      {
         super.a_3969(iValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBaseShot:a_4348 = null;
         var iCountShot:int = 0;
         stBaseShot = null;
         if(Boolean(a_1334) && Boolean(a_1334.m_stCurrentBattbleFieldView.a_3431()))
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               for each(stBaseShot in a_1324)
               {
                  stBaseShot.a_4350();
               }
               a_1324.length = 0;
               stBaseShot = DoubleRenShot.GetFreeShot2();
               if(stBaseShot)
               {
                  a_1321 = iCurrentTime;
                  a_1323 = 1;
                  a_1324.push(stBaseShot);
                  for(iCountShot = 1; iCountShot < 5; iCountShot++)
                  {
                     stBaseShot = DoubleRenShot.GetFreeShot2();
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
            }
            super.a_3954(iCurrentTime);
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 70;
      }
      
      override protected function a_3956() : Number
      {
         return 25;
      }
   }
}

