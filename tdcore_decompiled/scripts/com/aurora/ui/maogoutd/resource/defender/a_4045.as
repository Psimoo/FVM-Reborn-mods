package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class a_4045 extends a_3953
   {
      
      private var m_iEatLifeValueEx:EncrypIntEx;
      
      public function a_4045()
      {
         super();
         this.m_iEatLifeValueEx = new EncrypIntEx(900);
         a_1095 = 150;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4045) as a_4045;
      }
      
      override protected function getBindMovie() : Class
      {
         return HamburgerEaterAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 800 - this.a_3965();
         a_1321 = 0;
         this.m_iEatLifeValueEx.Value = 900;
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
         if(iCurrentTime - a_1321 == a_1309 - 20 && 2 == a_1275)
         {
            a_1275 = 0;
            a_1307 = 1;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stNextField:a_3491 = null;
         var stNextNextField:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stTempBaseMoveIntruder:a_4206 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime > a_1321 + a_1309)
         {
            stNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            stNextNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 2,a_1334.m_iYGridNo);
            if(a_1334.a_1511.length > 1 || 1 == a_1334.a_1511.length && 0 == a_1334.a_1511[0].iSpaceState || null != stNextField && (stNextField.a_1511.length > 1 || 1 == stNextField.a_1511.length && 0 == stNextField.a_1511[0].iSpaceState))
            {
               a_1321 = iCurrentTime;
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == 10)
         {
            stNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            stNextNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 2,a_1334.m_iYGridNo);
            if(a_1334.a_1511.length > 1 || 1 == a_1334.a_1511.length && 0 == a_1334.a_1511[0].iSpaceState)
            {
               for each(stTempBaseMoveIntruder in a_1334.a_1511)
               {
                  if(Boolean(stTempBaseMoveIntruder) && 0 == stTempBaseMoveIntruder.iSpaceState)
                  {
                     stBaseMoveIntruder = stTempBaseMoveIntruder;
                     break;
                  }
               }
            }
            else if(null != stNextField && (stNextField.a_1511.length > 1 || 1 == stNextField.a_1511.length && 0 == stNextField.a_1511[0].iSpaceState))
            {
               for each(stTempBaseMoveIntruder in stNextField.a_1511)
               {
                  if(Boolean(stTempBaseMoveIntruder) && 0 == stTempBaseMoveIntruder.iSpaceState)
                  {
                     stBaseMoveIntruder = stTempBaseMoveIntruder;
                     break;
                  }
               }
            }
            if(null != stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_4211(this.m_iEatLifeValueEx.Value);
            }
            BattleFieldView.a_1034.play();
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 2 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9 && a_1094 <= 13)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * 3 + 4 * (a_1094 - 9);
         }
         else if(a_1094 == 14)
         {
            iStarDegreeEffect = 36;
         }
         else if(a_1094 == 15)
         {
            iStarDegreeEffect = 38;
         }
         else if(a_1094 == 16)
         {
            iStarDegreeEffect = 39;
         }
         return 20 * iStarDegreeEffect;
      }
   }
}

