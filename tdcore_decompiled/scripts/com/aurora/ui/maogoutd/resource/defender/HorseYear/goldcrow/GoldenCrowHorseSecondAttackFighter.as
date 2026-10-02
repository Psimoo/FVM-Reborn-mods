package com.aurora.ui.maogoutd.resource.defender.HorseYear.goldcrow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class GoldenCrowHorseSecondAttackFighter extends a_3953
   {
      
      private static const SHOT_OFFSET:Array = [[[54,48],[48,47],[75,32],[79,40]],[[22,32],[79,31],[49,30],[55,28]],[[50,25],[48,20],[14,29],[17,37]]];
      
      private var m_StartPosition:Point;
      
      private var m_targets:Array = [];
      
      private var m_rowTargets:Array = [null,null,null];
      
      private var iShotIndex:int;
      
      public function GoldenCrowHorseSecondAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = GoldenCrowHorseDefence.DEFENSE_PRICE;
         a_1317 = 4;
         a_1337 = 0;
         a_1310 = 10;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldenCrowHorseSecondAttackFighter) as GoldenCrowHorseSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldenCrowHorseSecondAttackFighterMovie;
      }
      
      override public function a_1797(grid:a_3491) : Boolean
      {
         super.a_1797(grid);
         if(m_bServerIssued)
         {
            a_1311 = GoldenCrowHorseDefence.a_3965(a_1094) * 1.25;
            a_1309 = GoldenCrowHorseDefence.a_3966(m_iSkillDegree);
            if(!this.m_StartPosition)
            {
               this.m_StartPosition = new Point();
            }
            this.m_StartPosition.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_StartPosition.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldenCrowHorseDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(v:int) : Boolean
      {
         super.a_3969(v);
         return true;
      }
      
      override public function a_3957(t:int) : void
      {
         if(t % 2 == 0)
         {
            super.a_3957(t);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(GoldenCrowHorseDefence.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324.length = 0;
            this.CollectAndSortTargets();
            if(this.m_targets.length == 0)
            {
               return false;
            }
            this.CacheRowTargets();
            this.CreateShotsForRows(true);
            this.CreateShotsForRows(false);
            a_1321 = iCurrentTime;
            this.iShotIndex = this.GetShotDirection(this.m_targets[0]);
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[this.iShotIndex] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            this.FireShots(a_1323);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function CollectAndSortTargets() : void
      {
         var arr:Array;
         var myY:int;
         var intr:a_4206 = null;
         this.m_targets.length = 0;
         arr = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         myY = a_1334.m_iYGridNo;
         for each(intr in arr)
         {
            if(intr.iLifeValue > 0)
            {
               if(intr.m_stCurrentFieldGrid)
               {
                  if(!intr.isCannotSeeByFighter)
                  {
                     if(!(intr.iSpaceState != 0 && intr.iSpaceState != 2))
                     {
                        if(Math.abs(intr.m_stCurrentFieldGrid.m_iYGridNo - myY) <= 1)
                        {
                           this.m_targets.push(intr);
                        }
                     }
                  }
               }
            }
         }
         this.m_targets.sort(function(a:a_4206, b:a_4206):int
         {
            return Point.distance(m_StartPosition,GetCenter(a)) - Point.distance(m_StartPosition,GetCenter(b));
         });
      }
      
      private function CacheRowTargets() : void
      {
         var intr:a_4206 = null;
         var fallback:a_4206 = null;
         var row:int = 0;
         this.m_rowTargets[0] = null;
         this.m_rowTargets[1] = null;
         this.m_rowTargets[2] = null;
         var myY:int = a_1334.m_iYGridNo;
         for each(intr in this.m_targets)
         {
            row = intr.m_stCurrentFieldGrid.m_iYGridNo - myY + 1;
            if(!(row < 0 || row > 2))
            {
               if(this.m_rowTargets[row] == null)
               {
                  this.m_rowTargets[row] = intr;
               }
            }
         }
         fallback = this.m_targets[0];
         if(!this.m_rowTargets[0])
         {
            this.m_rowTargets[0] = fallback;
         }
         if(!this.m_rowTargets[1])
         {
            this.m_rowTargets[1] = fallback;
         }
         if(!this.m_rowTargets[2])
         {
            this.m_rowTargets[2] = fallback;
         }
      }
      
      private function CreateShotsForRows(isSecondRound:Boolean) : void
      {
         var shot:a_4348 = null;
         shot = GoldenCrowHorseSecondShot.a_4344();
         GoldenCrowHorseSecondShot(shot).stTargetMoveIntruder = this.m_rowTargets[0];
         shot.m_isSpecial = -1;
         a_1324.push(shot);
         if(!isSecondRound)
         {
            shot = GoldenCrowHorseSecondShot.a_4344();
            GoldenCrowHorseSecondShot(shot).stTargetMoveIntruder = this.m_rowTargets[1];
            shot.m_isSpecial = 0;
            a_1324.push(shot);
         }
         shot = GoldenCrowHorseSecondShot.a_4344();
         GoldenCrowHorseSecondShot(shot).stTargetMoveIntruder = this.m_rowTargets[2];
         shot.m_isSpecial = 1;
         a_1324.push(shot);
      }
      
      private function FireShots(Shotindex:int) : void
      {
         var dir:int = this.GetDirIndex();
         var idx:int = 0;
         this.FireOneShot(SHOT_OFFSET[idx][dir][0],SHOT_OFFSET[idx][dir][1]);
         idx++;
         if(Shotindex == 0)
         {
            this.FireOneShot(SHOT_OFFSET[idx][dir][0],SHOT_OFFSET[idx][dir][1]);
         }
         idx++;
         this.FireOneShot(SHOT_OFFSET[idx][dir][0],SHOT_OFFSET[idx][dir][1]);
      }
      
      private function FireOneShot(sx:Number, sy:Number) : void
      {
         var shot:a_4348 = a_1324.pop();
         if(!shot)
         {
            return;
         }
         var numShotXpos:Number = a_1283 ? -sx : sx;
         shot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + sy,a_1334.m_stCurrentBattbleFieldView,a_1334);
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,a_1334);
      }
      
      private function GetCenter(m:a_4206) : Point
      {
         return new Point(m.x + m.stDisplayBitmap.x + m.width * 0.5,m.y + m.stDisplayBitmap.y + m.height * 0.5);
      }
      
      private function GetShotDirection(a:a_4206) : int
      {
         var dx:Number = a.x - this.m_StartPosition.x;
         var dy:Number = a.y - this.m_StartPosition.y;
         if(Boolean(a.m_stCurrentFieldGrid) && a.m_stCurrentFieldGrid.m_iXGridNo == a_1334.m_iXGridNo)
         {
            return dy > 0 ? 4 : 3;
         }
         return dx >= 0 ? 1 : 2;
      }
      
      private function GetDirIndex() : int
      {
         return this.iShotIndex - 1;
      }
   }
}

