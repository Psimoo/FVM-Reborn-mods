package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.WitchMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.display.FrameLabel;
   
   public class WitchMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 900;
      
      private const HURT_HP:int = 450;
      
      private var m_bIsUseingMagic:Boolean;
      
      private var m_bIsUsedMagic:Boolean;
      
      private var m_useMagicTime:int = 64;
      
      public function WitchMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WitchMouseMoveIntruder) as WitchMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WitchMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (2 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -8;
         a_1465 = 3;
         this.m_bIsUseingMagic = false;
         this.m_bIsUsedMagic = false;
         BoomIsReduceLife = true;
         a_1464 = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_bIsUseingMagic)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_bIsUseingMagic)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
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
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         super.a_4212();
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime % 2 == 0 && a_1339 > 0)
         {
            trace("m_iCurrentFrame::" + a_1273);
         }
         if(!this.m_bIsUseingMagic)
         {
            super.a_4216(iCurrentTime);
         }
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo == 4 && !this.m_bIsUsedMagic && !this.m_bIsUseingMagic)
         {
            this.m_bIsUseingMagic = true;
            this.m_useMagicTime = 30 * 2;
            this.ResetMovieStatus();
         }
         if(this.m_bIsUseingMagic && this.m_useMagicTime > 0)
         {
            --this.m_useMagicTime;
            if(this.m_useMagicTime <= (30 - 9) * 2)
            {
               this.skillPickEnergy();
            }
            if(this.m_useMagicTime <= 0)
            {
               this.m_bIsUseingMagic = false;
               this.m_bIsUsedMagic = true;
               this.ResetMovieStatus();
               a_1350 = a_3491.a_1080 / (4 * 20);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
            }
         }
         return true;
      }
      
      private function skillPickEnergy() : void
      {
         var stBaseEnergy:a_4157 = null;
         if(null != m_stCurrentFieldGrid && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector.slice())
            {
               stBaseEnergy.a_4159(x - 120 + 94,y - 30 + 48,30,true);
            }
         }
      }
      
      private function UpdatePosY(numOrigXPos:Number) : void
      {
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
      }
   }
}

