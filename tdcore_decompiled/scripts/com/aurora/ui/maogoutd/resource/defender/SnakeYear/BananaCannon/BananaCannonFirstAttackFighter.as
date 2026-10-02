package com.aurora.ui.maogoutd.resource.defender.SnakeYear.BananaCannon
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
   
   public class BananaCannonFirstAttackFighter extends a_3953
   {
      
      private var iTargetCount:int;
      
      private var hasHitMouseArray:Array = new Array();
      
      private var m_StartPosition:Point;
      
      public function BananaCannonFirstAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = BananaCannonDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1337 = 2;
         a_1310 = 16;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BananaCannonFirstAttackFighter) as BananaCannonFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BananaCannonFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = 1.5 * BananaCannonDefence.a_3965(a_1094);
            a_1309 = BananaCannonDefence.a_3966(m_iSkillDegree);
            this.m_StartPosition = new Point((stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081);
            if(a_1336)
            {
               a_1336.x -= 2;
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return BananaCannonDefence.a_3964(m_iSkillDegree);
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
         var stStartField:a_3491 = null;
         var bulletCount:int = 0;
         var j:int = 0;
         var index:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(BananaCannonDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324 = [];
            a_1321 = iCurrentTime;
            this.a_3431(a_1334);
            bulletCount = 2;
            for(j = 0; j < bulletCount; j++)
            {
               stLastWaitShot = BananaCannonFirstShot.a_4344();
               if(this.hasHitMouseArray.length > 0)
               {
                  index = j % this.hasHitMouseArray.length;
                  BananaCannonFirstShot(stLastWaitShot).stTargetMoveIntruder = this.hasHitMouseArray[index];
               }
               else
               {
                  BananaCannonFirstShot(stLastWaitShot).stTargetMoveIntruder = null;
               }
               a_1324.push(stLastWaitShot);
            }
            this.iTargetCount = bulletCount;
            a_1323 = 0;
            a_1307 = 12;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 1,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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
            if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.x >= x && stMoveIntruder.m_stCurrentFieldGrid != null && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2) && !stMoveIntruder.isCannotSeeByFighter && Math.abs(stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo - stFieldGrid.m_iYGridNo) <= 1)
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
            return 1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return -1;
         }
         return 0;
      }
      
      override protected function a_3955() : Number
      {
         return 63;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

