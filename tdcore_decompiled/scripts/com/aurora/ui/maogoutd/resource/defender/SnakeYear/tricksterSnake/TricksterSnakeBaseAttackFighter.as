package com.aurora.ui.maogoutd.resource.defender.SnakeYear.tricksterSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TricksterSnakeBaseAttackFighter extends a_3953
   {
      
      public function TricksterSnakeBaseAttackFighter()
      {
         super();
         a_1095 = TricksterSnakeDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 11;
         a_1317 = 6;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(TricksterSnakeBaseAttackFighter) as TricksterSnakeBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TricksterSnakeBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = TricksterSnakeDefence.a_3966(m_iSkillDegree);
         a_1311 = TricksterSnakeDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TricksterSnakeDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
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
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 1; j++)
            {
               stLastWaitShot = TricksterSnakeBaseShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 14;
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
            if(stLastWaitShot != null)
            {
               if(a_1283)
               {
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x - 35,y + 15,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
               }
               else
               {
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 35,y + 15,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
               }
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
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

