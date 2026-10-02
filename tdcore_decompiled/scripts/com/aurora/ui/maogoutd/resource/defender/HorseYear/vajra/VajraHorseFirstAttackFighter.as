package com.aurora.ui.maogoutd.resource.defender.HorseYear.vajra
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class VajraHorseFirstAttackFighter extends a_3953
   {
      
      private var m_stTargetMoveIntruder:a_4206;
      
      private var totalShotCount:int = 0;
      
      public function VajraHorseFirstAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = VajraHorseDefine.DEFENSE_PRICE;
         a_1310 = 12;
         a_1317 = 3;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(VajraHorseFirstAttackFighter) as VajraHorseFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return VajraHorseFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = VajraHorseDefine.a_3966(m_iSkillDegree);
            a_1311 = VajraHorseDefine.a_3965(a_1094);
            this.totalShotCount = 0;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return VajraHorseDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iValue:int) : Boolean
      {
         super.a_3969(iValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var i:int = 0;
         var numShotXpos:Number = NaN;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            this.m_stTargetMoveIntruder = VajraHorseDefine.GetTheFarthestIntruder(a_1334,x,y);
            if(!this.m_stTargetMoveIntruder)
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            for(i = 0; i < 2; i++)
            {
               stLastWaitShot = VajraHorseBaseShot.a_4344();
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -50 : 50;
            ++this.totalShotCount;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.m_isSpecial = 1;
               this.m_stTargetMoveIntruder = VajraHorseDefine.GetTheFarthestIntruder(a_1334,x,y);
               (stLastWaitShot as VajraHorseBaseShot).stTargetMoveIntruder = this.m_stTargetMoveIntruder;
               stLastWaitShot.a_1797(m_iDefenseGlobalID + this.totalShotCount,a_1312,a_1311,x + numShotXpos,y + 60,a_1334.m_stCurrentBattbleFieldView,a_1334);
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
         return 70;
      }
      
      override protected function a_3956() : Number
      {
         return 25;
      }
   }
}

