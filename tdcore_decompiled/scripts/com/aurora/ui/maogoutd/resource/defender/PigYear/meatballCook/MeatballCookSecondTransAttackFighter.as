package com.aurora.ui.maogoutd.resource.defender.PigYear.meatballCook
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.effect.ElementSnakeDoubleHitEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class MeatballCookSecondTransAttackFighter extends a_3953
   {
      
      private var m_nAttackWaveCount:int = 0;
      
      private var m_HurtRate:Number = 0;
      
      public function MeatballCookSecondTransAttackFighter()
      {
         super();
         a_1338 = 6;
         a_1310 = MeatballCookDefine.SHOT_DELAY_TIMENUM;
         a_1095 = MeatballCookDefine.DEFENSE_PRICE;
         a_1309 = MeatballCookDefine.a_3966(m_iSkillDegree);
         a_1311 = MeatballCookDefine.a_3965(a_1094);
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MeatballCookSecondTransAttackFighter) as MeatballCookSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MeatballCookSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = MeatballCookDefine.a_3966(m_iSkillDegree);
         a_1311 = MeatballCookDefine.a_3965(a_1094);
         a_1339 = 90;
         this.m_nAttackWaveCount = this.m_HurtRate = 0;
         return true;
      }
      
      private function IsCanAttack(iCurrentTime:int, bIsAttack:Boolean) : Boolean
      {
         var iAttackLen:int = 0;
         var ly:int = 0;
         var lx:int = 0;
         var iAdd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var iYGridNo:int = 0;
         var k:int = 0;
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(bIsAttack || iCurrentTime >= m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309 && null != a_1334)
         {
            if(bIsAttack)
            {
               this.m_HurtRate = 1;
               ++this.m_nAttackWaveCount;
               if(this.m_nAttackWaveCount % 4 == 0)
               {
                  this.m_HurtRate = 1.5;
               }
            }
            iAttackLen = 5;
            ly = a_1334.m_iYGridNo;
            lx = a_1334.m_iXGridNo;
            iAdd = a_1283 ? -1 : 1;
            yStart = Math.max(0,ly - 1);
            yEnd = Math.min(BattleFieldView.a_1012 - 1,ly + 1);
            loop0:
            for(iYGridNo = yStart; iYGridNo <= yEnd; )
            {
               k = 0;
               loop1:
               while(true)
               {
                  if(k >= iAttackLen)
                  {
                     iYGridNo++;
                     continue loop0;
                  }
                  iXGridNo = lx + k * iAdd;
                  if(!(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011))
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
                                 break loop1;
                              }
                              stMoveIntruder.a_3969(a_1311 * this.m_HurtRate);
                              if(stMoveIntruder.iLifeValue > 0)
                              {
                                 stMoveIntruder.a_4208(b_182.a_432,2);
                              }
                              if(this.m_HurtRate == 1.5)
                              {
                                 this.addDoubleHitEffect(stMoveIntruder);
                              }
                           }
                        }
                     }
                  }
                  k++;
               }
               return true;
            }
         }
         return false;
      }
      
      private function addDoubleHitEffect(baseMoveIntruder:a_4206) : void
      {
         if(Boolean(baseMoveIntruder && baseMoveIntruder.iLifeValue > 0 && baseMoveIntruder.visible) && Boolean(!baseMoveIntruder.IsBossIntruder) && Boolean(baseMoveIntruder.m_stCurrentFieldGrid))
         {
            BattleEffectUtil.AddHitEffect(baseMoveIntruder,ElementSnakeDoubleHitEffectMovie);
         }
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
         return MeatballCookDefine.a_3964(a_1094);
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

