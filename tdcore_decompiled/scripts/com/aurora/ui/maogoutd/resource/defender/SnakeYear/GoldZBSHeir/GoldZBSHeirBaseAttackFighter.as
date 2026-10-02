package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldZBSHeir.GridBuff.GoldZBSHeirGridBaseBuff;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldZBSHeirBaseAttackFighter extends a_3953
   {
      
      private var m_iNormalShotCount1:int = 0;
      
      private var m_iNormalShotCount2:int = 0;
      
      private var m_iNormalShotCount3:int = 0;
      
      private var offsetList:Array = [0,1,-1];
      
      public function GoldZBSHeirBaseAttackFighter()
      {
         super();
         a_1095 = GoldZBSHeirDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1317 = 2;
         a_1338 = 0;
         a_1337 = 5;
         a_1310 = 12;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldZBSHeirBaseAttackFighter) as GoldZBSHeirBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldZBSHeirBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = GoldZBSHeirDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldZBSHeirDefine.a_3965(a_1094);
         this.m_iNormalShotCount1 = this.m_iNormalShotCount2 = this.m_iNormalShotCount3 = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldZBSHeirDefine.a_3964();
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
         var i:* = 0;
         var gridY:int = 0;
         var stStartField:a_3491 = null;
         var numShotYpos:Number = NaN;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(GoldZBSHeirDefine.GetFieldIntruderNumForAheadDirection(stFieldGrid,1) <= 0)
            {
               return false;
            }
            a_1324 = [];
            for(j = 0; j < 3; j++)
            {
               for(i = 1; i >= -1; i--)
               {
                  gridY = a_1334.m_iYGridNo + i;
                  if(!(gridY < 0 || gridY >= BattleFieldView.a_1012))
                  {
                     stLastWaitShot = GoldZBSHeirBaseShot.a_4344();
                     if(stLastWaitShot)
                     {
                        a_1324.push(stLastWaitShot);
                     }
                  }
               }
            }
            a_1321 = iCurrentTime;
            a_1307 = 1;
            a_1323 = 0;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            for(i = 1; i < 4; i++)
            {
               if(i == 1)
               {
                  gridY = a_1334.m_iYGridNo + 0;
                  numShotYpos = 0;
               }
               else if(i == 2)
               {
                  gridY = a_1334.m_iYGridNo + 1;
                  numShotYpos = 26;
               }
               else if(i == 3)
               {
                  gridY = a_1334.m_iYGridNo - 1;
                  numShotYpos = -26;
               }
               if(!(gridY < 0 || gridY >= BattleFieldView.a_1012))
               {
                  stLastWaitShot = a_1324.pop();
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,gridY);
                  if(Boolean(stLastWaitShot) && Boolean(stStartField))
                  {
                     stLastWaitShot.m_iCrossFireAllGride = Boolean(stStartField.m_iYGridNo != a_1334.m_iYGridNo);
                     ++this["m_iNormalShotCount" + i];
                     if(this["m_iNormalShotCount" + i] % 3 == 0)
                     {
                        this.addGridBuff(gridY);
                     }
                     stLastWaitShot.a_1797(0,a_1312,a_1311,10,(stStartField.m_iYGridNo + 0.5) * a_3491.a_1081,stStartField.m_stCurrentBattbleFieldView,stStartField);
                     stStartField.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stStartField);
                  }
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function addGridBuff(offect:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var m_stGoldZBSHeirGridBaseBuff:GoldZBSHeirGridBaseBuff = null;
         if(!stFieldGrid)
         {
            return;
         }
         for(var i:int = 1; i <= 3; i++)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(BattleFieldView.a_1011 - i,offect);
            if(!stTargetFieldGrid)
            {
               return;
            }
            m_stGoldZBSHeirGridBaseBuff = stTargetFieldGrid.m_stCurrentBattbleFieldView.m_GoldZBSHeirGridBaseBuffDic[stTargetFieldGrid.m_iXGridNo + "-" + stTargetFieldGrid.m_iYGridNo] as GoldZBSHeirGridBaseBuff;
            if(!m_stGoldZBSHeirGridBaseBuff)
            {
               m_stGoldZBSHeirGridBaseBuff = GoldZBSHeirGridBaseBuff.a_3926();
               m_stGoldZBSHeirGridBaseBuff.stTargetGrid = stTargetFieldGrid;
               m_stGoldZBSHeirGridBaseBuff.m_iBoomDie = false;
               m_stGoldZBSHeirGridBaseBuff.a_1797(!stTargetFieldGrid.m_stCurrentBattbleFieldView.m_isOwnBattleField);
               m_stGoldZBSHeirGridBaseBuff.x = stTargetFieldGrid.m_stCurrentBattbleFieldView.m_isOwnBattleField ? (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 : BattleFieldView.a_1013 - (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               m_stGoldZBSHeirGridBaseBuff.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
               stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_stGoldZBSHeirGridBaseBuff,BattleLayerDefine.EFFECTS_BASE_TYPE,stTargetFieldGrid);
            }
            if(m_stGoldZBSHeirGridBaseBuff.m_BuffDurations.length < 8)
            {
               m_stGoldZBSHeirGridBaseBuff.m_BuffDurations.push(4 * 10 + 1);
               m_stGoldZBSHeirGridBaseBuff.m_BuffPowers.push(120);
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

