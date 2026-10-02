package com.aurora.ui.maogoutd.resource.defender.fusionCard.EggPitcher
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class EggPitcherPrimaryAttackFighter extends a_3953
   {
      
      public function EggPitcherPrimaryAttackFighter()
      {
         super();
         a_1309 = 60 - EggPitcherDefence.a_3966(m_iSkillDegree);
         a_1311 = EggPitcherDefence.a_3965(a_1094);
         a_1312 = 15;
         a_1095 = 250;
         a_1304 = b_183.b_187;
         a_1310 = 10;
         a_1337 = -15;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(EggPitcherPrimaryAttackFighter) as EggPitcherPrimaryAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggPitcherPrimaryAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 10;
         super.a_1797(stFieldGrid);
         a_1311 = EggPitcherDefence.a_3965(a_1094);
         a_1309 = 60 - EggPitcherDefence.a_3966(m_iSkillDegree);
         a_1314 = true;
         a_1317 = 4;
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
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 1;
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.AddShot();
            this.AddShot();
         }
         return super.a_3954(iCurrentTime);
      }
      
      private function AddShot() : void
      {
         var stLastWaitShot:EggPitcherBaseShot = EggPitcherPrimaryShot.a_4344();
         stLastWaitShot.InitData(EggPitcherDefence.GetCardGradeDegree4EffectValue(m_iGradeDegree),EggPitcherDefence.GetCardGradeDegree3EffectValue(m_iGradeDegree),0);
         if(stLastWaitShot)
         {
            a_1324.push(stLastWaitShot);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

