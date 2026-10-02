package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class IceCreamPitcherSecondTransAttackFighter extends a_3953
   {
      
      private var shotCount:int = 0;
      
      public function IceCreamPitcherSecondTransAttackFighter()
      {
         super();
         a_1095 = IceCreamPitcherDefence.DEFENSE_PRICE;
         a_1312 = 15;
         a_1310 = 5;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherSecondTransAttackFighter) as IceCreamPitcherSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceCreamPitcherSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = IceCreamPitcherDefence.a_3965(a_1094) * 1.25;
         a_1309 = IceCreamPitcherDefence.a_3966(m_iSkillDegree);
         a_1339 = IceCreamPitcherDefence.LIFEVALUE;
         a_1317 = 4;
         this.shotCount = 2;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var numShotXpos:Number = NaN;
         var stLastWaitShot:* = undefined;
         var i:int = 0;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1307 = a_1273;
            if(this.shotCount <= 0)
            {
               for(i = 0; i < 2; i++)
               {
                  stLastWaitShot = IceCreamPitcherSnowShot.GetFreeShot2();
                  a_1324.push(stLastWaitShot);
               }
               this.shotCount = 2;
            }
            else
            {
               for(j = 0; j < 2; j++)
               {
                  stLastWaitShot = IceCreamPitcherBaseShot.GetFreeShot2();
                  a_1324.push(stLastWaitShot);
               }
               --this.shotCount;
            }
            if(null == stLastWaitShot)
            {
               return false;
            }
            if(this.shotCount == 2)
            {
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_1275 = 0;
            a_1321 = iCurrentTime;
            a_1323 = 1;
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = 3;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos + 70,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
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
      
      override protected function a_3964() : int
      {
         return IceCreamPitcherDefence.a_3964(a_1094);
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
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
   }
}

