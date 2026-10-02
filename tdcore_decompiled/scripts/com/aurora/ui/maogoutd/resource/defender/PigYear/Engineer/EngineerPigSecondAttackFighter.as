package com.aurora.ui.maogoutd.resource.defender.PigYear.Engineer
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class EngineerPigSecondAttackFighter extends a_3953
   {
      
      public function EngineerPigSecondAttackFighter()
      {
         super();
         a_1095 = EngineerPigDefine.DEFENSE_PRICE;
         a_1317 = 4;
         a_1312 = 15;
         a_1338 = 8;
         a_1337 = -2;
         a_1310 = 14;
         a_1309 = EngineerPigDefine.a_3966(m_iSkillDegree);
         a_1311 = EngineerPigDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(EngineerPigSecondAttackFighter) as EngineerPigSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return EngineerPigSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = EngineerPigDefine.a_3966(m_iSkillDegree);
         a_1311 = EngineerPigDefine.a_3965(a_1094);
         a_1339 = 60;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return EngineerPigDefine.a_3964();
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
         trace("*********111");
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
            }
            for(i = 0; i < 2; i++)
            {
               stLastWaitShot = EngineerPigSecondShot.a_4344() as EngineerPigSecondShot;
               a_1324.push(stLastWaitShot);
            }
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1307 = a_1273;
               a_1275 = 0;
               a_1323 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955() + 27;
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 21,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.6;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
      }
   }
}

