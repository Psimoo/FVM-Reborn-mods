package com.aurora.ui.maogoutd.resource.defender.SnakeYear.newTransCard
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.HorizontalSprayPotDownPaoPaoShot;
   import com.aurora.ui.maogoutd.resource.shot.HorizontalSprayPotLinePaoPaoShot;
   import com.aurora.ui.maogoutd.resource.shot.HorizontalSprayPotUpPaoPaoShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HorizontalSprayPotFirstAttackFighter extends a_3953
   {
      
      public function HorizontalSprayPotFirstAttackFighter()
      {
         super();
         a_1095 = 150;
         a_1335 = 3;
         a_1310 = 6;
         a_1312 = 0;
         a_1313 = true;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(HorizontalSprayPotFirstAttackFighter) as HorizontalSprayPotFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return HorizontalSprayPotFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 *= 1.25;
         a_1340 = false;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
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
         var i:int = 0;
         var stFieldGrid:a_3491 = null;
         var isExistIntruder:Boolean = false;
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var stStartField:a_3491 = null;
         if(!a_1340)
         {
            isExistIntruder = a_1334.a_1511.length > 0;
            for(i = 1; i <= 4; i++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + i);
               if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
               {
                  isExistIntruder = true;
               }
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - i);
               if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
               {
                  isExistIntruder = true;
               }
            }
            if(!a_1283)
            {
               for(i = 1; i <= 4; i++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo);
                  if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
                  {
                     isExistIntruder = true;
                  }
               }
            }
            else
            {
               for(i = 1; i <= 4; i++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - i,a_1334.m_iYGridNo);
                  if(Boolean(stFieldGrid) && stFieldGrid.a_1511.length > 0)
                  {
                     isExistIntruder = true;
                  }
               }
            }
            if(isExistIntruder)
            {
               if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
               {
                  a_1321 = iCurrentTime;
                  stLastWaitShot = HorizontalSprayPotUpPaoPaoShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1323 = 1;
                  a_1324.push(stLastWaitShot);
                  stLastWaitShot = HorizontalSprayPotDownPaoPaoShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
                  stLastWaitShot = HorizontalSprayPotLinePaoPaoShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
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
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.iShotSequenceNum = a_1322;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() - 30,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() + 30,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.iShotSequenceNum = 2;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1321 == iCurrentTime)
               {
                  BattleFieldView.a_1032.play();
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.5 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.6 * height;
      }
   }
}

