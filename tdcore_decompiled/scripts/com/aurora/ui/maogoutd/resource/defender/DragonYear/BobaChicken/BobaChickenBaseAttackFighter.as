package com.aurora.ui.maogoutd.resource.defender.DragonYear.BobaChicken
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BobaChickenBaseAttackFighter extends a_3953
   {
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iAppearedTime:int = -10;
      
      private var m_SmallChickenShotInterval:int;
      
      public function BobaChickenBaseAttackFighter()
      {
         super();
         a_1095 = BobaChickenDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 8;
         a_1313 = true;
         a_1337 = -5;
         a_1338 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BobaChickenBaseAttackFighter) as BobaChickenBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BobaChickenBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = BobaChickenDefence.a_3965(a_1094);
         this.m_SmallChickenShotInterval = BobaChickenDefence.a_3966(m_iSkillDegree);
         this.m_iAppearedTime = -10;
         a_1309 = 2.5 * 20;
         if(a_1336)
         {
            a_1336.x += 5;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BobaChickenDefence.a_3964(m_iSkillDegree);
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
         if(this.m_iAppearedTime == -10)
         {
            this.m_iAppearedTime = iCurrentTime;
         }
         this.m_iCurrentTimeIntval = iCurrentTime - this.m_iAppearedTime;
         if(this.m_iCurrentTimeIntval != 0 && this.m_iCurrentTimeIntval % this.m_SmallChickenShotInterval == 0)
         {
            stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
            this.addChickenShot(stStartField);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(BobaChickenDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            for(j = 0; j < 2; j++)
            {
               stLastWaitShot = BobaChickenBaseShot.a_4344();
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 10;
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
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 60,y + 54,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function addChickenShot(stStartField:a_3491) : Boolean
      {
         var stLastWaitShot:SmallChickenShot = null;
         if(!stStartField)
         {
            return false;
         }
         stLastWaitShot = SmallChickenShot.a_4344() as SmallChickenShot;
         if(null == stLastWaitShot)
         {
            return false;
         }
         var tempX2:int = stStartField.m_iXGridNo * a_3491.a_1080;
         var tempY2:int = stStartField.m_iYGridNo * a_3491.a_1081 + 44;
         stLastWaitShot.m_isSpecial = 0;
         stLastWaitShot.a_1797(0,10,a_1311,tempX2,tempY2,a_1334.m_stCurrentBattbleFieldView,stStartField);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
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

