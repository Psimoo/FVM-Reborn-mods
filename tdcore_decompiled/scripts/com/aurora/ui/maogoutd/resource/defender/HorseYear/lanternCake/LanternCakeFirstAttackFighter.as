package com.aurora.ui.maogoutd.resource.defender.HorseYear.lanternCake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.lanternCake.shot.LanternCakeCommonShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class LanternCakeFirstAttackFighter extends a_3953
   {
      
      public function LanternCakeFirstAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = LanternCakeDefine.DEFENSE_PRICE;
         a_1310 = 8;
         a_1317 = 3;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(LanternCakeFirstAttackFighter) as LanternCakeFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return LanternCakeFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         tagCom.AddTag(30038);
         if(m_bServerIssued)
         {
            a_1309 = LanternCakeDefine.a_3966(m_iSkillDegree);
            a_1311 = LanternCakeDefine.a_3965(a_1094);
            LanternCakeManager.getInstance().Add(this);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return LanternCakeDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iValue:int) : Boolean
      {
         super.a_3969(iValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 10;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 1)
         {
            this.AddShot(1);
            this.AddShot(2);
            ++a_1323;
         }
         LanternCakeManager.getInstance().a_3897(iCurrentTime);
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         this.AddShot(3);
      }
      
      private function AddShot(movePath:int) : void
      {
         var targetY:int = 0;
         var targetX:int = 0;
         var grid:a_3491 = null;
         if(!stFieldGrid)
         {
            return;
         }
         var shot:LanternCakeCommonShot = LanternCakeCommonShot.a_4344(1);
         if(shot == null)
         {
            return;
         }
         if(movePath == 1)
         {
            grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(0,stFieldGrid.m_iYGridNo);
            if(grid)
            {
               targetY = stFieldGrid.m_iYGridNo * a_3491.a_1081;
               targetX = 0;
               if(a_1283)
               {
                  targetX = BattleFieldView.a_1013 - targetX;
               }
            }
         }
         else if(movePath == 2)
         {
            grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,stFieldGrid.m_iYGridNo);
            if(grid)
            {
               targetX = BattleFieldView.a_1013;
               if(a_1283)
               {
                  targetX = BattleFieldView.a_1013 - targetX;
               }
               targetY = (stFieldGrid.m_iYGridNo + 1) * a_3491.a_1081;
            }
         }
         else if(movePath == 3)
         {
            grid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,0);
            if(grid)
            {
               targetY = 0;
               targetX = (BattleFieldView.a_1011 - 1) * a_3491.a_1080;
               if(a_1283)
               {
                  targetX = BattleFieldView.a_1013 - targetX;
               }
            }
         }
         if(Boolean(shot) && Boolean(grid))
         {
            if(movePath == 3)
            {
               shot.m_isSpecial = 3;
            }
            else
            {
               shot.m_isSpecial = movePath == 1 ? 0 : 1;
            }
            shot.a_1797(0,a_1312,a_1311,targetX,targetY,stFieldGrid.m_stCurrentBattbleFieldView,grid);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,grid);
            if(movePath == 3)
            {
               shot.InitData([3]);
            }
            else
            {
               shot.InitData(movePath == 1 ? [0] : [1]);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            LanternCakeManager.getInstance().Remove(this);
         }
         super.a_3940();
         return true;
      }
   }
}

