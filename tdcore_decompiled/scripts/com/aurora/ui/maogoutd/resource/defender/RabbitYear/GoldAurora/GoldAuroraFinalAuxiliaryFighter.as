package com.aurora.ui.maogoutd.resource.defender.RabbitYear.GoldAurora
{
   import a_4715.EncrypNumber;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public dynamic class GoldAuroraFinalAuxiliaryFighter extends a_3959
   {
      
      protected var a_1309:int = 20;
      
      protected var a_1321:int = 0;
      
      private var m_AuroraBottomEffect:a_4108;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      private var sameAuxiliaryMultiplier:Number = 1;
      
      public function GoldAuroraFinalAuxiliaryFighter()
      {
         super();
         a_1095 = GoldAuroraAuxiliaryDefine.DEFENSE_PRICE;
         a_1339 = GoldAuroraAuxiliaryDefine.LIFE_VALUE;
         this.InitNumHotMultiplier();
         a_1333 = true;
         a_1338 = 8;
         a_1337 = 7;
      }
      
      public static function a_3926() : a_3959
      {
         return PoolManager.getInstance().CheckOutOne(GoldAuroraFinalAuxiliaryFighter,GoldAuroraFinalAuxiliaryFighterMovie) as GoldAuroraFinalAuxiliaryFighter;
      }
      
      private function InitNumHotMultiplier() : void
      {
         var fBaseHotiplier:EncrypNumber = new EncrypNumber(0 * 0.8 + 0);
         m_ParabolaPathMultiplier = fBaseHotiplier.Value + 1 * GoldAuroraAuxiliaryDefine.a_3965(a_1094) * 1.3;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         tagCom.AddTag(30035);
         if(m_bServerIssued)
         {
            gotoAndStop(2);
            a_1275 = 1;
            if(a_1336)
            {
               a_1336.x += 3;
            }
            this.sameAuxiliaryMultiplier = 1;
            this.AddAuroraBottomEffect();
            this.InitNumHotMultiplier();
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldAuroraAuxiliaryDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            else if(a_1273 == a_1274 - 7)
            {
               this.a_4210();
            }
            else if(a_1273 == a_1274 - 1)
            {
               super.a_3969(a_1339);
            }
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(Boolean(iRduceLifeValue > 0) && Boolean(a_1334) && m_iDieType == 1)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(iRduceLifeValue);
                  }
               }
            }
         }
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                  if(a_1336)
                  {
                     a_1336.visible = false;
                  }
                  a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
               }
            }
            else
            {
               super.a_3969(iRduceLifeValue);
            }
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      public function a_4210() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      private function AddAuroraBottomEffect() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         if(Boolean(a_1334) && this.m_AuroraBottomEffect == null)
         {
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(4,a_1334.m_iYGridNo);
            this.m_AuroraBottomEffect = GoldAuroraFinalBottomEffect.a_3926();
            this.m_AuroraBottomEffect.a_1797(false);
            this.m_AuroraBottomEffect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_AuroraBottomEffect.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_AuroraBottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stTargetFieldGrid);
            if(stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stTargetFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_AuroraBottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_AuroraBottomEffect.play();
         }
      }
      
      public function a_3422(iDefenseTypeID:int) : void
      {
         var m_iYGridNo:int = 0;
         var x:int = 0;
         var field:a_3491 = null;
         var iTotalGridNum:int = 0;
         this.sameAuxiliaryMultiplier = 1;
         var dy:int = -1;
         while(dy <= 1 && this.sameAuxiliaryMultiplier < 1.4)
         {
            m_iYGridNo = stFieldGrid.m_iYGridNo + dy;
            if(!(m_iYGridNo < 0 || m_iYGridNo >= BattleFieldView.a_1012))
            {
               for(x = 0; x < BattleFieldView.a_1011; x++)
               {
                  field = a_1334.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,m_iYGridNo);
                  if(field != null)
                  {
                     if(Boolean(field.m_stBaseAuxiliaryFighter) && field.m_stBaseAuxiliaryFighter.a_3512() == iDefenseTypeID)
                     {
                        iTotalGridNum++;
                        this.sameAuxiliaryMultiplier += dy ? 1 : 0.2;
                        if(this.sameAuxiliaryMultiplier > 1.4)
                        {
                           this.sameAuxiliaryMultiplier = 1.4;
                        }
                        if(this.sameAuxiliaryMultiplier > 0)
                        {
                           break;
                        }
                     }
                  }
               }
            }
            dy++;
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            if(Boolean(this.m_AuroraBottomEffect) && Boolean(a_1334))
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_AuroraBottomEffect);
               }
               this.m_AuroraBottomEffect.a_3940();
               this.m_AuroraBottomEffect = null;
            }
         }
         super.a_3940();
         return true;
      }
   }
}

