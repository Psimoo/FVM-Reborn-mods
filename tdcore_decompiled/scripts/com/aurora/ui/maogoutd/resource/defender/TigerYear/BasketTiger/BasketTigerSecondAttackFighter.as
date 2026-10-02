package com.aurora.ui.maogoutd.resource.defender.TigerYear.BasketTiger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BasketTigerSecondAttackFighter extends a_3953
   {
      
      private var shotCount:int = 0;
      
      public function BasketTigerSecondAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = BasketTigerDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1337 = -5;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BasketTigerSecondAttackFighter) as BasketTigerSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BasketTigerSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 10;
         super.a_1797(stFieldGrid);
         a_1311 = BasketTigerDefence.a_3965(a_1094);
         a_1309 = BasketTigerDefence.a_3966(m_iSkillDegree);
         this.shotCount = 2;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BasketTigerDefence.a_3964(m_iSkillDegree);
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
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(BasketTigerDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            if(this.shotCount <= 0)
            {
               stLastWaitShot = BasketTigerSecondBoomShot.a_4344();
               a_1324.push(stLastWaitShot);
               this.shotCount = 2;
            }
            else
            {
               for(j = 0; j < 2; j++)
               {
                  stLastWaitShot = BasketTigerSecondShot.a_4344();
                  a_1324.push(stLastWaitShot);
               }
               --this.shotCount;
            }
            if(null == stLastWaitShot)
            {
               return false;
            }
            if(this.shotCount <= 0)
            {
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_1323 = 1;
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos - 32,y + this.a_3956() + 14,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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

