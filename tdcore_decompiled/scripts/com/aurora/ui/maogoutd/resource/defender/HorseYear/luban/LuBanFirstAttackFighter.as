package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class LuBanFirstAttackFighter extends a_3953
   {
      
      public function LuBanFirstAttackFighter()
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
         return PoolManager.getInstance().CheckOutOne(LuBanFirstAttackFighter) as LuBanFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return LuBanFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = LuBanDefence.a_3966(m_iSkillDegree);
         a_1311 = LuBanDefence.a_3965(a_1094);
         a_1311 *= 1.35;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return LuBanDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
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
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 2)
         {
            this.AddShot([1,2,3]);
            this.AddShot([0,2,3]);
            ++a_1323;
         }
         return true;
      }
      
      private function AddShot(movePath:Array) : void
      {
         var arr:Array = null;
         var i:int = 0;
         var numShotXpos:Number = this.a_3955();
         if(a_1283)
         {
            numShotXpos = -numShotXpos;
         }
         var shot:LuBanFirstShot = LuBanFirstShot.a_4344();
         if(shot != null)
         {
            if(a_1283)
            {
               shot.a_1797(0,a_1312,a_1311,x - 80,y + 45,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
            }
            else
            {
               shot.a_1797(0,a_1312,a_1311,x + 80,y + 45,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
            }
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
            arr = [];
            for(i = 0; i < 30; i++)
            {
               shot.m_iRandomArrOne.push(m_iDefenseRandomSeed.nextInt(101));
            }
            shot.InitData(movePath,2);
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
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

