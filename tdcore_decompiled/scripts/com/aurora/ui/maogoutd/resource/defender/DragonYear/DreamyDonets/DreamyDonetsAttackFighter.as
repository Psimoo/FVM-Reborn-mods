package com.aurora.ui.maogoutd.resource.defender.DragonYear.DreamyDonets
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DreamyDonetsAttackFighter extends a_3953
   {
      
      public function DreamyDonetsAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = DreamyDonetsDefine.DEFENSE_PRICE;
         a_1310 = DreamyDonetsDefine.SHOT_DELAY_TIMENUM;
         a_1317 = 2;
         a_1309 = DreamyDonetsDefine.a_3966(m_iSkillDegree);
         a_1311 = DreamyDonetsDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DreamyDonetsAttackFighter) as DreamyDonetsAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DreamyDonetsAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = DreamyDonetsDefine.a_3966(m_iSkillDegree);
         a_1311 = DreamyDonetsDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DreamyDonetsDefine.a_3964(a_1094);
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
         var j:int = 0;
         var stLastWaitShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(DreamyDonetsDefine.a_3431(a_1334) == 0)
            {
               return false;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 2; j++)
            {
               stLastWaitShot = DreamyDonetsBaseShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1321 = iCurrentTime;
            a_1307 = 11;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.m_isSpecial = 0;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 15,y - 25,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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

