package com.aurora.ui.maogoutd.resource.defender.fusionCard.oilMushroom
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.oilMushroom.shot.OilMushroomDeepHighShot;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.oilMushroom.shot.OilMushroomDeepLowShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class OilMushroomDeepAttackFighter extends a_3953
   {
      
      private var m_isHighShot:Boolean;
      
      private var m_isNormalShot:Boolean;
      
      public function OilMushroomDeepAttackFighter()
      {
         super();
         a_1095 = OilMushroomDefence.DEFENSE_PRICE;
         a_1317 = 4;
         a_1337 = 0;
         a_1310 = 12;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(OilMushroomDeepAttackFighter) as OilMushroomDeepAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilMushroomDeepAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = OilMushroomDefence.a_3966(m_iSkillDegree);
            a_1339 = OilMushroomDefence.MAX_LIFE_VALUE;
            m_LowHurtPower = OilMushroomDefence.GetLowShotHurtValue(a_1094) + OilMushroomDefence.GetPrimaryGroundHurtValue(m_iGradeDegree) + OilMushroomDefence.GetDeepGroundHurtValue(m_iGradeDegree);
            m_hightHurtPower = OilMushroomDefence.GetHighShotHurtValue(a_1094) + OilMushroomDefence.GetPrimaryAirHurtValue(m_iGradeDegree);
         }
         return true;
      }
      
      override public function AddShotHurtForEach(value:int) : void
      {
         m_LowHurtPower += value;
         m_hightHurtPower += value;
      }
      
      override public function AddShotHurtRate(iAddRate:Number) : void
      {
         m_LowHurtPower *= 1 + iAddRate;
         m_hightHurtPower *= 1 + iAddRate;
      }
      
      override protected function a_3964() : int
      {
         return OilMushroomDefence.a_3964(m_iSkillDegree);
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
         var numShotYpos:Number = NaN;
         var i:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            if(OilMushroomDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324.length = 0;
            this.m_isHighShot = Boolean(OilMushroomDefence.GetHighIntruderNum(a_1334) > 0);
            this.m_isNormalShot = Boolean(OilMushroomDefence.GetNormalIntruderNum(a_1334) > 0);
            for(i = 0; i < 4; i++)
            {
               if(this.m_isNormalShot)
               {
                  stLastWaitShot = OilMushroomDeepLowShot.a_4344();
                  a_1324.push(stLastWaitShot);
               }
               if(this.m_isHighShot)
               {
                  stLastWaitShot = OilMushroomDeepHighShot.a_4344();
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1307 = 12;
            a_1275 = 0;
            a_1323 = 0;
            if(this.m_isHighShot && this.m_isNormalShot)
            {
               a_1310 = 8;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            else if(this.m_isHighShot)
            {
               a_1310 = 10;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else if(this.m_isNormalShot)
            {
               a_1310 = 8;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(this.m_isHighShot)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  numShotXpos = 65;
                  if(a_1283)
                  {
                     numShotXpos = -numShotXpos;
                  }
                  numShotYpos = 30;
                  a_1311 = m_hightHurtPower;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(this.m_isNormalShot)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  numShotXpos = 57;
                  if(a_1283)
                  {
                     numShotXpos = -numShotXpos;
                  }
                  numShotYpos = 23 + 48;
                  a_1311 = m_LowHurtPower;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
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

