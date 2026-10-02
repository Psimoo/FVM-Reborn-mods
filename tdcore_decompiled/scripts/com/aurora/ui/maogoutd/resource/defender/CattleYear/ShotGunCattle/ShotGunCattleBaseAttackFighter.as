package com.aurora.ui.maogoutd.resource.defender.CattleYear.ShotGunCattle
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ShotGunCattleBaseAttackFighter extends a_3953
   {
      
      public function ShotGunCattleBaseAttackFighter()
      {
         super();
         a_1095 = ShotGunCattleDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 3;
         a_1333 = true;
         a_1309 = ShotGunCattleDefence.a_3966(m_iSkillDegree);
         a_1311 = ShotGunCattleDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ShotGunCattleBaseAttackFighter) as ShotGunCattleBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShotGunCattleBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = ShotGunCattleDefence.a_3966(m_iSkillDegree);
         a_1311 = ShotGunCattleDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ShotGunCattleDefence.a_3964(a_1094);
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
            if(this.GetFieldIntruderNumForFiveDirection(stFieldGrid) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            for(j = 0; j < 2; j++)
            {
               if(stFieldGrid.m_iYGridNo > 0)
               {
                  stLastWaitShot = ShotGunCattleBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(stFieldGrid.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = ShotGunCattleBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(stFieldGrid.m_iXGridNo >= 0)
               {
                  stLastWaitShot = ShotGunCattleBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(stFieldGrid.m_iXGridNo <= BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = ShotGunCattleBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
            }
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
            if(stFieldGrid.m_iXGridNo <= BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = stFieldGrid;
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 62,y + 40,stFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,1);
               parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
            }
            if(stFieldGrid.m_iXGridNo >= 0)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = stFieldGrid;
               stLastWaitShot.iShotSequenceNum = a_1322;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x - 10,y + 40,stFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,2);
               parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
            }
            if(stFieldGrid.m_iYGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = stFieldGrid;
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 30,y - 5,stFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,3);
               parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
            }
            if(stFieldGrid.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = stFieldGrid;
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 30,y + 70,stFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,4);
               parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
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
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,i).a_1511.length;
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
   }
}

