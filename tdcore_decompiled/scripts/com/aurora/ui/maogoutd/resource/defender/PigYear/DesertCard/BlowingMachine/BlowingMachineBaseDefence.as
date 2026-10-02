package com.aurora.ui.maogoutd.resource.defender.PigYear.DesertCard.BlowingMachine
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class BlowingMachineBaseDefence extends a_3953
   {
      
      private var a_1368:int;
      
      private var m_hasFinishSkill:Boolean = true;
      
      public function BlowingMachineBaseDefence()
      {
         a_1271 = true;
         super();
         a_1095 = BlowingMachineDefence.DEFENSE_PRICE;
      }
      
      public static function a_3926() : BlowingMachineBaseDefence
      {
         return PoolManager.getInstance().CheckOutOne(BlowingMachineBaseDefence) as BlowingMachineBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return BlowingMachineBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.a_1368 = 0;
         this.m_hasFinishSkill = false;
         this.visible = true;
         gotoAndStop(1);
         a_1095 = BlowingMachineDefence.DEFENSE_PRICE;
         a_1339 = 30;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            this.a_4003(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return BlowingMachineDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0 && !this.m_hasFinishSkill && stFieldGrid != null)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.m_stDesertFogEffectSprite.clearFog();
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1368 = 0;
         this.m_hasFinishSkill = true;
         return true;
      }
      
      private function a_4003(iCurrentTime:int) : void
      {
         nextFrame();
         if(this.a_1368 % 30 == 0)
         {
            BattleFieldView.a_1040.play();
         }
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.a_1368;
         if(this.a_1368 > 25)
         {
            a_1334.m_stCurrentBattbleFieldView.m_stDesertFogEffectSprite.clearFog();
            this.m_hasFinishSkill = true;
            this.a_3969(a_1339);
            m_iDieType = 0;
         }
      }
   }
}

