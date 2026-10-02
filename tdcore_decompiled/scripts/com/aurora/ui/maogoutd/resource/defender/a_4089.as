package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class a_4089 extends a_3953
   {
      
      public function a_4089()
      {
         super();
         a_1095 = 325;
         a_1304 = b_183.b_197;
         a_1313 = true;
         a_1310 = 10;
         a_1316 = true;
         a_1317 = 1;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4089) as a_4089;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThreeShotGunAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 26 - this.a_3966();
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
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1323 = 1;
            a_1324.push(stLastWaitShot);
            if(a_1316)
            {
               if(a_1334.m_iYGridNo > 0)
               {
                  stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1307 = 1;
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
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1322;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         if(a_1316 && iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            if(1 == a_1323 && a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,2);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(2 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,3);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(3 == a_1323)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3966() : int
      {
         if(m_iSkillDegree == 8)
         {
            return m_iSkillDegree + 2;
         }
         if(m_iSkillDegree == 7)
         {
            return m_iSkillDegree + 1;
         }
         return m_iSkillDegree;
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

