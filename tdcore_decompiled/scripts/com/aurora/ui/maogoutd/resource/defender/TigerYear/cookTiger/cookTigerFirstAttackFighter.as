package com.aurora.ui.maogoutd.resource.defender.TigerYear.cookTiger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class cookTigerFirstAttackFighter extends a_3953
   {
      
      public function cookTigerFirstAttackFighter()
      {
         super();
         a_1095 = cookTigerDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 8;
         a_1317 = 2;
         a_1333 = true;
         a_1309 = cookTigerDefence.a_3966(m_iSkillDegree);
         a_1311 = cookTigerDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(cookTigerFirstAttackFighter) as cookTigerFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return cookTigerFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = cookTigerDefence.a_3966(m_iSkillDegree);
         a_1311 = cookTigerDefence.a_3965(a_1094);
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
         var tempY:int = 0;
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
            for(j = 0; j < 3 * 2; j++)
            {
               stLastWaitShot = cookTigerFirstShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 13;
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
            if(stLastWaitShot)
            {
               tempY = a_1334.m_iYGridNo * a_3491.a_1081 + 30;
               tempX = (a_1334.m_iXGridNo + 0) * a_3491.a_1081 + 44;
               stLastWaitShot.iShotSequenceNum = a_1322;
               stLastWaitShot.a_1797(0,a_1312,a_1311,tempX + 0,tempY + 0,a_1334.m_stCurrentBattbleFieldView,a_1334,false,1,6);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            stLastWaitShot = a_1324.pop();
            stStartField = a_1334;
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,tempX + 0,tempY + 0,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,7);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            stLastWaitShot = a_1324.pop();
            stStartField = a_1334;
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,tempX + 0,tempY + 0,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,8);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
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
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
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
               for(k = stFieldGrid.m_iYGridNo; k >= 0; k--)
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

