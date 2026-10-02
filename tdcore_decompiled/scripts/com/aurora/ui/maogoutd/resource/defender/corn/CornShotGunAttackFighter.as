package com.aurora.ui.maogoutd.resource.defender.corn
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.Corn.CornGunShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CornShotGunAttackFighter extends a_3953
   {
      
      public function CornShotGunAttackFighter()
      {
         super();
         a_1335 = 16;
         a_1095 = 250;
         a_1096 = true;
         a_1310 = 8;
         a_1315 = true;
         a_1317 = 4;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CornShotGunAttackFighter) as CornShotGunAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CornShotGunAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 26;
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
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            stLastWaitShot = CornGunShot.a_4344();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 1;
               a_1324.push(stLastWaitShot);
               for(i = 0; i < 2; i++)
               {
                  stLastWaitShot = CornGunShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         return super.a_3954(iCurrentTime);
      }
      
      override protected function a_3956() : Number
      {
         return 0.2 * height;
      }
      
      override protected function a_3966() : int
      {
         return CornShotGunDefine.a_3966(m_iSkillDegree);
      }
   }
}

