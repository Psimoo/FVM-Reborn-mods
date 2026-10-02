package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFrey
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class GoldFreyFirstAttackFighter extends a_3953
   {
      
      private var m_BottomEffect:a_4108;
      
      private var iAttackRange:int = 2;
      
      private var m_arrAddAttackFighterGlobalID:Array;
      
      public function GoldFreyFirstAttackFighter()
      {
         super();
         a_1095 = GoldFreyDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 3;
         a_1337 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldFreyFirstAttackFighter) as GoldFreyFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFreyFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_arrAddAttackFighterGlobalID = [];
         if(m_bServerIssued)
         {
            this.AddBottomEffect();
            m_BaseAuxiliaryMultiplier = GoldFreyDefence.a_3965(a_1094);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldFreyDefence.a_3964(m_iSkillDegree);
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
         var targetFieldGrid:a_3491 = null;
         var iYGridNo:int = 0;
         var stAttackFighter:a_3953 = null;
         if(a_1334 == null)
         {
            return;
         }
         var iXCenterGridNo:int = stFieldGrid.m_iXGridNo;
         var iYCenterGridNo:int = stFieldGrid.m_iYGridNo;
         var iStartXGridNo:int = Math.max(iXCenterGridNo - this.iAttackRange,0);
         var iStartYGridNo:int = Math.max(iYCenterGridNo - this.iAttackRange,0);
         var iEndXGridNo:int = Math.min(iXCenterGridNo + this.iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(iYCenterGridNo + this.iAttackRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               targetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[iYGridNo][iXGridNo];
               if(targetFieldGrid != null)
               {
                  stAttackFighter = targetFieldGrid.m_stAttackFighter;
                  if(stAttackFighter != null && !(stAttackFighter is a_3924) && stAttackFighter.m_iDefenseGlobalID != this.m_iDefenseGlobalID)
                  {
                     if(BattleFieldView.FiveDirectionDefenseCardIDs.indexOf(stAttackFighter.a_3512()) != -1 || BattleFieldView.FourCountCardIDArray.indexOf(stAttackFighter.a_3512()) != -1)
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
         if(stFieldGrid == null)
         {
            return;
         }
         var iXCenterGridNo:int = stFieldGrid.m_iXGridNo;
         var iYCenterGridNo:int = stFieldGrid.m_iYGridNo;
         var iStartXGridNo:int = Math.max(iXCenterGridNo - this.iAttackRange,0);
         var iStartYGridNo:int = Math.max(iYCenterGridNo - this.iAttackRange,0);
         var iEndXGridNo:int = Math.min(iXCenterGridNo + this.iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(iYCenterGridNo + this.iAttackRange,BattleFieldView.a_1012 - 1);
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
                     if(BattleFieldView.FiveDirectionDefenseCardIDs.indexOf(stAttackFighter.a_3512()) != -1 || BattleFieldView.FourCountCardIDArray.indexOf(stAttackFighter.a_3512()) != -1)
                     {
                        stAttackFighter.a_1325 = 1;
                     }
                  }
               }
            }
         }
         this.m_arrAddAttackFighterGlobalID = [];
      }
      
      private function AddBottomEffect() : void
      {
         if(Boolean(a_1334) && this.m_BottomEffect == null)
         {
            this.m_BottomEffect = GoldFreyFirstBottomEffect.a_3926();
            this.m_BottomEffect.a_1797(false);
            this.m_BottomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_BottomEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_BottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_BottomEffect.play();
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.recoverHurt();
            if(this.m_BottomEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_BottomEffect);
               }
               this.m_BottomEffect.a_3940();
               this.m_BottomEffect = null;
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

