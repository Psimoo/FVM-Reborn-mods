package com.aurora.ui.maogoutd.resource.defender.DragonYear.TaliaDivineEmissary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class TaliaDivineEmissaryFinalAttackFighter extends a_3953
   {
      
      private var m_RangeEffect:a_4108;
      
      private var iAttackRange:int = 2;
      
      private var m_dicFirstID:Dictionary = new Dictionary();
      
      private var m_dicSecondID:Dictionary = new Dictionary();
      
      public function TaliaDivineEmissaryFinalAttackFighter()
      {
         super();
         a_1095 = TaliaDivineEmissaryDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 3;
         a_1337 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(TaliaDivineEmissaryFinalAttackFighter) as TaliaDivineEmissaryFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaliaDivineEmissaryFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            m_BaseAuxiliaryMultiplier = TaliaDivineEmissaryDefence.a_3965(a_1094) + 1 + 0.4;
            this.AddRangeEffectEffect();
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TaliaDivineEmissaryDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         this.RealeaseSkill();
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      private function RealeaseSkill() : void
      {
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stAttackFighter:a_3953 = null;
         var iFighterID:int = 0;
         var numSumMul:Number = NaN;
         if(!a_1334)
         {
            return;
         }
         var iCenterGridX:int = a_1334.m_iXGridNo;
         var iCenterGridY:int = a_1334.m_iYGridNo;
         var iStartXGrid:int = Math.max(iCenterGridX - this.iAttackRange,0);
         var iStartYGrid:int = Math.max(iCenterGridY - this.iAttackRange - 1,0);
         var iEndXGrid:int = Math.min(iCenterGridX + this.iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGrid:int = Math.min(iCenterGridY + this.iAttackRange + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var iSelfTypeID:int = this.a_3512();
         for(var iXGridNo:int = iStartXGrid; iXGridNo <= iEndXGrid; iXGridNo++)
         {
            for(iYGridNo = iStartYGrid; iYGridNo <= iEndYGrid; iYGridNo++)
            {
               stFieldGrid = stFieldGridsVector[iYGridNo][iXGridNo];
               if(stFieldGrid)
               {
                  stAttackFighter = stFieldGrid.m_stAttackFighter;
                  if(!(!stAttackFighter || stAttackFighter is a_3924))
                  {
                     if(stAttackFighter.a_3512() != iSelfTypeID)
                     {
                        if(TaliaDivineEmissaryDefence.m_GoldFollowingShotDefense.indexOf(stAttackFighter.a_3512()) != -1)
                        {
                           iFighterID = stAttackFighter.m_iDefenseGlobalID;
                           if(m_BaseAuxiliaryMultiplier > stAttackFighter.m_hotSlotMulA)
                           {
                              this.m_dicFirstID[iFighterID] = true;
                              if(this.m_dicSecondID[iFighterID])
                              {
                                 stAttackFighter.m_hotSlotMulB = 0;
                                 delete this.m_dicSecondID[iFighterID];
                              }
                              stAttackFighter.m_hotSlotMulA = m_BaseAuxiliaryMultiplier;
                           }
                           else if(m_BaseAuxiliaryMultiplier > stAttackFighter.m_hotSlotMulB && !this.m_dicFirstID[iFighterID])
                           {
                              this.m_dicSecondID[iFighterID] = true;
                              if(this.m_dicFirstID[iFighterID])
                              {
                                 stAttackFighter.m_hotSlotMulA = 0;
                                 delete this.m_dicFirstID[iFighterID];
                              }
                              stAttackFighter.m_hotSlotMulB = m_BaseAuxiliaryMultiplier;
                           }
                           numSumMul = stAttackFighter.m_hotSlotMulA + stAttackFighter.m_hotSlotMulB;
                           if(numSumMul > stAttackFighter.a_1325)
                           {
                              stAttackFighter.a_1325 = numSumMul;
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function recoverHurt() : void
      {
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stAttackFighter:a_3953 = null;
         if(!a_1334)
         {
            return;
         }
         var iCenterGridX:int = a_1334.m_iXGridNo;
         var iCenterGridY:int = a_1334.m_iYGridNo;
         var iStartXGrid:int = Math.max(iCenterGridX - this.iAttackRange,0);
         var iStartYGrid:int = Math.max(iCenterGridY - this.iAttackRange - 1,0);
         var iEndXGrid:int = Math.min(iCenterGridX + this.iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGrid:int = Math.min(iCenterGridY + this.iAttackRange + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var iSelfTypeID:int = this.a_3512();
         for(var iXGridNo:int = iStartXGrid; iXGridNo <= iEndXGrid; iXGridNo++)
         {
            for(iYGridNo = iStartYGrid; iYGridNo <= iEndYGrid; iYGridNo++)
            {
               stFieldGrid = stFieldGridsVector[iYGridNo][iXGridNo];
               if(stFieldGrid)
               {
                  stAttackFighter = stFieldGrid.m_stAttackFighter;
                  if(!(!stAttackFighter || stAttackFighter is a_3924))
                  {
                     if(stAttackFighter.a_3512() != iSelfTypeID)
                     {
                        if(TaliaDivineEmissaryDefence.m_GoldFollowingShotDefense.indexOf(stAttackFighter.a_3512()) != -1)
                        {
                           stAttackFighter.a_1325 = 1;
                           stAttackFighter.m_hotSlotMulA = 0;
                           stAttackFighter.m_hotSlotMulB = 0;
                        }
                     }
                  }
               }
            }
         }
         this.m_dicFirstID = new Dictionary();
         this.m_dicSecondID = new Dictionary();
      }
      
      private function AddRangeEffectEffect() : void
      {
         if(Boolean(a_1334) && this.m_RangeEffect == null)
         {
            this.m_RangeEffect = TaliaDivineEmissaryFinalEffect.a_3926();
            this.m_RangeEffect.a_1797(false);
            this.m_RangeEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_RangeEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_RangeEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_RangeEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_RangeEffect.play();
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.recoverHurt();
            if(this.m_RangeEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_RangeEffect);
               }
               this.m_RangeEffect.a_3940();
               this.m_RangeEffect = null;
            }
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

