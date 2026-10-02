package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class LuBanFinalAttackFighter extends a_3953
   {
      
      public function LuBanFinalAttackFighter()
      {
         super();
         a_1095 = LuBanDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 4;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(LuBanFinalAttackFighter) as LuBanFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return LuBanFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = LuBanDefence.a_3966(m_iSkillDegree);
            a_1311 = LuBanDefence.a_3965(a_1094) * 1.7;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return LuBanDefence.a_3964(a_1094);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 12;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 3)
         {
            this.AddShot([1,2,3]);
            this.AddShot([0,2,3]);
            if(a_1323 < 2)
            {
               this.AddVerticalShot([5],0,0);
               this.AddVerticalShot([6],1,BattleFieldView.a_1012 - 1);
            }
            ++a_1323;
         }
         return true;
      }
      
      private function AddShot(movePath:Array) : void
      {
         var arr:Array = null;
         var i:int = 0;
         var numShotXpos:Number = a_3955();
         if(a_1283)
         {
            numShotXpos = -numShotXpos;
         }
         var shot:LuBanFinalShot = LuBanFinalShot.a_4344();
         if(shot != null)
         {
            if(a_1283)
            {
               shot.a_1797(0,a_1312,a_1311,x - 95,y + 67,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
            }
            else
            {
               shot.a_1797(0,a_1312,a_1311,x + 95,y + 67,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
            }
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
            arr = [];
            for(i = 0; i < 30; i++)
            {
               shot.m_iRandomArrOne.push(m_iDefenseRandomSeed.nextInt(101));
            }
            shot.InitData(movePath,4);
         }
      }
      
      private function AddVerticalShot(movePath:Array, iGridX:int, iGridY:int) : void
      {
         var i:int = 0;
         var view:BattleFieldView = a_1334.m_stCurrentBattbleFieldView;
         var grid:a_3491 = view.a_3438(iGridX,iGridY);
         if(!grid)
         {
            return;
         }
         var posX:Number = a_3491.a_1080 * (iGridX + 0.5);
         if(a_1283)
         {
            posX = BattleFieldView.a_1013 - posX;
         }
         var posY:Number = iGridY == 0 ? 0 : BattleFieldView.a_1014 - 1;
         var shot:LuBanFinalShot = LuBanFinalShot.a_4344();
         if(shot != null)
         {
            shot.a_1797(0,a_1312,a_1311,posX,posY,view,grid);
            view.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,grid);
            for(i = 0; i < 30; i++)
            {
               shot.m_iRandomArrOne.push(m_iDefenseRandomSeed.nextInt(101));
            }
            shot.InitData(movePath,4);
         }
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
   }
}

