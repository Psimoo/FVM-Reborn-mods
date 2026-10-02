package com.aurora.ui.maogoutd.resource.defender.SnakeYear.mageSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MageSnakeBaseAttackFighter extends a_3953
   {
      
      private var m_iShotPieceNum:int = 0;
      
      public function MageSnakeBaseAttackFighter()
      {
         super();
         a_1095 = MageSnakeDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1317 = 3;
         a_1338 = 0;
         a_1337 = 5;
         a_1310 = 12;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MageSnakeBaseAttackFighter) as MageSnakeBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MageSnakeBaseAttackFighterMovie;
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
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var j:int = 0;
         var iFlag:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(MageSnakeDefine.GetFieldIntruderNumForAheadDirection(stFieldGrid) <= 0)
            {
               return false;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
            }
            for(j = 0; j < 2; j++)
            {
               stLastWaitShot = MageSnakeBaseShot.a_4344() as MageSnakeBaseShot;
               if(stLastWaitShot)
               {
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
            iFlag = 0;
            this.m_iShotPieceNum += 1;
            iFlag = this.m_iShotPieceNum % 3 == 0 ? 1 : 0;
            numShotXpos = 1;
            if(a_1283)
            {
               numShotXpos = BattleFieldView.a_1013 - 1;
            }
            if(iFlag > 0)
            {
               this.addPositionBuff();
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.m_isSpecial = 0;
            stLastWaitShot.a_1797(0,a_1312,a_1311,numShotXpos,(a_1334.m_iYGridNo + 0.5) * a_3491.a_1081,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function addPositionBuff() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         if(stFieldGrid)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - 1,stFieldGrid.m_iYGridNo);
            if(stTargetFieldGrid != null)
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

