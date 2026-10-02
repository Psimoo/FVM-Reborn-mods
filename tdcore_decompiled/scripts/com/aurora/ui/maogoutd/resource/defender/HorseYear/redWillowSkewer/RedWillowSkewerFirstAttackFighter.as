package com.aurora.ui.maogoutd.resource.defender.HorseYear.redWillowSkewer
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.redWillowSkewer.shot.RedWillowSkewerCommonShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RedWillowSkewerFirstAttackFighter extends a_3953
   {
      
      private var m_stTargetMoveIntruder:a_4206;
      
      public function RedWillowSkewerFirstAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = RedWillowSkewerDefine.DEFENSE_PRICE;
         a_1310 = RedWillowSkewerDefine.SHOT_DELAY_TIMENUM;
         a_1317 = RedWillowSkewerDefine.CONTINUE_SHOT_INTERVAL;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(RedWillowSkewerFirstAttackFighter) as RedWillowSkewerFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return RedWillowSkewerFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         tagCom.AddTag(30038);
         if(m_bServerIssued)
         {
            a_1309 = RedWillowSkewerDefine.a_3966(m_iSkillDegree);
            a_1311 = RedWillowSkewerDefine.a_3965(a_1094) * RedWillowSkewerDefine.FIRST_TRANS_ATTACK_RATE;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return RedWillowSkewerDefine.a_3964(a_1094);
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
         var numShotXpos:Number = NaN;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            this.m_stTargetMoveIntruder = RedWillowSkewerDefine.a_3431(a_1334,x,y);
            if(!this.m_stTargetMoveIntruder)
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            stLastWaitShot = RedWillowSkewerCommonShot.a_4344(1);
            a_1324.push(stLastWaitShot);
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -60 : 60;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.m_isSpecial = 1;
               this.m_stTargetMoveIntruder = RedWillowSkewerDefine.a_3431(a_1334,x,y);
               (stLastWaitShot as RedWillowSkewerCommonShot).stTargetMoveIntruder = this.m_stTargetMoveIntruder;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 50,a_1334.m_stCurrentBattbleFieldView,a_1334);
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

