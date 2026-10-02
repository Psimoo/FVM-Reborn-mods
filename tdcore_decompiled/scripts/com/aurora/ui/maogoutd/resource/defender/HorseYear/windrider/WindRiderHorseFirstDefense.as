package com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WindRiderHorseFirstDefense extends a_3953
   {
      
      private var stExistSpecialDefense:Boolean = false;
      
      public function WindRiderHorseFirstDefense()
      {
         super();
         a_1095 = WindRiderHorseDefense.DEFENSE_PRICE;
         a_1310 = 12;
         a_1317 = WindRiderHorseDefense.CONTINUE_SHOT_INTERVAL;
         a_1313 = true;
         a_1333 = true;
      }
      
      public static function a_3926() : WindRiderHorseFirstDefense
      {
         return PoolManager.getInstance().CheckOutOne(WindRiderHorseFirstDefense) as WindRiderHorseFirstDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindRiderHorseFirstDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = WindRiderHorseDefense.a_3966(m_iSkillDegree);
            a_1311 = WindRiderHorseDefense.a_3965(a_1094) * 1.3;
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            if(WindRiderHorseDefense.GetFieldIntruderNumForAheadDirection(stFieldGrid) <= 0)
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            this.stExistSpecialDefense = WindRiderHorseDefense.hasFanDefenseInBattleField(stFieldGrid);
            if(this.stExistSpecialDefense)
            {
               stLastWaitShot = WindRiderHorseThreeRowShot.a_4344();
            }
            else
            {
               stLastWaitShot = WindRiderHorseSingleRowShot.a_4344();
            }
            a_1324.push(stLastWaitShot);
            a_1323 = 0;
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -50 : 50;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.m_isSpecial = 1;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 40,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
   }
}

