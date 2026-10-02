package com.aurora.ui.maogoutd.resource.defender.CattleYear.StrongCattle
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class StrongCattleSecondTransAttackFighter extends a_3953
   {
      
      public function StrongCattleSecondTransAttackFighter()
      {
         super();
         a_1338 = 10;
         a_1337 = -15;
         a_1095 = StrongCattleDefine.DEFENSE_PRICE;
         a_1333 = true;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(StrongCattleSecondTransAttackFighter) as StrongCattleSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return StrongCattleSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1310 = 12;
         a_1317 = 4;
         a_1309 = 40;
         a_1311 = StrongCattleDefine.a_3965(a_1094);
         a_1309 = StrongCattleDefine.a_3966(m_iSkillDegree);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return StrongCattleDefine.a_3964(a_1094);
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
         var numShotXpos:Number = NaN;
         var k:int = 0;
         var stLastWaitShot:a_4348 = null;
         var i:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            for(k = 0; k < a_1324.length; k++)
            {
               a_1324.pop();
            }
            a_1321 = iCurrentTime;
            for(i = 0; i < 2; i++)
            {
               stLastWaitShot = StrongCattleAttackFighterShot.GetFreeShot2();
               a_1324.push(stLastWaitShot);
            }
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1323 = 0;
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
            stLastWaitShot.iShotSequenceNum = 2;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 75,y - 40,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      public function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491) : int
      {
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo).a_1511.length;
            }
         }
         return iTotalIntruderNum;
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

