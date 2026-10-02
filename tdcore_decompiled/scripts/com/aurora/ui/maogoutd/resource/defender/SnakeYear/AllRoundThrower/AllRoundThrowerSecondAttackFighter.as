package com.aurora.ui.maogoutd.resource.defender.SnakeYear.AllRoundThrower
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class AllRoundThrowerSecondAttackFighter extends a_3953
   {
      
      private const SHOT_COUNT:int = 2;
      
      private var iTargetCount:int;
      
      private var iShotIndex:int;
      
      private var hasHitMouseArray:Array = new Array();
      
      private var m_StartPosition:Point;
      
      public function AllRoundThrowerSecondAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = AllRoundThrowerDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(AllRoundThrowerSecondAttackFighter) as AllRoundThrowerSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AllRoundThrowerSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = AllRoundThrowerDefence.a_3965(a_1094) * 1.2;
            a_1309 = AllRoundThrowerDefence.a_3966(m_iSkillDegree);
            this.m_StartPosition = new Point((stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081);
            this.iShotIndex = 0;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return AllRoundThrowerDefence.a_3964(m_iSkillDegree);
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
         var numShotYpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         var index:int = 0;
         var k:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(AllRoundThrowerDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324 = [];
            a_1321 = iCurrentTime;
            this.a_3431(a_1334);
            this.iTargetCount = this.hasHitMouseArray.length > this.SHOT_COUNT ? this.SHOT_COUNT : int(this.hasHitMouseArray.length);
            this.iShotIndex = this.GetShotDirection(this.hasHitMouseArray[0]);
            for(j = 0; j < this.SHOT_COUNT; j++)
            {
               stLastWaitShot = AllRoundThrowerSecondShot.a_4344();
               if(this.hasHitMouseArray.length >= this.SHOT_COUNT)
               {
                  AllRoundThrowerSecondShot(stLastWaitShot).stTargetMoveIntruder = this.hasHitMouseArray[j];
               }
               else
               {
                  index = j % this.hasHitMouseArray.length;
                  AllRoundThrowerSecondShot(stLastWaitShot).stTargetMoveIntruder = this.hasHitMouseArray[index];
               }
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[this.iShotIndex] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(this.iShotIndex == 1)
            {
               numShotXpos = 21;
               numShotYpos = 25;
            }
            else if(this.iShotIndex == 2)
            {
               numShotXpos = 82;
               numShotYpos = 32;
            }
            else if(this.iShotIndex == 3)
            {
               numShotXpos = 51;
               numShotYpos = 46;
            }
            else if(this.iShotIndex == 4)
            {
               numShotXpos = 51;
               numShotYpos = 14;
            }
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            for(k = 0; k < this.iTargetCount; k++)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + numShotYpos,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
                  a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      public function a_3431(stFieldGrid:a_3491) : void
      {
         var stNearestMoveIntruder:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         this.hasHitMouseArray = [];
         if(stFieldGrid == null)
         {
            return;
         }
         var m_arrBaseMoveIntruderVector:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         var a_1011:int = BattleFieldView.a_1011;
         for each(stMoveIntruder in m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.m_stCurrentFieldGrid != null && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2) && !stMoveIntruder.isCannotSeeByFighter && Math.abs(stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo - stFieldGrid.m_iYGridNo) <= 1)
            {
               this.hasHitMouseArray.push(stMoveIntruder);
            }
         }
         this.hasHitMouseArray.sort(this.OnSortToken);
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + b.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.m_StartPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.m_StartPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
      
      private function GetShotDirection(a:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var dx:Number = aMouseX - this.m_StartPosition.x;
         var dy:Number = aMouseY - this.m_StartPosition.y;
         if(Boolean(a.m_stCurrentFieldGrid) && a.m_stCurrentFieldGrid.m_iXGridNo == stFieldGrid.m_iXGridNo)
         {
            if(dy > 0)
            {
               return 4;
            }
            return 3;
         }
         if(dx >= 0)
         {
            return 1;
         }
         return 2;
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

