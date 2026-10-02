package com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.yinyangSnake.shot.BlackSnakeBaseShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class yinyangSnakeBaseAttackFighter extends a_3953
   {
      
      private var totalShotCount:int = 0;
      
      public function yinyangSnakeBaseAttackFighter()
      {
         super();
         a_1095 = yinyangSnakeDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1317 = 2;
         a_1338 = 0;
         a_1337 = 0;
         a_1310 = 10;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(yinyangSnakeBaseAttackFighter) as yinyangSnakeBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return yinyangSnakeBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = yinyangSnakeDefine.a_3966(m_iSkillDegree);
         a_1311 = yinyangSnakeDefine.a_3965(a_1094);
         this.totalShotCount = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return yinyangSnakeDefine.a_3964();
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
         var id:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(yinyangSnakeDefine.GetFieldIntruderNumForAheadDirection(stFieldGrid) <= 0)
            {
               return false;
            }
            ++this.totalShotCount;
            a_1324.length = 0;
            for(i = 0; i < 5; i++)
            {
               stLastWaitShot = BlackSnakeBaseShot.a_4344();
               if(stLastWaitShot)
               {
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -53 : 53;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.m_iShowBloodHot = a_1323 == 0 ? 1 : 0;
               id = m_iDefenseGlobalID << 14 | this.totalShotCount << 4 | a_1323;
               stLastWaitShot.a_1797(id,a_1312,a_1311,x + numShotXpos,y + 41,a_1334.m_stCurrentBattbleFieldView,a_1334);
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
         return width * 0.6;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
      }
   }
}

