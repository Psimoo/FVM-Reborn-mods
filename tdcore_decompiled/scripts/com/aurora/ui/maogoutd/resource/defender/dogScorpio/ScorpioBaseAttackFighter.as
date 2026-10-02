package com.aurora.ui.maogoutd.resource.defender.dogScorpio
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ScorpioBaseAttackFighter extends a_3953
   {
      
      public function ScorpioBaseAttackFighter()
      {
         super();
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_1095 = ScorpioDefence.DEFENSE_PRICE;
         a_1310 = 8;
         a_1312 = 12;
         a_1333 = true;
         a_1313 = true;
         a_1309 = ScorpioDefence.a_3966(m_iSkillDegree);
         a_1311 = ScorpioDefence.GetHurtValueByCardStarDegree(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ScorpioBaseAttackFighter) as ScorpioBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ScorpioBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = ScorpioDefence.a_3966(m_iSkillDegree);
         a_1311 = ScorpioDefence.GetHurtValueByCardStarDegree(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ScorpioDefence.a_3964(a_1094);
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
         var stNewShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.GetFieldIntruderNumForRowAhead(a_1334) <= 0)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            stNewShot = ScorpioBaseShot.a_4344() as ScorpioBaseShot;
            if(null == stNewShot)
            {
               return false;
            }
            a_1324.push(stNewShot);
            a_1307 = a_1273;
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
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         return true;
      }
      
      override public function a_3970() : Boolean
      {
         if(a_1340)
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            a_1321 = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         return true;
      }
      
      public function GetFieldIntruderNumForRowAhead(stFieldGrid:a_3491) : int
      {
         var newFieldGrid:a_3491 = null;
         var iTotalIntruderNum:int = 0;
         for(var i:int = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
         {
            newFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
            if(Boolean(newFieldGrid) && newFieldGrid.a_1511.length > 0)
            {
               iTotalIntruderNum++;
            }
         }
         return iTotalIntruderNum;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}

