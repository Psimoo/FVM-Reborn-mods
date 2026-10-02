package com.aurora.ui.maogoutd.resource.defender.dogKungfu
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class KungfuBaseAttackFighter extends a_3953
   {
      
      public var m_iShotBoundStopTime:int = 0;
      
      public function KungfuBaseAttackFighter()
      {
         super();
         a_1338 = 6;
         a_1310 = KungfuDefine.SHOT_DELAY_TIMENUM;
         a_1095 = KungfuDefine.DEFENSE_PRICE;
         a_1309 = KungfuDefine.a_3966(m_iSkillDegree);
         a_1311 = KungfuDefine.GetHurtValueByCardStarDegree(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(KungfuBaseAttackFighter) as KungfuBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return KungfuBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = KungfuDefine.a_3966(m_iSkillDegree);
         a_1311 = KungfuDefine.GetHurtValueByCardStarDegree(a_1094);
         this.m_iShotBoundStopTime = 30;
         return true;
      }
      
      private function IsCanAttack(iCurrentTime:int, bIsAttack:Boolean) : Boolean
      {
         var iAttackLen:int = 0;
         var iYGridNo:int = 0;
         var lx:int = 0;
         var rx:int = 0;
         var iAdd:int = 0;
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(bIsAttack || iCurrentTime >= m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309 && null != a_1334)
         {
            iAttackLen = 3;
            iYGridNo = a_1334.m_iYGridNo;
            lx = a_1334.m_iXGridNo;
            rx = 0;
            if(a_1283)
            {
               iAdd = -1;
               rx = Math.max(-1,lx - iAttackLen);
            }
            else
            {
               iAdd = 1;
               rx = Math.min(BattleFieldView.a_1011,lx + iAttackLen);
            }
            for(iXGridNo = lx; iXGridNo != rx; iXGridNo += iAdd)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               if(null != stFieldGrid && stFieldGrid.m_isOccupy)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMouveIntruder)
                  {
                     if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                     {
                        if(!bIsAttack)
                        {
                           return true;
                        }
                        stMoveIntruder.a_3969(a_1311);
                        stMoveIntruder.a_4208(b_182.a_432,2);
                        if(Boolean(this.m_iShotBoundStopTime > 0) && Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
                        {
                           if(Math.random() * 100 <= 20)
                           {
                              stMoveIntruder.a_4208(b_182.a_435,this.m_iShotBoundStopTime);
                           }
                        }
                     }
                  }
               }
            }
         }
         return false;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.IsCanAttack(iCurrentTime,false))
         {
            a_1321 = iCurrentTime;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(a_1321 + a_1310 == iCurrentTime)
         {
            this.IsCanAttack(iCurrentTime,true);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return KungfuDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
   }
}

