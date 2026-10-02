package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.ElectricBatonLightingShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ElectricBatonBreadAttackFighter extends a_3953
   {
      
      public function ElectricBatonBreadAttackFighter()
      {
         super();
         a_1095 = 225;
         a_1313 = true;
         a_1310 = 8;
         a_1317 = 2;
         a_1309 = 200;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ElectricBatonBreadAttackFighter,ElectricBatonBreadAttackFighterMovie) as ElectricBatonBreadAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 200 - this.a_3965();
         a_1339 = 350;
         tagCom.AddTag(30030);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 600 - this.a_3966();
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
         var stTempFieldGrid:a_3491 = null;
         var iYIndex:int = 0;
         var iShotNum:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            for(iYIndex = 1; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               stTempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + iYIndex);
               if(Boolean(stTempFieldGrid) && stTempFieldGrid.m_stAttackFighter is ElectricBatonBreadAttackFighter)
               {
                  break;
               }
            }
            if(!(Boolean(stTempFieldGrid) && stTempFieldGrid.m_stAttackFighter is ElectricBatonBreadAttackFighter))
            {
               return false;
            }
            for(iShotNum = 0; iShotNum < stTempFieldGrid.m_iYGridNo - a_1334.m_iYGridNo; iShotNum++)
            {
               stLastWaitShot = ElectricBatonLightingShot.a_4344();
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
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            i = 0;
            while(true)
            {
               stLastWaitShot = a_1324.pop();
               if(!stLastWaitShot)
               {
                  break;
               }
               stTempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + i);
               if(Boolean(stTempFieldGrid) && Boolean(stLastWaitShot))
               {
                  stLastWaitShot.iShotSequenceNum = a_1322;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() + i * a_3491.a_1081,a_1334.m_stCurrentBattbleFieldView,stTempFieldGrid);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               i++;
            }
         }
         return true;
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
         return 0.4 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
      
      override protected function a_3965() : int
      {
         return 10 * a_1094;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 3 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 5)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 5)
         {
            iSkillDegreeEffect = 3 * 3 + 4 * (5 - 3) + 5 * (m_iSkillDegree - 5);
         }
         return iSkillDegreeEffect;
      }
   }
}

