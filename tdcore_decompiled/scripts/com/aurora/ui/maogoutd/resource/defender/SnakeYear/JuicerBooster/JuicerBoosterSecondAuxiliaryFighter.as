package com.aurora.ui.maogoutd.resource.defender.SnakeYear.JuicerBooster
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.DragonYear.SpiritDragon.FiveAddRangeEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public dynamic class JuicerBoosterSecondAuxiliaryFighter extends a_3959
   {
      
      private static var ms_stJuicerBoosterSecondAuxiliaryFighterVector:Array = new Array();
      
      private var m_AddRangeEffect:a_4108;
      
      public function JuicerBoosterSecondAuxiliaryFighter()
      {
         super();
         a_1095 = JuicerBoosterAuxiliaryDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3959
      {
         var stJuicerBoosterSecondAuxiliaryFighter:JuicerBoosterSecondAuxiliaryFighter = null;
         stJuicerBoosterSecondAuxiliaryFighter = ms_stJuicerBoosterSecondAuxiliaryFighterVector.pop();
         if(null == stJuicerBoosterSecondAuxiliaryFighter)
         {
            stJuicerBoosterSecondAuxiliaryFighter = new JuicerBoosterSecondAuxiliaryFighter();
         }
         stJuicerBoosterSecondAuxiliaryFighter.visible = true;
         return stJuicerBoosterSecondAuxiliaryFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return JuicerBoosterSecondAuxiliaryFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         if(m_bServerIssued)
         {
            m_RotateShotMultiplier = JuicerBoosterAuxiliaryDefine.a_3965(a_1094) + 0.25;
         }
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return JuicerBoosterAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            this.RealeaseSkill();
         }
      }
      
      private function RealeaseSkill() : void
      {
         var addPower:int = 0;
         var targetFieldGrid:a_3491 = null;
         var iYGridNo:int = 0;
         var stAttackFighter:a_3953 = null;
         if(a_1334 == null)
         {
            return;
         }
         var iXCenterGridNo:int = stFieldGrid.m_iXGridNo;
         var iYCenterGridNo:int = stFieldGrid.m_iYGridNo;
         var iAttackRange:int = 2;
         var iStartXGridNo:int = Math.max(iXCenterGridNo - iAttackRange,0);
         var iStartYGridNo:int = Math.max(iYCenterGridNo - iAttackRange,0);
         var iEndXGridNo:int = Math.min(iXCenterGridNo + iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(iYCenterGridNo + iAttackRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               targetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iYGridNo][iXGridNo];
               if(targetFieldGrid != null)
               {
                  stAttackFighter = targetFieldGrid.m_stAttackFighter;
                  if(null != stAttackFighter && !(stAttackFighter is a_3924))
                  {
                     if(BattleVOUtil.IsRotateShotCard(stAttackFighter.a_3512()))
                     {
                        if(m_RotateShotMultiplier > stAttackFighter.a_1325)
                        {
                           stAttackFighter.a_1325 = m_RotateShotMultiplier;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function recoverHurt() : void
      {
         var addPower:int = 0;
         var targetFieldGrid:a_3491 = null;
         var iYGridNo:int = 0;
         var stAttackFighter:a_3953 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var iXCenterGridNo:int = stFieldGrid.m_iXGridNo;
         var iYCenterGridNo:int = stFieldGrid.m_iYGridNo;
         var iAttackRange:int = 2;
         var iStartXGridNo:int = Math.max(iXCenterGridNo - iAttackRange,0);
         var iStartYGridNo:int = Math.max(iYCenterGridNo - iAttackRange,0);
         var iEndXGridNo:int = Math.min(iXCenterGridNo + iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(iYCenterGridNo + iAttackRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               targetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iYGridNo][iXGridNo];
               if(targetFieldGrid != null)
               {
                  stAttackFighter = targetFieldGrid.m_stAttackFighter;
                  if(null != stAttackFighter && !(stAttackFighter is a_3924))
                  {
                     if(BattleVOUtil.IsRotateShotCard(stAttackFighter.a_3512()))
                     {
                        stAttackFighter.a_1325 = 1;
                     }
                  }
               }
            }
         }
      }
      
      private function AddAddRangeEffect() : void
      {
         if(Boolean(a_1334) && this.m_AddRangeEffect == null)
         {
            this.m_AddRangeEffect = FiveAddRangeEffect.a_3926();
            this.m_AddRangeEffect.a_1797(false);
            this.m_AddRangeEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_AddRangeEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_AddRangeEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_AddRangeEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_AddRangeEffect.play();
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.recoverHurt();
            if(this.m_AddRangeEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_AddRangeEffect);
               }
               this.m_AddRangeEffect.a_3940();
               this.m_AddRangeEffect = null;
            }
         }
         super.a_3940();
         if(-1 == ms_stJuicerBoosterSecondAuxiliaryFighterVector.indexOf(this))
         {
            ms_stJuicerBoosterSecondAuxiliaryFighterVector.push(this);
         }
         return true;
      }
   }
}

