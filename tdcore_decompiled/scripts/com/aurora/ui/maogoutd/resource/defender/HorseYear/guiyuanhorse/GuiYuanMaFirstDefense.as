package com.aurora.ui.maogoutd.resource.defender.HorseYear.guiyuanhorse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GuiYuanMaFirstDefense extends a_3953
   {
      
      public function GuiYuanMaFirstDefense()
      {
         super();
         a_1095 = GuiYuanMaDefense.DEFENSE_PRICE;
         a_1310 = GuiYuanMaDefense.SHOT_DELAY_TIMENUM;
         a_1317 = GuiYuanMaDefense.CONTINUE_SHOT_INTERVAL;
         a_1313 = true;
         a_1333 = true;
         a_1337 = 10;
      }
      
      public static function a_3926() : GuiYuanMaFirstDefense
      {
         return PoolManager.getInstance().CheckOutOne(GuiYuanMaFirstDefense) as GuiYuanMaFirstDefense;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = GuiYuanMaDefense.a_3966(m_iSkillDegree);
            a_1311 = GuiYuanMaDefense.a_3965(a_1094);
            if(a_1336)
            {
               a_1336.x -= 7;
            }
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return GuiYuanMaFirstDefenseMovie;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var stShot:a_4348 = null;
         var nearest:a_4206 = null;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            if(!GuiYuanMaDefense.HasTargetInView(a_1334,GuiYuanMaDefense.ROW_RANGE_BASE))
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            stLastWaitShot = GuiYuanMaFirstShot.a_4344();
            a_1324.push(stLastWaitShot);
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -45 : 45;
            stShot = a_1324.pop();
            if(stShot)
            {
               nearest = GuiYuanMaDefense.GetNearestIntruderInFrontRows(a_1334,GuiYuanMaDefense.ROW_RANGE_BASE);
               (stShot as GuiYuanMaFirstShot).m_targetIntruder = nearest;
               stShot.m_isSpecial = GuiYuanMaDefense.DAZE_HP_RATIO_FIRST;
               stShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 51,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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
      
      override public function a_3940() : Boolean
      {
         return super.a_3940();
      }
   }
}

