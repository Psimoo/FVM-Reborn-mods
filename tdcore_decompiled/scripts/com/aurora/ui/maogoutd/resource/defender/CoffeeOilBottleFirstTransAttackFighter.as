package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.CoffeeOilBottleShot;
   import flash.display.FrameLabel;
   
   public class CoffeeOilBottleFirstTransAttackFighter extends a_3953
   {
      
      public function CoffeeOilBottleFirstTransAttackFighter()
      {
         super();
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_1095 = 150;
         a_1335 = 3;
         a_1310 = 8;
         a_1312 = 12;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeOilBottleFirstTransAttackFighter) as CoffeeOilBottleFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeOilBottleFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_1311 = this.a_3965();
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
         var stLastWaitShot:CoffeeOilBottleShot = null;
         var numShotXpos:Number = NaN;
         var stStartField:a_3491 = null;
         var isExistIntruder:Boolean = a_1334.a_1511.length > 0;
         if(!a_1283)
         {
            for(i = 1; i <= 6; i++)
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
            for(i = 1; i <= 6; i++)
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
               a_1323 = 1;
               stLastWaitShot = CoffeeOilBottleShot.a_4344() as CoffeeOilBottleShot;
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               BattleFieldView.a_1032.play();
            }
            if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
            {
               numShotXpos = this.a_3955();
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_iTransType = 1;
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
         }
         return true;
      }
      
      override public function a_3970() : Boolean
      {
         if(a_1340)
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            a_1321 = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
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
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 20;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 20;
               break;
            case 1:
               iStarDegreeEffect = 24;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 32;
               break;
            case 4:
               iStarDegreeEffect = 36;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 44;
               break;
            case 7:
               iStarDegreeEffect = 52;
               break;
            case 8:
               iStarDegreeEffect = 64;
               break;
            case 9:
               iStarDegreeEffect = 80;
               break;
            case 10:
               iStarDegreeEffect = 110;
               break;
            case 11:
               iStarDegreeEffect = 140;
               break;
            case 12:
               iStarDegreeEffect = 170;
               break;
            case 13:
               iStarDegreeEffect = 200;
               break;
            case 14:
               iStarDegreeEffect = 230;
               break;
            case 15:
               iStarDegreeEffect = 260;
               break;
            case 16:
               iStarDegreeEffect = 290;
         }
         return iStarDegreeEffect;
      }
   }
}

