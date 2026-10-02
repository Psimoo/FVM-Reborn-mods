package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFrey
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class GoldFreyFinalAttackFighter extends a_3953
   {
      
      private var m_BottomEffect:a_4108;
      
      private var iAttackRange:int = 2;
      
      private var m_dicFirstID:Dictionary = new Dictionary();
      
      private var m_dicSecondID:Dictionary = new Dictionary();
      
      private var m_dicThirdID:Dictionary = new Dictionary();
      
      public function GoldFreyFinalAttackFighter()
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
         return PoolManager.getInstance().CheckOutOne(GoldFreyFinalAttackFighter) as GoldFreyFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFreyFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.AddBottomEffect();
            m_BaseAuxiliaryMultiplier = GoldFreyDefence.a_3965(a_1094) + 1;
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
         var fighterID:int = 0;
         var addMultiplier:Number = NaN;
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
                  if(!(stAttackFighter == null || stAttackFighter is a_3924 || stAttackFighter.m_iDefenseGlobalID == this.m_iDefenseGlobalID))
                  {
                     if(BattleFieldView.FiveDirectionDefenseCardIDs.indexOf(stAttackFighter.a_3512()) != -1 || BattleFieldView.FourCountCardIDArray.indexOf(stAttackFighter.a_3512()) != -1)
                     {
                        fighterID = stAttackFighter.m_iDefenseGlobalID;
                        addMultiplier = stAttackFighter.a_1325 > 1 ? m_BaseAuxiliaryMultiplier : m_BaseAuxiliaryMultiplier - 1;
                        if(addMultiplier > stAttackFighter.m_ThirdHotMultiplier)
                        {
                           this.m_dicThirdID[fighterID] = true;
                           stAttackFighter.m_ThirdHotMultiplier = addMultiplier;
                           if(this.m_dicFirstID[fighterID])
                           {
                              stAttackFighter.a_1325 = 1;
                              delete this.m_dicFirstID[fighterID];
                           }
                           if(this.m_dicSecondID[fighterID])
                           {
                              stAttackFighter.m_SecondHotMultiplier = 0;
                              delete this.m_dicFirstID[fighterID];
                           }
                        }
                        if(m_BaseAuxiliaryMultiplier > stAttackFighter.m_SecondHotMultiplier)
                        {
                           if(!this.m_dicThirdID[fighterID])
                           {
                              this.m_dicSecondID[fighterID] = true;
                              stAttackFighter.m_SecondHotMultiplier = m_BaseAuxiliaryMultiplier;
                              if(this.m_dicFirstID[fighterID])
                              {
                                 stAttackFighter.a_1325 = 1;
                                 delete this.m_dicFirstID[fighterID];
                              }
                              if(this.m_dicThirdID[fighterID])
                              {
                                 stAttackFighter.m_ThirdHotMultiplier = 0;
                                 delete this.m_dicThirdID[fighterID];
                              }
                           }
                        }
                        else if(m_BaseAuxiliaryMultiplier > stAttackFighter.a_1325)
                        {
                           if(!this.m_dicSecondID[fighterID] && !this.m_dicThirdID[fighterID])
                           {
                              this.m_dicFirstID[fighterID] = true;
                              stAttackFighter.a_1325 = m_BaseAuxiliaryMultiplier;
                              if(this.m_dicSecondID[fighterID])
                              {
                                 stAttackFighter.m_SecondHotMultiplier = 0;
                                 delete this.m_dicSecondID[fighterID];
                              }
                              if(this.m_dicThirdID[fighterID])
                              {
                                 stAttackFighter.m_ThirdHotMultiplier = 0;
                                 delete this.m_dicThirdID[fighterID];
                              }
                           }
                        }
                        else
                        {
                           trace("xxxxxxxxxx");
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
                        stAttackFighter.m_SecondHotMultiplier = 0;
                        stAttackFighter.m_ThirdHotMultiplier = 0;
                     }
                  }
               }
            }
         }
         this.m_dicFirstID = new Dictionary();
         this.m_dicSecondID = new Dictionary();
         this.m_dicThirdID = new Dictionary();
      }
      
      private function AddBottomEffect() : void
      {
         if(Boolean(a_1334) && this.m_BottomEffect == null)
         {
            this.m_BottomEffect = GoldFreyFinalBottomEffect.a_3926();
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

