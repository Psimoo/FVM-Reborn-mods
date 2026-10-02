package com.aurora.ui.maogoutd.resource.defender.DragonYear.BaobaoLong
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BaoBaoLongAttackFighter extends a_3953
   {
      
      private var m_iAppearedTime:int;
      
      public function BaoBaoLongAttackFighter()
      {
         super();
         a_1095 = BaobaoLongDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 2;
         a_1317 = 3;
         a_1337 = 0;
         a_1333 = true;
         a_1309 = BaobaoLongDefence.a_3966(m_iSkillDegree);
         a_1311 = BaobaoLongDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BaoBaoLongAttackFighter) as BaoBaoLongAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaoBaoLongAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1312 = 15;
         a_1309 = BaobaoLongDefence.a_3966(m_iSkillDegree);
         a_1311 = BaobaoLongDefence.a_3965(a_1094);
         this.m_iAppearedTime = -10;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BaobaoLongDefence.a_3964(m_iSkillDegree);
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
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1334.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[a_1334.m_iYGridNo] <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 5; j++)
            {
               if(j == 0)
               {
                  stLastWaitShot = BaoBaoLongFireShot.a_4344();
               }
               else
               {
                  stLastWaitShot = BaoBaoLongNormalShot.a_4344();
               }
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 12;
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
            if(stLastWaitShot != null)
            {
               stStartField = stFieldGrid;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 60,y + 18,a_1334.m_stCurrentBattbleFieldView,stStartField);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stStartField);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var iDefenseCount:int = stDataEvent.dataObject[1] - 1;
         if(a_3512() == iDefenseTypeID)
         {
            iDefenseCount = iDefenseCount > 9 ? 9 : iDefenseCount;
            iDefenseCount = iDefenseCount < 0 ? 0 : iDefenseCount;
            a_1311 = BaobaoLongDefence.a_3965(a_1094) * (1 + iDefenseCount * 0.05);
         }
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
         return 0.3 * height;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

