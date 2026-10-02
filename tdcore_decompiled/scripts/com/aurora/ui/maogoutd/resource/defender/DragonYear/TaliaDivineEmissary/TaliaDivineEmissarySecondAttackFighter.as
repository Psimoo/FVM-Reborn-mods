package com.aurora.ui.maogoutd.resource.defender.DragonYear.TaliaDivineEmissary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class TaliaDivineEmissarySecondAttackFighter extends a_3953
   {
      
      public function TaliaDivineEmissarySecondAttackFighter()
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
         return PoolManager.getInstance().CheckOutOne(TaliaDivineEmissarySecondAttackFighter) as TaliaDivineEmissarySecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TaliaDivineEmissarySecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         m_BaseAuxiliaryMultiplier = TaliaDivineEmissaryDefence.a_3965(a_1094) + 1 + 0.4;
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
                  if(null != stAttackFighter && !(stAttackFighter is a_3924) && stAttackFighter.m_iDefenseGlobalID != this.m_iDefenseGlobalID)
                  {
                     if(TaliaDivineEmissaryDefence.m_GoldFollowingShotDefense.indexOf(stAttackFighter.a_3512()) != -1)
                     {
                        if(m_BaseAuxiliaryMultiplier > stAttackFighter.a_1325)
                        {
                           stAttackFighter.a_1325 = m_BaseAuxiliaryMultiplier;
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
                  if(null != stAttackFighter && !(stAttackFighter is a_3924) && stAttackFighter.m_iDefenseGlobalID != this.m_iDefenseGlobalID)
                  {
                     if(TaliaDivineEmissaryDefence.m_GoldFollowingShotDefense.indexOf(stAttackFighter.a_3512()) != -1)
                     {
                        stAttackFighter.a_1325 = 1;
                     }
                  }
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.recoverHurt();
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

