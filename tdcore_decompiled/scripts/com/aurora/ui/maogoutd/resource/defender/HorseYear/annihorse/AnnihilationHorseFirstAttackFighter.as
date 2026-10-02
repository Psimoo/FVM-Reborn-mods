package com.aurora.ui.maogoutd.resource.defender.HorseYear.annihorse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AnnihilationHorseFirstAttackFighter extends a_3953
   {
      
      public function AnnihilationHorseFirstAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = AnnihilationHorseDefine.DEFENSE_PRICE;
         a_1310 = AnnihilationHorseDefine.SHOT_DELAY_TIMENUM;
         a_1317 = 4;
         a_1309 = AnnihilationHorseDefine.a_3966(m_iSkillDegree);
         a_1311 = AnnihilationHorseDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(AnnihilationHorseFirstAttackFighter) as AnnihilationHorseFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AnnihilationHorseFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = AnnihilationHorseDefine.a_3966(m_iSkillDegree);
         a_1311 = AnnihilationHorseDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return AnnihilationHorseDefine.a_3964(a_1094);
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
         var numShotXpos:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(!AnnihilationHorseDefine.HasIntruderOnRow(a_1334))
            {
               return false;
            }
            a_1324.length = 0;
            stLastWaitShot = AnnihilationHorseBaseShot.a_4344();
            a_1324.push(stLastWaitShot);
            a_1323 = 0;
            a_1321 = iCurrentTime;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -30 : 30;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.m_SplitBulletCount = 3;
               stLastWaitShot.m_SplitBulletMul = 1.5;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 55,a_1334.m_stCurrentBattbleFieldView,a_1334);
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
         return 37;
      }
      
      override protected function a_3956() : Number
      {
         return -20;
      }
   }
}

