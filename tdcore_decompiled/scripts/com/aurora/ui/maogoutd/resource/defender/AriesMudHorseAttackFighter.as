package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.AriesMudHorseShot;
   
   public class AriesMudHorseAttackFighter extends a_3953
   {
      
      public function AriesMudHorseAttackFighter()
      {
         super();
         a_1312 = 10;
         a_1095 = 300;
         a_1337 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(AriesMudHorseAttackFighter) as AriesMudHorseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AriesMudHorseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 2;
         super.a_1797(stFieldGrid);
         a_1311 = 1800;
         a_1309 = 4;
         a_1313 = true;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3965();
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
         var stLastWaitShot:AriesMudHorseShot = null;
         var numShotXpos:Number = NaN;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            stLastWaitShot = AriesMudHorseShot.a_4344() as AriesMudHorseShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop(1);
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
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 20;
               break;
            case 2:
               iStarDegreeEffect = 40;
               break;
            case 3:
               iStarDegreeEffect = 60;
               break;
            case 4:
               iStarDegreeEffect = 80;
               break;
            case 5:
               iStarDegreeEffect = 100;
               break;
            case 6:
               iStarDegreeEffect = 120;
               break;
            case 7:
               iStarDegreeEffect = 150;
               break;
            case 8:
               iStarDegreeEffect = 180;
               break;
            case 9:
               iStarDegreeEffect = 210;
               break;
            case 10:
               iStarDegreeEffect = 240;
               break;
            case 11:
               iStarDegreeEffect = 270;
               break;
            case 12:
               iStarDegreeEffect = 300;
               break;
            case 13:
               iStarDegreeEffect = 330;
               break;
            case 14:
               iStarDegreeEffect = 360;
               break;
            case 15:
               iStarDegreeEffect = 390;
               break;
            case 16:
               iStarDegreeEffect = 420;
         }
         return iStarDegreeEffect;
      }
   }
}

