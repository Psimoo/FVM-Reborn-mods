package com.aurora.ui.maogoutd.resource.defender.SnakeYear.mageSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MageSnakeSecondAttackFighter extends a_3953
   {
      
      private var m_iShotPieceNum:int = 0;
      
      public function MageSnakeSecondAttackFighter()
      {
         super();
         a_1095 = MageSnakeDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1317 = 3;
         a_1338 = 0;
         a_1337 = 5;
         a_1310 = 9;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MageSnakeSecondAttackFighter) as MageSnakeSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MageSnakeSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = MageSnakeDefine.a_3966(m_iSkillDegree);
         a_1311 = MageSnakeDefine.a_3965(a_1094);
         this.m_iShotPieceNum = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MageSnakeDefine.a_3964();
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
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         var iFlag:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(MageSnakeDefine.GetFieldIntruderNumForAheadDirection(stFieldGrid,1) <= 0)
            {
               return false;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
            }
            for(j = 0; j < 3; j++)
            {
               if(a_1334.m_iYGridNo > 0)
               {
                  stLastWaitShot = MageSnakeSecondShot.a_4344() as MageSnakeSecondShot;
                  a_1324.push(stLastWaitShot);
               }
               stLastWaitShot = MageSnakeSecondShot.a_4344() as MageSnakeSecondShot;
               if(stLastWaitShot)
               {
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = MageSnakeSecondShot.a_4344() as MageSnakeSecondShot;
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1321 = iCurrentTime;
            a_1307 = 11;
            a_1323 = 0;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            iFlag = a_1323 == 2 ? 1 : 0;
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               this.addShot(stStartField,stLastWaitShot,iFlag,1);
            }
            stLastWaitShot = a_1324.pop();
            stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            this.addShot(stStartField,stLastWaitShot,iFlag,0);
            if(a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
               this.addShot(stStartField,stLastWaitShot,iFlag,-1);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function addShot(stStartField:a_3491, stLastWaitShot:a_4348, isFlag:int, Index:int) : void
      {
         var numShotXpos:Number = NaN;
         if(stLastWaitShot != null)
         {
            numShotXpos = 59;
            if(a_1283)
            {
               numShotXpos = BattleFieldView.a_1013 - numShotXpos;
            }
            stLastWaitShot.a_1797(0,a_1312,a_1311,numShotXpos,(stStartField.m_iYGridNo + 0.5) * a_3491.a_1081,stStartField.m_stCurrentBattbleFieldView,stStartField);
            stStartField.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stStartField);
            if(isFlag > 0)
            {
               this.addPositionBuff(stStartField);
            }
         }
      }
      
      private function addPositionBuff(stStartField:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         if(stStartField)
         {
            stTargetFieldGrid = stStartField.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,stStartField.m_iYGridNo);
            if(stTargetFieldGrid != null && (stTargetFieldGrid.m_stMageSnakePoisonBuff == null || stTargetFieldGrid.m_stMageSnakePoisonBuff.m_BuffDurations.length < 6))
            {
               stTargetFieldGrid.AddMageSnakePoisonBuff(80);
            }
            stTargetFieldGrid = stStartField.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 2,stStartField.m_iYGridNo);
            if(stTargetFieldGrid != null && (stTargetFieldGrid.m_stMageSnakePoisonBuff == null || stTargetFieldGrid.m_stMageSnakePoisonBuff.m_BuffDurations.length < 6))
            {
               stTargetFieldGrid.AddMageSnakePoisonBuff(80);
            }
            stTargetFieldGrid = stStartField.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 3,stStartField.m_iYGridNo);
            if(stTargetFieldGrid != null && (stTargetFieldGrid.m_stMageSnakePoisonBuff == null || stTargetFieldGrid.m_stMageSnakePoisonBuff.m_BuffDurations.length < 6))
            {
               stTargetFieldGrid.AddMageSnakePoisonBuff(80);
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.6;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
      }
   }
}

