package com.aurora.ui.maogoutd.resource.defender.PigYear.CakeAirdrop
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CakeAirdropBaseDefence extends a_3953
   {
      
      private var m_isAppeared:Boolean = false;
      
      private var m_iStartTime:int = 0;
      
      private var shotTimes:int = 3;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var hitFieldGrid:Array = new Array();
      
      public function CakeAirdropBaseDefence()
      {
         super();
         a_1337 = 0;
         a_1312 = 30;
         a_1313 = true;
         a_1310 = 26;
         a_1095 = CakeAirdropDefence.DEFENSE_PRICE;
         a_1096 = false;
         a_1309 = 5 * 20;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CakeAirdropBaseDefence) as CakeAirdropBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return CakeAirdropBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1310 = 30;
         a_1308 = 0;
         this.m_isAppeared = false;
         this.m_iStartTime = 0;
         a_1317 = 4;
         this.shotTimes = 3;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CakeAirdropDefence.a_3964(a_1094);
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
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -80;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var stNewShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var tempX:int = 0;
         var tempY:int = 0;
         if(iCurrentTime % 2 == 0)
         {
            trace("m_iCurrentFrame::" + a_1273);
            if(!this.m_isAppeared)
            {
               this.m_iStartTime = iCurrentTime;
               this.m_isAppeared = true;
            }
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               if(iCurrentTime - this.m_iStartTime == 0)
               {
                  this.a_3431();
                  a_1321 = iCurrentTime;
                  this.addLastShot();
               }
               else if(iCurrentTime - this.m_iStartTime == 20 * 5)
               {
                  this.a_3431();
                  a_1321 = iCurrentTime;
                  this.addLastShot();
               }
               else if(iCurrentTime - this.m_iStartTime == 20 * 10)
               {
                  this.a_3431();
                  a_1321 = iCurrentTime;
                  this.addLastShot();
               }
            }
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(this.hitFieldGrid.length == 1)
               {
                  stStartField = this.hitFieldGrid[0];
               }
               else
               {
                  stStartField = this.hitFieldGrid[a_1323];
               }
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot == null || stStartField == null)
               {
                  return false;
               }
               stLastWaitShot.m_isSpecial = 0;
               tempX = stStartField.m_iXGridNo * a_3491.a_1080 + 0.5 * a_3491.a_1080 - 30;
               tempY = stStartField.m_iInitialYGridNo * a_3491.a_1081 + 0.5 * a_3491.a_1081 - 175;
               stLastWaitShot.a_1797(0,a_1312,a_1311,tempX,tempY,a_1334.m_stCurrentBattbleFieldView,stStartField);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               if(a_1323 == 0)
               {
                  --this.shotTimes;
                  if(this.shotTimes <= 0)
                  {
                     m_iDieType = 5;
                     this.a_3969(a_1339);
                     m_iDieType = 0;
                  }
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         return true;
      }
      
      private function addLastShot() : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         a_1323 = 0;
         for(var k:int = 0; k < a_1324.length; k++)
         {
            a_1324.pop();
         }
         for(var j:int = 0; j < 1; j++)
         {
            stLastWaitShot = CakeAirdropShot.a_4344();
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
         }
         a_1307 = a_1273;
         a_1275 = 0;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
         return true;
      }
      
      public function a_3431() : void
      {
         var stNearestMoveIntruder:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         this.hitFieldGrid = new Array();
         var m_arrBaseMoveIntruderVector:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         var a_1011:int = BattleFieldView.a_1011;
         for each(stMoveIntruder in m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && 1 != stMoveIntruder.iSpaceState)
            {
               if(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo >= 0 && stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo <= 8)
               {
                  this.hitFieldGrid.push(stMoveIntruder.m_stCurrentFieldGrid);
               }
            }
         }
         if(this.hitFieldGrid.length == 0)
         {
            for(i = 0; i < 1; i++)
            {
               do
               {
                  m_iXGridNo = 6;
                  m_iYGridNo = int(this.m_stRandomSeed.nextInt(7));
                  stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
               }
               while(stTargetFieldGrid == null || stTargetFieldGrid != null && stTargetFieldGrid.m_stAttackFighter is a_3924 || stTargetFieldGrid == a_1334);
               this.hitFieldGrid.push(stTargetFieldGrid);
            }
         }
      }
   }
}

