package com.aurora.ui.maogoutd.resource.defender.spicyHotPot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class SpicyHotPotAttackFighter extends a_3953
   {
      
      public function SpicyHotPotAttackFighter()
      {
         super();
         a_1304 = b_183.enm_SpicyHotPot;
         a_1337 = 0;
         a_1338 = 0;
         a_1312 = a_3491.a_1080 * 0.2;
         a_1313 = true;
         a_1309 = SpicyHotPotDefine.a_3966(m_iSkillDegree);
         a_1311 = SpicyHotPotDefine.a_3965(a_1094);
         a_1310 = 40;
         a_1317 = 8;
         a_1095 = 300;
         a_1323 = 1;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SpicyHotPotAttackFighter) as SpicyHotPotAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpicyHotPotAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = SpicyHotPotDefine.a_3966(m_iSkillDegree);
         a_1311 = SpicyHotPotDefine.a_3965(a_1094);
         a_1310 = 40;
         a_1317 = 8;
         a_1095 = 300;
         a_1323 = 1;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var numShotXpos:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) > 0)
         {
            a_1321 = iCurrentTime;
            stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1323 = 1;
            a_1324.push(stLastWaitShot);
            if(a_1307 >= 14)
            {
               a_1307 = 1;
            }
            a_1307 = 1;
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
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,1);
         }
         else if(a_1314 && iCurrentTime - a_1321 == a_1310 + a_1317 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1322 + 1;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,1);
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 55;
      }
      
      override protected function a_3956() : Number
      {
         return 20;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return 300;
      }
   }
}

