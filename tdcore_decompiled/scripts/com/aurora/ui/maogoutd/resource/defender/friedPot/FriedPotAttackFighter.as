package com.aurora.ui.maogoutd.resource.defender.friedPot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.friedPot.FriedPotShot;
   import flash.display.FrameLabel;
   
   public class FriedPotAttackFighter extends a_3953
   {
      
      public function FriedPotAttackFighter()
      {
         super();
         a_1304 = b_183.enm_FriedPotShot;
         a_1337 = -4;
         a_1312 = 15;
         a_1313 = true;
         a_1309 = this.a_3966();
         a_1311 = this.a_3965();
         a_1310 = 10;
         a_1317 = 8;
         a_1095 = 150;
         a_1323 = 1;
         a_1314 = false;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FriedPotAttackFighter) as FriedPotAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FriedPotAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = this.a_3966();
         a_1311 = this.a_3965();
         a_1310 = 10;
         a_1317 = 8;
         a_1323 = 1;
         a_1314 = false;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var numShotXpos:Number = NaN;
         var stLastWaitShot:FriedPotShot = null;
         var dy:int = 0;
         var uy:int = 0;
         var iXGridAdd:int = 0;
         var iTargetXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iCurXGridNo:int = 0;
         var bIsOccupy:Boolean = false;
         var iDis:int = 0;
         var iYGridNo:int = 0;
         if(null != a_1334 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) > 0 && iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            stLastWaitShot = FriedPotShot.a_4344();
            if(null == stLastWaitShot)
            {
               return false;
            }
            dy = Math.max(0,a_1334.m_iYGridNo - 1);
            uy = Math.min(BattleFieldView.a_1012 - 1,a_1334.m_iYGridNo + 1);
            if(a_1283)
            {
               iXGridAdd = -1;
            }
            else
            {
               iXGridAdd = 1;
            }
            iTargetXGridNo = a_1334.m_iXGridNo;
            bIsOccupy = false;
            for(iDis = 1; iDis <= 4; iDis += iXGridAdd)
            {
               iCurXGridNo = a_1334.m_iXGridNo + iDis;
               if(iCurXGridNo < 0 || iCurXGridNo >= BattleFieldView.a_1011)
               {
                  break;
               }
               for(iYGridNo = dy; iYGridNo <= uy; iYGridNo++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iCurXGridNo,iYGridNo);
                  if(null != stFieldGrid && stFieldGrid.m_isOccupy)
                  {
                     bIsOccupy = true;
                     break;
                  }
               }
               iTargetXGridNo = iCurXGridNo;
               if(bIsOccupy)
               {
                  break;
               }
            }
            stLastWaitShot.TargetGrid = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][iTargetXGridNo];
            a_1324.push(stLastWaitShot);
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1322;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
         }
         if(a_1314 && iCurrentTime - a_1321 == a_1310 + a_1317 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = 1;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.5 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override protected function a_3965() : int
      {
         return FriedPotDefine.a_3965(a_1094);
      }
      
      override protected function a_3966() : int
      {
         return FriedPotDefine.a_3966(m_iSkillDegree);
      }
   }
}

