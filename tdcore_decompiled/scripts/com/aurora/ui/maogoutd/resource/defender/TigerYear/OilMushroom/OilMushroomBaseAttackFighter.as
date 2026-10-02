package com.aurora.ui.maogoutd.resource.defender.TigerYear.OilMushroom
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class OilMushroomBaseAttackFighter extends a_3953
   {
      
      private var m_isHighShot:Boolean;
      
      private var m_isNormalShot:Boolean;
      
      public function OilMushroomBaseAttackFighter()
      {
         super();
         a_1310 = 15;
         a_1337 = 0;
         a_1095 = OilMushroomDefine.DEFENSE_PRICE;
         a_1333 = true;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(OilMushroomBaseAttackFighter) as OilMushroomBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilMushroomBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = OilMushroomDefine.a_3966(m_iSkillDegree);
            a_1317 = 4;
            a_1339 = OilMushroomDefine.MAX_LIFE_VALUE;
            m_LowHurtPower = OilMushroomDefine.GetLowShotHurtValue(a_1094);
            m_hightHurtPower = OilMushroomDefine.GetHighShotHurtValue(a_1094);
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
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var numShotYpos:Number = NaN;
         var i:int = 0;
         trace("m_iCurrentFrame::" + a_1273);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(OilMushroomDefine.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
            }
            this.m_isHighShot = false;
            this.m_isNormalShot = false;
            for(i = 0; i < 2; i++)
            {
               if(OilMushroomDefine.GetNormalIntruderNum(a_1334) > 0)
               {
                  stLastWaitShot = OilMushroomLowShot.a_4344() as OilMushroomLowShot;
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  this.m_isNormalShot = true;
                  a_1324.push(stLastWaitShot);
               }
               if(OilMushroomDefine.GetHighIntruderNum(a_1334) > 0)
               {
                  stLastWaitShot = OilMushroomHighShot.a_4344() as OilMushroomHighShot;
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  stLastWaitShot.m_isShotHighSkySpace = true;
                  a_1324.push(stLastWaitShot);
                  this.m_isHighShot = true;
               }
            }
            if(this.m_isHighShot && this.m_isNormalShot)
            {
               a_1321 = iCurrentTime;
               a_1310 = 6;
               a_1323 = 1;
               a_1307 = 12;
               a_1275 = 0;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            else if(this.m_isHighShot)
            {
               a_1321 = iCurrentTime;
               a_1310 = 8;
               a_1323 = 1;
               a_1307 = 12;
               a_1275 = 0;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else if(this.m_isNormalShot)
            {
               a_1321 = iCurrentTime;
               a_1310 = 4;
               a_1275 = 1;
               a_1323 = 1;
               a_1307 = 12;
               a_1275 = 0;
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
      
      override protected function a_3964() : int
      {
         return OilMushroomDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.7 * width;
      }
   }
}

