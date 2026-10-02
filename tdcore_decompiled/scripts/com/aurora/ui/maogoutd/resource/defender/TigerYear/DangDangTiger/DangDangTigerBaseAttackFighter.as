package com.aurora.ui.maogoutd.resource.defender.TigerYear.DangDangTiger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DangDangTigerBaseAttackFighter extends a_3953
   {
      
      public function DangDangTigerBaseAttackFighter()
      {
         super();
         a_1095 = DangDangTigerDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 2;
         a_1333 = true;
         a_1309 = DangDangTigerDefine.a_3966(m_iSkillDegree);
         a_1311 = DangDangTigerDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DangDangTigerBaseAttackFighter) as DangDangTigerBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DangDangTigerBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = DangDangTigerDefine.a_3966(m_iSkillDegree);
         a_1311 = DangDangTigerDefine.a_3965(a_1094);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var dy:int = 0;
         var uy:int = 0;
         var iXGridAdd:int = 0;
         var iTargetXGridNo:int = 0;
         var stTargetField:a_3491 = null;
         var iCurXGridNo:int = 0;
         var bIsOccupy:Boolean = false;
         var iDis:int = 0;
         var iYGridNo:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            stLastWaitShot = DangDangTigerShot.a_4344();
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
                  stTargetField = a_1334.m_stCurrentBattbleFieldView.a_3438(iCurXGridNo,iYGridNo);
                  if(null != stTargetField && stTargetField.m_isOccupy)
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
            DangDangTigerShot(stLastWaitShot).TargetGrid = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][iTargetXGridNo];
            DangDangTigerShot(stLastWaitShot).m_iShotType = 1;
            a_1324.push(stLastWaitShot);
            a_1323 = 0;
            a_1307 = a_1273;
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
            stLastWaitShot.iShotSequenceNum = a_1322;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() - 30,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
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
   }
}

