package com.aurora.ui.maogoutd.resource.defender.DragonYear.GodYouMiEr
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GodYouMiErFinalAttackFighter extends a_3953
   {
      
      private var shotOffset:Array = [[64.5,10,-1],[64.5,74,0],[54.5,138,1]];
      
      public function GodYouMiErFinalAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = GodYouMiErDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 8;
         a_1313 = true;
         a_1337 = -4;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GodYouMiErFinalAttackFighter) as GodYouMiErFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodYouMiErFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = GodYouMiErDefence.a_3965(a_1094);
         a_1309 = GodYouMiErDefence.a_3966(m_iSkillDegree);
         if(a_1336)
         {
            a_1336.x += 4;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GodYouMiErDefence.a_3964(m_iSkillDegree);
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
         var k:int = 0;
         var targetY:int = 0;
         var j:int = 0;
         var i3:* = 0;
         var i2:int = 0;
         var targetY1:int = 0;
         var stStartField:a_3491 = null;
         var numShotXpos:Number = NaN;
         var numShotYpos:Number = NaN;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(GodYouMiErDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(k = 0; k < 3; k++)
            {
               targetY = a_1334.m_iYGridNo + int(this.shotOffset[k][2]);
               if(!(targetY < 0 || targetY >= BattleFieldView.a_1012))
               {
                  for(j = 0; j < 4; j++)
                  {
                     stLastWaitShot = GodYouMiErFinalShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
               }
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            for(i3 = 3; i3 >= 0; i3--)
            {
               for(i2 = 0; i2 < 3; i2++)
               {
                  targetY1 = a_1334.m_iYGridNo + int(this.shotOffset[i2][2]);
                  stStartField = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,targetY1);
                  if(stStartField)
                  {
                     numShotXpos = this.shotOffset[i2][0] - i3 * 15;
                     if(a_1283)
                     {
                        numShotXpos = -numShotXpos;
                     }
                     numShotYpos = Number(this.shotOffset[i2][1]);
                     stLastWaitShot = a_1324.pop();
                     if(stLastWaitShot)
                     {
                        stLastWaitShot.alpha = 1 - 0.25 * i3;
                        stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,stStartField.m_stCurrentBattbleFieldView,stStartField);
                        stStartField.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stStartField);
                     }
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

