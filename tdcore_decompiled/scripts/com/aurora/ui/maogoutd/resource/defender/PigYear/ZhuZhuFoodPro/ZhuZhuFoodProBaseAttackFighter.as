package com.aurora.ui.maogoutd.resource.defender.PigYear.ZhuZhuFoodPro
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ZhuZhuFoodProBaseAttackFighter extends a_3953
   {
      
      private var m_iShotHurtForEachHor:int;
      
      public function ZhuZhuFoodProBaseAttackFighter()
      {
         super();
         a_1095 = ZhuZhuFoodProDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1338 = 5;
         a_1337 = -2;
         a_1310 = 6;
         a_1317 = 2;
         a_1333 = true;
         a_1309 = ZhuZhuFoodProDefence.a_3966(m_iSkillDegree);
         a_1311 = ZhuZhuFoodProDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ZhuZhuFoodProBaseAttackFighter) as ZhuZhuFoodProBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZhuZhuFoodProBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = ZhuZhuFoodProDefence.a_3966(m_iSkillDegree);
         a_1311 = ZhuZhuFoodProDefence.a_3965(a_1094);
         this.m_iShotHurtForEachHor = ZhuZhuFoodProDefence.GetCardStarDegreeEffectValueHor(a_1094);
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
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         var tempX:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.GetFieldIntruderNumForFiveDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 1; j++)
            {
               if(a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = ZhuZhuFoodProBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo > 0)
               {
                  stLastWaitShot = ZhuZhuFoodProBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = ZhuZhuFoodProBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = ZhuZhuFoodProBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = ZhuZhuFoodProBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
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
            tempX = 0;
            tempX = a_1323 == 0 ? 0 : 10;
            if(a_1334.m_iXGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stLastWaitShot.iShotSequenceNum = a_1322;
                  stLastWaitShot.a_1797(0,a_1312,this.m_iShotHurtForEachHor,x + 0 + tempX,y - 32 + 75,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stStartField = a_1334;
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 60 - 75 + tempX,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,5);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stStartField = a_1334;
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 60 - tempX,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,6);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stStartField = a_1334;
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 62,y + 38 + tempX,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,7);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stStartField = a_1334;
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 62,y + 38 - tempX,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,8);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      public function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var j:int = 0;
         var k:* = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < stFieldGrid.m_iXGridNo; i++)
            {
               iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
            }
            for(i = 0; i < stFieldGrid.m_iYGridNo; i++)
            {
               iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,i).a_1511.length;
            }
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               for(j = stFieldGrid.m_iYGridNo; j < BattleFieldView.a_1012; j++)
               {
                  iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.a_3438(i,j).a_1511.length;
               }
            }
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               for(k = stFieldGrid.m_iYGridNo; k > 0; k--)
               {
                  iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.a_3438(i,k).a_1511.length;
               }
            }
         }
         return iTotalIntruderNum;
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
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}

