package com.aurora.ui.maogoutd.resource.defender.HorseYear.fighteKingHorse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class FighteKingHorseBaseAttackFighter extends a_3953
   {
      
      private var m_nAttackWaveCount:int = 0;
      
      private var m_HurtRate:Number = 0;
      
      public function FighteKingHorseBaseAttackFighter()
      {
         super();
         a_1095 = FighteKingHorseDefine.DEFENSE_PRICE;
         a_1304 = 0;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FighteKingHorseBaseAttackFighter) as FighteKingHorseBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FighteKingHorseBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = FighteKingHorseDefine.a_3966(m_iSkillDegree);
         a_1311 = FighteKingHorseDefine.a_3965(a_1094);
         this.m_nAttackWaveCount = this.m_HurtRate = 0;
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
            if(this.m_nAttackWaveCount % 4 == 0)
            {
               shotLabelIndex = 2;
               this.m_HurtRate = 1.5;
            }
            else
            {
               shotLabelIndex = 1;
               this.m_HurtRate = 1;
            }
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[shotLabelIndex] as FrameLabel).frame);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.m_nAttackWaveCount = this.m_HurtRate = 0;
         super.a_3940();
         return true;
      }
      
      private function attackStraightPunch() : void
      {
         var gride:a_3491 = null;
         if(!a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var hurt:int = a_1311 * this.m_HurtRate;
         var xStart:int = a_1334.m_iXGridNo;
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 4,BattleFieldView.a_1011 - 1);
         for(var xIndex:int = xStart; xIndex <= xEnd; xIndex++)
         {
            gride = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,a_1334.m_iYGridNo);
            if(gride)
            {
               this.applyDamageToGrid(gride,hurt,false);
            }
         }
      }
      
      private function attackSpinPunch() : void
      {
         var xIndex:int = 0;
         var gride:a_3491 = null;
         if(!a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var hurt:int = a_1311 * this.m_HurtRate;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 4,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               gride = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(gride)
               {
                  this.applyDamageToGrid(gride,hurt,true);
               }
            }
         }
      }
      
      private function applyDamageToGrid(stFieldGrid:a_3491, hurt:int, isSpin:Boolean) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(!stFieldGrid)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.IntruderArray;
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(!(!stMoveIntruder || stMoveIntruder.iLifeValue <= 0))
            {
               if(isSpin)
               {
                  if(stMoveIntruder.isCannotSeeByFighter && stMoveIntruder.iSpaceState != 1)
                  {
                     continue;
                  }
               }
               else if(stMoveIntruder.isCannotSeeByFighter || stMoveIntruder.iSpaceState == 1 || stMoveIntruder.iSpaceState == 3)
               {
                  continue;
               }
               stMoveIntruder.a_3969(hurt);
               if(isSpin && stMoveIntruder.iLifeValue > 0)
               {
                  stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,20);
               }
            }
         }
      }
   }
}

