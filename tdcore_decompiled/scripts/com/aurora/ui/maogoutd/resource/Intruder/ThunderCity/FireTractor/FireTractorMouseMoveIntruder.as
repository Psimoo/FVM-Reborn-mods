package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.FireTractor
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.display.FrameLabel;
   
   public class FireTractorMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 2800;
      
      private const HURT_HP:int = 500;
      
      private const DEAD_HP:int = 0;
      
      private var stbIsRollingAttack:Boolean;
      
      private var stRollingAttackTime:int;
      
      private var m_iSkillTimes:int;
      
      private var stIsPickEnergy:Boolean;
      
      private var stbPcikEnergyTime:int;
      
      private var stHasPcikEnergy:Boolean;
      
      public function FireTractorMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FireTractorMouseMoveIntruder) as FireTractorMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireTractorMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 70;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.15 - 67 + 55;
         a_1272 = 0;
         this.stbIsRollingAttack = false;
         this.stIsPickEnergy = false;
         this.stHasPcikEnergy = false;
         this.m_iSkillTimes = 0;
         BoomIsReduceLife = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.stIsPickEnergy)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.stbIsRollingAttack)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(this.stIsPickEnergy)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.stbIsRollingAttack)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 10)
            {
               a_1275 = 10;
               gotoAndStop((a_1276[10] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime % 2 == 0)
         {
            return false;
         }
         trace("m_iCurrentFrame::" + a_1273);
         if(!this.stIsPickEnergy && !this.stbIsRollingAttack)
         {
            a_1350 = a_3491.a_1080 / 70;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            super.a_4216(iCurrentTime);
            if(m_stCurrentFieldGrid.a_3492())
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 1)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2 && this.m_iSkillTimes == 0)
               {
                  this.stIsPickEnergy = true;
                  this.stbPcikEnergyTime = 17;
                  ++this.m_iSkillTimes;
                  this.stHasPcikEnergy = false;
                  this.ResetMovieStatus();
               }
            }
            else if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 5)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2 && this.m_iSkillTimes == 1)
               {
                  this.stIsPickEnergy = true;
                  this.stbPcikEnergyTime = 17;
                  ++this.m_iSkillTimes;
                  this.stHasPcikEnergy = false;
                  this.ResetMovieStatus();
               }
            }
         }
         if(this.stbPcikEnergyTime > 0)
         {
            this.skillPickEnergy();
            --this.stbPcikEnergyTime;
            if(this.stbPcikEnergyTime <= 0)
            {
               this.stIsPickEnergy = false;
               if(this.stHasPcikEnergy)
               {
                  this.stbIsRollingAttack = true;
                  this.stRollingAttackTime = 3 * 2 * 10 / a_1470 - 5;
               }
               this.ResetMovieStatus();
            }
         }
         if(this.stRollingAttackTime > 0)
         {
            --this.stRollingAttackTime;
            if(m_stCurrentFieldGrid.a_3492())
            {
               this.a_3502(m_stCurrentFieldGrid);
               this.stbIsRollingAttack = false;
               this.stRollingAttackTime = 0;
               this.ResetMovieStatus();
            }
            else if(this.stRollingAttackTime <= 0)
            {
               this.stbIsRollingAttack = false;
               this.ResetMovieStatus();
            }
         }
         if(this.stbIsRollingAttack)
         {
            a_1350 = a_3491.a_1080 / (2 * 10);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      private function skillPickEnergy() : void
      {
         var stBaseEnergy:a_4157 = null;
         if(null != m_stCurrentFieldGrid && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector.slice())
            {
               stBaseEnergy.a_4159(x - 120,y - 30,30,true);
               this.stHasPcikEnergy = true;
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

