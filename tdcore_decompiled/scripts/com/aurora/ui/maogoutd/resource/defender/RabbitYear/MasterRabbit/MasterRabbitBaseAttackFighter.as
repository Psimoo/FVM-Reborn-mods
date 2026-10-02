package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MasterRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MasterRabbitBaseAttackFighter extends a_3953
   {
      
      private var m_arrShotArray:Array = [];
      
      public function MasterRabbitBaseAttackFighter()
      {
         super();
         a_1095 = MasterRabbitDefence.DEFENSE_PRICE;
         a_1338 = 0;
         a_1337 = 6;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 4;
         a_1333 = true;
         a_1309 = MasterRabbitDefence.a_3966(m_iSkillDegree);
         a_1311 = MasterRabbitDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MasterRabbitBaseAttackFighter) as MasterRabbitBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MasterRabbitBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = MasterRabbitDefence.a_3966(m_iSkillDegree);
         a_1311 = MasterRabbitDefence.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MasterRabbitDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var stShot:MasterRabbitBaseShot = null;
         if(a_1339 - iRduceLifeValue <= 0)
         {
            for each(stShot in this.m_arrShotArray)
            {
               stShot.a_4350();
               this.m_arrShotArray.slice(this.m_arrShotArray.indexOf(stShot),1);
            }
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         var k:int = 0;
         trace("m_iCurrentFrame::" + a_1273);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetFieldRowIntruderNumForFiveRow(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 3; j++)
            {
               stLastWaitShot = MasterRabbitBaseShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1321 = iCurrentTime;
            a_1307 = 12;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            for(k = 0; k < 3; k++)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot != null)
               {
                  stLastWaitShot.m_isSpecial = k + 1;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 65,y + 72,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
            this.m_arrShotArray.push(stLastWaitShot);
         }
         return true;
      }
      
      public function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
         }
         return iTotalIntruderNum;
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
         return 0.3 * height;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

