package com.aurora.ui.maogoutd.resource.defender.SnakeYear.missileSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class MissileSnakeFirstAttackFighter extends a_3953
   {
      
      public function MissileSnakeFirstAttackFighter()
      {
         super();
         a_1312 = 15;
         a_1095 = MissileSnakeDefence.DEFENSE_PRICE;
         a_1317 = 5;
         a_1310 = 30;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MissileSnakeFirstAttackFighter) as MissileSnakeFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MissileSnakeFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = MissileSnakeDefence.a_3965(a_1094);
         a_1311 = 1200;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MissileSnakeDefence.a_3964(m_iSkillDegree);
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
         var stLastWaitShot:MissileSnakeFirstShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            for(j = 0; j < 1; j++)
            {
               stLastWaitShot = MissileSnakeFirstShot.a_4344() as MissileSnakeFirstShot;
               stLastWaitShot.a_1598 = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][BattleFieldView.a_1011 - 2];
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 10;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot != null)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,numShotXpos,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
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

