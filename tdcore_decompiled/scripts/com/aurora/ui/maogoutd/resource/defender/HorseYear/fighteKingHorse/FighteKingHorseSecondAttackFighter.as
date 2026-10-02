package com.aurora.ui.maogoutd.resource.defender.HorseYear.fighteKingHorse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class FighteKingHorseSecondAttackFighter extends a_3953
   {
      
      private var m_nAttackWaveCount:int = 0;
      
      private var m_dicIntruderHitCount:Dictionary = new Dictionary();
      
      public function FighteKingHorseSecondAttackFighter()
      {
         super();
         a_1095 = FighteKingHorseDefine.DEFENSE_PRICE;
         a_1304 = 0;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FighteKingHorseSecondAttackFighter) as FighteKingHorseSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FighteKingHorseSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = FighteKingHorseDefine.a_3966(m_iSkillDegree);
         a_1311 = FighteKingHorseDefine.a_3965(a_1094);
         this.m_nAttackWaveCount = 0;
         this.clearIntruderHitCount();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FighteKingHorseDefine.a_3964(m_iSkillDegree);
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
            if(a_1273 == 18)
            {
               this.attackStraightPunch();
            }
            else if(a_1273 == 30)
            {
               this.attackSpinPunch();
            }
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var shotLabelIndex:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            ++this.m_nAttackWaveCount;
            shotLabelIndex = this.m_nAttackWaveCount % 4 == 0 ? 2 : 1;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[shotLabelIndex] as FrameLabel).frame);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.m_nAttackWaveCount = 0;
         this.clearIntruderHitCount();
         super.a_3940();
         return true;
      }
      
      private function attackStraightPunch() : void
      {
         var gride:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var moveFighterID:int = 0;
         var hurtRate:Number = NaN;
         if(!a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var xStart:int = a_1334.m_iXGridNo;
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 4,BattleFieldView.a_1011 - 1);
         for(var xIndex:int = xStart; xIndex <= xEnd; xIndex++)
         {
            gride = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,a_1334.m_iYGridNo);
            if(gride)
            {
               arrMoveIntruder = gride.IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!(!stMoveIntruder || stMoveIntruder.iLifeValue <= 0))
                  {
                     if(!(stMoveIntruder.isCannotSeeByFighter || stMoveIntruder.iSpaceState == 1 || stMoveIntruder.iSpaceState == 3))
                     {
                        moveFighterID = stMoveIntruder.globalMoveFighterID;
                        hurtRate = this.bumpStraightPunchAndGetHurtRate(moveFighterID);
                        stMoveIntruder.a_3969(a_1311 * hurtRate);
                     }
                  }
               }
            }
         }
      }
      
      private function attackSpinPunch() : void
      {
         var xIndex:int = 0;
         var gride:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var hurt:int = a_1311 * 3;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 4,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               gride = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(gride)
               {
                  arrMoveIntruder = gride.IntruderArray;
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(!(!stMoveIntruder || stMoveIntruder.iLifeValue <= 0))
                     {
                        if(!(stMoveIntruder.isCannotSeeByFighter && stMoveIntruder.iSpaceState != 1))
                        {
                           stMoveIntruder.a_3969(hurt);
                           if(stMoveIntruder.iLifeValue > 0)
                           {
                              stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,20);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function bumpStraightPunchAndGetHurtRate(key:int) : Number
      {
         if(!(key in this.m_dicIntruderHitCount))
         {
            this.m_dicIntruderHitCount[key] = 0;
         }
         ++this.m_dicIntruderHitCount[key];
         var hitMod:int = int(this.m_dicIntruderHitCount[key]) % 3;
         if(hitMod == 1)
         {
            return 1;
         }
         if(hitMod == 2)
         {
            return 1.5;
         }
         return 2;
      }
      
      private function clearIntruderHitCount() : void
      {
         var key:* = undefined;
         for(key in this.m_dicIntruderHitCount)
         {
            delete this.m_dicIntruderHitCount[key];
         }
      }
   }
}

