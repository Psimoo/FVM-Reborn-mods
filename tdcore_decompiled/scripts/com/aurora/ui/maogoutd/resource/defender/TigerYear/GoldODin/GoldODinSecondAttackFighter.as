package com.aurora.ui.maogoutd.resource.defender.TigerYear.GoldODin
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldODinSecondAttackFighter extends a_3953
   {
      
      public function GoldODinSecondAttackFighter()
      {
         super();
         a_1095 = GoldODinDefine.DEFENSE_PRICE;
         a_1317 = 2;
         a_1312 = 15;
         a_1338 = 8;
         a_1337 = 20;
         a_1310 = 10;
         a_1309 = GoldODinDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldODinDefine.a_3965(a_1094) * 1.25;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldODinSecondAttackFighter) as GoldODinSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldODinSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = GoldODinDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldODinDefine.a_3965(a_1094) * 1.25;
         a_1339 = 50;
         if(a_1336)
         {
            a_1336.y += 2;
            a_1336.x -= 15;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldODinDefine.a_3964();
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
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
            }
            for(j = 0; j < 3; j++)
            {
               stLastWaitShot = GoldODinSecondShot.a_4344() as GoldODinSecondShot;
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1307 = 9;
            a_1275 = 0;
            a_1323 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955() + 2;
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 80,y + 0,a_1334.m_stCurrentBattbleFieldView,a_1334);
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

