package com.aurora.ui.maogoutd.resource.defender.goldGemini
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.props.IBaseProp;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   
   public class GoldGeminiDoubleEnergyFinalFlameFlower extends a_3971
   {
      
      private var m_isFirstProduce:Boolean;
      
      private var m_RowNum:int;
      
      public function GoldGeminiDoubleEnergyFinalFlameFlower()
      {
         super();
         a_1275 = 0;
         a_1344 = b_180.enm_FlameGoldGemini;
         a_1333 = true;
         a_1347 = 8;
         a_1095 = 25;
         a_1096 = false;
         a_1345 = GoldGeminiDefine.a_3966(m_iSkillDegree);
         a_1343 = GoldGeminiDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(GoldGeminiDoubleEnergyFinalFlameFlower) as GoldGeminiDoubleEnergyFinalFlameFlower;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldGeminiDoubleEnergyFinalFlameFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1345 = GoldGeminiDefine.a_3966(m_iSkillDegree);
         a_1343 = GoldGeminiDefine.a_3965(a_1094);
         a_1342 = -a_1343;
         this.m_isFirstProduce = true;
         this.m_RowNum = 3;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldGeminiDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var i:int = 0;
         var iIndex:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         var stGameBasePop:IBaseProp = null;
         var posX:int = 0;
         var posY:int = 0;
         var stPropDisplayEffect:MovieClip = null;
         if((iCurrentTime & 1) == 0)
         {
            return;
         }
         if(a_1336)
         {
            a_1336.a_3957(iCurrentTime);
         }
         if(m_stFrozenCardEffect)
         {
            m_stFrozenCardEffect.a_3957(iCurrentTime);
         }
         if(m_stShiHuaEffect)
         {
            m_stShiHuaEffect.a_3957(iCurrentTime);
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(0 == a_1342)
         {
            a_1342 = iCurrentTime;
         }
         if(iCurrentTime >= a_1342 + a_1343 && !stFieldGrid.m_isSilent)
         {
            a_1342 = iCurrentTime;
            gotoAndStop((a_1276[a_1346] as FrameLabel).frame);
         }
         else if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            if(!stFieldGrid.m_isSilent)
            {
               this.m_RowNum = this.m_isFirstProduce ? 3 : 2;
               for(i = 0; i < this.m_RowNum; i++)
               {
                  for(iIndex = 0; iIndex < a_1347; iIndex++)
                  {
                     stFreeEnergy = a_4162.getInstance().a_4163(a_1344);
                     if(stFreeEnergy)
                     {
                        iProduceEnergy = int(a_1341 * a_1345);
                        iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
                        stGameBasePop = m_arrEnergyAddValueProp.pop();
                        if(stGameBasePop)
                        {
                           iEnergyValue += stGameBasePop.a_4328().m_iEffectValue;
                        }
                        posX = x + a_3955() + 82 - 10 * iIndex;
                        posY = y + 73 + (i - 1) * 30;
                        stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
                        stFreeEnergy.a_1797(0,iEnergyValue,posX,posY);
                        stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
                        if(stGameBasePop)
                        {
                           stPropDisplayEffect = stGameBasePop.a_4327();
                           stPropDisplayEffect.x = stFreeEnergy.width;
                           stPropDisplayEffect.y = -20;
                           stFreeEnergy.addChild(stPropDisplayEffect);
                        }
                     }
                  }
               }
               this.m_isFirstProduce = false;
            }
         }
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
   }
}

