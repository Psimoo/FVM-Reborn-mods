package com.aurora.ui.maogoutd.resource.defender.DragonYear.BubbleDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.StaticFieldGrid;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BubbleDragonFirstTransAttackFighter extends a_3953
   {
      
      private var m_ShotTimes:int;
      
      public function BubbleDragonFirstTransAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = BubbleDragonDefine.DEFENSE_PRICE;
         a_1310 = BubbleDragonDefine.SHOT_DELAY_TIMENUM;
         a_1317 = 3;
         a_1309 = BubbleDragonDefine.a_3966(m_iSkillDegree);
         a_1311 = BubbleDragonDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BubbleDragonFirstTransAttackFighter) as BubbleDragonFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BubbleDragonFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = BubbleDragonDefine.a_3966(m_iSkillDegree);
         a_1311 = BubbleDragonDefine.a_3965(a_1094);
         this.m_ShotTimes = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BubbleDragonDefine.a_3964(a_1094);
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
         var j:int = 0;
         var stLastWaitShot:* = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(BubbleDragonDefine.a_3431(a_1334) == 0)
            {
               return false;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               if(Boolean(stLastWaitShot) && stLastWaitShot is a_4348)
               {
                  stLastWaitShot.a_4350();
               }
               else if(stLastWaitShot is BubbleDragonSpecialBuffer)
               {
                  stLastWaitShot.a_3940();
               }
            }
            ++this.m_ShotTimes;
            for(j = 0; j < 2; j++)
            {
               if(this.m_ShotTimes % 5 == 0 && j == 1)
               {
                  stLastWaitShot = BubbleDragonSpecialBuffer.a_3926();
               }
               else
               {
                  stLastWaitShot = BubbleDragonFirstShot.a_4344();
               }
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1321 = iCurrentTime;
            a_1307 = 11;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            if(Boolean(stLastWaitShot) && stLastWaitShot is a_4348)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 50,y + 70,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            else if(stLastWaitShot is BubbleDragonSpecialBuffer)
            {
               this.addSpecialBuffer(stLastWaitShot);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function addSpecialBuffer(stEffect:BubbleDragonSpecialBuffer) : void
      {
         var stTargetFieldGrid:StaticFieldGrid = null;
         var m_FindGrid:Boolean = false;
         var stFieldGridVector:Array = null;
         var iXIndex:* = 0;
         var iYIndex:int = 0;
         if(stFieldGrid)
         {
            m_FindGrid = false;
            stFieldGridVector = stFieldGrid.m_stCurrentBattbleFieldView.stStaticFieldGridVector;
            for(iXIndex = int(BattleFieldView.a_1011 - 1); iXIndex > BattleFieldView.a_1011 - 3; iXIndex--)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  stTargetFieldGrid = stFieldGridVector[iYIndex][iXIndex];
                  if(stTargetFieldGrid != null && stTargetFieldGrid.m_stSpecialBuffer == null)
                  {
                     stEffect.a_1598 = stTargetFieldGrid;
                     stEffect.m_startPosition.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 + 10;
                     stEffect.m_startPosition.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 10;
                     stEffect.a_1797(false);
                     stEffect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 + 10;
                     stEffect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 10;
                     a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.SHOT_TYPE,a_1334);
                     m_FindGrid = true;
                     break;
                  }
               }
               if(m_FindGrid)
               {
                  break;
               }
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return 37;
      }
      
      override protected function a_3956() : Number
      {
         return -20;
      }
   }
}

