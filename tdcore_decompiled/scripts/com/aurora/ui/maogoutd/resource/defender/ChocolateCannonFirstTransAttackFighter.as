package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.ChocolateCannonShot;
   import flash.display.FrameLabel;
   
   public class ChocolateCannonFirstTransAttackFighter extends a_3953
   {
      
      public function ChocolateCannonFirstTransAttackFighter()
      {
         super();
         a_1335 = 65542;
         a_1309 = 300;
         a_1311 = 900;
         a_1312 = 15;
         a_1309 = 700 - this.a_3965();
         a_1095 = 300;
         a_1304 = b_183.enm_IceEggShot;
         a_1310 = 17;
         a_1337 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ChocolateCannonFirstTransAttackFighter) as ChocolateCannonFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ChocolateCannonFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 17;
         super.a_1797(stFieldGrid);
         a_1311 = 900;
         a_1309 = 700 - this.a_3965();
         a_1313 = true;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3966();
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
         var stLastWaitShot:ChocolateCannonShot = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            stLastWaitShot = ChocolateCannonShot.a_4344() as ChocolateCannonShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            stLastWaitShot.a_1598 = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][BattleFieldView.a_1011 - 2];
            a_1324.push(stLastWaitShot);
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         super.a_3954(iCurrentTime);
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
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 1 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * 3 + 2 * (a_1094 - 9);
         }
         return 20 * iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         return 30 * m_iSkillDegree;
      }
   }
}

